Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331C965AA33
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 15:45:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBzZJ-0005aX-Od; Sun, 01 Jan 2023 09:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pBzZ5-0005YH-TK
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 09:43:58 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pBzZ0-0003l9-JC
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 09:43:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ElL49Sqzdf7MIXuxwXtF3hqK4Ur0aBuQ7FtVeV4GtM4=; b=DO8HaF/0WZsZmlz0UhPZha+0Gs
 c7pP8JbKH5Uj10zgB0IkKgBUNTmP8eNkIi9LjyTJvYwAZSXfvRWJIJCYWchkhAiifKOvoEjk1EPb/
 v4bvhu1qPAnXvYBMdFu68s5IbHOcssU378QH1frpBaPGeq9rd1qWtyMkC0agLCKDW+aylc8I6lAHE
 if7kFicjmbrJIp2LNpywE9Y5PLU8KfTs06Aee8hXzCUZWSYMAU64IoTzKRtdsFQrCi5GMaVaI+NNJ
 orfsA+RGqIio1EZd9PlxzQ5pQqHTcuoy+gplnGRgM7l5G2q7VKohjDhM7mILxuhjTRCo/nIAgQqMH
 SI4YT+yUhbNBcVIFzlws/w02Za2uiF7R7HUVqJOi3I6wcaZTbuyluvS9LDfKnr6nRDewYJs92IQ8P
 ytrnZ4X+JeiTtO+axN+D6gGEjDVYB+tKS9uXJnNB9CvXiUVPpO31hawYdlsOldAK8W3syzu5gknhl
 PqOks0YJQrf+YaITJGRj1pQ/SstQHzgsywXl7ECrrmatPBU5b6xY3EY9wGpeWA8hGiy0+lRMpCGe2
 hIcBZ7Lrzg6lc4waeXtS8fiICsm0XHSsVL8IdUVPwhASnyk9rFnicwpDd0dze2T8WmjGYvbwo7ied
 yjVzDcitfmrybAUI3ZTBfWZNB5AtgN2BojOLgSKoc=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pBzYa-0001W3-TJ; Sun, 01 Jan 2023 14:43:29 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sun,  1 Jan 2023 14:43:34 +0000
Message-Id: <20230101144339.60307-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/4] target/m68k: fix FPSR quotient byte for fmod and frem
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


Mark Cave-Ayland (4):
  target/m68k: pass quotient directly into make_quotient()
  target/m68k: pass sign directly into make_quotient()
  target/m68k: fix FPSR quotient byte for fmod instruction
  target/m68k: fix FPSR quotient byte for frem instruction

 target/m68k/fpu_helper.c | 43 ++++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 17 deletions(-)

-- 
2.30.2


