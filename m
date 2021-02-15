Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6C931BAF1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 15:24:36 +0100 (CET)
Received: from localhost ([::1]:39504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBenj-0000dB-83
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 09:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBemD-0000Cg-2R
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:23:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBem9-0000Ai-70
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613398975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=drHqQfONFxDAPuMcXEdy5iQDC+8eU4RfU+I4FYFuK+g=;
 b=g1t8wgzoxcwQK0yTi7ZcdkcVJB35HyKiVPeIdSMs/BPePgLAVgxwNN/spr0zumzatA4/2l
 5LVxDCuoZpgKXgIL6AJyLJvAU8+C8BSFk10fJtvitWKITu1bAJfrfCHTCYTpT2XtmV7GHe
 kNcyxKeSfhJ0zKU6fInn42WrqD0IxOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-faxaTMWjPpiZHvtv4zIceA-1; Mon, 15 Feb 2021 09:22:53 -0500
X-MC-Unique: faxaTMWjPpiZHvtv4zIceA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1CFF1020C25
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 14:22:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-100.ams2.redhat.com
 [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A44CC5D9C0;
 Mon, 15 Feb 2021 14:22:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 99B51113865F; Mon, 15 Feb 2021 15:22:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/2] monitor/qmp: Stop processing requests when shutdown
 is requested
References: <20210212172028.288825-1-kwolf@redhat.com>
 <20210212172028.288825-3-kwolf@redhat.com>
 <87blclzg4p.fsf@dusky.pond.sub.org>
 <20210215122819.GL7226@merkur.fritz.box>
 <87k0r9y01g.fsf@dusky.pond.sub.org>
 <20210215135844.GP7226@merkur.fritz.box>
Date: Mon, 15 Feb 2021 15:22:50 +0100
In-Reply-To: <20210215135844.GP7226@merkur.fritz.box> (Kevin Wolf's message of
 "Mon, 15 Feb 2021 14:58:44 +0100")
Message-ID: <87k0r9v29x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 15.02.2021 um 13:42 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > Am 15.02.2021 um 13:09 hat Markus Armbruster geschrieben:
>> >> Kevin Wolf <kwolf@redhat.com> writes:
>> >> 
>> >> > monitor_qmp_dispatcher_co() used to check whether shutdown is requested
>> >> 
>> >> "used to": until when?
>> >
>> > Until right before this patch. Do you prefer present tense to describe
>> > the old state?
>> 
>> I've done it both ways.  I think present tense works better for me.
>> Case in point: I wasn't confident I read your commit message correctly,
>> so I asked.
>
> I guess I can just add "Before this patch, ..." to clarify.

Yes, please.

>> > Also, does your Tested-by imply that you expect someone else to merge
>> > this series? I'm planning to send a pull request today, so if that was
>> > your intention, I can include it there.
>> 
>> I didn't mean to imply anything beyond "I ran my reproducer, and your
>> patches fix it."
>> 
>> I don't mind you including the fixes in your pull request.  I also
>> don't mind doing a pull request for your fixes.  Up to you!
>
> Ok, if you don't mind either way, I'll just fix up the commit message
> and include it.
>
> I just asked because it has happened before that everyone was waiting
> for someone else to merge a patch. So I made it a habit to ask when a
> maintainer replies with some kind of approval without mentioning that
> they queued the patch, because that could be a sign that they expect it
> to go through a different tree.

Not a bad habit.

Thanks!


