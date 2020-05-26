Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12741DBC17
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 19:57:03 +0200 (CEST)
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbSxi-0002yN-Jf
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 13:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jbSwV-0001z2-UN
 for qemu-devel@nongnu.org; Wed, 20 May 2020 13:55:47 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:52145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jbSwS-0000o9-GZ
 for qemu-devel@nongnu.org; Wed, 20 May 2020 13:55:45 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C7A5874594E;
 Wed, 20 May 2020 19:55:39 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A956F745702; Wed, 20 May 2020 19:55:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A7B637456F8;
 Wed, 20 May 2020 19:55:39 +0200 (CEST)
Date: Wed, 20 May 2020 19:55:39 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/6] Misc display/sm501 clean ups and fixes
In-Reply-To: <cover.1589981990.git.balaton@eik.bme.hu>
Message-ID: <alpine.BSF.2.22.395.2005201948530.21248@zero.eik.bme.hu>
References: <cover.1589981990.git.balaton@eik.bme.hu>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sebastian Bauer <mail@sebastianbauer.info>,
 Magnus Damm <magnus.damm@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 dino.papararo@gmail.com, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 May 2020, BALATON Zoltan wrote:
> Hello,
>
> These are some small clean ups and changes to hopefully improve 2D
> engine performance and fix a security bug in it. I've only tested it
> lightly, haven't verified if breaking it is still possible. It's also
> known to change handling of right to left blits which may not be able
> to handle overlaping regions but the only guest known to use it
> (AmigaOS on sam460ex) seems to be OK with this so unless this is
> proven to be needed I won't try to fix that now, this could be
> addressed in later patches.

I've found a case where not handling right to left causes a problem (can 
be reproduced by scrolling window content which will do overlapping blits) 
so this will need some more work but the basic idea can be tested with 
this version.

Does anyone know how the X server or other users of pixman handle this as 
pixman does not seem to have support for other than left to right top to 
bottom blits?

Regards,
BALATON Zoltan

