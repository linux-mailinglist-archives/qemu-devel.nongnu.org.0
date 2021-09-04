Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEA0400B37
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 13:51:09 +0200 (CEST)
Received: from localhost ([::1]:53782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMUCR-0006ql-TE
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 07:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMUAt-0005v1-9Y
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 07:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMUAq-0001AK-2Y
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 07:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630756166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2tAzhPOCAhWjsrW7D57RnbhzD1dl7rb/Aql2by1d+Gc=;
 b=CWlTjW16GJBXiviebFkMvP4c8w+vR9tyO6gTQ2uZKnGx0vD8rXCHD3Zwdwxn3DlYaDItAM
 WHGd/l+c1STRVMEYOoXaRQoywvWOnovwYYhKQk12jJ5EtMhMkiNXCWjy4eitKrc6ePrnM3
 vwGiEtU0HRWU4M5eMyR2+atNvK/HmWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-hz2q3udJPw2ZKODlaY4n0Q-1; Sat, 04 Sep 2021 07:49:24 -0400
X-MC-Unique: hz2q3udJPw2ZKODlaY4n0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6CA4100670B;
 Sat,  4 Sep 2021 11:49:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 722656A91D;
 Sat,  4 Sep 2021 11:49:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B4A591138606; Sat,  4 Sep 2021 13:49:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v7 5/7] qapi/qdev.json: add DEVICE_UNPLUG_GUEST_ERROR
 QAPI event
References: <20210825004835.472919-1-danielhb413@gmail.com>
 <20210825004835.472919-6-danielhb413@gmail.com>
 <87tuj4a0wx.fsf@dusky.pond.sub.org> <YTLtvn5ywJce0iqE@yekko>
Date: Sat, 04 Sep 2021 13:49:21 +0200
In-Reply-To: <YTLtvn5ywJce0iqE@yekko> (David Gibson's message of "Sat, 4 Sep
 2021 13:53:34 +1000")
Message-ID: <874kb0pnlq.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Wed, Sep 01, 2021 at 03:19:26PM +0200, Markus Armbruster wrote:
>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>> 
>> > At this moment we only provide one event to report a hotunplug error,
>> > MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
>> > machine is now able to report unplug errors for other device types, such
>> > as CPUs.
>> >
>> > Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
>> > create a generic DEVICE_UNPLUG_GUEST_ERROR event that can be used by all
>> > guest side unplug errors in the future. This event has a similar API as
>> > the existing DEVICE_DELETED event, always providing the QOM path of the
>> > device and dev->id if there's any.
>> >
>> > With this new generic event, MEM_UNPLUG_ERROR is now marked as deprecated.
>> >
>> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> > ---
>> 
>> [...]
>> 
>> > diff --git a/qapi/qdev.json b/qapi/qdev.json
>> > index 0e9cb2ae88..8b1a1dd43b 100644
>> > --- a/qapi/qdev.json
>> > +++ b/qapi/qdev.json
>> > @@ -84,7 +84,9 @@
>> >  #        This command merely requests that the guest begin the hot removal
>> >  #        process.  Completion of the device removal process is signaled with a
>> >  #        DEVICE_DELETED event. Guest reset will automatically complete removal
>> > -#        for all devices.
>> > +#        for all devices.  If a guest-side error in the hot removal process is
>> > +#        detected, the device will not be removed and a DEVICE_UNPLUG_GUEST_ERROR
>> > +#        event is sent.  Some errors cannot be detected.
>> >  #
>> >  # Since: 0.14
>> >  #
>> > @@ -124,3 +126,27 @@
>> >  ##
>> >  { 'event': 'DEVICE_DELETED',
>> >    'data': { '*device': 'str', 'path': 'str' } }
>> > +
>> > +##
>> > +# @DEVICE_UNPLUG_GUEST_ERROR:
>> > +#
>> > +# Emitted when a device hot unplug fails due to an internal guest
>> > +# error.
>> 
>> Suggest to scratch "internal".
>
> I'd suggest s/internal guest/guest reported/.  "guest error" is a bit
> vague, this doesn't neccessarily indicate a bug in the guest.  The key
> point is that we're reporting this event because the guest performed
> some explicit action to tell us something went wrong with the plug
> attempt.

Yes, that's better.

[...]


