Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC594B0350
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 03:26:08 +0100 (CET)
Received: from localhost ([::1]:43458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHz9r-0002vD-IJ
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 21:26:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nHz13-0007DD-B2
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 21:17:02 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:16931)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nHz0z-0000Af-9L
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 21:17:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644459417; x=1675995417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uSeizUsDcPuFWEPIhe1yoHzeBvunT6nwaaWt3ITPh4c=;
 b=fQhdjtK7M43IldZt1v+g9PR18wGOzYzazPe6bKXHREYVtAofMZHbz38H
 aqO11R7Q03Jdk2+/kjRDzAmR92I/y2KkIBJp476nJR/zhIuds8NrgQn4Z
 vnrEdJQXQj66Q48HLSph9jqRe4q8LYEqmhZQdz9CX4UmmT4D0VckZVn7r 8=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 09 Feb 2022 18:16:02 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg08-lv.qualcomm.com with ESMTP; 09 Feb 2022 18:16:02 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 0A5015005A3; Wed,  9 Feb 2022 18:16:02 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/12] Hexagon (target/hexagon) assignment to c4 should
 wait until packet commit
Date: Wed,  9 Feb 2022 18:15:56 -0800
Message-Id: <20220210021556.9217-13-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220210021556.9217-1-tsimpson@quicinc.com>
References: <20220210021556.9217-1-tsimpson@quicinc.com>
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org,
 f4bug@amsat.org, tsimpson@quicinc.com, mlambert@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gSGV4YWdvbiwgYzQgaXMgYW4gYWxpYXMgZm9yIHByZWRpY2F0ZSByZWdpc3RlcnMgUDM6MC4g
IElmIHdlIGFzc2lnbiB0bwpjNCBpbnNpZGUgYSBwYWNrZXQgd2l0aCByZWFkcyBmcm9tIHByZWRp
Y2F0ZSByZWdpc3RlcnMsIHRoZSBwcmVkaWNhdGUKcmVhZHMgc2hvdWxkIGdldCB0aGUgb2xkIHZh
bHVlcy4KClRlc3QgY2FzZSBhZGRlZCB0byB0ZXN0cy90Y2cvaGV4YWdvbi9wcmVnX2FsaWFzLmMK
CkNvLWF1dGhvcmVkLWJ5OiBNaWNoYWVsIExhbWJlcnQgPG1sYW1iZXJ0QGN1aWNpbmMuY29tPgpT
aWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQog
dGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgICAgICAgIHwgMTQgKysrKysrKystLS0tLQogdGVzdHMv
dGNnL2hleGFnb24vcHJlZ19hbGlhcy5jIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jIGIvdGFyZ2V0L2hleGFnb24v
Z2VucHRyLmMKaW5kZXggNDQxOWQzMGUyMy4uY2Q2YWY0YmNlYiAxMDA2NDQKLS0tIGEvdGFyZ2V0
L2hleGFnb24vZ2VucHRyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKQEAgLTEsNSAr
MSw1IEBACiAvKgotICogIENvcHlyaWdodChjKSAyMDE5LTIwMjEgUXVhbGNvbW0gSW5ub3ZhdGlv
biBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAqICBDb3B5cmlnaHQoYykgMjAx
OS0yMDIyIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2
ZWQuCiAgKgogICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlz
dHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKQEAgLTIxMCwxMSArMjEw
LDE1IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBnZW5fcmVhZF9jdHJsX3JlZ19wYWlyKERpc2FzQ29u
dGV4dCAqY3R4LCBjb25zdCBpbnQgcmVnX251bSwKICAgICB9CiB9CiAKLXN0YXRpYyBpbmxpbmUg
dm9pZCBnZW5fd3JpdGVfcDNfMChUQ0d2IGNvbnRyb2xfcmVnKQorc3RhdGljIHZvaWQgZ2VuX3dy
aXRlX3AzXzAoRGlzYXNDb250ZXh0ICpjdHgsIFRDR3YgY29udHJvbF9yZWcpCiB7CisgICAgVENH
diBoZXhfcDggPSB0Y2dfdGVtcF9uZXcoKTsKICAgICBmb3IgKGludCBpID0gMDsgaSA8IE5VTV9Q
UkVHUzsgaSsrKSB7Ci0gICAgICAgIHRjZ19nZW5fZXh0cmFjdF90bChoZXhfcHJlZFtpXSwgY29u
dHJvbF9yZWcsIGkgKiA4LCA4KTsKKyAgICAgICAgdGNnX2dlbl9leHRyYWN0X3RsKGhleF9wOCwg
Y29udHJvbF9yZWcsIGkgKiA4LCA4KTsKKyAgICAgICAgZ2VuX2xvZ19wcmVkX3dyaXRlKGN0eCwg
aSwgaGV4X3A4KTsKKyAgICAgICAgY3R4X2xvZ19wcmVkX3dyaXRlKGN0eCwgaSk7CiAgICAgfQor
ICAgIHRjZ190ZW1wX2ZyZWUoaGV4X3A4KTsKIH0KIAogLyoKQEAgLTIyOCw3ICsyMzIsNyBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgZ2VuX3dyaXRlX2N0cmxfcmVnKERpc2FzQ29udGV4dCAqY3R4LCBp
bnQgcmVnX251bSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVENHdiB2
YWwpCiB7CiAgICAgaWYgKHJlZ19udW0gPT0gSEVYX1JFR19QM18wKSB7Ci0gICAgICAgIGdlbl93
cml0ZV9wM18wKHZhbCk7CisgICAgICAgIGdlbl93cml0ZV9wM18wKGN0eCwgdmFsKTsKICAgICB9
IGVsc2UgewogICAgICAgICBnZW5fbG9nX3JlZ193cml0ZShyZWdfbnVtLCB2YWwpOwogICAgICAg
ICBjdHhfbG9nX3JlZ193cml0ZShjdHgsIHJlZ19udW0pOwpAQCAtMjUwLDcgKzI1NCw3IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCBnZW5fd3JpdGVfY3RybF9yZWdfcGFpcihEaXNhc0NvbnRleHQgKmN0
eCwgaW50IHJlZ19udW0sCiAgICAgaWYgKHJlZ19udW0gPT0gSEVYX1JFR19QM18wKSB7CiAgICAg
ICAgIFRDR3YgdmFsMzIgPSB0Y2dfdGVtcF9uZXcoKTsKICAgICAgICAgdGNnX2dlbl9leHRybF9p
NjRfaTMyKHZhbDMyLCB2YWwpOwotICAgICAgICBnZW5fd3JpdGVfcDNfMCh2YWwzMik7CisgICAg
ICAgIGdlbl93cml0ZV9wM18wKGN0eCwgdmFsMzIpOwogICAgICAgICB0Y2dfZ2VuX2V4dHJoX2k2
NF9pMzIodmFsMzIsIHZhbCk7CiAgICAgICAgIGdlbl9sb2dfcmVnX3dyaXRlKHJlZ19udW0gKyAx
LCB2YWwzMik7CiAgICAgICAgIHRjZ190ZW1wX2ZyZWUodmFsMzIpOwpkaWZmIC0tZ2l0IGEvdGVz
dHMvdGNnL2hleGFnb24vcHJlZ19hbGlhcy5jIGIvdGVzdHMvdGNnL2hleGFnb24vcHJlZ19hbGlh
cy5jCmluZGV4IDlmN2IxMjU5OTguLmIwNGM0NTYzMmMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3RjZy9o
ZXhhZ29uL3ByZWdfYWxpYXMuYworKysgYi90ZXN0cy90Y2cvaGV4YWdvbi9wcmVnX2FsaWFzLmMK
QEAgLTk3LDYgKzk3LDQyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBjcmVnX2FsaWFzX3BhaXIodW5z
aWduZWQgaW50IGN2YWwsIFBSZWdzICpwcmVncykKICAgY2hlY2soYzUsIDB4ZGVhZGJlZWYpOwog
fQogCitzdGF0aWMgdm9pZCB0ZXN0X3BhY2tldCh2b2lkKQoreworICAgIC8qCisgICAgICogVGVz
dCB0aGF0IHNldHRpbmcgYzQgaW5zaWRlIGEgcGFja2V0IGRvZXNuJ3QgaW1wYWN0IHRoZSBwcmVk
aWNhdGVzCisgICAgICogdGhhdCBhcmUgcmVhZCBkdXJpbmcgdGhlIHBhY2tldC4KKyAgICAgKi8K
KworICAgIGludCByZXN1bHQ7CisgICAgaW50IG9sZF92YWwgPSAweDAwMDAwMDFjOworCisgICAg
LyogVGVzdCBhIHByZWRpY2F0ZWQgcmVnaXN0ZXIgdHJhbnNmZXIgKi8KKyAgICByZXN1bHQgPSBv
bGRfdmFsOworICAgIGFzbSAoCisgICAgICAgICAiYzQgPSAlMVxuXHQiCisgICAgICAgICAie1xu
XHQiCisgICAgICAgICAiICAgIGM0ID0gJTJcblx0IgorICAgICAgICAgIiAgICBpZiAoIXAyKSAl
MCA9ICUzXG5cdCIKKyAgICAgICAgICJ9XG5cdCIKKyAgICAgICAgIDogIityIihyZXN1bHQpCisg
ICAgICAgICA6ICJyIigweGZmZmZmZmZmKSwgInIiKDB4ZmYwMGZmZmYpLCAiciIoMHg4MzdlZDY1
MykKKyAgICAgICAgIDogImM0IiwgInAwIiwgInAxIiwgInAyIiwgInAzIik7CisgICAgY2hlY2so
cmVzdWx0LCBvbGRfdmFsKTsKKworICAgIC8qIFRlc3QgYSBwcmVkaWNhdGVkIHN0b3JlICovCisg
ICAgcmVzdWx0ID0gMHhmZmZmZmZmZjsKKyAgICBhc20gKCJjNCA9ICUwXG5cdCIKKyAgICAgICAg
ICJ7XG5cdCIKKyAgICAgICAgICIgICAgYzQgPSAlMVxuXHQiCisgICAgICAgICAiICAgIGlmICgh
cDIpIG1lbXcoJTIpID0gIzBcblx0IgorICAgICAgICAgIn1cblx0IgorICAgICAgICAgOgorICAg
ICAgICAgOiAiciIoMCksICJyIigweGZmZmZmZmZmKSwgInIiKCZyZXN1bHQpCisgICAgICAgICA6
ICJjNCIsICJwMCIsICJwMSIsICJwMiIsICJwMyIsICJtZW1vcnkiKTsKKyAgICBjaGVjayhyZXN1
bHQsIDB4MCk7Cit9CisKIGludCBtYWluKCkKIHsKICAgICBpbnQgYzQ7CkBAIC0xNjIsNiArMTk4
LDggQEAgaW50IG1haW4oKQogICAgIGNyZWdfYWxpYXNfcGFpcigweGZmZmZmZmZmLCAmcHJlZ3Mp
OwogICAgIGNoZWNrKHByZWdzLmNyZWcsIDB4ZmZmZmZmZmYpOwogCisgICAgdGVzdF9wYWNrZXQo
KTsKKwogICAgIHB1dHMoZXJyID8gIkZBSUwiIDogIlBBU1MiKTsKICAgICByZXR1cm4gZXJyOwog
fQotLSAKMi4xNy4xCgo=

