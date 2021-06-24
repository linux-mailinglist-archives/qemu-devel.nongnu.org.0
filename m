Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995633B245B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 02:55:34 +0200 (CEST)
Received: from localhost ([::1]:33298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwDeX-00065g-3j
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 20:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lwDcO-0004rw-9q
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 20:53:20 -0400
Received: from pv34p98im-ztdg02172101.me.com ([17.143.234.142]:53318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lwDcM-0003ET-PP
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 20:53:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1624495997; bh=kUr48z4FtaOmqmozFkKalFqIn1+NVlDCN9fjI+LawBI=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=SBWs73+tK+hTtEjBUqte1QUQbZF77sqkNVF7xPhgsTusOO+uZB32DO54OeCgQbmaC
 MuaE1csJtsv0vhAjNBrBsKlsPO7J3C8loH5oaTzxFtsWCUsG/p+eDuvAnj83mpyskP
 nmFa1zb5BD+HaTCrDgHalGQGSh8KZ7hBl24Vm5Ml1Q6fj2xXG839u/VvCaPEgfGlle
 +VUEQKiyy6HAKzgwJLukridFzEKOBV3DbTDjSFGqgkE6Gx2OnhMqi/eULFMuPBqtCF
 3+JnufF2QAbmDq5DA5/m0cFj4a4LQR5aw1WsbvI8h2mmZ3Szwzp3dPc/jpGrNJcqyE
 31gwRljUL522Q==
Received: from smtpclient.apple (unknown [17.11.62.76])
 by pv34p98im-ztdg02172101.me.com (Postfix) with ESMTPSA id C58D354028F;
 Thu, 24 Jun 2021 00:53:16 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: Guidance on emulating "sparse" address spaces
From: Jason Thorpe <thorpej@me.com>
In-Reply-To: <13c2d220-4000-74e2-a07b-88d6b898fb34@amsat.org>
Date: Wed, 23 Jun 2021 17:53:15 -0700
Cc: qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4E502648-2EFD-4A0E-B161-2C2410709536@me.com>
References: <B588EDAA-3A97-44A9-8CAF-B2858CBE0A93@me.com>
 <13c2d220-4000-74e2-a07b-88d6b898fb34@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-23_14:2021-06-23,
 2021-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=689 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2106240003
Received-SPF: pass client-ip=17.143.234.142; envelope-from=thorpej@me.com;
 helo=pv34p98im-ztdg02172101.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> On Jun 23, 2021, at 5:42 PM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
>> I'm trying to wrap my head around how to achieve this in Qemu.  I =
don't see an obvious way from my initial study of how the PCI code and =
memory regions work.  Some guidance would be appreciated!
>=20
> Is bitband_ops[] useful? (see hw/arm/armv7m.c)

Thanks for the pointer!  Yes, it seems like that might be similar to =
what I need... create new address spaces (rather than using the "system" =
address space) for the PCI memory and I/O regions (I need to do this for =
PCI configuration space, too, FWIW...), then in my sparse ops handlers, =
decode the bus address and size, and then call =
address_space_{read,write}().  Have I got the gist of it?

-- thorpej


