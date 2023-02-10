Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28046920BA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 15:21:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQUHL-0006S5-DU; Fri, 10 Feb 2023 09:21:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQUHI-0006Rp-Q0
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:21:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQUHG-0007YN-JS
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:21:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676038885;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=HWr/8s3ZahYTuxdeqD4XaN2pNE2ZrFVeReJ243s1M+E=;
 b=Mu6gRgB7zMdf7iQn6f3Lv2Jk/6I7Oqq3PKnPI/6Hlzv1G3OlRaMj9OqX4N8+ZGOFlT6DTB
 O6uspEwPK6gCNO4Jmn34OMIDLf6A7y4ziZE1ll0SZKyl3+dA2IIC8P6zrECnfyQ/bCaSaZ
 0HiJqU0c3U5StAjRAK3TYg5xeT0ZoGw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-339-G1ptaZSxM-uIvr4fexBGXA-1; Fri, 10 Feb 2023 09:21:22 -0500
X-MC-Unique: G1ptaZSxM-uIvr4fexBGXA-1
Received: by mail-wr1-f69.google.com with SMTP id
 b13-20020a5d4d8d000000b002c457ce3c9bso1284809wru.4
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 06:21:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HWr/8s3ZahYTuxdeqD4XaN2pNE2ZrFVeReJ243s1M+E=;
 b=vl8MWN0O1YyA84+JUXnkxXhgMEFSLuYjXqXebORgrYZMFS+0x4qIqFaKEoqKKfV4TR
 Xutm+y2/qnLxSjL4oAfdIE/DjnYj/yxB6WlhpwcngMNPD7V0ND4j439GVkDf+L4+uCo1
 +O5y10lllVR6BwvPrwaAgv11ffIWHaWRRf3yQIrIQd/u/ud0QsdX8Ub0Ep/48lSD9x5w
 W2V8FsrTjIt1RdhgD8cXjrsJESqkDXH6nejBexPcLl4tw3ic1ZZhJv1OJCBMrXJ5W0to
 QH7XDjMl0fxGsXTpP3SP4M64xO4fccIVFtedyBihJosclQEV5mDICjuH+xFUqZgs/sym
 TwCg==
X-Gm-Message-State: AO0yUKVJixbIZMLc+HGNL7NEGPiJlo1o6ISfTcawroirAFEdoPOdtlhA
 2cpj2DscBgQFsdXa/pmz2LD1M2HycGiVFJiBuPOyemfq0XWCEId3MM7sFsU4pCBYGR350ME+6ZP
 Apt9IS8E5goP1bK4=
X-Received: by 2002:adf:f4c6:0:b0:2bf:cfc0:ac71 with SMTP id
 h6-20020adff4c6000000b002bfcfc0ac71mr13318235wrp.53.1676038880967; 
 Fri, 10 Feb 2023 06:21:20 -0800 (PST)
X-Google-Smtp-Source: AK7set8NfALs8aSllqSw1tQaXoS//RvloLM8Zh97/y5ySzijydOkcsurTfIeolz2dsNWEFZ9i7/pJA==
X-Received: by 2002:adf:f4c6:0:b0:2bf:cfc0:ac71 with SMTP id
 h6-20020adff4c6000000b002bfcfc0ac71mr13318210wrp.53.1676038880723; 
 Fri, 10 Feb 2023 06:21:20 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 u13-20020a5d468d000000b002c54c92e125sm588934wrq.46.2023.02.10.06.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 06:21:20 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  kvm@vger.kernel.org,  Philippe =?utf-8?Q?Mathi?=
 =?utf-8?Q?eu-Daud=C3=A9?=
 <philmd@linaro.org>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Cornelia Huck <cohuck@redhat.com>,  "Michael S.
 Tsirkin" <mst@redhat.com>,  Thomas Huth <thuth@redhat.com>,  =?utf-8?Q?Ma?=
 =?utf-8?Q?rc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PULL 00/17] Migration 20230209 patches
In-Reply-To: <CAFEAcA-qSWck=ga4XBGvGXJohtGrSPO6t6+U4KqRvJdN8hrAug@mail.gmail.com>
 (Peter Maydell's message of "Fri, 10 Feb 2023 13:36:44 +0000")
References: <20230209233426.37811-1-quintela@redhat.com>
 <CAFEAcA-qSWck=ga4XBGvGXJohtGrSPO6t6+U4KqRvJdN8hrAug@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 10 Feb 2023 15:21:19 +0100
Message-ID: <87r0uxy528.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Maydell <peter.maydell@linaro.org> wrote:
> On Thu, 9 Feb 2023 at 23:35, Juan Quintela <quintela@redhat.com> wrote:
>>
>> The following changes since commit 417296c8d8588f782018d01a317f88957e9786d6:
>>
>>   tests/qtest/netdev-socket: Raise connection timeout to 60 seconds (2023-02-09 11:23:53 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/juan.quintela/qemu.git tags/migration-20230209-pull-request
>>
>> for you to fetch changes up to 858191aebda251a4d1e3bc77b238096673241cdd:
>>
>>   migration: Postpone postcopy preempt channel to be after main (2023-02-09 21:26:02 +0100)
>>
>> ----------------------------------------------------------------
>> Migration Pull request
>>
>> Hi
>>
>> This are all the reviewed patches for migration:
>> - AVX512 support for xbzrle (Ling Xu)
>> - /dev/userfaultd support (Peter Xu)
>> - Improve ordering of channels (Peter Xu)
>> - multifd cleanups (Li Zhang)
>> - Remove spurious files from last merge (me)
>>   Rebase makes that to you
>> - Fix mixup between state_pending_{exact,estimate} (me)
>> - Cache RAM size during migration (me)
>> - cleanup several functions (me)
>>
>> Please apply.
>>
>> ----------------------------------------------------------------
>
> Fails to build the user-mode emulators:

This is weird.

$ ls *user -d
aarch64_be-linux-user   m68k-linux-user          ppc-linux-user
aarch64-linux-user      microblazeel-linux-user  riscv32-linux-user
alpha-linux-user        microblaze-linux-user    riscv64-linux-user
armeb-linux-user        mips64el-linux-user      s390x-linux-user
arm-linux-user          mips64-linux-user        sh4eb-linux-user
bsd-user                mipsel-linux-user        sh4-linux-user
common-user             mips-linux-user          sparc32plus-linux-user
cris-linux-user         mipsn32el-linux-user     sparc64-linux-user
hexagon-linux-user      mipsn32-linux-user       sparc-linux-user
hppa-linux-user         nios2-linux-user         x86_64-linux-user
i386-linux-user         or1k-linux-user          xtensaeb-linux-user
linux-user              ppc64le-linux-user       xtensa-linux-user
loongarch64-linux-user  ppc64-linux-user


I think I build all user emulators locally.

> https://gitlab.com/qemu-project/qemu/-/jobs/3749435025
>
> In file included from ../authz/base.c:24:
> ../authz/trace.h:1:10: fatal error: trace/trace-authz.h: No such file
> or directory
> 1 | #include "trace/trace-authz.h"

This series only have one change for traces:

diff --git a/util/trace-events b/util/trace-events
index c8f53d7d9f..16f78d8fe5 100644
--- a/util/trace-events
+++ b/util/trace-events
@@ -93,6 +93,7 @@ qemu_vfio_region_info(const char *desc, uint64_t region_ofs, uint64_t region_siz
 qemu_vfio_pci_map_bar(int index, uint64_t region_ofs, uint64_t region_size, int ofs, void *host) "map region bar#%d addr 0x%"PRIx64" size 0x%"PRIx64" ofs 0x%x host %p"
 
 #userfaultfd.c
+uffd_detect_open_mode(int mode) "%d"
 uffd_query_features_nosys(int err) "errno: %i"
 uffd_query_features_api_failed(int err) "errno: %i"
 uffd_create_fd_nosys(int err) "errno: %i"

Rest of trace mentions are for the removal of migration.multifd.c.orig

And I don't play with authentication at all.

This is Fedora 37.

> https://gitlab.com/qemu-project/qemu/-/jobs/3749435094
> In file included from ../authz/simple.c:23:
> ../authz/trace.h:1:10: fatal error: trace/trace-authz.h: No such file
> or directory

Problem is that this trace file is not generated, but I can think how
any change that I did can influence this.

> 1 | #include "trace/trace-authz.h"
>
>
> https://gitlab.com/qemu-project/qemu/-/jobs/3749434963
> In file included from ../authz/listfile.c:23:
> ../authz/trace.h:1:10: fatal error: trace/trace-authz.h: No such file
> or directory
> 1 | #include "trace/trace-authz.h"

Looking at the ouptut of these, they are not informatives at all.

I am going to try to compile linux-user without system, and see if that
brings a clue.

But I don't know what is going on here.

Later, Juan.


