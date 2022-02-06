Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6828E4AB2D9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 00:59:59 +0100 (CET)
Received: from localhost ([::1]:55022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGrRl-0002xf-VZ
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 18:59:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nGrP0-0000LN-UC
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 18:57:06 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:61317)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nGrOy-00083y-H7
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 18:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644191824; x=1675727824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WzHSFZynJxPE9xSVQ7ezZN7EOS5qvqs0yMvE+HnMY9g=;
 b=pw8gmrQuo8oNseK1LCBxGqUyk031PoDRg5iSlgGhcCW0UqQiHirimRhP
 j2o5/fkIvfcL9som7GudBE9NTT+NbyNORZJrTbrF8hG90MQYxfp5wjwOg
 4/Z41x3+4QTJY25QijexOISmeSy4FF1RJGqoe1yVgBhmVr/XFafqnq+Rj Q=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 06 Feb 2022 15:50:54 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg08-lv.qualcomm.com with ESMTP; 06 Feb 2022 15:50:53 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 9B7EC500587; Sun,  6 Feb 2022 15:50:33 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] Hexagon (target/hexagon) fix bug in circular addressing
Date: Sun,  6 Feb 2022 15:50:23 -0800
Message-Id: <20220206235030.31493-2-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220206235030.31493-1-tsimpson@quicinc.com>
References: <20220206235030.31493-1-tsimpson@quicinc.com>
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org,
 f4bug@amsat.org, tsimpson@quicinc.com, mlambert@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogTWljaGFlbCBMYW1iZXJ0IDxtbGFtYmVydEBxdWljaW5jLmNvbT4KClZlcnNpb25zIFYz
IGFuZCBlYXJsaWVyIHNob3VsZCB0cmVhdCB0aGUgIktfY29uc3QiIGFuZCAibGVuZ3RoIiB2YWx1
ZXMKYXMgdW5zaWduZWQuCgpNb2RpZmllZCBjaXJjX3Rlc3RfdjMoKSBpbiB0ZXN0cy90Y2cvaGV4
YWdvbi9jaXJjLmMgdG8gcmVwcm9kdWNlIHRoZSBidWcKClNpZ25lZC1vZmYtYnk6IE1pY2hhZWwg
TGFtYmVydCA8bWxhbWJlcnRAcXVpY2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1w
c29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIu
YyB8IDYgKysrLS0tCiB0ZXN0cy90Y2cvaGV4YWdvbi9jaXJjLmMgICB8IDUgKysrLS0KIDIgZmls
ZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jIGIvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMK
aW5kZXggMDU3YmFmOWE0OC4uNDdiZDUxZTBjYSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24v
b3BfaGVscGVyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMKQEAgLTEsNSArMSw1
IEBACiAvKgotICogIENvcHlyaWdodChjKSAyMDE5LTIwMjEgUXVhbGNvbW0gSW5ub3ZhdGlvbiBD
ZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAqICBDb3B5cmlnaHQoYykgMjAxOS0y
MDIyIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQu
CiAgKgogICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJp
YnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKQEAgLTMwNCw4ICszMDQsOCBA
QCB2b2lkIEhFTFBFUihkZWJ1Z19jb21taXRfZW5kKShDUFVIZXhhZ29uU3RhdGUgKmVudiwgaW50
IGhhc19zdDAsIGludCBoYXNfc3QxKQogCiBpbnQzMl90IEhFTFBFUihmY2lyY2FkZCkoaW50MzJf
dCBSeFYsIGludDMyX3Qgb2Zmc2V0LCBpbnQzMl90IE0sIGludDMyX3QgQ1MpCiB7Ci0gICAgaW50
MzJfdCBLX2NvbnN0ID0gc2V4dHJhY3QzMihNLCAyNCwgNCk7Ci0gICAgaW50MzJfdCBsZW5ndGgg
PSBzZXh0cmFjdDMyKE0sIDAsIDE3KTsKKyAgICB1aW50MzJfdCBLX2NvbnN0ID0gZXh0cmFjdDMy
KE0sIDI0LCA0KTsKKyAgICB1aW50MzJfdCBsZW5ndGggPSBleHRyYWN0MzIoTSwgMCwgMTcpOwog
ICAgIHVpbnQzMl90IG5ld19wdHIgPSBSeFYgKyBvZmZzZXQ7CiAgICAgdWludDMyX3Qgc3RhcnRf
YWRkcjsKICAgICB1aW50MzJfdCBlbmRfYWRkcjsKZGlmZiAtLWdpdCBhL3Rlc3RzL3RjZy9oZXhh
Z29uL2NpcmMuYyBiL3Rlc3RzL3RjZy9oZXhhZ29uL2NpcmMuYwppbmRleCA2N2ExYWEzMDU0Li4z
NTQ0MTZlYjZkIDEwMDY0NAotLS0gYS90ZXN0cy90Y2cvaGV4YWdvbi9jaXJjLmMKKysrIGIvdGVz
dHMvdGNnL2hleGFnb24vY2lyYy5jCkBAIC0xLDUgKzEsNSBAQAogLyoKLSAqICBDb3B5cmlnaHQo
YykgMjAxOS0yMDIxIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMg
UmVzZXJ2ZWQuCisgKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMiBRdWFsY29tbSBJbm5vdmF0aW9u
IENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgogICoKICAqICBUaGlzIHByb2dyYW0g
aXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQog
ICogIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2Ug
YXMgcHVibGlzaGVkIGJ5CkBAIC00MTUsNyArNDE1LDggQEAgc3RhdGljIHZvaWQgY2lyY190ZXN0
X3YzKHZvaWQpCiB7CiAgICAgaW50ICpwID0gd2J1ZjsKICAgICBpbnQgc2l6ZSA9IDE1OwotICAg
IGludCBLID0gNDsgICAgICAvKiA2NCBieXRlcyAqLworICAgIC8qIHNldCBoaWdoIGJpdCBpbiBL
IHRvIHRlc3QgdW5zaWduZWQgZXh0cmFjdCBpbiBmY2lyYyAqLworICAgIGludCBLID0gODsgICAg
ICAvKiAxMDI0IGJ5dGVzICovCiAgICAgaW50IGVsZW1lbnQ7CiAgICAgaW50IGk7CiAKLS0gCjIu
MTcuMQoK

