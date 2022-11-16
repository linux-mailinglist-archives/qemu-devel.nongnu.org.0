Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E71962BB66
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 12:21:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovGT6-00072M-Ip; Wed, 16 Nov 2022 06:20:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias@fiebig.nl>)
 id 1ovGT3-0006zn-Vn; Wed, 16 Nov 2022 06:20:34 -0500
Received: from mail.aperture-labs.org ([195.191.197.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <tobias@fiebig.nl>)
 id 1ovGT1-0008CH-So; Wed, 16 Nov 2022 06:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fiebig.nl; s=key01;
 t=1668597623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/kfoopRZLw4sPfQY1QuUpQmfpOCvdacocTEEvo7wmQo=;
 b=wLdw0t8lP+gbpFnnTvL9FeO2U1sZMoG0XnvAbc97OGSwqA98nMQTeYPI+2KVo/ZiBHzOhi
 Rmahz9uAQ5eq20WkTA2zfqJks096GILddEJjRwNWF4TJgmpe8sFYGtExOOpFKaMDMptfGs
 KSy5v5cFJi7IY+l8k2r4BvrkgIJ5N8xDceV4TWOOeQrrcja4OYftvo0FCYzTpDDzU4odBt
 keJqwgcZdhdtaHndwO3yLx/kDxPW4DKkE9tRortWHH3LzXf2WSuLS2YpX1GDdtvbX5DNhM
 FXS8h4D0imSWrmeTIteEfn2tIcbH/Zi27xuuFZDJLsRZWnzIgmv3i9ksG54kXA==
Received: from DESKTOP1J9BJ88 (<unknown> [2a06:d1c1:a:0:d0f7:15f4:7842:c716])
 by mail.aperture-labs.org (OpenSMTPD) with ESMTPSA id 8c899a1b
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Wed, 16 Nov 2022 11:20:23 +0000 (UTC)
From: "Tobias Fiebig" <tobias@fiebig.nl>
To: "'Jason Wang'" <jasowang@redhat.com>
Cc: "'Stefan Hajnoczi'" <stefanha@redhat.com>, <qemu-devel@nongnu.org>,
 <qemu-stable@nongnu.org>,
 "'Russell King - ARM Linux'" <linux@armlinux.org.uk>
References: <20221115163659.1595865-1-stefanha@redhat.com>
 <011801d8f967$5dad0f00$19072d00$@fiebig.nl>
 <CACGkMEtJ2+2yhHgD33wiWvUEREei2ThQAkRNFWzRrDt5D50u+g@mail.gmail.com> 
In-Reply-To: 
Subject: RE: [PATCH for-7.2] rtl8139: honor large send MSS value
Date: Wed, 16 Nov 2022 12:20:23 +0100
Message-ID: <008c01d8f9ad$6ba58e20$42f0aa60$@fiebig.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIsokZAyfqueh54+bOmp3YoqNF9QAEWPJjQAkWwLFsB7W81O61vx+HA
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
Quick follow-up; Applied the change you suggested, but there are still =
some things to test.

While this now works (mostly), MSS values are still off; Especially the =
behavior below <=3D1036 is difficult, as for v4 the minimum MTU is 576 =
and minimum MSS is 536:

Requested    DPRINT
1320              1292
1319              1291
1100              1024
1036              1024
1035                271
1000                268

So, I guess there is something else amiss; Will test more in-depth later =
tonight and shift the bits a bit; Also, I will look into behavior when =
forcing >1500 MTUs (in case that works with the rtl8139).

Sidenote: This all seems to be a non-issue for v6, as the RTL8139 does =
not support TSO for v6, so at least one thing less to worry about. ;-)

With best regards,
Tobias


