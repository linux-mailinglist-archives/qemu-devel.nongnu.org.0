Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 886764B2438
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 12:24:09 +0100 (CET)
Received: from localhost ([::1]:42678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIU24-0007gU-KW
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 06:24:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nITw1-0007Py-Mx
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:17:53 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:17131)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nITvz-00017S-0z
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:17:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644578271; x=1676114271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QNONfYEJWFj0i/4dIkqVtZ5sociMkPaKaQ5x88qIYFk=;
 b=Bn1x1APsQAL9v6RifHNBYTCkC8LeYNl/w9ud+R9MQQ5Pl6n+zQD8hoxB
 A9mHZVi6uzrK06EfR8X8gaf/PvmQ90NypPxiBBGf0W2+gSfyy4zqtZKS/
 z4fuJehORDATbVPyQA/gjrEZZC0jxMrhiulD/WwNj/EuzVq7V3BsBjgpv w=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 11 Feb 2022 03:17:44 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg09-lv.qualcomm.com with ESMTP; 11 Feb 2022 03:17:44 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 8D2E4500583; Fri, 11 Feb 2022 03:17:24 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/12] Hexagon (target/hexagon) fix bug in circular addressing
Date: Fri, 11 Feb 2022 03:17:11 -0800
Message-Id: <20220211111722.31036-2-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211111722.31036-1-tsimpson@quicinc.com>
References: <20220211111722.31036-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=129.46.98.28; envelope-from=tsimpson@qualcomm.com;
 helo=alexa-out.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, f4bug@amsat.org,
 tsimpson@quicinc.com, zongyuan.li@smartx.com,
 Michael Lambert <mlambert@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogTWljaGFlbCBMYW1iZXJ0IDxtbGFtYmVydEBxdWljaW5jLmNvbT4KClZlcnNpb25zIFYz
IGFuZCBlYXJsaWVyIHNob3VsZCB0cmVhdCB0aGUgIktfY29uc3QiIGFuZCAibGVuZ3RoIiB2YWx1
ZXMKYXMgdW5zaWduZWQuCgpNb2RpZmllZCBjaXJjX3Rlc3RfdjMoKSBpbiB0ZXN0cy90Y2cvaGV4
YWdvbi9jaXJjLmMgdG8gcmVwcm9kdWNlIHRoZSBidWcKClNpZ25lZC1vZmYtYnk6IE1pY2hhZWwg
TGFtYmVydCA8bWxhbWJlcnRAcXVpY2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1w
c29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KTWVzc2FnZS1JZDogPDIwMjIwMjEwMDIxNTU2Ljky
MTctMi10c2ltcHNvbkBxdWljaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29u
IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgotLS0KIHRhcmdldC9oZXhhZ29uL29wX2hl
bHBlci5jIHwgNiArKystLS0KIHRlc3RzL3RjZy9oZXhhZ29uL2NpcmMuYyAgIHwgNSArKystLQog
MiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMgYi90YXJnZXQvaGV4YWdvbi9vcF9oZWxw
ZXIuYwppbmRleCAwNTdiYWY5YTQ4Li40N2JkNTFlMGNhIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4
YWdvbi9vcF9oZWxwZXIuYworKysgYi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYwpAQCAtMSw1
ICsxLDUgQEAKIC8qCi0gKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMSBRdWFsY29tbSBJbm5vdmF0
aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgorICogIENvcHlyaWdodChjKSAy
MDE5LTIwMjIgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNl
cnZlZC4KICAqCiAgKiAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVk
aXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAqICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhl
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQpAQCAtMzA0LDggKzMw
NCw4IEBAIHZvaWQgSEVMUEVSKGRlYnVnX2NvbW1pdF9lbmQpKENQVUhleGFnb25TdGF0ZSAqZW52
LCBpbnQgaGFzX3N0MCwgaW50IGhhc19zdDEpCiAKIGludDMyX3QgSEVMUEVSKGZjaXJjYWRkKShp
bnQzMl90IFJ4ViwgaW50MzJfdCBvZmZzZXQsIGludDMyX3QgTSwgaW50MzJfdCBDUykKIHsKLSAg
ICBpbnQzMl90IEtfY29uc3QgPSBzZXh0cmFjdDMyKE0sIDI0LCA0KTsKLSAgICBpbnQzMl90IGxl
bmd0aCA9IHNleHRyYWN0MzIoTSwgMCwgMTcpOworICAgIHVpbnQzMl90IEtfY29uc3QgPSBleHRy
YWN0MzIoTSwgMjQsIDQpOworICAgIHVpbnQzMl90IGxlbmd0aCA9IGV4dHJhY3QzMihNLCAwLCAx
Nyk7CiAgICAgdWludDMyX3QgbmV3X3B0ciA9IFJ4ViArIG9mZnNldDsKICAgICB1aW50MzJfdCBz
dGFydF9hZGRyOwogICAgIHVpbnQzMl90IGVuZF9hZGRyOwpkaWZmIC0tZ2l0IGEvdGVzdHMvdGNn
L2hleGFnb24vY2lyYy5jIGIvdGVzdHMvdGNnL2hleGFnb24vY2lyYy5jCmluZGV4IDY3YTFhYTMw
NTQuLjM1NDQxNmViNmQgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3RjZy9oZXhhZ29uL2NpcmMuYworKysg
Yi90ZXN0cy90Y2cvaGV4YWdvbi9jaXJjLmMKQEAgLTEsNSArMSw1IEBACiAvKgotICogIENvcHly
aWdodChjKSAyMDE5LTIwMjEgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJp
Z2h0cyBSZXNlcnZlZC4KKyAqICBDb3B5cmlnaHQoYykgMjAxOS0yMDIyIFF1YWxjb21tIElubm92
YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCiAgKgogICogIFRoaXMgcHJv
Z3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9k
aWZ5CiAgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZSBhcyBwdWJsaXNoZWQgYnkKQEAgLTQxNSw3ICs0MTUsOCBAQCBzdGF0aWMgdm9pZCBjaXJj
X3Rlc3RfdjModm9pZCkKIHsKICAgICBpbnQgKnAgPSB3YnVmOwogICAgIGludCBzaXplID0gMTU7
Ci0gICAgaW50IEsgPSA0OyAgICAgIC8qIDY0IGJ5dGVzICovCisgICAgLyogc2V0IGhpZ2ggYml0
IGluIEsgdG8gdGVzdCB1bnNpZ25lZCBleHRyYWN0IGluIGZjaXJjICovCisgICAgaW50IEsgPSA4
OyAgICAgIC8qIDEwMjQgYnl0ZXMgKi8KICAgICBpbnQgZWxlbWVudDsKICAgICBpbnQgaTsKIAot
LSAKMi4xNy4xCgo=

