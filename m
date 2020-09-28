Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0FA27ADFE
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 14:39:12 +0200 (CEST)
Received: from localhost ([::1]:58394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMsQx-0005i1-SK
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 08:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kMsOq-0003zx-Kc
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 08:37:00 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:39953)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kMsOn-0005eT-8Q
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 08:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1601296617; x=1632832617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x3UQvNMZ4qr25snCOX0N4CtI1pqwjfrmGhiQr2JS1zs=;
 b=L5yYmSr135Y0nXSrlyUtzoif9VjC5UTgkiQsXslHrWFyr47xihPxtWf0
 5ihwd/Cw25E/xWOuXUSTxjsBmUe1f2C8GbWqenY/SYAKgHD0NCqhyCeiT
 PxfHNd6B6JKDMpBu3ziO1tytqopIO7ogBI7NkJM+izRHtn1t1WUf1eWa5 E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Sep 2020 05:36:51 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 28 Sep 2020 05:36:51 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 5706E1184; Mon, 28 Sep 2020 07:36:51 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: tsimpson@quicinc.com
Subject: [RFC PATCH v4 03/29] Hexagon (include/elf.h) ELF machine definition
Date: Mon, 28 Sep 2020 07:36:22 -0500
Message-Id: <1601296608-29390-4-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601296608-29390-1-git-send-email-tsimpson@quicinc.com>
References: <1601296608-29390-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 08:36:52
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.199,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RGVmaW5lIEVNX0hFWEFHT04gMTY0CgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNp
bXBzb25AcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8
cGhpbG1kQHJlZGhhdC5jb20+ClRlc3RlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvZWxmLmggfCAyICsrCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9lbGYuaCBiL2luY2x1ZGUv
ZWxmLmgKaW5kZXggYzExN2E0ZC4uMTQxYTg2ZiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9lbGYuaAor
KysgYi9pbmNsdWRlL2VsZi5oCkBAIC0xNzIsNiArMTcyLDggQEAgdHlwZWRlZiBzdHJ1Y3QgbWlw
c19lbGZfYWJpZmxhZ3NfdjAgewogCiAjZGVmaW5lIEVNX1VOSUNPUkUzMiAgICAxMTAgICAgIC8q
IFVuaUNvcmUzMiAqLwogCisjZGVmaW5lIEVNX0hFWEFHT04gICAgIDE2NCAgICAgLyogUXVhbGNv
bW0gSGV4YWdvbiAqLworCiAjZGVmaW5lIEVNX1JJU0NWICAgICAgICAyNDMgICAgIC8qIFJJU0Mt
ViAqLwogCiAjZGVmaW5lIEVNX05BTk9NSVBTICAgICAyNDkgICAgIC8qIFdhdmUgQ29tcHV0aW5n
IG5hbm9NSVBTICovCi0tIAoyLjcuNAoK

