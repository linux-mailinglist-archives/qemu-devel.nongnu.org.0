Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6EB48DB22
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:55:52 +0100 (CET)
Received: from localhost ([::1]:43622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82S7-00078g-44
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:55:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n82Oz-0005b3-5a
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:52:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n82Os-0003iW-CM
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642089145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EKgHT2xDlWJDURWwj4KmvhZrZRgy/oDCT5lLVbSlv/M=;
 b=WxH8NQDayZh5yeh9+aRipwF8HGDiogLnaJLpahjrgguq5Y+Qu6vkluuT3/83DqD6ywHiPP
 KXKxQkXWH6koR3mNkbTuYMdlVKEgFwAhNs7Hegs1t6xcJPpPl3M+1B5QdeqQ7BhrRGUpO3
 hvFFOGOndrTF640arBiVV3PuV2UrN5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-UqiM-PtZPK-Sj6vPybRUlg-1; Thu, 13 Jan 2022 10:52:22 -0500
X-MC-Unique: UqiM-PtZPK-Sj6vPybRUlg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06F9D83DD28;
 Thu, 13 Jan 2022 15:52:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-9.ams2.redhat.com [10.36.112.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72A5484FF6;
 Thu, 13 Jan 2022 15:52:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DF90911380A2; Thu, 13 Jan 2022 16:52:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH v7 0/4] VNC-related HMP/QMP fixes
References: <20211021100135.4146766-1-s.reiter@proxmox.com>
 <87fssl3emb.fsf@dusky.pond.sub.org>
 <87r1c5lz4s.fsf@dusky.pond.sub.org>
 <ef0fd05c-7eab-ee0f-812c-1a3095da058c@proxmox.com>
Date: Thu, 13 Jan 2022 16:52:18 +0100
In-Reply-To: <ef0fd05c-7eab-ee0f-812c-1a3095da058c@proxmox.com> (Fabian
 Ebner's message of "Tue, 11 Jan 2022 15:18:17 +0100")
Message-ID: <87o84f7hvx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fabian Ebner <f.ebner@proxmox.com> writes:

> Am 28.10.21 um 21:37 schrieb Markus Armbruster:
>> Markus Armbruster <armbru@redhat.com> writes:
>> 
>>> Stefan Reiter <s.reiter@proxmox.com> writes:
>>>
>>>> Since the removal of the generic 'qmp_change' command, one can no longer replace
>>>> the 'default' VNC display listen address at runtime (AFAIK). For our users who
>>>> need to set up a secondary VNC access port, this means configuring a second VNC
>>>> display (in addition to our standard one for web-access), but it turns out one
>>>> cannot set a password on this second display at the moment, as the
>>>> 'set_password' call only operates on the 'default' display.
>>>>
>>>> Additionally, using secret objects, the password is only read once at startup.
>>>> This could be considered a bug too, but is not touched in this series and left
>>>> for a later date.
>>>
>>> Queued, thanks!
>> 
>> Unqueued, because it fails to compile with --disable-vnc and with
>> --disable-spice.  I failed to catch this in review, sorry.
>>
>> Making it work takes a tiresome amount of #ifdeffery (sketch appended).
>> Missing: removal of stubs that are no longer used,
>> e.g. vnc_display_password() in ui/vnc-stubs.c.  Feels like more trouble
>> than it's worth.
>> 
>> To maximize our chances to get this into 6.2, please respin without the
>> 'if' conditionals.  Yes, this makes introspection less useful, but it's
>> no worse than before the patch.
>
> Unfortunately, Stefan is no longer working with Proxmox, so I would
> pick up these patches instead.

Appreciated!

> Since the 6.2 ship has long sailed, I suppose the way forward is using
> the #ifdefs then?

Maybe.

We can choose to improve introspection: keep the 'if' conditionals, and
fix the C code to compile with --disable-vnc and --disable-spice.

Or we can leave it imperfect as it was: drop the 'if' conditionals.

If we had a concrete need for better introspection here, the choice
would be easy.  But as far as I know, we don't.  Is better introspection
worth the additional work anyway?  Since you're volunteering to do the
work, you get to decide :)

> From my understanding what should be done is:
>
> * In the first patch, fix the typo spotted by Eric Blake and add the
>   R-b tags from this round.
>
> * Replace "since 6.2" with "since 7.0" everywhere.
>
> * Incorporate the #ifdef handling from below. I had to add another one
>   for the when/whenstr handling in qmp_expire_password to avoid an
>  error with -Werror=unused-but-set-variable.
>
> * Add #ifdefs for the unused stubs too? If yes, how to best find them?

For every call you put under #if, check whether there are are any
unconditional calls left, and if not, whether there is a stub function
for it.  If this is too terse, just ask for more help.


