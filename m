Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3131F62B1A1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 04:01:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov8e2-0003yo-O1; Tue, 15 Nov 2022 21:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias@fiebig.nl>)
 id 1ov8e0-0003yX-7n; Tue, 15 Nov 2022 21:59:21 -0500
Received: from mail.aperture-labs.org ([195.191.197.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <tobias@fiebig.nl>)
 id 1ov8dx-0002K7-D2; Tue, 15 Nov 2022 21:59:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fiebig.nl; s=key01;
 t=1668567537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gnQPo5C4Uy3g049zDmvGKrEqbIHMwh7mCZYuYhvz5fQ=;
 b=FGrAyprBCduf6F5WbN6lrFi8SQ5mWbCfhofHpOi3x1waU8fbEOZRBjcsb/pUgH/HB8Fn25
 rxoWBL7KyZCBdKTQ466gPliVQ7cHNpAIeuMC/ot4EzEcUJx/C+geJ7hBQFZGAJhY+5i8sE
 nPV/rSlAQ9NamPNNv7mzs078jhW29jXWTJmaWHUJFV37IidphZ7g3tDJAsHmY1IVGAl8gs
 5gImd48+vTOdcWa9fh/6R6l45PN4eyihlXX5acTfpHSG53Ix3lg0VpY/OZXg7fOdf0AV05
 Ik7wHt+WwIYpl6KjKB7hOew8/wqS6TNkzF0orjz6qsuJ23W7pYC0yjOWR2XnfA==
Received: from DESKTOP1J9BJ88 (<unknown> [2a06:d1c1:a:0:d0f7:15f4:7842:c716])
 by mail.aperture-labs.org (OpenSMTPD) with ESMTPSA id a126268a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Wed, 16 Nov 2022 02:58:57 +0000 (UTC)
From: "Tobias Fiebig" <tobias@fiebig.nl>
To: "'Stefan Hajnoczi'" <stefanha@redhat.com>,
	<qemu-devel@nongnu.org>
Cc: <jasowang@redhat.com>, <qemu-stable@nongnu.org>,
 "'Russell King - ARM Linux'" <linux@armlinux.org.uk>
References: <20221115163659.1595865-1-stefanha@redhat.com> 
In-Reply-To: 
Subject: RE: [PATCH for-7.2] rtl8139: honor large send MSS value
Date: Wed, 16 Nov 2022 03:58:54 +0100
Message-ID: <011801d8f967$5dad0f00$19072d00$@fiebig.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIsokZAyfqueh54+bOmp3YoqNF9QAJffM5ArYaKxRA=
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
I just tested around with the patch;
Good news: Certainly my builds are being executed. Also, if I patch the =
old code to have a MAX_MTU <=3D the max MTU on my path, throughput is =
ok.

Bad news: Something is wrong with getting the MSS in the patch you =
shared. When enabling DPRINT, values are off (sent MSS vs. printed MSS):
600 2060
800 2308
1000 2316
1023 2307
1200 3076
1400 3340 (most likely clamped to 1320)

Fiddling around a bit more, I found txdw0 printed earlier in the stack =
as hex (sent MSS, txdw0):
769 900502f5
1000 900503dc
1280 900504f4
1281 900504f5
1301 90050509
1317 90050519
1320 9005051c

This maps rather well to:
MSS =3D txdw0 - 2416246772=20
MSS =3D txdw0 - 9004FFF4

Sadly, my C is 'non-existent' and it is kind-of 4AM, so also not in the =
brainspace to fill those gaps. But if one of you could look at the patch =
again, that would be nice. Otherwise, I should have some brainspace for =
this tomorrow night (UTC) again.

With best regards,
Tobias


