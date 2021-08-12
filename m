Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C823EA535
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 15:11:27 +0200 (CEST)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEAUY-00046s-MG
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 09:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mEASg-0001xX-Gx
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 09:09:30 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:18398)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mEASe-0007w0-Cq
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 09:09:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1628773768; x=1660309768;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5N1bCNbN1LRAFl+23WVyBxds2Z76PV4s74mgds6JaZk=;
 b=avizhTII9ZqhaLM3QvP2J8zGOYJxaPUn57gdwTSirHqKUoYSDQLt1Ycl
 Mf4XsiFQjByOpllrZrCHtY0FD/XI8jMzi9e5wyvXQboxMhVFJuwP1H7hl
 moeLthI9L3wkkIjxGUIDjbb/9BHB99RSvGNeo8wmfvcE1qKZnh91FAw3V Y=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Aug 2021 06:09:25 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 12 Aug 2021 06:09:24 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 7B90E91D; Thu, 12 Aug 2021 08:09:24 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Hexagon (disas/hexagon.c) fix memory leak for early exit cases
Date: Thu, 12 Aug 2021 08:09:20 -0500
Message-Id: <1628773760-870-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
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
Cc: peter.maydell@linaro.org, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RG9uJ3QgYWxsb2NhdGUgdGhlIHN0cmluZyB1bnRpbCBlcnJvciBjb25kaXRpb25zIGhhdmUgYmVl
biBjaGVja2VkCgpGaXhlczogYTAwY2ZlZDBlICgiSGV4YWdvbiAoZGlzYXMpIGRpc2Fzc2VtYmxl
ciIpCkVsaW1pbmF0ZSBDb3Zlcml0eSBDSUQgMTQ2MDEyMSAoUmVzb3VyY2UgbGVhaykKClNpZ25l
ZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiBkaXNh
cy9oZXhhZ29uLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Rpc2FzL2hleGFnb24uYyBiL2Rpc2FzL2hleGFnb24u
YwppbmRleCAzYzI0ZTJhLi5jMWE0ZmZjIDEwMDY0NAotLS0gYS9kaXNhcy9oZXhhZ29uLmMKKysr
IGIvZGlzYXMvaGV4YWdvbi5jCkBAIC0zMyw3ICszMyw3IEBAIGludCBwcmludF9pbnNuX2hleGFn
b24oYmZkX3ZtYSBtZW1hZGRyLCBzdHJ1Y3QgZGlzYXNzZW1ibGVfaW5mbyAqaW5mbykKIHsKICAg
ICB1aW50MzJfdCB3b3Jkc1tQQUNLRVRfV09SRFNfTUFYXTsKICAgICBib29sIGZvdW5kX2VuZCA9
IGZhbHNlOwotICAgIEdTdHJpbmcgKmJ1ZiA9IGdfc3RyaW5nX3NpemVkX25ldyhQQUNLRVRfQlVG
RkVSX0xFTik7CisgICAgR1N0cmluZyAqYnVmOwogICAgIGludCBpLCBsZW47CiAKICAgICBmb3Ig
KGkgPSAwOyBpIDwgUEFDS0VUX1dPUkRTX01BWCAmJiAhZm91bmRfZW5kOyBpKyspIHsKQEAgLTU3
LDYgKzU3LDcgQEAgaW50IHByaW50X2luc25faGV4YWdvbihiZmRfdm1hIG1lbWFkZHIsIHN0cnVj
dCBkaXNhc3NlbWJsZV9pbmZvICppbmZvKQogICAgICAgICByZXR1cm4gUEFDS0VUX1dPUkRTX01B
WCAqIHNpemVvZih1aW50MzJfdCk7CiAgICAgfQogCisgICAgYnVmID0gZ19zdHJpbmdfc2l6ZWRf
bmV3KFBBQ0tFVF9CVUZGRVJfTEVOKTsKICAgICBsZW4gPSBkaXNhc3NlbWJsZV9oZXhhZ29uKHdv
cmRzLCBpLCBtZW1hZGRyLCBidWYpOwogICAgICgqaW5mby0+ZnByaW50Zl9mdW5jKShpbmZvLT5z
dHJlYW0sICIlcyIsIGJ1Zi0+c3RyKTsKICAgICBnX3N0cmluZ19mcmVlKGJ1ZiwgdHJ1ZSk7Ci0t
IAoyLjcuNAoK

