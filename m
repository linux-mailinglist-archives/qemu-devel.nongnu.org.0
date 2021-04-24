Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDD4369EF2
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 07:29:15 +0200 (CEST)
Received: from localhost ([::1]:60196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laAqw-0001yt-Mk
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 01:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1laApz-0001a4-P3
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 01:28:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1laApy-0005Bm-4n
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 01:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619242093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dwe1rr93mk3hwMcE+NwiWXZjueXi05LWdV4bvtqkZGQ=;
 b=GWRcJ2nVXToG6nkltHJQ2GG8V71/tZ0KfoIcpLJo7OOayR1QFUBAlE9AsiPe55L9gHBrnH
 Tc7KIV3j1w9FEC5QcFEfb3dbz9fIVJsoEfk8OGpPHxXbCfd9lrOUec5AME0C30RGFZwqoE
 7Y7ly//30Y30sGuX7SCF9P1kVxO0tgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-1hVxZCVPM16mPVvIE_JJCQ-1; Sat, 24 Apr 2021 01:28:10 -0400
X-MC-Unique: 1hVxZCVPM16mPVvIE_JJCQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A736B8030C4;
 Sat, 24 Apr 2021 05:28:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CFAE5D745;
 Sat, 24 Apr 2021 05:28:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CC6B9113525D; Sat, 24 Apr 2021 07:28:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: Resetting non-qdev children in a 3-phase reset device
References: <CAFEAcA8k+RUNhAOzCeefBs+vcyAgrtHwHMH9KfQb6OJg0su_7w@mail.gmail.com>
 <fc080508-9b82-8a2b-79bb-ab4e9f812cce@amsat.org>
 <CAFEAcA8hs3Uw=8-_CFa_GoMhmqxCcHw5t751oKzicd0_+Dh8kA@mail.gmail.com>
 <87y2datpyw.fsf@dusky.pond.sub.org>
 <5570bf5a-3cab-c30c-2c21-0ab02543199e@amsat.org>
 <2f4155ca-ee84-75f0-8b35-aac6b18ee4f0@amsat.org>
 <3dcb8efa-8f6b-0f45-a753-cc58d3bf9855@amsat.org>
Date: Sat, 24 Apr 2021 07:28:07 +0200
In-Reply-To: <3dcb8efa-8f6b-0f45-a753-cc58d3bf9855@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sat, 24 Apr 2021 01:28:56
 +0200")
Message-ID: <87im4cb6ag.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 4/24/21 1:06 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>
>> Looking at qemu_register_reset() uses I found this commit:
>>=20
>> commit 0c7322cfd3fd382c0096c2a9f00775818a878e13
>> Date:   Mon Jun 29 08:21:10 2015 +0200
>>=20
>>  watchdog/diag288: correctly register for system reset requests
>>=20
>>  The diag288 watchdog is no sysbus device, therefore it doesn't get
>>  triggered on resets automatically using dc->reset.
>>=20
>>  Let's register the reset handler manually, so we get correctly notified
>>  again when a system reset was requested. Also reset the watchdog on
>>  subsystem resets that don't trigger a full system reset.
>>=20
>> Why is the reset() handler in DeviceClass and not in SysbusDeviceClass
>> if "Only sysbus devices get reset"? ...
>
> Ah, probably because the problem is generic to all busses (ISA, ...)
> and not just sysbus.

diag288 is a bus-less device.  Propagating reset from the root of the
qtree to the leaves won't reach it, because the qtree contains only the
devices that plug into a qbus.

>>>> Sysbus may habe been a design mistake.  It goes back the qdev design
>>>> assumption "every device plugs into exactly one bus, every bus is part
>>>> of exactly one device, and the main system bus is the root of this
>>>> tree".  The assumption ceased to hold long ago, but we still have
>>>> sysbus.


