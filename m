Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ECD2C2B1F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 16:23:15 +0100 (CET)
Received: from localhost ([::1]:52090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kha9v-0005FD-Vy
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 10:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kha7Z-0003tm-LX
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:20:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kha7X-0007bj-Jt
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606231242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bHM6smSIUleaOwc6stdAxbqa06fMmNXQJjmaXZrMzfg=;
 b=Scgf7t94yAMKldk+XcROMhvuG2oIO0HX3BShRm6mVs+jFYPkSndbdLFD9Z03r3h7b94w9f
 cZJJFZcYIzFg/YNeKbCJOrIT5Yy5Rz9kXptxaNWhm7ZBcfHUCF6LZAraYPD1BPDtpm0GkP
 dShOIxFTfRGV7Goq7JBz4FectYQ9Gk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-mmrSBnHOMRWWw2orM6wLnw-1; Tue, 24 Nov 2020 10:20:39 -0500
X-MC-Unique: mmrSBnHOMRWWw2orM6wLnw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3F7618C43CC;
 Tue, 24 Nov 2020 15:20:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A572460864;
 Tue, 24 Nov 2020 15:20:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 58B43113864E; Tue, 24 Nov 2020 16:20:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 3/8] qnum: QNumValue type for QNum value literals
References: <CAJ+F1C+YUZdP56MuLtZbO0fK6rPsDosgxXG4zaDq=mjwqsV74A@mail.gmail.com>
 <20201117144246.GD1235237@habkost.net>
 <CAJ+F1CLZg-hhuK2ffRzVaWiZKe2Aqvf0-mqxXGAzscSa8FmCNw@mail.gmail.com>
 <87mtzdd4p7.fsf@dusky.pond.sub.org>
 <20201119182158.GX1509407@habkost.net>
 <877dqg8ukz.fsf@dusky.pond.sub.org>
 <20201120182720.GF2271382@habkost.net>
 <877dqcwlxc.fsf@dusky.pond.sub.org>
 <20201123183357.GK2271382@habkost.net>
 <87ft4zp2at.fsf@dusky.pond.sub.org>
 <20201124144102.GL2271382@habkost.net>
Date: Tue, 24 Nov 2020 16:20:37 +0100
In-Reply-To: <20201124144102.GL2271382@habkost.net> (Eduardo Habkost's message
 of "Tue, 24 Nov 2020 09:41:02 -0500")
Message-ID: <877dqahjcq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Tue, Nov 24, 2020 at 09:49:30AM +0100, Markus Armbruster wrote:
>> Eduardo Habkost <ehabkost@redhat.com> writes:
>> 
>> > On Mon, Nov 23, 2020 at 08:51:27AM +0100, Markus Armbruster wrote:
>> >> Eduardo Habkost <ehabkost@redhat.com> writes:
>> >> 
>> >> > On Fri, Nov 20, 2020 at 06:29:16AM +0100, Markus Armbruster wrote:
>> >> [...]
>> >> >> When the structure of a data type is to be kept away from its users, I
>> >> >> prefer to keep it out of the public header, so the compiler enforces the
>> >> >> encapsulation.
>> >> >
>> >> > I prefer that too, except that it is impossible when users of the
>> >> > API need the compiler to know the struct size.
>> >> 
>> >> There are cases where the structure of a data type should be
>> >> encapsulated, yet its size must be made known for performance (avoid
>> >> dynamic memory allocation and pointer chasing).
>> >> 
>> >> Need for encapsulation correlates with complex algorithms and data
>> >> structures.  The cost of dynamic allocation is often in the noise then.
>> >
>> > I don't know what we are talking about anymore.  None of this
>> > applies to the QNum API, right?
>> >
>> > QNum/QNumValue are not complex data structures, and the reason we
>> > need the compiler to know the size of QNumValue is not related to
>> > performance at all.
>> 
>> We started with the question whether to make QNumValue's members
>> private.  We digressed to the question when to make members private.
>> So back to the original question.
>> 
>> > We might still want to discourage users of the QNum API from
>> > accessing QNum.u/QNumValue.u directly.  Documenting the field as
>> > private is a very easy way to do it.
>> 
>> It's a complete non-issue.  QNum has been around for years, and we
>> haven't had any issues that could've been plausibly avoided by asking
>> people to refrain from accessing its members.
>> 
>> If there was an actual need to keep the members private, I'd move the
>> struct out of the header, so the compiler enforces privacy.
>
> Understood.  There's still a question I'd like to answer, to
> decide how the API documentation should look like:
>
>   Is QNum.u/QNumValue.u required to be part of the API
>   documentation?
>
> If accessing that field directly is not necessary for using the
> API, I don't think it should appear in the documentation (because
> it would be just noise).

The current patch's comment on QNumValue looks good to me.

Does this answer your question?


