Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E794AB2E5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 01:08:14 +0100 (CET)
Received: from localhost ([::1]:39384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGrZl-0003A7-NM
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 19:08:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nGrP1-0000MP-Sq
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 18:57:07 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:55676)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nGrOz-00083w-PA
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 18:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644191826; x=1675727826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9gSyrh0alaxvv3yRhIcZJ/z/pzQRQwND45cWzN57W3I=;
 b=Kcfn1qwnly4TMXPyfmqoeUzaQDuifLYkhUxfco/2pV4EQrMTuSMS1IRG
 uTmL4lb+mVJ1mjR1eH6ujnfjRPBMcApuentJ6Gj1FcH2UjTeWi2vsBJzc
 h9o+mIGr1zxflAyhyKYBGPafEcQB2LPjU6YKSiJ8mxtxtIBy3cSatNoqN k=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 06 Feb 2022 15:50:54 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP; 06 Feb 2022 15:50:53 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id AE4E350059F; Sun,  6 Feb 2022 15:50:33 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] Hexagon (tests/tcg/hexagon) update overflow test
Date: Sun,  6 Feb 2022 15:50:30 -0800
Message-Id: <20220206235030.31493-9-tsimpson@quicinc.com>
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

QWRkIGEgdGVzdCB0aGF0IHNldHMgVVNSIG11bHRpcGxlIHRpbWVzIGluIGEgcGFja2V0CgpTaWdu
ZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGVz
dHMvdGNnL2hleGFnb24vb3ZlcmZsb3cuYyB8IDYxICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS90ZXN0cy90Y2cvaGV4YWdvbi9vdmVyZmxvdy5jIGIvdGVzdHMvdGNn
L2hleGFnb24vb3ZlcmZsb3cuYwppbmRleCAxOTZmY2Y3ZjNhLi45NDA4Nzg1MWIwIDEwMDY0NAot
LS0gYS90ZXN0cy90Y2cvaGV4YWdvbi9vdmVyZmxvdy5jCisrKyBiL3Rlc3RzL3RjZy9oZXhhZ29u
L292ZXJmbG93LmMKQEAgLTEsNSArMSw1IEBACiAvKgotICogIENvcHlyaWdodChjKSAyMDIxIFF1
YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisgKiAg
Q29weXJpZ2h0KGMpIDIwMjEtMjAyMiBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBB
bGwgUmlnaHRzIFJlc2VydmVkLgogICoKICAqICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2Fy
ZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICogIGl0IHVuZGVyIHRo
ZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5
CkBAIC03Miw2ICs3MiwyMCBAQCBpbnQgcmVhZF91c3Jfb3ZlcmZsb3codm9pZCkKICAgICByZXR1
cm4gcmVzdWx0ICYgMTsKIH0KIAoraW50IGdldF91c3Jfb3ZlcmZsb3coaW50IHVzcikKK3sKKyAg
ICByZXR1cm4gdXNyICYgMTsKK30KKworaW50IGdldF91c3JfZnBfaW52YWxpZChpbnQgdXNyKQor
eworICAgIHJldHVybiAodXNyID4+IDEpICYgMTsKK30KKworaW50IGdldF91c3JfbHBjZmcoaW50
IHVzcikKK3sKKyAgICByZXR1cm4gKHVzciA+PiA4KSAmIDB4MzsKK30KIAogam1wX2J1ZiBqbXBf
ZW52OwogaW50IHVzcl9vdmVyZmxvdzsKQEAgLTgyLDYgKzk2LDQ5IEBAIHN0YXRpYyB2b2lkIHNp
Z19zZWd2KGludCBzaWcsIHNpZ2luZm9fdCAqaW5mbywgdm9pZCAqcHVjKQogICAgIGxvbmdqbXAo
am1wX2VudiwgMSk7CiB9CiAKK3N0YXRpYyB2b2lkIHRlc3RfcGFja2V0KHZvaWQpCit7CisgICAg
aW50IGNvbnZyZXM7CisgICAgaW50IHNhdHJlczsKKyAgICBpbnQgdXNyOworCisgICAgYXNtKCJy
MiA9IHVzclxuXHQiCisgICAgICAgICJyMiA9IGNscmJpdChyMiwgIzApXG5cdCIgICAgICAgIC8q
IGNsZWFyIG92ZXJmbG93IGJpdCAqLworICAgICAgICAicjIgPSBjbHJiaXQocjIsICMxKVxuXHQi
ICAgICAgICAvKiBjbGVhciBGUCBpbnZhbGlkIGJpdCAqLworICAgICAgICAidXNyID0gcjJcblx0
IgorICAgICAgICAie1xuXHQiCisgICAgICAgICIgICAgJTAgPSBjb252ZXJ0X3NmMnV3KCUzKTpj
aG9wXG5cdCIKKyAgICAgICAgIiAgICAlMSA9IHNhdGIoJTQpXG5cdCIKKyAgICAgICAgIn1cblx0
IgorICAgICAgICAiJTIgPSB1c3Jcblx0IgorICAgICAgICA6ICI9ciIoY29udnJlcyksICI9ciIo
c2F0cmVzKSwgIj1yIih1c3IpCisgICAgICAgIDogInIiKDB4NmEwNTFiODYpLCAiciIoMHgwNDEw
ZWVjMCkKKyAgICAgICAgOiAicjIiLCAidXNyIik7CisKKyAgICBjaGVjayhjb252cmVzLCAweGZm
ZmZmZmZmKTsKKyAgICBjaGVjayhzYXRyZXMsIDB4N2YpOworICAgIGNoZWNrKGdldF91c3Jfb3Zl
cmZsb3codXNyKSwgMSk7CisgICAgY2hlY2soZ2V0X3Vzcl9mcF9pbnZhbGlkKHVzciksIDEpOwor
CisgICAgYXNtKCJyMiA9IHVzclxuXHQiCisgICAgICAgICJyMiA9IGNscmJpdChyMiwgIzApXG5c
dCIgICAgICAgIC8qIGNsZWFyIG92ZXJmbG93IGJpdCAqLworICAgICAgICAidXNyID0gcjJcblx0
IgorICAgICAgICAiJTIgPSByMlxuXHQiCisgICAgICAgICJwMyA9IHNwM2xvb3AwKDFmLCAjMSlc
blx0IgorICAgICAgICAiMTpcblx0IgorICAgICAgICAie1xuXHQiCisgICAgICAgICIgICAgJTAg
PSBzYXRiKCUyKVxuXHQiCisgICAgICAgICJ9OmVuZGxvb3AwXG5cdCIKKyAgICAgICAgIiUxID0g
dXNyXG5cdCIKKyAgICAgICAgOiAiPXIiKHNhdHJlcyksICI9ciIodXNyKQorICAgICAgICA6ICJy
IigweDA0MTBlZWMwKQorICAgICAgICA6ICJyMiIsICJ1c3IiLCAicDMiLCAic2EwIiwgImxjMCIp
OworCisgICAgY2hlY2soc2F0cmVzLCAweDdmKTsKKyAgICBjaGVjayhnZXRfdXNyX292ZXJmbG93
KHVzciksIDEpOworICAgIGNoZWNrKGdldF91c3JfbHBjZmcodXNyKSwgMik7Cit9CisKIGludCBt
YWluKCkKIHsKICAgICBzdHJ1Y3Qgc2lnYWN0aW9uIGFjdDsKQEAgLTEwMiw2ICsxNTksOCBAQCBp
bnQgbWFpbigpCiAKICAgICBjaGVjayh1c3Jfb3ZlcmZsb3csIDApOwogCisgICAgdGVzdF9wYWNr
ZXQoKTsKKwogICAgIHB1dHMoZXJyID8gIkZBSUwiIDogIlBBU1MiKTsKICAgICByZXR1cm4gZXJy
ID8gRVhJVF9GQUlMVVJFIDogRVhJVF9TVUNDRVNTOwogfQotLSAKMi4xNy4xCgo=

