Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE44B247D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 12:35:56 +0100 (CET)
Received: from localhost ([::1]:35562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIUDT-0005e9-6z
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 06:35:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nITwF-0007hI-AD
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:18:07 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:50440)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nITwD-00017l-EN
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:18:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644578285; x=1676114285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/ZACeLQMt2iWa+fcz1G107uiiRYY/7vBXnlv0uqSYEo=;
 b=Ne+7TABbC6ZD1/lyUxmIMfPwWgQBxVgaRplByoLtod21RWscvt7p1H/e
 gZFlecU2vIV1E99EFk73FPp/QNkBmMN0XdxA59e9sS0xWjBWUhz3+ZUin
 mwRhpcgRfejYk9OscDwBY6Nspd+hQp/gQgBiwh7qbmWg89vcQL0rCbCrL Q=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 11 Feb 2022 03:17:44 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg08-lv.qualcomm.com with ESMTP; 11 Feb 2022 03:17:45 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id A0B6350059B; Fri, 11 Feb 2022 03:17:24 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/12] Hexagon (tests/tcg/hexagon) fix inline asm in
 preg_alias.c
Date: Fri, 11 Feb 2022 03:17:18 -0800
Message-Id: <20220211111722.31036-9-tsimpson@quicinc.com>
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
Cc: peter.maydell@linaro.org, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org, zongyuan.li@smartx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UmVwbGFjZSBjb25zZWN1dGl2ZSBpbmxpbmUgYXNtIGJsb2NrcyB3aXRoIGEgc2luZ2xlIG9uZSB3
aXRoIHByb3BlcgpvdXRwdXRzL2lucHV0cy9jbG9iYmVycyByYXRoZXIgdGhhbiBtYWtpbmcgYXNz
dW1wdGlvbnMgYWJvdXQgcmVnaXN0ZXIKdmFsdWVzIGJlaW5nIGNhcnJpZWQgYmV0d2VlbiBzZXBh
cmF0ZSBibG9ja3MuCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVp
Y2luYy5jb20+Ck1lc3NhZ2UtSWQ6IDwyMDIyMDIxMDAyMTU1Ni45MjE3LTEwLXRzaW1wc29uQHF1
aWNpbmMuY29tPgpSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVy
c29uQGxpbmFyby5vcmc+Ci0tLQogdGVzdHMvdGNnL2hleGFnb24vcHJlZ19hbGlhcy5jIHwgNDYg
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIyIGlu
c2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3RjZy9oZXhh
Z29uL3ByZWdfYWxpYXMuYyBiL3Rlc3RzL3RjZy9oZXhhZ29uL3ByZWdfYWxpYXMuYwppbmRleCAw
Y2FjNDY5Yjc4Li45ZjdiMTI1OTk4IDEwMDY0NAotLS0gYS90ZXN0cy90Y2cvaGV4YWdvbi9wcmVn
X2FsaWFzLmMKKysrIGIvdGVzdHMvdGNnL2hleGFnb24vcHJlZ19hbGlhcy5jCkBAIC0xLDUgKzEs
NSBAQAogLyoKLSAqICBDb3B5cmlnaHQoYykgMjAxOS0yMDIxIFF1YWxjb21tIElubm92YXRpb24g
Q2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisgKiAgQ29weXJpZ2h0KGMpIDIwMTkt
MjAyMiBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVk
LgogICoKICAqICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3Ry
aWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICogIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CkBAIC01NywxNyArNTcsMTUg
QEAgdHlwZWRlZiB1bmlvbiB7CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBjcmVnX2FsaWFzKGludCBj
dmFsLCBQUmVncyAqcHJlZ3MpCiB7Ci0gIHVuc2lnbmVkIGNoYXIgdmFsOwotICBhc20gdm9sYXRp
bGUoImM0ID0gJTAiIDogOiAiciIoY3ZhbCkpOwotCi0gIGFzbSB2b2xhdGlsZSgiJTAgPSBwMCIg
OiAiPXIiKHZhbCkpOwotICBwcmVncy0+cHJlZ3MucDAgPSB2YWw7Ci0gIGFzbSB2b2xhdGlsZSgi
JTAgPSBwMSIgOiAiPXIiKHZhbCkpOwotICBwcmVncy0+cHJlZ3MucDEgPSB2YWw7Ci0gIGFzbSB2
b2xhdGlsZSgiJTAgPSBwMiIgOiAiPXIiKHZhbCkpOwotICBwcmVncy0+cHJlZ3MucDIgPSB2YWw7
Ci0gIGFzbSB2b2xhdGlsZSgiJTAgPSBwMyIgOiAiPXIiKHZhbCkpOwotICBwcmVncy0+cHJlZ3Mu
cDMgPSB2YWw7CisgIGFzbSgiYzQgPSAlNFxuXHQiCisgICAgICAiJTAgPSBwMFxuXHQiCisgICAg
ICAiJTEgPSBwMVxuXHQiCisgICAgICAiJTIgPSBwMlxuXHQiCisgICAgICAiJTMgPSBwM1xuXHQi
CisgICAgICA6ICI9ciIocHJlZ3MtPnByZWdzLnAwKSwgIj1yIihwcmVncy0+cHJlZ3MucDEpLAor
ICAgICAgICAiPXIiKHByZWdzLT5wcmVncy5wMiksICI9ciIocHJlZ3MtPnByZWdzLnAzKQorICAg
ICAgOiAiciIoY3ZhbCkKKyAgICAgIDogImM0IiwgInAwIiwgInAxIiwgInAyIiwgInAzIik7CiB9
CiAKIGludCBlcnI7CkBAIC04MywxOSArODEsMTkgQEAgc3RhdGljIHZvaWQgY2hlY2soaW50IHZh
bCwgaW50IGV4cGVjdCkKIHN0YXRpYyBpbmxpbmUgdm9pZCBjcmVnX2FsaWFzX3BhaXIodW5zaWdu
ZWQgaW50IGN2YWwsIFBSZWdzICpwcmVncykKIHsKICAgdW5zaWduZWQgbG9uZyBsb25nIGN2YWxf
cGFpciA9ICgweGRlYWRiZWVmVUxMIDw8IDMyKSB8IGN2YWw7Ci0gIHVuc2lnbmVkIGNoYXIgdmFs
OwogICBpbnQgYzU7Ci0gIGFzbSB2b2xhdGlsZSgiYzU6NCA9ICUwIiA6IDogInIiKGN2YWxfcGFp
cikpOwotCi0gIGFzbSB2b2xhdGlsZSgiJTAgPSBwMCIgOiAiPXIiKHZhbCkpOwotICBwcmVncy0+
cHJlZ3MucDAgPSB2YWw7Ci0gIGFzbSB2b2xhdGlsZSgiJTAgPSBwMSIgOiAiPXIiKHZhbCkpOwot
ICBwcmVncy0+cHJlZ3MucDEgPSB2YWw7Ci0gIGFzbSB2b2xhdGlsZSgiJTAgPSBwMiIgOiAiPXIi
KHZhbCkpOwotICBwcmVncy0+cHJlZ3MucDIgPSB2YWw7Ci0gIGFzbSB2b2xhdGlsZSgiJTAgPSBw
MyIgOiAiPXIiKHZhbCkpOwotICBwcmVncy0+cHJlZ3MucDMgPSB2YWw7Ci0gIGFzbSB2b2xhdGls
ZSgiJTAgPSBjNSIgOiAiPXIiKGM1KSk7CisKKyAgYXNtICgiYzU6NCA9ICU1XG5cdCIKKyAgICAg
ICAiJTAgPSBwMFxuXHQiCisgICAgICAgIiUxID0gcDFcblx0IgorICAgICAgICIlMiA9IHAyXG5c
dCIKKyAgICAgICAiJTMgPSBwM1xuXHQiCisgICAgICAgIiU0ID0gYzVcblx0IgorICAgICAgIDog
Ij1yIihwcmVncy0+cHJlZ3MucDApLCAiPXIiKHByZWdzLT5wcmVncy5wMSksCisgICAgICAgICAi
PXIiKHByZWdzLT5wcmVncy5wMiksICI9ciIocHJlZ3MtPnByZWdzLnAzKSwgIj1yIihjNSkKKyAg
ICAgICA6ICJyIihjdmFsX3BhaXIpCisgICAgICAgOiAiYzQiLCAiYzUiLCAicDAiLCAicDEiLCAi
cDIiLCAicDMiKTsKKwogICBjaGVjayhjNSwgMHhkZWFkYmVlZik7CiB9CiAKLS0gCjIuMTcuMQoK

