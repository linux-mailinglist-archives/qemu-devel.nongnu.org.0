Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C104635F77
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 14:26:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxpkO-0001zJ-GC; Wed, 23 Nov 2022 08:25:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxpkK-0001yn-Ee
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 08:25:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxpkI-00059Y-3K
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 08:24:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669209897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7M8qNdwutNbrDlHyglmM0mHMX16jt8wqvEpfUTu/gAY=;
 b=UXyP/N7LnF/KGjClVNxldP+IFi2LXiWZDyb/9AfGD2LatAOW+MF55oo/JYAjxjA/hwUui1
 MfBOUA5Cgq1C18ljZKSgtwmLuhnOL3BLI8xusouKFG76kOsZLbUQiHF5UL/P7ddJ9BCLZ2
 jOvi2MJ5v0k9zv1EDZKMouHQrrfqfnc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-OuNto4O2PMm8TAcZz97iiA-1; Wed, 23 Nov 2022 08:24:54 -0500
X-MC-Unique: OuNto4O2PMm8TAcZz97iiA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD956101A54E;
 Wed, 23 Nov 2022 13:24:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 534D2492B07;
 Wed, 23 Nov 2022 13:24:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2C6AB21E6921; Wed, 23 Nov 2022 14:24:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org
Subject: Re: [PATCH 3/3] Drop more useless casts from void * to pointer
References: <20220923120025.448759-1-armbru@redhat.com>
 <20220923120025.448759-4-armbru@redhat.com>
 <6a978ba7-45cb-323d-0c1c-ed40dd68972f@vivier.eu>
Date: Wed, 23 Nov 2022 14:24:49 +0100
In-Reply-To: <6a978ba7-45cb-323d-0c1c-ed40dd68972f@vivier.eu> (Laurent
 Vivier's message of "Sat, 22 Oct 2022 23:07:13 +0200")
Message-ID: <87mt8h6bxa.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Laurent Vivier <laurent@vivier.eu> writes:

> Le 23/09/2022 =C3=A0 14:00, Markus Armbruster a =C3=A9crit=C2=A0:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   bsd-user/elfload.c                      | 2 +-
>>   contrib/plugins/cache.c                 | 8 ++++----
>>   contrib/vhost-user-blk/vhost-user-blk.c | 2 +-
>>   hw/core/qdev-clock.c                    | 2 +-
>>   hw/hyperv/vmbus.c                       | 2 +-
>>   hw/net/cadence_gem.c                    | 2 +-
>>   hw/net/virtio-net.c                     | 2 +-
>>   hw/nvme/ctrl.c                          | 4 ++--
>>   hw/rdma/vmw/pvrdma_cmd.c                | 9 +++------
>>   hw/rdma/vmw/pvrdma_qp_ops.c             | 6 +++---
>>   hw/virtio/virtio-iommu.c                | 3 +--
>>   linux-user/syscall.c                    | 2 +-
>>   target/i386/hax/hax-all.c               | 2 +-
>>   tests/tcg/aarch64/system/semiheap.c     | 4 ++--
>>   util/coroutine-ucontext.c               | 2 +-
>>   util/vfio-helpers.c                     | 2 +-
>>   16 files changed, 25 insertions(+), 29 deletions(-)
>>=20
> ...
>> diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
>> index ddc98fb4f8..31f586d366 100644
>> --- a/util/coroutine-ucontext.c
>> +++ b/util/coroutine-ucontext.c
>> @@ -105,7 +105,7 @@ void finish_switch_fiber(void *fake_stack_save)
>>       __sanitizer_finish_switch_fiber(fake_stack_save, &bottom_old, &siz=
e_old);
>>         if (!leaderp->stack) {
>> -        leaderp->stack =3D (void *)bottom_old;
>> +        leaderp->stack =3D bottom_old;
>
> bottom_old is "const void *" and stack is "void *", I think compiler will=
 complain we discard the "const" qualifier.

You're right.

> Otherwise:
>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Thanks!


