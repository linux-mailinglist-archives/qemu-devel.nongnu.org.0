Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EB03EAEC8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 05:08:50 +0200 (CEST)
Received: from localhost ([::1]:43702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mENYu-0007iw-Mw
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 23:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mENXo-0006LA-5g
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 23:07:40 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:34261)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mENXj-0007iJ-8e
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 23:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1628824055; x=1660360055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gS6qhv1h5ZW5RzLHKmg10lU2gHLCnwVsTTokS3iHrLM=;
 b=ei2WwBmBhmSNbZcV0DSJB4d5Wv6cKja0EyX2v9vSczymBjHT/W2vAWbV
 m/iDHsistkLeXB9z59taLZzDQNSz1R1SRvBoVFbnP+VEWaIDFRNzxy79s
 NJ1kUPgQYXyddZu10cT2Hxy8QlHH2t5b6xzUbLHdIbxIZiSN6CQ4fXLl0 A=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Aug 2021 20:07:32 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 12 Aug 2021 20:07:32 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 8DF9ECAF; Thu, 12 Aug 2021 22:07:31 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] Hexagon (disas/hexagon.c) fix memory leak for early exit
 cases
Date: Thu, 12 Aug 2021 22:07:30 -0500
Message-Id: <1628824050-15249-2-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628824050-15249-1-git-send-email-tsimpson@quicinc.com>
References: <1628824050-15249-1-git-send-email-tsimpson@quicinc.com>
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
ciIpCkVsaW1pbmF0ZSBDb3Zlcml0eSBDSUQgMTQ2MDEyMSAoUmVzb3VyY2UgbGVhaykKClJldmll
d2VkLWJ5OiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+ClJldmlld2Vk
LWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWQ/IDxmNGJ1Z0BhbXNhdC5vcmc+ClNpZ25lZC1vZmYt
Ynk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiBkaXNhcy9oZXhh
Z29uLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2Rpc2FzL2hleGFnb24uYyBiL2Rpc2FzL2hleGFnb24uYwppbmRl
eCAzYzI0ZTJhLi5jMWE0ZmZjIDEwMDY0NAotLS0gYS9kaXNhcy9oZXhhZ29uLmMKKysrIGIvZGlz
YXMvaGV4YWdvbi5jCkBAIC0zMyw3ICszMyw3IEBAIGludCBwcmludF9pbnNuX2hleGFnb24oYmZk
X3ZtYSBtZW1hZGRyLCBzdHJ1Y3QgZGlzYXNzZW1ibGVfaW5mbyAqaW5mbykKIHsKICAgICB1aW50
MzJfdCB3b3Jkc1tQQUNLRVRfV09SRFNfTUFYXTsKICAgICBib29sIGZvdW5kX2VuZCA9IGZhbHNl
OwotICAgIEdTdHJpbmcgKmJ1ZiA9IGdfc3RyaW5nX3NpemVkX25ldyhQQUNLRVRfQlVGRkVSX0xF
Tik7CisgICAgR1N0cmluZyAqYnVmOwogICAgIGludCBpLCBsZW47CiAKICAgICBmb3IgKGkgPSAw
OyBpIDwgUEFDS0VUX1dPUkRTX01BWCAmJiAhZm91bmRfZW5kOyBpKyspIHsKQEAgLTU3LDYgKzU3
LDcgQEAgaW50IHByaW50X2luc25faGV4YWdvbihiZmRfdm1hIG1lbWFkZHIsIHN0cnVjdCBkaXNh
c3NlbWJsZV9pbmZvICppbmZvKQogICAgICAgICByZXR1cm4gUEFDS0VUX1dPUkRTX01BWCAqIHNp
emVvZih1aW50MzJfdCk7CiAgICAgfQogCisgICAgYnVmID0gZ19zdHJpbmdfc2l6ZWRfbmV3KFBB
Q0tFVF9CVUZGRVJfTEVOKTsKICAgICBsZW4gPSBkaXNhc3NlbWJsZV9oZXhhZ29uKHdvcmRzLCBp
LCBtZW1hZGRyLCBidWYpOwogICAgICgqaW5mby0+ZnByaW50Zl9mdW5jKShpbmZvLT5zdHJlYW0s
ICIlcyIsIGJ1Zi0+c3RyKTsKICAgICBnX3N0cmluZ19mcmVlKGJ1ZiwgdHJ1ZSk7Ci0tIAoyLjcu
NAoK

