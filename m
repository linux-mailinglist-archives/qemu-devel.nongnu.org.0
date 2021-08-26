Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598083F8D8E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 20:06:42 +0200 (CEST)
Received: from localhost ([::1]:46262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJls-0007pZ-8W
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 14:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJIj-0004N1-CJ
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:36:29 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:48465)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJIg-00058q-F2
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1629999386; x=1661535386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=esXQH2kVYEzGMudG2Vv4sl13w2C5no5+5YGV+Skfjpc=;
 b=aIFVJ92IFCBWmSOpkN3G7exJIWMfVY2Cmh+zTxUbKNntXU+Exm/sNUlE
 QBS4+FOrra+fEQyvqs4AEKqwrVVY42YSesTANfYytjRLCqdzCnVEwHp/o
 gQV5UxJSzAaZwbHznky98eU9u6TqGP+VA07ly94l90wsX5xNJohUNdAxK c=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Aug 2021 10:36:15 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 26 Aug 2021 10:36:15 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 6F24513BE; Thu, 26 Aug 2021 12:36:13 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/30] Hexagon HVX (target/hexagon) C preprocessor for
 decode tree
Date: Thu, 26 Aug 2021 12:35:37 -0500
Message-Id: <1629999358-25304-10-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629999358-25304-1-git-send-email-tsimpson@quicinc.com>
References: <1629999358-25304-1-git-send-email-tsimpson@quicinc.com>
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
Cc: ale@rev.ng, bcain@quicinc.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2dlbl9kZWN0cmVlX2ltcG9ydC5jIHwgMTMgKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4
YWdvbi9nZW5fZGVjdHJlZV9pbXBvcnQuYyBiL3RhcmdldC9oZXhhZ29uL2dlbl9kZWN0cmVlX2lt
cG9ydC5jCmluZGV4IDViN2VjZmMuLmVlMzU0NjcgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29u
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
KyAgICAgICAgY29uc3QgY2hhciAqbmFtZSA9IG9wY29kZV9uYW1lc1tvcGNvZGVdOworICAgICAg
ICBpZiAoc3RybmNtcChuYW1lLCB0ZXN0LCBzdHJsZW4odGVzdCkpID09IDApIHsKKyAgICAgICAg
ICAgIHJldHVybiAiRVhUX21tdmVjIjsKKyAgICAgICAgfQorICAgIH0KICAgICByZXR1cm4gb3Bj
b2RlX2VuY19jbGFzc19uYW1lc1tvcGNvZGVfZW5jb2RpbmdzW29wY29kZV0uZW5jX2NsYXNzXTsK
IH0KIAotLSAKMi43LjQKCg==

