Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829964D70CB
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 21:21:08 +0100 (CET)
Received: from localhost ([::1]:44320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nT8Ed-0001SV-IZ
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 15:21:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nT87I-0003gD-EM
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 15:13:32 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:37881)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nT87G-0008O9-Ff
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 15:13:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647116010; x=1678652010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xGbD0WBkojka4Pijw2kA07NSo91KfJMwHuNkSmlJN1s=;
 b=T+UqLU8S08dBT7DyAGOSdOlFQsYke0su0Z9wJ8w0wAqWgv9p/lgLM7U5
 AdlfbnHt4nFbudZMUp3JV1aabCV6wGNEQ/vXIJQ66ox2w3/s7Vj2VpwlX
 e2ZQPEguYS3FTu83xi4C3nVCpLEahdL1seuodhXftgDr0TQFDt2qJ/ocG 0=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 12 Mar 2022 12:13:21 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP; 12 Mar 2022 12:13:20 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id C2DA15005BC; Sat, 12 Mar 2022 12:13:20 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 11/12] Hexagon (target/hexagon) assignment to c4 should wait
 until packet commit
Date: Sat, 12 Mar 2022 12:13:18 -0800
Message-Id: <20220312201319.29040-12-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220312201319.29040-1-tsimpson@quicinc.com>
References: <20220312201319.29040-1-tsimpson@quicinc.com>
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
Cc: peter.maydell@linaro.org, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org, zongyuan.li@smartx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gSGV4YWdvbiwgYzQgaXMgYW4gYWxpYXMgZm9yIHByZWRpY2F0ZSByZWdpc3RlcnMgUDM6MC4g
IElmIHdlIGFzc2lnbiB0bwpjNCBpbnNpZGUgYSBwYWNrZXQgd2l0aCByZWFkcyBmcm9tIHByZWRp
Y2F0ZSByZWdpc3RlcnMsIHRoZSBwcmVkaWNhdGUKcmVhZHMgc2hvdWxkIGdldCB0aGUgb2xkIHZh
bHVlcy4KClRlc3QgY2FzZSBhZGRlZCB0byB0ZXN0cy90Y2cvaGV4YWdvbi9wcmVnX2FsaWFzLmMK
CkNvLWF1dGhvcmVkLWJ5OiBNaWNoYWVsIExhbWJlcnQgPG1sYW1iZXJ0QGN1aWNpbmMuY29tPgpT
aWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ck1lc3Nh
Z2UtSWQ6IDwyMDIyMDIxMDAyMTU1Ni45MjE3LTEzLXRzaW1wc29uQHF1aWNpbmMuY29tPgpSZXZp
ZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+
Ci0tLQogdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgICAgICAgIHwgMTQgKysrKysrKystLS0tLQog
dGVzdHMvdGNnL2hleGFnb24vcHJlZ19hbGlhcy5jIHwgMzggKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jIGIvdGFyZ2V0L2hl
eGFnb24vZ2VucHRyLmMKaW5kZXggNDQxOWQzMGUyMy4uY2Q2YWY0YmNlYiAxMDA2NDQKLS0tIGEv
dGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKQEAg
LTEsNSArMSw1IEBACiAvKgotICogIENvcHlyaWdodChjKSAyMDE5LTIwMjEgUXVhbGNvbW0gSW5u
b3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAqICBDb3B5cmlnaHQo
YykgMjAxOS0yMDIyIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMg
UmVzZXJ2ZWQuCiAgKgogICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2Fu
IHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9m
IHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKQEAgLTIxMCwx
MSArMjEwLDE1IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBnZW5fcmVhZF9jdHJsX3JlZ19wYWlyKERp
c2FzQ29udGV4dCAqY3R4LCBjb25zdCBpbnQgcmVnX251bSwKICAgICB9CiB9CiAKLXN0YXRpYyBp
bmxpbmUgdm9pZCBnZW5fd3JpdGVfcDNfMChUQ0d2IGNvbnRyb2xfcmVnKQorc3RhdGljIHZvaWQg
Z2VuX3dyaXRlX3AzXzAoRGlzYXNDb250ZXh0ICpjdHgsIFRDR3YgY29udHJvbF9yZWcpCiB7Cisg
ICAgVENHdiBoZXhfcDggPSB0Y2dfdGVtcF9uZXcoKTsKICAgICBmb3IgKGludCBpID0gMDsgaSA8
IE5VTV9QUkVHUzsgaSsrKSB7Ci0gICAgICAgIHRjZ19nZW5fZXh0cmFjdF90bChoZXhfcHJlZFtp
XSwgY29udHJvbF9yZWcsIGkgKiA4LCA4KTsKKyAgICAgICAgdGNnX2dlbl9leHRyYWN0X3RsKGhl
eF9wOCwgY29udHJvbF9yZWcsIGkgKiA4LCA4KTsKKyAgICAgICAgZ2VuX2xvZ19wcmVkX3dyaXRl
KGN0eCwgaSwgaGV4X3A4KTsKKyAgICAgICAgY3R4X2xvZ19wcmVkX3dyaXRlKGN0eCwgaSk7CiAg
ICAgfQorICAgIHRjZ190ZW1wX2ZyZWUoaGV4X3A4KTsKIH0KIAogLyoKQEAgLTIyOCw3ICsyMzIs
NyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZ2VuX3dyaXRlX2N0cmxfcmVnKERpc2FzQ29udGV4dCAq
Y3R4LCBpbnQgcmVnX251bSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
VENHdiB2YWwpCiB7CiAgICAgaWYgKHJlZ19udW0gPT0gSEVYX1JFR19QM18wKSB7Ci0gICAgICAg
IGdlbl93cml0ZV9wM18wKHZhbCk7CisgICAgICAgIGdlbl93cml0ZV9wM18wKGN0eCwgdmFsKTsK
ICAgICB9IGVsc2UgewogICAgICAgICBnZW5fbG9nX3JlZ193cml0ZShyZWdfbnVtLCB2YWwpOwog
ICAgICAgICBjdHhfbG9nX3JlZ193cml0ZShjdHgsIHJlZ19udW0pOwpAQCAtMjUwLDcgKzI1NCw3
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBnZW5fd3JpdGVfY3RybF9yZWdfcGFpcihEaXNhc0NvbnRl
eHQgKmN0eCwgaW50IHJlZ19udW0sCiAgICAgaWYgKHJlZ19udW0gPT0gSEVYX1JFR19QM18wKSB7
CiAgICAgICAgIFRDR3YgdmFsMzIgPSB0Y2dfdGVtcF9uZXcoKTsKICAgICAgICAgdGNnX2dlbl9l
eHRybF9pNjRfaTMyKHZhbDMyLCB2YWwpOwotICAgICAgICBnZW5fd3JpdGVfcDNfMCh2YWwzMik7
CisgICAgICAgIGdlbl93cml0ZV9wM18wKGN0eCwgdmFsMzIpOwogICAgICAgICB0Y2dfZ2VuX2V4
dHJoX2k2NF9pMzIodmFsMzIsIHZhbCk7CiAgICAgICAgIGdlbl9sb2dfcmVnX3dyaXRlKHJlZ19u
dW0gKyAxLCB2YWwzMik7CiAgICAgICAgIHRjZ190ZW1wX2ZyZWUodmFsMzIpOwpkaWZmIC0tZ2l0
IGEvdGVzdHMvdGNnL2hleGFnb24vcHJlZ19hbGlhcy5jIGIvdGVzdHMvdGNnL2hleGFnb24vcHJl
Z19hbGlhcy5jCmluZGV4IDc5ZmViZWNhOTcuLmI0NGE4MTEyYjQgMTAwNjQ0Ci0tLSBhL3Rlc3Rz
L3RjZy9oZXhhZ29uL3ByZWdfYWxpYXMuYworKysgYi90ZXN0cy90Y2cvaGV4YWdvbi9wcmVnX2Fs
aWFzLmMKQEAgLTk3LDYgKzk3LDQyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBjcmVnX2FsaWFzX3Bh
aXIodW5zaWduZWQgaW50IGN2YWwsIFBSZWdzICpwcmVncykKICAgY2hlY2soYzUsIDB4ZGVhZGJl
ZWYpOwogfQogCitzdGF0aWMgdm9pZCB0ZXN0X3BhY2tldCh2b2lkKQoreworICAgIC8qCisgICAg
ICogVGVzdCB0aGF0IHNldHRpbmcgYzQgaW5zaWRlIGEgcGFja2V0IGRvZXNuJ3QgaW1wYWN0IHRo
ZSBwcmVkaWNhdGVzCisgICAgICogdGhhdCBhcmUgcmVhZCBkdXJpbmcgdGhlIHBhY2tldC4KKyAg
ICAgKi8KKworICAgIGludCByZXN1bHQ7CisgICAgaW50IG9sZF92YWwgPSAweDAwMDAwMDFjOwor
CisgICAgLyogVGVzdCBhIHByZWRpY2F0ZWQgcmVnaXN0ZXIgdHJhbnNmZXIgKi8KKyAgICByZXN1
bHQgPSBvbGRfdmFsOworICAgIGFzbSAoCisgICAgICAgICAiYzQgPSAlMVxuXHQiCisgICAgICAg
ICAie1xuXHQiCisgICAgICAgICAiICAgIGM0ID0gJTJcblx0IgorICAgICAgICAgIiAgICBpZiAo
IXAyKSAlMCA9ICUzXG5cdCIKKyAgICAgICAgICJ9XG5cdCIKKyAgICAgICAgIDogIityIihyZXN1
bHQpCisgICAgICAgICA6ICJyIigweGZmZmZmZmZmKSwgInIiKDB4ZmYwMGZmZmYpLCAiciIoMHg4
MzdlZDY1MykKKyAgICAgICAgIDogInAwIiwgInAxIiwgInAyIiwgInAzIik7CisgICAgY2hlY2so
cmVzdWx0LCBvbGRfdmFsKTsKKworICAgIC8qIFRlc3QgYSBwcmVkaWNhdGVkIHN0b3JlICovCisg
ICAgcmVzdWx0ID0gMHhmZmZmZmZmZjsKKyAgICBhc20gKCJjNCA9ICUwXG5cdCIKKyAgICAgICAg
ICJ7XG5cdCIKKyAgICAgICAgICIgICAgYzQgPSAlMVxuXHQiCisgICAgICAgICAiICAgIGlmICgh
cDIpIG1lbXcoJTIpID0gIzBcblx0IgorICAgICAgICAgIn1cblx0IgorICAgICAgICAgOgorICAg
ICAgICAgOiAiciIoMCksICJyIigweGZmZmZmZmZmKSwgInIiKCZyZXN1bHQpCisgICAgICAgICA6
ICJwMCIsICJwMSIsICJwMiIsICJwMyIsICJtZW1vcnkiKTsKKyAgICBjaGVjayhyZXN1bHQsIDB4
MCk7Cit9CisKIGludCBtYWluKCkKIHsKICAgICBpbnQgYzQ7CkBAIC0xNjIsNiArMTk4LDggQEAg
aW50IG1haW4oKQogICAgIGNyZWdfYWxpYXNfcGFpcigweGZmZmZmZmZmLCAmcHJlZ3MpOwogICAg
IGNoZWNrKHByZWdzLmNyZWcsIDB4ZmZmZmZmZmYpOwogCisgICAgdGVzdF9wYWNrZXQoKTsKKwog
ICAgIHB1dHMoZXJyID8gIkZBSUwiIDogIlBBU1MiKTsKICAgICByZXR1cm4gZXJyOwogfQotLSAK
Mi4xNy4xCgo=

