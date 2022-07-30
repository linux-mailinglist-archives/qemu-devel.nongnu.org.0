Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F3E585A6E
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 14:29:16 +0200 (CEST)
Received: from localhost ([::1]:44816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHlak-00075o-Nn
	for lists+qemu-devel@lfdr.de; Sat, 30 Jul 2022 08:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oHlYx-0004N5-3y
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 08:27:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oHlYv-0002Fs-PC
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 08:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hHeKAFEIMNvoo/5G4AFSF8NqJCMC2P0AxoosWI5zs54=; b=DOZvawCeoaNqTLw2ETVgiOcr48
 Njr3EiEcrwnKuaPOqEhUqy9wxBYM3+btwS4Fza16uewoQFo+O524GV2wMRkHW4Wx2Ftgeo86KWopo
 3k2egMlDXbva63u6F+WdH5OzhQIJkcB3kf6J1M+nDf1moxvDplJucCLPzkO9yr0Au9SVbzMRh/4an
 qqoN3r2ApbkGYaVqBJnYNJgIWzz22e8VSq54vUoFYh1sLNh9Dt+nYMCPsh5OZShgyAhN2aHv/1uBZ
 Wr2Kk5HBp4T6fWlh2oviZxUjm7OHy/rmZSpY2lhA47Yu6va082FrKVkDqvGt9U1jD8czflgMiEwRn
 v/ZJ3j4das+o1t3a0uSnJOSBUxh3KNLIQ2sA2r+2SGwyftWoJkSYecsi9Aztt8kR2pIth9xJg6/iD
 a8fXETKld8mmZAJTs9IUDxgXwESq+Z9JUbAc69jpFxH2L7l100z15aDCkQel649ivF1p4SK9dPkMz
 seYNdYqrs/lc/2wlX5qmDeFlBc6ATL0qWL35XkX7+R5YnaOja3p1X0ZTcF+F21fM0PAYgn6MyN5Sf
 FK2BBoPAvuUGZPVzeb2EJbwKLV4Qzo9PgZfAndZFpUCNfzJf8IKuFkFjC4OQMLMsGW+8pWj8xVH28
 Q0hop0Xugqkjb37lPKMrVpzFRbg3LLHA6FnqqKTlw=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oHlXG-0006Ru-7y; Sat, 30 Jul 2022 13:25:42 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, fam@euphon.net, alxndr@bu.edu, qemu-devel@nongnu.org
Date: Sat, 30 Jul 2022 13:26:54 +0100
Message-Id: <20220730122656.253448-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH for-7.1 0/2] scsi-disk: fixes for block size crashes found by
 fuzzer
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two patches fix a couple of issues which were found by the fuzzer as a
consequence of allowing the guest to change the SCSI block size in commit
356c4c441e ("scsi-disk: allow MODE SELECT block descriptor to set the block size").

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (2):
  scsi-disk: fix overflow when block size is not a multiple of
    BDRV_SECTOR_SIZE
  scsi-disk: ensure block size is non-zero and changes limited to bits
    8-15

 hw/scsi/scsi-disk.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

-- 
2.30.2


