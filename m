Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC182FC8F4
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 04:32:00 +0100 (CET)
Received: from localhost ([::1]:42608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l24Dv-0000eh-5j
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 22:31:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l24Bg-0007DH-31
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 22:29:40 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:7731)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l24BV-0007Vb-UA
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 22:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1611113369; x=1642649369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aDEyM1fv9oRr0Su6HcOS/2lGOJ5PWbgNGrfSnVEqwUo=;
 b=sXzdlIXocRC7Hvj3GoWQQvHd4oda/u8bwDKPrKSgBhgMai1ROnprhOeZ
 Xm6KcrUiQKra4kYskYBriRbPDPnYQ5AOTPO3cYpvUJ9LeqPJ+ksYZQDiu
 hWuDKLakAvsFCkB2Fv+c2MMxTvvt6PKgmvo30y3uyfBr3z68H6uXdNTGU g=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Jan 2021 19:29:25 -0800
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 19 Jan 2021 19:29:24 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 2156C295E; Tue, 19 Jan 2021 21:29:24 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/35] Hexagon (include/elf.h) ELF machine definition
Date: Tue, 19 Jan 2021 21:28:36 -0600
Message-Id: <1611113349-24906-4-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, tsimpson@quicinc.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RGVmaW5lIEVNX0hFWEFHT04gMTY0CgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNp
bXBzb25AcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8
cGhpbG1kQHJlZGhhdC5jb20+ClRlc3RlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQu
aGVuZGVyc29uQGxpbmFyby5vcmc+Ci0tLQogaW5jbHVkZS9lbGYuaCB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9lbGYuaCBiL2luY2x1
ZGUvZWxmLmgKaW5kZXggN2E0MThlZS4uZjRmYTNjMSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9lbGYu
aAorKysgYi9pbmNsdWRlL2VsZi5oCkBAIC0xNzYsNiArMTc2LDcgQEAgdHlwZWRlZiBzdHJ1Y3Qg
bWlwc19lbGZfYWJpZmxhZ3NfdjAgewogCiAjZGVmaW5lIEVNX1VOSUNPUkUzMiAgICAxMTAgICAg
IC8qIFVuaUNvcmUzMiAqLwogCisjZGVmaW5lIEVNX0hFWEFHT04gICAgICAxNjQgICAgIC8qIFF1
YWxjb21tIEhleGFnb24gKi8KICNkZWZpbmUgRU1fUlggICAgICAgICAgIDE3MyAgICAgLyogUmVu
ZXNhcyBSWCBmYW1pbHkgKi8KIAogI2RlZmluZSBFTV9SSVNDViAgICAgICAgMjQzICAgICAvKiBS
SVNDLVYgKi8KLS0gCjIuNy40Cgo=

