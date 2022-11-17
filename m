Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D1162D965
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 12:29:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovd31-0001w3-8j; Thu, 17 Nov 2022 06:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias@fiebig.nl>)
 id 1ovd2v-0001vB-PC; Thu, 17 Nov 2022 06:27:08 -0500
Received: from mail.aperture-labs.org ([195.191.197.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <tobias@fiebig.nl>)
 id 1ovd2t-0006p8-3D; Thu, 17 Nov 2022 06:27:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fiebig.nl; s=key01;
 t=1668684418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w1eZ1DmzeiIIofhlxiSiymNMYc4S62m+sVAPLfMZv1Y=;
 b=WtaN+BJOIy5z7oPQT8iGp57iKwdBd2f0RfNKszENx8ajTgAlKOD1evlKjMCqeJd32+okqz
 GaGwONA5MqsD/qpjd9ra+cMJlrjAqpnqGKNWPhib4fc0U7QFK9wVd87OY5nzcVF9zHRXPe
 KPFxHbHw+jQ2ExXEl4aUe1NS1lToasdwlvU0v3vLU15ch5KxvZPCUWMYM+fUiwZ/Lbr1Hb
 jEhhyc/MD51g7tCijIbFtv5Soh19fkAMz57naBpGOGmxPQPeIVhpVEWEhWYX7BjZIglSTt
 B4nn770wxFtMAyrY0hoFPYUNH4PRNZjEuN/91carZJ1En0JpoXoGVyJE8IFPow==
Received: from DESKTOP1J9BJ88 (<unknown> [2a06:d1c1:a:0:d0f7:15f4:7842:c716])
 by mail.aperture-labs.org (OpenSMTPD) with ESMTPSA id 566de064
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Thu, 17 Nov 2022 11:26:58 +0000 (UTC)
From: "Tobias Fiebig" <tobias@fiebig.nl>
To: "'Stefan Hajnoczi'" <stefanha@gmail.com>
Cc: "'Jason Wang'" <jasowang@redhat.com>,
 "'Stefan Hajnoczi'" <stefanha@redhat.com>, <qemu-devel@nongnu.org>,
 <qemu-stable@nongnu.org>,
 "'Russell King - ARM Linux'" <linux@armlinux.org.uk>
References: <20221115163659.1595865-1-stefanha@redhat.com>
 <011801d8f967$5dad0f00$19072d00$@fiebig.nl>
 <CACGkMEtJ2+2yhHgD33wiWvUEREei2ThQAkRNFWzRrDt5D50u+g@mail.gmail.com>
 <008c01d8f9ad$6ba58e20$42f0aa60$@fiebig.nl>
 <CAJSP0QUcYkKjJ1NMvKcs=03Z0Yjm+SD6H0wScJ-Zx62sXb6egQ@mail.gmail.com>
 <01e701d8fa2f$4124d750$c36e85f0$@fiebig.nl>
 <CAJSP0QX_PCNU6PFd8svnGJq5U9-0+weAN6MyiyYqWHkssY4QPA@mail.gmail.com>
 <CAJSP0QW76L82s=LM=RpWEwiFPFaNBe4J4AXBi6jtDR2h8dE1UQ@mail.gmail.com>
In-Reply-To: <CAJSP0QW76L82s=LM=RpWEwiFPFaNBe4J4AXBi6jtDR2h8dE1UQ@mail.gmail.com>
Subject: RE: [PATCH for-7.2] rtl8139: honor large send MSS value
Date: Thu, 17 Nov 2022 12:26:57 +0100
Message-ID: <004f01d8fa77$80cfe4b0$826fae10$@fiebig.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIsokZAyfqueh54+bOmp3YoqNF9QAEWPJjQAkWwLFsBcAFz4wIIdbmQApZ4LIEBfw6SlgLLtpjbrS371lA=
Content-Language: en-nl
Received-SPF: pass client-ip=195.191.197.3; envelope-from=tobias@fiebig.nl;
 helo=mail.aperture-labs.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Heho,
Ok, that explains a lot. I was also thinking that the vlan bit seem to =
overlap with the MTU field, and wanted to look at that later today.

Re the 12b: IIRC, the standard 1500 MTU for ethernet is already without =
the ethernet header; That can have up to 26b (18b basis, 4b 802.1q, 4b =
802.1ad), but leads to a total frame length of 1526 (with other =
additions (MPLS) also just making the frame bigger, without touching the =
MTU/MSS). MSS than as usual -40 for v4 and ~ -60 for v6.

So I doubt that those 12b are subtracted for the ethernet header.

Does somebody still have an RTL8139 around, to test how the real =
hardware behaved?

With best regards,
Tobias

-----Original Message-----
From: Stefan Hajnoczi <stefanha@gmail.com>=20
Sent: Thursday, 17 November 2022 12:16
To: Tobias Fiebig <tobias@fiebig.nl>
Cc: Jason Wang <jasowang@redhat.com>; Stefan Hajnoczi =
<stefanha@redhat.com>; qemu-devel@nongnu.org; qemu-stable@nongnu.org; =
Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH for-7.2] rtl8139: honor large send MSS value

After looking more closely at txdw0 it seems that the code mixes "Tx =
command mode 0", "Tx command mode 1", and "Tx status mode". The bits =
have different meanings in each mode, so this leads to confusion :).

Stefan


