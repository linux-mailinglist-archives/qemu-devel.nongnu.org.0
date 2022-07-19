Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D932657AA78
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 01:29:18 +0200 (CEST)
Received: from localhost ([::1]:32876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDweT-0001I5-MK
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 19:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oDwch-0006zZ-GS
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 19:27:27 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:53943)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oDwcf-0003R4-NN
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 19:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1658273246; x=1689809246;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vuoWEZsWvE9p5w161ii+ur/Unl1OWKhwgyRJITsd6iU=;
 b=LKckg7ZnM0LN8VHQ04fL/NZ121G5BzH18qZYZRwYPScnB+eRhsvwKRWN
 PpYRuOR+ZRdYAPDjV4muAzlGgdQSg7UgScIQk17M4tLGMFHWKwMATiroe
 7boJncnTFcneYJtwIsdciTfEnb2sxkbN6ckdTGjKxLbgcLNMAOiaRyIKj E=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 19 Jul 2022 16:27:25 -0700
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg09-lv.qualcomm.com with ESMTP; 19 Jul 2022 16:27:24 -0700
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 6D9B05000B9; Tue, 19 Jul 2022 16:26:44 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org
Subject: [PULL 0/2] Hexagon (target/hexagon) bug fixes for mem_noshuf
Date: Tue, 19 Jul 2022 16:26:29 -0700
Message-Id: <20220719232631.25316-1-tsimpson@quicinc.com>
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBkNDgxMjVkZTM4ZjQ4YTYxZDY0MjNl
ZjZhMDExNTZkNmRmZjllZTJjOgoKICBNZXJnZSB0YWcgJ2tyYXhlbC0yMDIyMDcxOS1wdWxsLXJl
cXVlc3QnIG9mIGh0dHBzOi8vZ2l0bGFiLmNvbS9rcmF4ZWwvcWVtdSBpbnRvIHN0YWdpbmcgKDIw
MjItMDctMTkgMTc6NDA6MzYgKzAxMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoKCiAgaHR0cHM6Ly9naXRodWIuY29tL3F1aWMvcWVtdSB0YWdzL3B1bGwtaGV4LTIw
MjIwNzE5LTEKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAxNWZjNmJhZGJkMjhhMTI2
MzQ2Zjg0YzFhY2FlNDhlMjczYjY2YjY3OgoKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgZml4
IGJ1ZyBpbiBtZW1fbm9zaHVmIGxvYWQgZXhjZXB0aW9uICgyMDIyLTA3LTE5IDE0OjIwOjA4IC0w
NzAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpSZWNhbGwgdGhhdCB0aGUgc2VtYW50aWNzIG9mIGEgSGV4YWdvbiBtZW1f
bm9zaHVmIHBhY2tldCBhcmUgdGhhdCB0aGUKc3RvcmUgZWZmZWN0aXZlbHkgaGFwcGVucyBiZWZv
cmUgdGhlIGxvYWQuICBUaGVyZSBhcmUgdHdvIGJ1ZyBmaXhlcwppbiB0aGlzIHNlcmllcy4KCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KVGF5bG9yIFNpbXBzb24gKDIpOgogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikg
Zml4IHN0b3JlIHcvbWVtX25vc2h1ZiAmIHByZWRpY2F0ZWQgbG9hZAogICAgICBIZXhhZ29uICh0
YXJnZXQvaGV4YWdvbikgZml4IGJ1ZyBpbiBtZW1fbm9zaHVmIGxvYWQgZXhjZXB0aW9uCgogdGFy
Z2V0L2hleGFnb24vZ2VuX3RjZy5oICAgICAgICAgICAgICAgICB8ICAxMCArKy0KIHRhcmdldC9o
ZXhhZ29uL2hlbHBlci5oICAgICAgICAgICAgICAgICAgfCAgIDEgKwogdGFyZ2V0L2hleGFnb24v
bWFjcm9zLmggICAgICAgICAgICAgICAgICB8ICAzNyArKysrKy0tLQogdGFyZ2V0L2hleGFnb24v
Z2VucHRyLmMgICAgICAgICAgICAgICAgICB8ICAgNyArKwogdGFyZ2V0L2hleGFnb24vb3BfaGVs
cGVyLmMgICAgICAgICAgICAgICB8ICAyMyArKystLQogdGVzdHMvdGNnL2hleGFnb24vbWVtX25v
c2h1Zi5jICAgICAgICAgICB8IDEyMiArKysrKysrKysrKysrKysrKysrKysrKystLQogdGVzdHMv
dGNnL2hleGFnb24vbWVtX25vc2h1Zl9leGNlcHRpb24uYyB8IDE0NiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiB0ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQgICAgICAg
IHwgICAxICsKIDggZmlsZXMgY2hhbmdlZCwgMzIzIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3RjZy9oZXhhZ29uL21lbV9ub3NodWZfZXhj
ZXB0aW9uLmMK

