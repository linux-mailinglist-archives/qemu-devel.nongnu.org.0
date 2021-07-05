Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443F03BC431
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 01:44:32 +0200 (CEST)
Received: from localhost ([::1]:54738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0YGN-0006QV-8Z
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 19:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m0Y73-0003TJ-O5
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 19:34:53 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:37352)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m0Y71-0004a6-Bh
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 19:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1625528091; x=1657064091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L0r/SjBIiuHwy3wEcnjBPBns6twuxYCLV4rVrvjLw4g=;
 b=vx8vJ2KmvFA3xBTiWfK7vnejz1k8rjyKvL0nRtCZY1+t1GofU4AaGBhT
 Rcw3Iw/qXfGKzGiEeP5xcXp5vZgejA3SPbG2QPUZAeJx3gJTnsKulj5LA
 /PJbuQ+j894MUlfS0QchhwXT5Z+xc+xhKk0s29cAApit0yuSmYvdenSqB E=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 05 Jul 2021 16:34:39 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 05 Jul 2021 16:34:38 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id EAFDE11B7; Mon,  5 Jul 2021 18:34:37 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/20] Hexagon HVX (target/hexagon) C preprocessor for decode
 tree
Date: Mon,  5 Jul 2021 18:34:24 -0500
Message-Id: <1625528074-19440-11-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: ale@rev.ng, peter.maydell@linaro.org, bcain@quicinc.com,
 richard.henderson@linaro.org, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2dlbl9kZWN0cmVlX2ltcG9ydC5jIHwgMTMgKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4
YWdvbi9nZW5fZGVjdHJlZV9pbXBvcnQuYyBiL3RhcmdldC9oZXhhZ29uL2dlbl9kZWN0cmVlX2lt
cG9ydC5jCmluZGV4IDViN2VjZmMuLjIzNzQwMzAgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29u
L2dlbl9kZWN0cmVlX2ltcG9ydC5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl9kZWN0cmVlX2lt
cG9ydC5jCkBAIC00MCw2ICs0MCwxMSBAQCBjb25zdCBjaGFyICogY29uc3Qgb3Bjb2RlX25hbWVz
W10gPSB7CiAgKiAgICAgICAgIFE2SU5TTihBMl9hZGQsIlJkMzI9YWRkKFJzMzIsUnQzMikiLEFU
VFJJQlMoKSwKICAqICAgICAgICAgIkFkZCAzMi1iaXQgcmVnaXN0ZXJzIiwKICAqICAgICAgICAg
eyBSZFY9UnNWK1J0Vjt9KQorICogICAgIEhWWCBpbnN0cnVjdGlvbnMgaGF2ZSB0aGUgZm9sbG93
aW5nIGZvcm0KKyAqICAgICAgICAgRVhUSU5TTihWNl92aW5zZXJ0d3IsICJWeDMyLnc9dmluc2Vy
dChSdDMyKSIsCisgKiAgICAgICAgIEFUVFJJQlMoQV9FWFRFTlNJT04sQV9DVkksQV9DVklfVlgs
QV9DVklfTEFURSksCisgKiAgICAgICAgICJJbnNlcnQgV29yZCBTY2FsYXIgaW50byBWZWN0b3Ii
LAorICogICAgICAgICBWeFYudXdbMF0gPSBSdFY7KQogICovCiBjb25zdCBjaGFyICogY29uc3Qg
b3Bjb2RlX3N5bnRheFtYWF9MQVNUX09QQ09ERV0gPSB7CiAjZGVmaW5lIFE2SU5TTihUQUcsIEJF
SCwgQVRUUklCUywgREVTQ1IsIFNFTSkgXApAQCAtMTA1LDYgKzExMCwxNCBAQCBzdGF0aWMgY29u
c3QgY2hhciAqZ2V0X29wY29kZV9lbmMoaW50IG9wY29kZSkKIAogc3RhdGljIGNvbnN0IGNoYXIg
KmdldF9vcGNvZGVfZW5jX2NsYXNzKGludCBvcGNvZGUpCiB7CisgICAgY29uc3QgY2hhciAqdG1w
ID0gb3Bjb2RlX2VuY29kaW5nc1tvcGNvZGVdLmVuY29kaW5nOworICAgIGlmICh0bXAgPT0gTlVM
TCkgeworICAgICAgICBjb25zdCBjaGFyICp0ZXN0ID0gIlY2XyI7ICAgICAgICAvKiBIVlggKi8K
KyAgICAgICAgY2hhciAqbmFtZSA9IChjaGFyICopb3Bjb2RlX25hbWVzW29wY29kZV07CisgICAg
ICAgIGlmIChzdHJuY21wKG5hbWUsIHRlc3QsIHN0cmxlbih0ZXN0KSkgPT0gMCkgeworICAgICAg
ICAgICAgcmV0dXJuICJFWFRfbW12ZWMiOworICAgICAgICB9CisgICAgfQogICAgIHJldHVybiBv
cGNvZGVfZW5jX2NsYXNzX25hbWVzW29wY29kZV9lbmNvZGluZ3Nbb3Bjb2RlXS5lbmNfY2xhc3Nd
OwogfQogCi0tIAoyLjcuNAoK

