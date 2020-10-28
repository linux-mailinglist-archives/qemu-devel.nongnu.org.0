Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9908929D268
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 22:21:15 +0100 (CET)
Received: from localhost ([::1]:55006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXssc-0005Lh-Nf
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 17:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kXsql-0004bM-Sx
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 17:19:19 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:4027)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kXsqi-0007TP-CB
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 17:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1603919956; x=1635455956;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tF3XORPptp80IhMj+xxICUUjXW0fjQEn9q9GfewXzkE=;
 b=i51TJnCvawCbwiCEZZ5wG1/gQB+EwL4o0NP/54DGJrF/h1ToVQhOQ7mv
 0en67jK6Lv2PZRjaccLDYmhnMMU/1hWWPprw9E3dEVIu6lrKpSFFMMINg
 M07/lyLw3NBWlj8zAndas0W0xWlw4pLiRUCgcbcNxMuZVDgvGlnL1AcBI o=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Oct 2020 14:19:13 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 28 Oct 2020 14:19:12 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 886307BD; Wed, 28 Oct 2020 16:19:12 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Add int128_or to include/qemu/int128.h
Date: Wed, 28 Oct 2020 16:19:09 -0500
Message-Id: <1603919949-17498-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 17:19:13
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RGlzY292ZXJlZCB0aGUgbmVlZCB3aGVuIHdvcmtpbmcgb24gSGV4YWdvbiB0YXJnZXQKaHR0cHM6
Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9xZW11LWRldmVsQG5vbmdudS5vcmcvbXNnNzMzODE4Lmh0
bWwKVXNlZnVsIGFzIGEgc3RhbmRhbG9uZSBwYXRjaAoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNp
bXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIGluY2x1ZGUvcWVtdS9pbnQxMjguaCB8
IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9xZW11L2ludDEyOC5oIGIvaW5jbHVkZS9xZW11L2ludDEyOC5oCmluZGV4
IDc2ZWE0MDUuLjUyZmMyMzggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvcWVtdS9pbnQxMjguaAorKysg
Yi9pbmNsdWRlL3FlbXUvaW50MTI4LmgKQEAgLTU4LDYgKzU4LDExIEBAIHN0YXRpYyBpbmxpbmUg
SW50MTI4IGludDEyOF9hbmQoSW50MTI4IGEsIEludDEyOCBiKQogICAgIHJldHVybiBhICYgYjsK
IH0KIAorc3RhdGljIGlubGluZSBJbnQxMjggaW50MTI4X29yKEludDEyOCBhLCBJbnQxMjggYikK
K3sKKyAgICByZXR1cm4gYSB8IGI7Cit9CisKIHN0YXRpYyBpbmxpbmUgSW50MTI4IGludDEyOF9y
c2hpZnQoSW50MTI4IGEsIGludCBuKQogewogICAgIHJldHVybiBhID4+IG47CkBAIC0yMDgsNiAr
MjEzLDExIEBAIHN0YXRpYyBpbmxpbmUgSW50MTI4IGludDEyOF9hbmQoSW50MTI4IGEsIEludDEy
OCBiKQogICAgIHJldHVybiAoSW50MTI4KSB7IGEubG8gJiBiLmxvLCBhLmhpICYgYi5oaSB9Owog
fQogCitzdGF0aWMgaW5saW5lIEludDEyOCBpbnQxMjhfb3IoSW50MTI4IGEsIEludDEyOCBiKQor
eworICAgIHJldHVybiAoSW50MTI4KSB7IGEubG8gfCBiLmxvLCBhLmhpIHwgYi5oaSB9OworfQor
CiBzdGF0aWMgaW5saW5lIEludDEyOCBpbnQxMjhfcnNoaWZ0KEludDEyOCBhLCBpbnQgbikKIHsK
ICAgICBpbnQ2NF90IGg7Ci0tIAoyLjcuNAoK

