Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDBD4961AE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 16:02:23 +0100 (CET)
Received: from localhost ([::1]:47854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAvQk-0003Ev-Cs
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 10:02:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nAv3i-0002Qf-0B
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 09:38:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nAv3g-00087V-DT
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 09:38:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642775912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iEkkoGeah9eazI7KZ4JpCQw0Oq5wXabCYzluIMpj2AY=;
 b=jAGAcrn/OziSj5sT0FnTe3YONz1cbLHiew9kUPe5gOKxHGAs+ceJOFSnO92fNPOHrDbtMU
 jG54Zize+19CvP29qhitZgvnRrha9z/FVc8fpnDX3FzKjJErNH5FLro7CMaseOObdnyhuC
 +se9HtJEfZ/aJoAgwqtcjmLoiTgQtmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-HR8jMEk8Pt-hym_ePPX0fQ-1; Fri, 21 Jan 2022 09:38:23 -0500
X-MC-Unique: HR8jMEk8Pt-hym_ePPX0fQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADBEB8144E1;
 Fri, 21 Jan 2022 14:38:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B2741091EEA;
 Fri, 21 Jan 2022 14:38:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A9B991136421; Fri, 21 Jan 2022 15:38:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: MkfsSion <mkfssion@mkfssion.com>
Subject: Re: [PATCH v2] vl: Add support to set properties when using JSON
 syntax for -device via -set option
References: <20211224072511.63894-1-mkfssion@mkfssion.com>
 <87iluflsxg.fsf@dusky.pond.sub.org>
 <45fba3c2-11b8-7710-95ee-859f09aea332@mkfssion.com>
Date: Fri, 21 Jan 2022 15:38:20 +0100
In-Reply-To: <45fba3c2-11b8-7710-95ee-859f09aea332@mkfssion.com>
 (mkfssion@mkfssion.com's message of "Fri, 21 Jan 2022 20:59:20 +0800")
Message-ID: <8735lh40ir.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MkfsSion <mkfssion@mkfssion.com> writes:

> On 2022/1/19 22:08, Markus Armbruster wrote:

[...]

>> I don't think we should try to make -set work when using JSON arguments.
>>=20
> Thanks for your detailed review.

You're welcome!

> The following is my opinion towards implementing -set option for JSON arg=
uments.
> Having -set option worked for JSON argument improved compatability with l=
ibvirt (libvirt has switched to use JSON arguments for device by default). =
-set option is useful for libvirt user as libvirt doesn't support all funct=
ionality that QEMU provides.

I understand you'd like to tweak how libvirt configures things.  -set
used to work, but doesn't anymore.

> I have another idea for implementing this feature which seems addressed t=
he above issue. We can implement this feature by add new parameter that ref=
ers to options provided by -set option to qdev_device_add_from_qdict() (Thi=
s api seems is not widely used in QEMU tree) function and use old qobject_i=
nput_visitor_new() visitor for setting them.
> Do you think is OK to implement this feature in that way?

I'm afraid I don't understand what you're proposing.

Daniel Berrang=C3=A9 suggested to provide the means to tweak in libvirt:

    Message-ID: <YdRIOC4XbSOLDpMj@redhat.com>
    https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg00289.html

Would that work for you?

[...]


