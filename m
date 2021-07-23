Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987DD3D3B9B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 16:07:08 +0200 (CEST)
Received: from localhost ([::1]:51472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6vpT-00019w-E4
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 10:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1m6vmn-0007uZ-V0
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:04:23 -0400
Received: from dedi548.your-server.de ([85.10.215.148]:36100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1m6vmj-0002t3-Hi
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:04:21 -0400
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by dedi548.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1m6vmf-000G05-GF
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 16:04:13 +0200
Received: from [82.100.198.138] (helo=mail.embedded-brains.de)
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1m6vmf-000LWW-Dc
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 16:04:13 +0200
Received: from localhost (localhost.localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 1C1F62A1610
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 16:04:13 +0200 (CEST)
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xsIOOKBFLYuR for <qemu-devel@nongnu.org>;
 Fri, 23 Jul 2021 16:04:12 +0200 (CEST)
Received: from localhost (localhost.localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id CBD1C2A165B
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 16:04:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LuVrJS16ShZl for <qemu-devel@nongnu.org>;
 Fri, 23 Jul 2021 16:04:12 +0200 (CEST)
Received: from shuber-nb-linux.eb.localhost (unknown [10.10.171.10])
 by mail.embedded-brains.de (Postfix) with ESMTPSA id A85132A1610
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 16:04:12 +0200 (CEST)
Subject: Re: [PATCH] hw/intc/arm_gic: Fix set/clear pending of PPI/SPI
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: qemu-devel@nongnu.org
References: <20210709094948.60344-1-sebastian.huber@embedded-brains.de>
Message-ID: <8d22a0b9-8a45-90cf-1095-aff08fde79b3@embedded-brains.de>
Date: Fri, 23 Jul 2021 16:04:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210709094948.60344-1-sebastian.huber@embedded-brains.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: smtp-embedded@poldinet.de
X-Virus-Scanned: Clear (ClamAV 0.103.2/26241/Fri Jul 23 10:20:30 2021)
Received-SPF: pass client-ip=85.10.215.148;
 envelope-from=sebastian.huber@embedded-brains.de; helo=dedi548.your-server.de
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) NICE_REPLY_A=-0.203, SPF_HELO_NONE=0.001,
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

On 09/07/2021 11:49, Sebastian Huber wrote:
> According to the GICv3 specification register GICD_ISPENDR0 is Banked f=
or each
> connected PE with GICR_TYPER.Processor_Number < 8.  For Qemu this is th=
e case
> since GIC_NCPU =3D=3D 8.
>=20
> For SPI, make the interrupt pending on all CPUs and not just the proces=
sor
> targets of the interrupt.
>=20
> This behaviour is at least present on the i.MX7D which uses an Cortex-A=
7MPCore.

Could someone please have a look at this patch?

--=20
embedded brains GmbH
Herr Sebastian HUBER
Dornierstr. 4
82178 Puchheim
Germany
email: sebastian.huber@embedded-brains.de
phone: +49-89-18 94 741 - 16
fax:   +49-89-18 94 741 - 08

Registergericht: Amtsgericht M=C3=BCnchen
Registernummer: HRB 157899
Vertretungsberechtigte Gesch=C3=A4ftsf=C3=BChrer: Peter Rasmussen, Thomas=
 D=C3=B6rfler
Unsere Datenschutzerkl=C3=A4rung finden Sie hier:
https://embedded-brains.de/datenschutzerklaerung/

