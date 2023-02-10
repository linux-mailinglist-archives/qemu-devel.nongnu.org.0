Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A626769230E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:14:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQW2F-0005na-0R; Fri, 10 Feb 2023 11:14:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQW2A-0005mo-87
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:13:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQW28-0003rZ-24
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:13:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676045635;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1TNtnMSuwgAJ9TPeJHingwuTeeAD7DgHLp5+nrvN9js=;
 b=LJcIDNawHan22T0L92dEJDoBGOOesTxZ7HsnZAp07DSmmYWg4ABcpVndAOiFAZ7HXa3e3O
 gxWQOW+GgERCwPc+H3O2YTg0MnwicpA+8+JXYLv4NySSQM2spu2a6bq7yC8hRA3B3QuizC
 VCnz+fCsItvQcpFXg00hXRvD6Duz+RQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-17-qy4hfANUOauHN6j1S_P-Gw-1; Fri, 10 Feb 2023 11:13:52 -0500
X-MC-Unique: qy4hfANUOauHN6j1S_P-Gw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j20-20020a05600c1c1400b003dc5dd44c0cso2837909wms.8
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1TNtnMSuwgAJ9TPeJHingwuTeeAD7DgHLp5+nrvN9js=;
 b=BlYnHElZUU5X4srVVcT+jCoiojL9NWj1f1g/1GKtkSWEIEedEYXVqriIxqh0AEBJ4E
 bQnMaX0ROTUU2cTmkqEvHuvGw1smsX7nTDQrwtAIBNMFRLHYfQpKbAL5z75/EXt1oK/8
 EsqSxR/6buXz3s0BlkujroGIa/yFyXv+slrnsIT7xIp4SY4dR7pKaLW3Inbjv7Xb1LU3
 ox8XK6z3xbjRt8nOCEXAV5HvE/Qu45fRBx8iUe747b3oI9LUFxsmfQ2o5YkA8Raayvdo
 ZprJHPBVEJdoir6NCbvFIYzWs9/Ov2WfaNBeuK8Fuo09lNTKZnprXppzfDuRKNJszNlY
 AyTQ==
X-Gm-Message-State: AO0yUKWM7wwBV/DDeD4XNuvEAkI1kcdgdq6SXrpqY8dpSuMsmqEINiFO
 TJb5i95Ore29pLVRqcZWiKgeBKVCkewyujVE1dCNvYnnoP5dku9iZahsrukE18aRWItNjlWqQI+
 FV17+xo8sG2sA/pM=
X-Received: by 2002:a05:600c:a295:b0:3dd:1bcc:eb17 with SMTP id
 hu21-20020a05600ca29500b003dd1bcceb17mr13404078wmb.28.1676045630885; 
 Fri, 10 Feb 2023 08:13:50 -0800 (PST)
X-Google-Smtp-Source: AK7set9vnc3om7YV+x9nJQ2aqeEn0pJA7h8pK/a9Tc5Z9TxsVzavz8MU+5m5dqGzAkrTQ+stETKGtA==
X-Received: by 2002:a05:600c:a295:b0:3dd:1bcc:eb17 with SMTP id
 hu21-20020a05600ca29500b003dd1bcceb17mr13404058wmb.28.1676045630666; 
 Fri, 10 Feb 2023 08:13:50 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c328f00b003dc5b59ed7asm5177576wmp.11.2023.02.10.08.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 08:13:49 -0800 (PST)
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
In-Reply-To: <CAFEAcA-SOpRiX+s14OxCJ+Lwx6kzUdroM9ufugzTVLM9Tq2gHA@mail.gmail.com>
 (Peter Maydell's message of "Fri, 10 Feb 2023 14:33:02 +0000")
References: <20230209233426.37811-1-quintela@redhat.com>
 <CAFEAcA-qSWck=ga4XBGvGXJohtGrSPO6t6+U4KqRvJdN8hrAug@mail.gmail.com>
 <87r0uxy528.fsf@secure.mitica>
 <CAFEAcA-SOpRiX+s14OxCJ+Lwx6kzUdroM9ufugzTVLM9Tq2gHA@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 10 Feb 2023 17:13:48 +0100
Message-ID: <87edqxxzur.fsf@secure.mitica>
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
> On Fri, 10 Feb 2023 at 14:21, Juan Quintela <quintela@redhat.com> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> wrote:
>> > Fails to build the user-mode emulators:
>>
>> This is weird.
>
>> > https://gitlab.com/qemu-project/qemu/-/jobs/3749435025
>> >
>> > In file included from ../authz/base.c:24:
>> > ../authz/trace.h:1:10: fatal error: trace/trace-authz.h: No such file
>> > or directory
>> > 1 | #include "trace/trace-authz.h"
>>
>> This series only have one change for traces:
>>
>> diff --git a/util/trace-events b/util/trace-events
>> index c8f53d7d9f..16f78d8fe5 100644
>> --- a/util/trace-events
>> +++ b/util/trace-events
>> @@ -93,6 +93,7 @@ qemu_vfio_region_info(const char *desc, uint64_t region_ofs, uint64_t region_siz
>>  qemu_vfio_pci_map_bar(int index, uint64_t region_ofs, uint64_t
>> region_size, int ofs, void *host) "map region bar#%d addr
>> 0x%"PRIx64" size 0x%"PRIx64" ofs 0x%x host %p"
>>
>>  #userfaultfd.c
>> +uffd_detect_open_mode(int mode) "%d"
>>  uffd_query_features_nosys(int err) "errno: %i"
>>  uffd_query_features_api_failed(int err) "errno: %i"
>>  uffd_create_fd_nosys(int err) "errno: %i"
>>
>> Rest of trace mentions are for the removal of migration.multifd.c.orig
>>
>> And I don't play with authentication at all.
>>
>> This is Fedora 37.
>>
>> > https://gitlab.com/qemu-project/qemu/-/jobs/3749435094
>> > In file included from ../authz/simple.c:23:
>> > ../authz/trace.h:1:10: fatal error: trace/trace-authz.h: No such file
>> > or directory
>>
>> Problem is that this trace file is not generated, but I can think how
>> any change that I did can influence this.
>>
>> > 1 | #include "trace/trace-authz.h"
>> >
>> >
>> > https://gitlab.com/qemu-project/qemu/-/jobs/3749434963
>> > In file included from ../authz/listfile.c:23:
>> > ../authz/trace.h:1:10: fatal error: trace/trace-authz.h: No such file
>> > or directory
>> > 1 | #include "trace/trace-authz.h"
>>
>> Looking at the ouptut of these, they are not informatives at all.
>>
>> I am going to try to compile linux-user without system, and see if that
>> brings a clue.
>
> Yes, I suspect this is a "user-mode only build" specific failure
> (you may need --disable-system --disable-tools to see it).

git-bisect is my friend O:-)

And yes, the problem was in my PULL request.

Again, I don't know why it fails.

diff --git a/tests/bench/meson.build b/tests/bench/meson.build
index daefead58d..7477a1f401 100644
--- a/tests/bench/meson.build
+++ b/tests/bench/meson.build
@@ -3,9 +3,11 @@ qht_bench = executable('qht-bench',
                        sources: 'qht-bench.c',
                        dependencies: [qemuutil])
 
+if have_system
 xbzrle_bench = executable('xbzrle-bench',
                        sources: 'xbzrle-bench.c',
                        dependencies: [qemuutil,migration])
+endif
 
 executable('atomic_add-bench',
            sources: files('atomic_add-bench.c'),

This make it works.

And no, I still not have a single clue how creating a new executable in
tests/bench/ can make trace files not to be generated somewhere else.

> meson.build only puts authz into trace_events_subdirs "if have_block"
> (which is to say "if have_system or have_tools"). However the
> bit of meson.build that says "subdir('authz') does not have
> the same condition on it -- it's just been put in the list without
> any condition on it. So I think that in a build-only-user-emulators
> config meson will not generate trace events for the subdirectory
> but will try to build it, which falls over.
>
> Contrast 'block', 'nbd', 'scsi', which are all guarded by
> 'if have_block' for their subdir() lines, to match the guard on
> the trace_events_subdirs. OTOH 'io' is also mismatched-guards...
>
> Why this only shows up with your pullreq I have no idea.

xbzrle_bench.
Notice that dependency on migration.

As said, I compile every user and system targets that compile in fedora
before I submit a PULL request.
But it is getting clear than that is not enough anymore.

Sorry about the noise.

Will resubmit the PULL requset.

Later, Juan.


