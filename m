Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E61662B72A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 11:06:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovFHf-0007yp-AA; Wed, 16 Nov 2022 05:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias@fiebig.nl>)
 id 1ovFHb-0007yO-Dd; Wed, 16 Nov 2022 05:04:39 -0500
Received: from mail.aperture-labs.org ([195.191.197.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <tobias@fiebig.nl>)
 id 1ovFHZ-0000km-8P; Wed, 16 Nov 2022 05:04:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fiebig.nl; s=key01;
 t=1668593069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqDS8M97s63f1/npeupwi1Q9FQjxY/BdGPJaRE0JmiA=;
 b=m8QYAoGJVcaAagcdCmeeXNOzAtR6eIzF8Dp0/ZyWNBILYsNO1F774bT70VwvkNci6i+adR
 zsgynN3cPP1HlQb/y7W54WEHPFLGZnqKzlg6S3tMLAjJj+DWnaL2LjKmsMt15RmRCZEiBA
 lIL90cCjMosfRQ7aO7W/lWvqimGBZE+JEaStdD6qMCdhc0F3ehFw9I99vfKtQusXeLb55T
 7zxmFEvWzODwKyAamKcGbLxzpPgILfnfIVn8li/48e0+BuAmTRBZ76TPvXsgfx1EkmbRbB
 t3hGDM1qEKfFn0xqyvUOH7woi+1mRbqQmoEx/qocHYu93wvojT6oMEaUFspXXw==
Received: from DESKTOP1J9BJ88 (<unknown> [2a06:d1c1:a:0:d0f7:15f4:7842:c716])
 by mail.aperture-labs.org (OpenSMTPD) with ESMTPSA id 32d0832f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Wed, 16 Nov 2022 10:04:29 +0000 (UTC)
From: "Tobias Fiebig" <tobias@fiebig.nl>
To: "'Jason Wang'" <jasowang@redhat.com>
Cc: "'Stefan Hajnoczi'" <stefanha@redhat.com>, <qemu-devel@nongnu.org>,
 <qemu-stable@nongnu.org>,
 "'Russell King - ARM Linux'" <linux@armlinux.org.uk>
References: <20221115163659.1595865-1-stefanha@redhat.com>
 <011801d8f967$5dad0f00$19072d00$@fiebig.nl>
 <CACGkMEtJ2+2yhHgD33wiWvUEREei2ThQAkRNFWzRrDt5D50u+g@mail.gmail.com>
In-Reply-To: <CACGkMEtJ2+2yhHgD33wiWvUEREei2ThQAkRNFWzRrDt5D50u+g@mail.gmail.com>
Subject: RE: [PATCH for-7.2] rtl8139: honor large send MSS value
Date: Wed, 16 Nov 2022 11:04:26 +0100
Message-ID: <003c01d8f9a2$cffad4d0$6ff07e70$@fiebig.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIsokZAyfqueh54+bOmp3YoqNF9QAEWPJjQAkWwLFutfyD2kA==
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
> Ok, I think I found at least one issue:
>=20
> /* large send MSS mask, bits 16...25 */
> #define CP_TC_LGSEN_MSS_MASK ((1 << 12) - 1)
>=20
> First, MSS occupies 11 bits from 16 to 26 Second, the mask is wrong it =
should be ((1 << 11) - 1)
Awesome, thanks, will give this a shot later on and let you know.

With best regards,
Tobias


