Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEBC284088
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 22:20:26 +0200 (CEST)
Received: from localhost ([::1]:37436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPWy9-0004Av-F1
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 16:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1kPWZr-00040n-Iq; Mon, 05 Oct 2020 15:55:19 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:35790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1kPWZo-0007S2-Po; Mon, 05 Oct 2020 15:55:19 -0400
Received: from sekoia-pc.home.lmichel.fr (sekoia-pc.home.lmichel.fr
 [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPS id 9EFC4C60F1B;
 Mon,  5 Oct 2020 19:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1601927714;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2YvRWU8Q71r/HodOj2Tq1W8QbOOySWrqCTp2w6lz2kQ=;
 b=Mywm6ZpDAbIthRVxtnIwbd1hq9qx8M3cIHlhxLekBXVSs2dJxonj3ocI9Wy3x9Ul/d/8dK
 zLFwQ2MBcKIITLkMaSillQLAO0v1N2NzrGU5ybyuV04vtBtQie1+xC6XH+Cakgub6r+aqd
 6Ypk/WgAHq1KT3hAtHIxABa+9p/DcjQqkd6chOPw+VmCyznBEG18oiJiwSzj3c5LohU+WR
 RSUH0jfo2LKe5T+paNH76M2PafpugB9l3ONcGvyvhD9fURR5JcvfE1nvQhjoOpk1aXJt0d
 dMnLpJqmuWyQH5vo2zBk/7saX/RZao9HeecIW+qaksdtzuOgrJdjVa8QX0Wbpw==
From: Luc Michel <luc@lmichel.fr>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/15] hw/core/clock: add the clock_new helper function
Date: Mon,  5 Oct 2020 21:56:00 +0200
Message-Id: <20201005195612.1999165-4-luc@lmichel.fr>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005195612.1999165-1-luc@lmichel.fr>
References: <20201005195612.1999165-1-luc@lmichel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr;
 s=pharaoh; t=1601927714;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2YvRWU8Q71r/HodOj2Tq1W8QbOOySWrqCTp2w6lz2kQ=;
 b=euQcevv4jynwm0+jfP9KKIrNU4Y01UbJTG0h4lXLD49juT4KstHkr2IMk0tjB9BZhuyXMa
 OVFwczELmt1pV04A1N93dJqB0AUDEwcvyWxUptTrnt9EuLVt6gTNADKlS1wR3N5/yxHDWu
 wZR8hHeRr2BmrlIAD5uIHCWpq6p4Wmm47ptOsn7PGxCRkhCC81U0KHigaOA8QaXtEF7U0P
 12uh9vyGWldEJbkENCAUdQpRx5oBuZ3TkhrD7yg89u5y2aKTRlvKUYZSSI1ZkCOOseX1O5
 Rbhi95YzlE6WhPrTcOGiwSEL0e9MPXLK6HYkG5n1dbrDAkk17tZFD5PkutskCQ==
ARC-Seal: i=1; s=pharaoh; d=lmichel.fr; t=1601927714; a=rsa-sha256; cv=none;
 b=azX0yWmV/MrtJ1Cez+JfxoYNRUCJ5bwfr8vVNnDsQOxzETU6YJW4npnYD7ODeqrqXe1Pz8NCoreNqlMLOxUSSapTTb3M6lNQsn3bpXH0CLzoxT/Vuiga8Lwvht4iCIox19hbGNda6Jj45xd25XncfmIEex5U9UVIVkYQ+oyvhUHgTX3TR9J3UZ+SrFPvaB0apbDWT7FLAcSZaO7ArmHueknhIu2JBV6N9twd/8p2NDJFE1pkG7V9JWEWRp333Mb5Gu3+bW1v92PRnBP6UoGut9F8+Tkm3qONeW8ae+/CvgEp1ChBrmSk43IlDJgtGDETkFTs0neGwWJcrNKbiHhy6g==
ARC-Authentication-Results: i=1;
	pharaoh.lmichel.fr
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 15:49:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function creates a clock a parent it to another object with a given
name. It calls clock_setup_canonical_path before returning the new
clock.

This function is useful to create clocks in devices when one doesn't
want to expose it at the qdev level (as an input or an output).

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Luc Michel <luc@lmichel.fr>
---
 include/hw/clock.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/hw/clock.h b/include/hw/clock.h
index c93e6113cd..a67c4c008b 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -93,10 +93,36 @@ extern const VMStateDescription vmstate_clock;
  *
  * compute the canonical path of the clock (used by log messages)
  */
 void clock_setup_canonical_path(Clock *clk);
 
+/**
+ * clock_new:
+ * @parent: the clock parent
+ * @name: the clock object name
+ *
+ * Helper function to create a new clock and parent it to @parent. There is no
+ * need to call clock_setup_canonical_path on the returned clock as it is done
+ * by this function.
+ *
+ * @return the newly created clock
+ */
+static inline Clock *clock_new(Object *parent, const char *name)
+{
+    Object *obj;
+    Clock *clk;
+
+    obj = object_new(TYPE_CLOCK);
+    object_property_add_child(parent, name, obj);
+    object_unref(obj);
+
+    clk = CLOCK(obj);
+    clock_setup_canonical_path(clk);
+
+    return clk;
+}
+
 /**
  * clock_set_callback:
  * @clk: the clock to register the callback into
  * @cb: the callback function
  * @opaque: the argument to the callback
-- 
2.28.0


