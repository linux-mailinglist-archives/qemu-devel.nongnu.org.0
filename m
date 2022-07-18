Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98D1578DB9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 00:51:02 +0200 (CEST)
Received: from localhost ([::1]:56934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDZZt-0002Jy-Fk
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 18:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oDZY9-0008CT-NU
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 18:49:13 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:64030)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oDZY7-0003Iq-EY
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 18:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1658184551; x=1689720551;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/UlGBfzUqm/uCDspYXuHh4Sw9mW5AvcivSIwG9we0Zs=;
 b=k2uM+wHuMU6MdjCjkqEp1wuwnk8S9uttMtxAQ/qsuDCKo7ZlSuRQ9Csr
 grHn5+C4Td0Gsuj6mcDMkdyFIT8ZrgZ7WLSAYgJ0oKmU6x0bTesgOUIaq
 OmOJA4fAHRGt3llgE8X3qxE+tSR7BJsCWC0qBxvArMRtOq8Qpn1KO+o4E I=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 18 Jul 2022 15:49:07 -0700
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg09-lv.qualcomm.com with ESMTP; 18 Jul 2022 15:49:07 -0700
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 4D7215005B6; Mon, 18 Jul 2022 15:48:47 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org
Subject: [PULL 0/2] Hexagon (target/hexagon) bug fixes for mem_noshuf
Date: Mon, 18 Jul 2022 15:48:43 -0700
Message-Id: <20220718224845.19878-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=129.46.98.28; envelope-from=tsimpson@qualcomm.com;
 helo=alexa-out.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAyNGYwMWQyMjBmNTZlYWIzMjY4NTM4
ZWYxMDY1NWI0ZmIyNDUzZmRmOgoKICBNZXJnZSBodHRwczovL2dpdGh1Yi5jb20vcWVtdS9xZW11
IGludG8gdGlwICgyMDIyLTA3LTE4IDExOjE2OjM5IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0
aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGh0dHBzOi8vZ2l0aHViLmNvbS9xdWljL3FlbXUgdGFn
cy9wdWxsLWhleC0yMDIyMDcxOAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGViOTA3
MjYwMjYxN2NiNDljNDg5YWFmMDU4ZjcyNjk1YzJlYWVkYzI6CgogIEhleGFnb24gKHRhcmdldC9o
ZXhhZ29uKSBmaXggYnVnIGluIG1lbV9ub3NodWYgbG9hZCBleGNlcHRpb24gKDIwMjItMDctMTgg
MTE6MjA6MDkgLTA3MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClJlY2FsbCB0aGF0IHRoZSBzZW1hbnRpY3Mgb2YgYSBI
ZXhhZ29uIG1lbV9ub3NodWYgcGFja2V0IGFyZSB0aGF0IHRoZQpzdG9yZSBlZmZlY3RpdmVseSBo
YXBwZW5zIGJlZm9yZSB0aGUgbG9hZC4gIFRoZXJlIGFyZSB0d28gYnVnIGZpeGVzCmluIHRoaXMg
c2VyaWVzLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpUYXlsb3IgU2ltcHNvbiAoMik6CiAgICAgIEhleGFnb24gKHRhcmdl
dC9oZXhhZ29uKSBmaXggc3RvcmUgdy9tZW1fbm9zaHVmICYgcHJlZGljYXRlZCBsb2FkCiAgICAg
IEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBmaXggYnVnIGluIG1lbV9ub3NodWYgbG9hZCBleGNl
cHRpb24KCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmggICAgICAgICAgICAgICAgIHwgIDEwICsr
LQogdGFyZ2V0L2hleGFnb24vaGVscGVyLmggICAgICAgICAgICAgICAgICB8ICAgMSArCiB0YXJn
ZXQvaGV4YWdvbi9tYWNyb3MuaCAgICAgICAgICAgICAgICAgIHwgIDM3ICsrKysrLS0tCiB0YXJn
ZXQvaGV4YWdvbi9nZW5wdHIuYyAgICAgICAgICAgICAgICAgIHwgICA3ICsrCiB0YXJnZXQvaGV4
YWdvbi9vcF9oZWxwZXIuYyAgICAgICAgICAgICAgIHwgIDIzICsrKy0tCiB0ZXN0cy90Y2cvaGV4
YWdvbi9tZW1fbm9zaHVmLmMgICAgICAgICAgIHwgMTIyICsrKysrKysrKysrKysrKysrKysrKysr
Ky0tCiB0ZXN0cy90Y2cvaGV4YWdvbi9tZW1fbm9zaHVmX2V4Y2VwdGlvbi5jIHwgMTQ2ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIHRlc3RzL3RjZy9oZXhhZ29uL01ha2VmaWxlLnRh
cmdldCAgICAgICAgfCAgIDEgKwogOCBmaWxlcyBjaGFuZ2VkLCAzMjMgaW5zZXJ0aW9ucygrKSwg
MjQgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvdGNnL2hleGFnb24vbWVt
X25vc2h1Zl9leGNlcHRpb24uYwo=

