Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93F81544B6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 14:18:38 +0100 (CET)
Received: from localhost ([::1]:38956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izh3G-0002UM-12
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 08:18:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37067)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1izgrP-00081m-Rd
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:06:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1izgrO-0004tQ-US
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:06:23 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38607
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1izgrO-0004tI-Ql
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:06:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580994382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V6HXzhNVBZVIknjU4RHEtR/eSgtmHlHskb3iHjFCwVg=;
 b=TdPTOpy15GdgFANPRgws3YPJa+MRvbyI1sOizCFwdVP8tJ0tdMv+FV5PvJoE9hTpSpnTUs
 JfVp8l6/GDKr7F2xRXfrJ6bBF0WwR/xW0gN3ZXHny/XbXDL0IEdb4XJNq/iNUeRKGqQf4h
 U6IfWW1pROqQn4Qkr4uBWTdWq5gD2HU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-n1LaLXYXOdWE_2vjWsnxRQ-1; Thu, 06 Feb 2020 08:06:20 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61E62800D6C;
 Thu,  6 Feb 2020 13:06:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-136.ams2.redhat.com
 [10.36.116.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BA368E9E5;
 Thu,  6 Feb 2020 13:06:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 952C711386A7; Thu,  6 Feb 2020 14:06:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kamil Rytarowski <n54@gmx.com>
Subject: Re: [PATCH v2 4/4] Add the NVMM acceleration enlightenments
References: <20200107124903.16505-1-n54@gmx.com>
 <20200128140945.929-1-n54@gmx.com> <20200128140945.929-5-n54@gmx.com>
 <0ed12efa-eee4-b3ff-8f02-f9c3b80d0e21@redhat.com>
 <2ae4caf9-05fd-b740-2612-e1c1ecafe277@gmx.com>
Date: Thu, 06 Feb 2020 14:06:08 +0100
In-Reply-To: <2ae4caf9-05fd-b740-2612-e1c1ecafe277@gmx.com> (Kamil
 Rytarowski's message of "Thu, 6 Feb 2020 11:24:44 +0100")
Message-ID: <87o8ubuapr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: n1LaLXYXOdWE_2vjWsnxRQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, slp@redhat.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, max@m00nbsd.net,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kamil Rytarowski <n54@gmx.com> writes:

> On 03.02.2020 12:54, Philippe Mathieu-Daud=C3=A9 wrote:
>>> @@ -2029,6 +2072,19 @@ static void qemu_whpx_start_vcpu(CPUState *cpu)
>>> =C2=A0 #endif
>>> =C2=A0 }
>>>
>>> +static void qemu_nvmm_start_vcpu(CPUState *cpu)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 char thread_name[VCPU_THREAD_NAME_SIZE];
>>> +
>>> +=C2=A0=C2=A0=C2=A0 cpu->thread =3D g_malloc0(sizeof(QemuThread));
>>> +=C2=A0=C2=A0=C2=A0 cpu->halt_cond =3D g_malloc0(sizeof(QemuCond));
>>
>> Nitpick, we prefer g_new0().
>
> In this file other qemu_*_start_vcpu() use  g_malloc0().
>
> I will leave this part unchanged and defer tor future style fixups if
> someone is interested.

Time to re-run Coccinelle with the semantic patch from commit
b45c03f585e.


