Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790593CF3FF
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 07:31:38 +0200 (CEST)
Received: from localhost ([::1]:51732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5iLx-0000Zq-4i
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 01:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5iKr-0008FD-LH
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 01:30:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5iKm-0005h7-IE
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 01:30:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626759023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i9tepXv16H9Fy0rVuB55wBqEZlAWfooZr/stUVPsApI=;
 b=SMacweUh3G+ZeNYWeOuDg5f578VdY7cgpY/rXWcmppPcEACCur6YGtrr8oVpOifj5AksF4
 Dn5iRj+kCbL93k9BsJEaRfSKv2CZMauHHYd8dUMkBR3OI+Dnvu/uEDGCqboUFv/vync/Mv
 OWnpkjlaBPqOjn+4+5cNnVaJgwB8dPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-m9_-uovHNVCq8-Ss8Bz57Q-1; Tue, 20 Jul 2021 01:30:19 -0400
X-MC-Unique: m9_-uovHNVCq8-Ss8Bz57Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C399884F209;
 Tue, 20 Jul 2021 05:30:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B89E5D6A1;
 Tue, 20 Jul 2021 05:30:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E853A11326B9; Tue, 20 Jul 2021 07:30:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: -only-migrate and the two different uses of migration blockers
References: <87tukvaejt.fsf@dusky.pond.sub.org> <YPTj6ml6LoMJkypI@yekko>
 <87lf62ydow.fsf@dusky.pond.sub.org> <YPUn2quWrztTqyML@yekko>
 <875yx6oabe.fsf@dusky.pond.sub.org>
 <87sg0amuuz.fsf_-_@dusky.pond.sub.org> <YPVzURLf5qqwtYsZ@work-vm>
Date: Tue, 20 Jul 2021 07:30:16 +0200
In-Reply-To: <YPVzURLf5qqwtYsZ@work-vm> (David Alan Gilbert's message of "Mon, 
 19 Jul 2021 13:42:57 +0100")
Message-ID: <87o8axh7rr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> We appear to use migration blockers in two ways:
>> 
>> (1) Prevent migration for an indefinite time, typically due to use of
>> some feature that isn't compatible with migration.
>> 
>> (2) Delay migration for a short time.
>> 
>> Option -only-migrate is designed for (1).  It interferes with (2).
>> 
>> Example for (1): device "x-pci-proxy-dev" doesn't support migration.  It
>> adds a migration blocker on realize, and deletes it on unrealize.  With
>> -only-migrate, device realize fails.  Works as designed.
>> 
>> Example for (2): spapr_mce_req_event() makes an effort to prevent
>> migration degrate the reporting of FWNMIs.  It adds a migration blocker
>> when it receives one, and deletes it when it's done handling it.  This
>> is a best effort; if migration is already in progress by the time FWNMI
>> is received, we simply carry on, and that's okay.  However, option
>> -only-migrate sabotages the best effort entirely.
>
> That's interesting; it's the first time I've heard of anyone using it as
> 'best effort'.  I've always regarded blockers as blocking.

Me too, until I found this one.

>> While this isn't exactly terrible, it may be a weakness in our thinking
>> and our infrastructure.  I'm bringing it up so the people in charge are
>> aware :)
>
> Thanks.
>
> It almost feels like they need a way to temporarily hold off
> 'completion' of migratio - i.e. the phase where we stop the CPU and
> write the device data;  mind you you'd also probably want it to stop
> cold-migrates/snapshots?

Yes, a proper way to delay 'completion' for a bit would be clearer, and
wouldn't let -only-migrate interfere.


