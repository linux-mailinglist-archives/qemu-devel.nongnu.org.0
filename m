Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7597A4AE071
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 19:14:12 +0100 (CET)
Received: from localhost ([::1]:46266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHV0F-0002HT-ES
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 13:14:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nHU8D-0006hD-Ab
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:18:21 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:61003)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nHU80-0002Z6-33
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644340688; x=1675876688;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=01Bbm5zoY43+gfseMEAlRWX3keMDKpLh5hrxe5L2EQE=;
 b=kJLSuFpk/gcKsU1XtlwVGkqNyyeilm6YS2E7vO9Fa6ioOtzQM3bQrJ82
 Gy8nP/VcN91Iroul2gMPOp2OXRuBquwhRZxW54rxVx4kGWjsWvw2BIJ77
 ccLPtT9fXz/2y6eBW9fVH1R1A0aPAY1wUCA1HvgAwHD22nTvGzx78xQOE w=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 08 Feb 2022 09:17:56 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP; 08 Feb 2022 09:17:56 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id DAA8C500175; Tue,  8 Feb 2022 09:16:55 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Hexagon (tests/tcg/hexagon) fix inline asm in preg_alias.c
Date: Tue,  8 Feb 2022 09:16:52 -0800
Message-Id: <20220208171652.31085-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
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
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

UmVwbGFjZSBjb25zZWN1dGl2ZSBpbmxpbmUgYXNtIGJsb2NrcyB3aXRoIGEgc2luZ2xlIG9uZSB3
aXRoIHByb3BlcgpvdXRwdXRzL2lucHV0cy9jbG9iYmVycyByYXRoZXIgdGhhbiBtYWtpbmcgYXNz
dW1wdGlvbnMgYWJvdXQgcmVnaXN0ZXIKdmFsdWVzIGJlaW5nIGNhcnJpZWQgYmV0d2VlbiBzZXBh
cmF0ZSBibG9ja3MuCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVp
Y2luYy5jb20+Ci0tLQogdGVzdHMvdGNnL2hleGFnb24vcHJlZ19hbGlhcy5jIHwgNDYgKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlv
bnMoKyksIDI0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3RjZy9oZXhhZ29uL3By
ZWdfYWxpYXMuYyBiL3Rlc3RzL3RjZy9oZXhhZ29uL3ByZWdfYWxpYXMuYwppbmRleCAwY2FjNDY5
Yjc4Li45ZjdiMTI1OTk4IDEwMDY0NAotLS0gYS90ZXN0cy90Y2cvaGV4YWdvbi9wcmVnX2FsaWFz
LmMKKysrIGIvdGVzdHMvdGNnL2hleGFnb24vcHJlZ19hbGlhcy5jCkBAIC0xLDUgKzEsNSBAQAog
LyoKLSAqICBDb3B5cmlnaHQoYykgMjAxOS0yMDIxIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVy
LCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisgKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMiBR
dWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgogICoK
ICAqICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUg
aXQgYW5kL29yIG1vZGlmeQogICogIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CkBAIC01NywxNyArNTcsMTUgQEAgdHlw
ZWRlZiB1bmlvbiB7CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBjcmVnX2FsaWFzKGludCBjdmFsLCBQ
UmVncyAqcHJlZ3MpCiB7Ci0gIHVuc2lnbmVkIGNoYXIgdmFsOwotICBhc20gdm9sYXRpbGUoImM0
ID0gJTAiIDogOiAiciIoY3ZhbCkpOwotCi0gIGFzbSB2b2xhdGlsZSgiJTAgPSBwMCIgOiAiPXIi
KHZhbCkpOwotICBwcmVncy0+cHJlZ3MucDAgPSB2YWw7Ci0gIGFzbSB2b2xhdGlsZSgiJTAgPSBw
MSIgOiAiPXIiKHZhbCkpOwotICBwcmVncy0+cHJlZ3MucDEgPSB2YWw7Ci0gIGFzbSB2b2xhdGls
ZSgiJTAgPSBwMiIgOiAiPXIiKHZhbCkpOwotICBwcmVncy0+cHJlZ3MucDIgPSB2YWw7Ci0gIGFz
bSB2b2xhdGlsZSgiJTAgPSBwMyIgOiAiPXIiKHZhbCkpOwotICBwcmVncy0+cHJlZ3MucDMgPSB2
YWw7CisgIGFzbSgiYzQgPSAlNFxuXHQiCisgICAgICAiJTAgPSBwMFxuXHQiCisgICAgICAiJTEg
PSBwMVxuXHQiCisgICAgICAiJTIgPSBwMlxuXHQiCisgICAgICAiJTMgPSBwM1xuXHQiCisgICAg
ICA6ICI9ciIocHJlZ3MtPnByZWdzLnAwKSwgIj1yIihwcmVncy0+cHJlZ3MucDEpLAorICAgICAg
ICAiPXIiKHByZWdzLT5wcmVncy5wMiksICI9ciIocHJlZ3MtPnByZWdzLnAzKQorICAgICAgOiAi
ciIoY3ZhbCkKKyAgICAgIDogImM0IiwgInAwIiwgInAxIiwgInAyIiwgInAzIik7CiB9CiAKIGlu
dCBlcnI7CkBAIC04MywxOSArODEsMTkgQEAgc3RhdGljIHZvaWQgY2hlY2soaW50IHZhbCwgaW50
IGV4cGVjdCkKIHN0YXRpYyBpbmxpbmUgdm9pZCBjcmVnX2FsaWFzX3BhaXIodW5zaWduZWQgaW50
IGN2YWwsIFBSZWdzICpwcmVncykKIHsKICAgdW5zaWduZWQgbG9uZyBsb25nIGN2YWxfcGFpciA9
ICgweGRlYWRiZWVmVUxMIDw8IDMyKSB8IGN2YWw7Ci0gIHVuc2lnbmVkIGNoYXIgdmFsOwogICBp
bnQgYzU7Ci0gIGFzbSB2b2xhdGlsZSgiYzU6NCA9ICUwIiA6IDogInIiKGN2YWxfcGFpcikpOwot
Ci0gIGFzbSB2b2xhdGlsZSgiJTAgPSBwMCIgOiAiPXIiKHZhbCkpOwotICBwcmVncy0+cHJlZ3Mu
cDAgPSB2YWw7Ci0gIGFzbSB2b2xhdGlsZSgiJTAgPSBwMSIgOiAiPXIiKHZhbCkpOwotICBwcmVn
cy0+cHJlZ3MucDEgPSB2YWw7Ci0gIGFzbSB2b2xhdGlsZSgiJTAgPSBwMiIgOiAiPXIiKHZhbCkp
OwotICBwcmVncy0+cHJlZ3MucDIgPSB2YWw7Ci0gIGFzbSB2b2xhdGlsZSgiJTAgPSBwMyIgOiAi
PXIiKHZhbCkpOwotICBwcmVncy0+cHJlZ3MucDMgPSB2YWw7Ci0gIGFzbSB2b2xhdGlsZSgiJTAg
PSBjNSIgOiAiPXIiKGM1KSk7CisKKyAgYXNtICgiYzU6NCA9ICU1XG5cdCIKKyAgICAgICAiJTAg
PSBwMFxuXHQiCisgICAgICAgIiUxID0gcDFcblx0IgorICAgICAgICIlMiA9IHAyXG5cdCIKKyAg
ICAgICAiJTMgPSBwM1xuXHQiCisgICAgICAgIiU0ID0gYzVcblx0IgorICAgICAgIDogIj1yIihw
cmVncy0+cHJlZ3MucDApLCAiPXIiKHByZWdzLT5wcmVncy5wMSksCisgICAgICAgICAiPXIiKHBy
ZWdzLT5wcmVncy5wMiksICI9ciIocHJlZ3MtPnByZWdzLnAzKSwgIj1yIihjNSkKKyAgICAgICA6
ICJyIihjdmFsX3BhaXIpCisgICAgICAgOiAiYzQiLCAiYzUiLCAicDAiLCAicDEiLCAicDIiLCAi
cDMiKTsKKwogICBjaGVjayhjNSwgMHhkZWFkYmVlZik7CiB9CiAKLS0gCjIuMTcuMQoK

