Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4E335867A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:14:10 +0200 (CEST)
Received: from localhost ([::1]:53226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVQ9-0002oN-3B
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUVN0-0007jK-Ao
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:10:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUVMn-0001wc-9R
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617891039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u3/zusNK5SRbMrDodIu2zj2+HWUbx98GJ00vRCsH0us=;
 b=VZ1xTN1H3MEmSIEnvHC3t7ApmEJJmzvZV6QibZGWRcCtEK4+6d8Rum8h8FoCHZq0FFQMkJ
 ZBkzB6Nn/NMjJCH3IgCfOpf+G6HwTL1lCRXB+2cPKVyzZEtOGTmJC0zwnri7iWMJtwh8Z7
 prqY5ysVH7tEZY5A4oU6rvUFGhN2MEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-vz0dkep6O8mdt0hsa4Wa8A-1; Thu, 08 Apr 2021 10:10:35 -0400
X-MC-Unique: vz0dkep6O8mdt0hsa4Wa8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B664C73A4;
 Thu,  8 Apr 2021 14:10:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 186D310016F4;
 Thu,  8 Apr 2021 14:10:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8E639113525D; Thu,  8 Apr 2021 16:10:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: [PATCH v2] monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB
References: <20210322154024.15011-1-s.reiter@proxmox.com>
 <YG2xUD5M7RCuIe+X@merkur.fritz.box>
 <87lf9tces9.fsf@dusky.pond.sub.org>
 <YG7akVvfY30Q7Cj1@merkur.fritz.box>
 <871rblaqm9.fsf@dusky.pond.sub.org>
 <1f326b87-b568-5aa5-011e-057e046c0717@proxmox.com>
Date: Thu, 08 Apr 2021 16:10:31 +0200
In-Reply-To: <1f326b87-b568-5aa5-011e-057e046c0717@proxmox.com> (Thomas
 Lamprecht's message of "Thu, 8 Apr 2021 15:27:51 +0200")
Message-ID: <87tuog98a0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Reiter <s.reiter@proxmox.com>, qemu-devel@nongnu.org,
 Wolfgang Bumiller <w.bumiller@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Lamprecht <t.lamprecht@proxmox.com> writes:

> On 08.04.21 14:49, Markus Armbruster wrote:
>> Kevin Wolf <kwolf@redhat.com> writes:
>>> Am 08.04.2021 um 11:21 hat Markus Armbruster geschrieben:
>>>> Should this go into 6.0?
>>>
>>> This is something that the responsible maintainer needs to decide.
>> 
>> Yes, and that's me.  I'm soliciting opinions.
>> 
>>> If it helps you with the decision, and if I understand correctly, it is
>>> a regression from 5.1, but was already broken in 5.2.
>> 
>> It helps.
>> 
>> Even more helpful would be a risk assessment: what's the risk of
>> applying this patch now vs. delaying it?
>
> Stefan is on vacation this week, but I can share some information, maybe it
> helps.
>
>> 
>> If I understand Stefan correctly, Proxmox observed VM hangs.  How
>> frequent are these hangs?  Did they result in data corruption?
>
>
> They were not highly frequent, but frequent enough to get roughly a bit over a
> dozen of reports in our forum, which normally means something is off but its
> limited to certain HW, storage-tech used or load patterns.
>
> We had initially a hard time to reproduce this, but a user finally could send
> us a backtrace of a hanging VM and with that information we could pin it enough
> down and Stefan came up with a good reproducer (see v1 of this patch).

Excellent work, props!

> We didn't got any report of actual data corruption due to this, but the VM
> hangs completely, so a user killing it may produce that theoretical; but only
> for those program running in the guest that where not made power-loss safe
> anyway...
>
>> 
>> How confident do we feel about the fix?
>> 
>
> Cannot comment from a technical POV, but can share the feedback we got with it.
>
> Some context about reach:
> We have rolled the fix out to all repository stages which had already a build of
> 5.2, that has a reach of about 100k to 300k installations, albeit we only have
> some rough stats about the sites that accesses the repository daily, cannot really
> tell who actually updated to the new versions, but there are some quite update-happy
> people in the community, so with that in mind and my experience of the feedback
> loop of rolling out updates, I'd figure a lower bound one can assume without going
> out on a limb is ~25k.
>
> Positive feedback from users:
> We got some positive feedback from people which ran into this at least once per
> week about the issue being fixed with that. In total almost a dozen user reported
> improvements, a good chunk of those which reported the problem in the first place.
>
> Mixed feedback:
> We had one user which reported still getting QMP timeouts, but that their VMs did
> not hang anymore (could be high load or the like). Only one user reported that it
> did not help, still investigating there, they have quite high CPU pressure stats
> and it actually may also be another issue, cannot tell for sure yet though.
>
> Negative feedback:
> We had no new users reporting of new/worse problems in that direction, at least
> from what I'm aware off.
>
> Note, we do not use OOB currently, so above does not speak for the OOB case at
> all.

Thanks!


