Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8169C534249
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 19:38:26 +0200 (CEST)
Received: from localhost ([::1]:37894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntuxl-0005Dv-LS
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 13:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntusj-0005ih-Tr
 for qemu-devel@nongnu.org; Wed, 25 May 2022 13:33:13 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntusV-0002HY-Jy
 for qemu-devel@nongnu.org; Wed, 25 May 2022 13:33:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cOsyLI4BQpqmY3oYM63LD8HIF/HgPjxlPtwW+9QdcEw=; b=oP+qLiR4+9PyJ3sOuobnNLfvF8
 1Ml3rhhKeCaMkRUTUiZrUQrdHmuShADLEEmsFvXHo7j4SEa9KlsAjAt+FiZiWjQePz17lbgjMDyn2
 OsuW6y1eJUJGI8ohE8586OO5zd6aIIgdprRBeWH+gC7MVY8cRAJxjxCKRfPtZ7MdPr33UVD3zA147
 SUhhzBbwpZDJvKzpkyqaj51PDrJGZYhDPejV4wXIqHBc7AXJEdWCXh+GJNnnqTSw/BqzH/Tdh4qms
 Uy86QBFFFeszGnThz4Rm0AZgj4C+qelkyzvRBs+s3dd4eHWFF/UCCVCE4B9abcrtHKft1lv7RV2r1
 IIYwmvfkwMLjVROW+TTU/P6VzKBg65iQMvsoYdArX+5wVhtBaZCSR5uo72x9NedHhiQuZaBA/HNFc
 19mupk79Nd4/WwM90b9rH8jzXx3awh2959jROH2deCZHLWxfXdTX5RSVu35w9bgbmeeS1zOzPxPwU
 gYtVD0m97vLOJ5l91c+HAmnhCj5forPGwlNv9JXTrkKt/WjT6g+WN+jG1RazCPkwOVNdPVdXv/3z9
 pFFENNl1uigxayAUY826GgeO7LyV+05a1clqnEkcnt3gLyycENN8xtcjiRllN61EPHFlBJdxiMhEE
 DuAeInFYQt5dwDMJ/7URh5n4wxUih5lK5tjQWtbbM=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nturQ-0006Pu-FW; Wed, 25 May 2022 18:31:56 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 jean-philippe@linaro.org, qemu-devel@nongnu.org
Date: Wed, 25 May 2022 18:32:30 +0100
Message-Id: <20220525173232.31429-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220525173232.31429-1-mark.cave-ayland@ilande.co.uk>
References: <20220525173232.31429-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 4/6] tests/acpi: virt: allow VIOT acpi table changes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..8367ffe1d4 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/VIOT",
-- 
2.20.1


