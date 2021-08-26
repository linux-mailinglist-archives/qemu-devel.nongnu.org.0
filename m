Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEB33F8D7B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 20:02:33 +0200 (CEST)
Received: from localhost ([::1]:60658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJhw-0006XZ-Nq
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 14:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJJa-0006Ig-Od
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:37:22 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:54743)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJJV-00059Z-QS
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1629999437; x=1661535437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YfqPQCgkk2kvuyHkBHJHI3xCJwzF4ZjrfKRdHPIJL70=;
 b=InFVM2cCrXnoPwL9GjuOz8R3oRXEJ5ZxO5y8990nF2KbNdTzH+qlU2I6
 t4nL7Oulcmro/Zj8INxKU5IMVJzZUMLFDFRaP/xB3p5BJl8iSj8k5zfXd
 6lryeRa6M9yq+UnUcaeo2kr17KJZvltLykK7h0xWjPACy8GTH4I6y/Tsa E=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Aug 2021 10:36:16 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg03-sd.qualcomm.com with ESMTP; 26 Aug 2021 10:36:15 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 9BA621712; Thu, 26 Aug 2021 12:36:13 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/30] Hexagon HVX (tests/tcg/hexagon) vector_add_int test
Date: Thu, 26 Aug 2021 12:35:55 -0500
Message-Id: <1629999358-25304-28-git-send-email-tsimpson@quicinc.com>
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
IHRlc3RzL3RjZy9oZXhhZ29uL3ZlY3Rvcl9hZGRfaW50LmMgfCA2MSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogdGVzdHMvdGNnL2hleGFnb24vTWFrZWZpbGUudGFyZ2V0
ICB8ICAzICsrCiAyIGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB0ZXN0cy90Y2cvaGV4YWdvbi92ZWN0b3JfYWRkX2ludC5jCgpkaWZmIC0tZ2l0IGEv
dGVzdHMvdGNnL2hleGFnb24vdmVjdG9yX2FkZF9pbnQuYyBiL3Rlc3RzL3RjZy9oZXhhZ29uL3Zl
Y3Rvcl9hZGRfaW50LmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uZDYwMTBl
YQotLS0gL2Rldi9udWxsCisrKyBiL3Rlc3RzL3RjZy9oZXhhZ29uL3ZlY3Rvcl9hZGRfaW50LmMK
QEAgLTAsMCArMSw2MSBAQAorLyoKKyAqICBDb3B5cmlnaHQoYykgMjAxOS0yMDIxIFF1YWxjb21t
IElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisgKgorICogIFRo
aXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQv
b3IgbW9kaWZ5CisgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyAqICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcgorICogIChhdCB5b3VyIG9w
dGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisgKgorICogIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmli
dXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICogIGJ1dCBXSVRIT1VU
IEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisgKiAg
TUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2Vl
IHRoZQorICogIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisg
KgorICogIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlCisgKiAgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgc2Vl
IDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyAqLworCisjaW5jbHVkZSA8c3RkaW8u
aD4KKworaW50IGdBWzQwMV07CitpbnQgZ0JbNDAxXTsKK2ludCBnQ1s0MDFdOworCit2b2lkIHZl
Y3Rvcl9hZGRfaW50KCkKK3sKKyAgaW50IGk7CisgIGZvciAoaSA9IDA7IGkgPCA0MDA7IGkrKykg
eworICAgIGdBW2ldID0gZ0JbaV0gKyBnQ1tpXTsKKyAgfQorfQorCitpbnQgbWFpbigpCit7Cisg
IGludCBlcnJvciA9IDA7CisgIGludCBpOworICBmb3IgKGkgPSAwOyBpIDwgNDAwOyBpKyspIHsK
KyAgICBnQltpXSA9IGkgKiAyOworICAgIGdDW2ldID0gaSAqIDM7CisgIH0KKyAgZ0FbNDAwXSA9
IDE3OworICB2ZWN0b3JfYWRkX2ludCgpOworICBmb3IgKGkgPSAwOyBpIDwgNDAwOyBpKyspIHsK
KyAgICBpZiAoZ0FbaV0gIT0gaSAqIDUpIHsKKyAgICAgICAgZXJyb3IrKzsKKyAgICAgICAgcHJp
bnRmKCJFUlJPUjogZ0JbJWRdID0gJWRcdCIsIGksIGdCW2ldKTsKKyAgICAgICAgcHJpbnRmKCJn
Q1slZF0gPSAlZFx0IiwgaSwgZ0NbaV0pOworICAgICAgICBwcmludGYoImdBWyVkXSA9ICVkXG4i
LCBpLCBnQVtpXSk7CisgICAgfQorICB9CisgIGlmIChnQVs0MDBdICE9IDE3KSB7CisgICAgZXJy
b3IrKzsKKyAgICBwcmludGYoIkVSUk9SOiBPdmVycmFuIHRoZSBidWZmZXJcbiIpOworICB9Cisg
IGlmICghZXJyb3IpIHsKKyAgICBwcmludGYoIlBBU1NcbiIpOworICAgIHJldHVybiAwOworICB9
IGVsc2UgeworICAgIHByaW50ZigiRkFJTFxuIik7CisgICAgcmV0dXJuIDE7CisgIH0KK30KZGlm
ZiAtLWdpdCBhL3Rlc3RzL3RjZy9oZXhhZ29uL01ha2VmaWxlLnRhcmdldCBiL3Rlc3RzL3RjZy9o
ZXhhZ29uL01ha2VmaWxlLnRhcmdldAppbmRleCAwNTBjZDYxLi4xOGI0NDcyIDEwMDY0NAotLS0g
YS90ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQKKysrIGIvdGVzdHMvdGNnL2hleGFn
b24vTWFrZWZpbGUudGFyZ2V0CkBAIC0zNyw3ICszNywxMCBAQCBIRVhfVEVTVFMgKz0gY2lyYwog
SEVYX1RFU1RTICs9IGJyZXYKIEhFWF9URVNUUyArPSBsb2FkX3VucGFjawogSEVYX1RFU1RTICs9
IGxvYWRfYWxpZ24KK0hFWF9URVNUUyArPSB2ZWN0b3JfYWRkX2ludAogSEVYX1RFU1RTICs9IGF0
b21pY3MKIEhFWF9URVNUUyArPSBmcHN0dWZmCiAKIFRFU1RTICs9ICQoSEVYX1RFU1RTKQorCit2
ZWN0b3JfYWRkX2ludDogQ0ZMQUdTICs9IC1taHZ4IC1mdmVjdG9yaXplCi0tIAoyLjcuNAoK

