Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FF53583B3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 14:51:42 +0200 (CEST)
Received: from localhost ([::1]:57402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUU8L-0004zw-1o
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 08:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUU5z-0003Za-8D
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 08:49:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUU5w-000806-Td
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 08:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617886151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fOlSwm+26bFhmayJERO08hpul/Mw9HV+pNET1iY1YG4=;
 b=gYV6xsytckjHZSPmKybUBGvE3hPKZwlYj7Gljue4q15L4W0zaJHN8IDIuBOOaKS0UeqRvp
 U1seidIi410dE7rZZitUYuwrVt1O7fGMlVEOFlQi3zX7XXTHRFGshVrkxxrmTJd9uZzVCZ
 ZsmXM69DvujCVT7Q+68uma4ctsNxDSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-1DAIm4KXNOmjWxp1wR9cmA-1; Thu, 08 Apr 2021 08:49:09 -0400
X-MC-Unique: 1DAIm4KXNOmjWxp1wR9cmA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BF7910054F6;
 Thu,  8 Apr 2021 12:49:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2370D5C1C4;
 Thu,  8 Apr 2021 12:49:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 86ADF1132D66; Thu,  8 Apr 2021 14:49:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2] monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB
References: <20210322154024.15011-1-s.reiter@proxmox.com>
 <YG2xUD5M7RCuIe+X@merkur.fritz.box>
 <87lf9tces9.fsf@dusky.pond.sub.org>
 <YG7akVvfY30Q7Cj1@merkur.fritz.box>
Date: Thu, 08 Apr 2021 14:49:02 +0200
In-Reply-To: <YG7akVvfY30Q7Cj1@merkur.fritz.box> (Kevin Wolf's message of
 "Thu, 8 Apr 2021 12:27:29 +0200")
Message-ID: <871rblaqm9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Reiter <s.reiter@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, qemu-devel@nongnu.org,
 Wolfgang Bumiller <w.bumiller@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 08.04.2021 um 11:21 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > Am 22.03.2021 um 16:40 hat Stefan Reiter geschrieben:
>> >> The QMP dispatcher coroutine holds the qmp_queue_lock over a yield
>> >> point, where it expects to be rescheduled from the main context. If a
>> >> CHR_EVENT_CLOSED event is received just then, it can race and block the
>> >> main thread on the mutex in monitor_qmp_cleanup_queue_and_resume.
>> >> 
>> >> monitor_resume does not need to be called from main context, so we can
>> >> call it immediately after popping a request from the queue, which allows
>> >> us to drop the qmp_queue_lock mutex before yielding.
>> >> 
>> >> Suggested-by: Wolfgang Bumiller <w.bumiller@proxmox.com>
>> >> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
>> >> ---
>> >> v2:
>> >> * different approach: move everything that needs the qmp_queue_lock mutex before
>> >>   the yield point, instead of moving the event handling to a different context
>> >
>> > The interesting new case here seems to be that new requests could be
>> > queued and the dispatcher coroutine could be kicked before yielding.
>> > This is safe because &qmp_dispatcher_co_busy is accessed with atomics
>> > on both sides.
>> >
>> > The important part is just that the first (conditional) yield stays
>> > first, so that the aio_co_wake() in handle_qmp_command() won't reenter
>> > the coroutine while it is expecting to be reentered from somewhere else.
>> > This is still the case after the patch.
>> >
>> > Reviewed-by: Kevin Wolf <kwolf@redhat.com>
>> 
>> Thanks for saving me from an ugly review headache.
>> 
>> Should this go into 6.0?
>
> This is something that the responsible maintainer needs to decide.

Yes, and that's me.  I'm soliciting opinions.

> If it helps you with the decision, and if I understand correctly, it is
> a regression from 5.1, but was already broken in 5.2.

It helps.

Even more helpful would be a risk assessment: what's the risk of
applying this patch now vs. delaying it?

If I understand Stefan correctly, Proxmox observed VM hangs.  How
frequent are these hangs?  Did they result in data corruption?

How confident do we feel about the fix?


