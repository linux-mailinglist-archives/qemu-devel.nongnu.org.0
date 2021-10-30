Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671964406B8
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 03:33:09 +0200 (CEST)
Received: from localhost ([::1]:53986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgdF6-0005zu-Fr
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 21:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mgd3Q-0002un-Ke
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 21:21:04 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:10774)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mgd3P-0001cl-2j
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 21:21:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635556863; x=1667092863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ITRDH6jVME6ePg7atny8ShXneIJSliVfuzvjirIwLtM=;
 b=P9RXxZl2SogzOIgbyhINW5tA5WxX2kARBzsE6ZrXicjsTMlGvMTwrM+l
 2ZOooXRp3eVZrwGnOVb5aeNSbUeQ/aw7KFlPnYl5ixUbtNRJaiV2IHccq
 M+V8Tr1wmDAsd09vu2JotJPdOBov24CbqUjfSiesRz2Lap0ywQUh6EZYm w=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 29 Oct 2021 18:20:58 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 29 Oct 2021 18:20:57 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 045422834; Fri, 29 Oct 2021 20:20:57 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/30] Hexagon HVX (target/hexagon) C preprocessor for
 decode tree
Date: Fri, 29 Oct 2021 20:20:28 -0500
Message-Id: <1635556849-18120-10-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635556849-18120-1-git-send-email-tsimpson@quicinc.com>
References: <1635556849-18120-1-git-send-email-tsimpson@quicinc.com>
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
Cc: ale@rev.ng, bcain@quicinc.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWNrZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3Jn
PgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0t
LQogdGFyZ2V0L2hleGFnb24vZ2VuX2RlY3RyZWVfaW1wb3J0LmMgfCAxMyArKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9o
ZXhhZ29uL2dlbl9kZWN0cmVlX2ltcG9ydC5jIGIvdGFyZ2V0L2hleGFnb24vZ2VuX2RlY3RyZWVf
aW1wb3J0LmMKaW5kZXggNWI3ZWNmYy4uZWUzNTQ2NyAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFn
b24vZ2VuX2RlY3RyZWVfaW1wb3J0LmMKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX2RlY3RyZWVf
aW1wb3J0LmMKQEAgLTQwLDYgKzQwLDExIEBAIGNvbnN0IGNoYXIgKiBjb25zdCBvcGNvZGVfbmFt
ZXNbXSA9IHsKICAqICAgICAgICAgUTZJTlNOKEEyX2FkZCwiUmQzMj1hZGQoUnMzMixSdDMyKSIs
QVRUUklCUygpLAogICogICAgICAgICAiQWRkIDMyLWJpdCByZWdpc3RlcnMiLAogICogICAgICAg
ICB7IFJkVj1Sc1YrUnRWO30pCisgKiAgICAgSFZYIGluc3RydWN0aW9ucyBoYXZlIHRoZSBmb2xs
b3dpbmcgZm9ybQorICogICAgICAgICBFWFRJTlNOKFY2X3ZpbnNlcnR3ciwgIlZ4MzIudz12aW5z
ZXJ0KFJ0MzIpIiwKKyAqICAgICAgICAgQVRUUklCUyhBX0VYVEVOU0lPTixBX0NWSSxBX0NWSV9W
WCxBX0NWSV9MQVRFKSwKKyAqICAgICAgICAgIkluc2VydCBXb3JkIFNjYWxhciBpbnRvIFZlY3Rv
ciIsCisgKiAgICAgICAgIFZ4Vi51d1swXSA9IFJ0VjspCiAgKi8KIGNvbnN0IGNoYXIgKiBjb25z
dCBvcGNvZGVfc3ludGF4W1hYX0xBU1RfT1BDT0RFXSA9IHsKICNkZWZpbmUgUTZJTlNOKFRBRywg
QkVILCBBVFRSSUJTLCBERVNDUiwgU0VNKSBcCkBAIC0xMDUsNiArMTEwLDE0IEBAIHN0YXRpYyBj
b25zdCBjaGFyICpnZXRfb3Bjb2RlX2VuYyhpbnQgb3Bjb2RlKQogCiBzdGF0aWMgY29uc3QgY2hh
ciAqZ2V0X29wY29kZV9lbmNfY2xhc3MoaW50IG9wY29kZSkKIHsKKyAgICBjb25zdCBjaGFyICp0
bXAgPSBvcGNvZGVfZW5jb2RpbmdzW29wY29kZV0uZW5jb2Rpbmc7CisgICAgaWYgKHRtcCA9PSBO
VUxMKSB7CisgICAgICAgIGNvbnN0IGNoYXIgKnRlc3QgPSAiVjZfIjsgICAgICAgIC8qIEhWWCAq
LworICAgICAgICBjb25zdCBjaGFyICpuYW1lID0gb3Bjb2RlX25hbWVzW29wY29kZV07CisgICAg
ICAgIGlmIChzdHJuY21wKG5hbWUsIHRlc3QsIHN0cmxlbih0ZXN0KSkgPT0gMCkgeworICAgICAg
ICAgICAgcmV0dXJuICJFWFRfbW12ZWMiOworICAgICAgICB9CisgICAgfQogICAgIHJldHVybiBv
cGNvZGVfZW5jX2NsYXNzX25hbWVzW29wY29kZV9lbmNvZGluZ3Nbb3Bjb2RlXS5lbmNfY2xhc3Nd
OwogfQogCi0tIAoyLjcuNAoK

