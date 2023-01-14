Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A05F66AEC4
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 00:31:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGpyi-0006Tu-4E; Sat, 14 Jan 2023 18:30:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pGpye-0006TZ-IG
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 18:30:22 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pGpyd-0003vH-0Y
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 18:30:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DQmezFUw/eYIKsVBJnun/bpKJQ/etb/fuXFA5dwN1yg=; b=hjkHiBA5fM4bP9eg4Oz5JuKpKW
 2bmVVKnSO/ahrVIeIzm5l/nhbo/E6b0j4D/vQKaSe8ndwYLwFk1if5snOrG9Q9LKtEmb9zSM2Ku6C
 Q6NYL5g3o0Rg2ZuZIQD+SUb6eZUKMHWLYR4MjRUF2m8v0yO4Y3HNwrE/RkW++CYXVN9HjiMyb1UXV
 Ej2y1K6GHTvzaXF6ggcj3VaRMQOqu/ta159lACbe0HW5e6cTvMn2I3zLqVN9+UpL5zKQe5yCs7mNm
 k2IJ/6nSWGLjPQJ5HhLfRxQ8hOZEKAoikzn7EyNheYcvy5QeOB5YFl2QUbaxUZw2BmXoiYozPApmQ
 eR5s1Sau3spfIkqiqY/+Vz2S39dhsdXEswmEL+bdg+ibiqrcqC/cArjEkq2UsfDQauFxZa7xDTSiR
 CHmpiMsyMa/Dt3ZQ4Z0F8Lx8lTR2dRv3f7rTtO5cUVHl4bbvM49Vk7CiaB6x6sxNwUPQ5vcMSj0+V
 mTex1yju9hoq78JSSfn1r/6ECt6RSqbHBZNeVXToet4nNNAPjyDAiVPQpRFYVg3UIOtECJActyAe/
 JLYBm9EulLtY3nP6yDHbgwqFQd6jM1LyMc6SQbIL6qVkwi9mR1sjs6ahhJiIt7o05SBiPkHSV2MDT
 os7rdo/UQH/Q2xWEBtr01OJGPLkb0NXmsTZc6PZuU=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pGpy7-0002Ab-KB; Sat, 14 Jan 2023 23:29:51 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sat, 14 Jan 2023 23:29:55 +0000
Message-Id: <20230114232959.118224-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 0/4] target/m68k: fix FPSR quotient byte for fmod and frem
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

This series is taken from my MacOS branch and fixes setting the FPSR quotient
byte for the fmod and frem instructions which was causing the MacOS _Pack5
SANE trancendentals implementation to return incorrect values for sin() and
cos().

The first 2 patches update make_quotient() to take separate sign and value
parameters so that it can be used for both floatx80_modrem() and a manual
division calculation, whilst the last 2 patches fix the value of the quotient
byte for both the fmod and frem instructions. This series has been validated
against the fmod and frem results using a custom test program which has been
run on a real 68040 Mac.

Many thanks to the mac68k folk for their help debugging this, in particular
SolraBizna for narrowing down the issue to the transcendentals and writing
the custom test program, and also treellama and Cat7 for running the test
program on real hardware and uploading the generated results file for
further analysis.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

v3:
- Drop R-B tags from patch 4
- Rework patch 4 as suggested by Richard

v2:
- Add Laurent's R-B tags to patches 1, 3 and 4
- Rework patch 2 as suggested by Richard


Mark Cave-Ayland (4):
  target/m68k: pass quotient directly into make_quotient()
  target/m68k: pass sign directly into make_quotient()
  target/m68k: fix FPSR quotient byte for fmod instruction
  target/m68k: fix FPSR quotient byte for frem instruction

 target/m68k/fpu_helper.c | 49 +++++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 18 deletions(-)

-- 
2.30.2


