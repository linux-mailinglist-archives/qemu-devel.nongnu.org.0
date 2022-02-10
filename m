Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BBB4B0355
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 03:28:27 +0100 (CET)
Received: from localhost ([::1]:48818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHzC6-0006w2-DY
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 21:28:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nHz13-0007Cz-4e
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 21:17:02 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:12210)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nHz0z-0008Tm-9C
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 21:17:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644459417; x=1675995417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6NqVSaizYRH8SigA+8qUpstm/0PN5NW3XKDCp3CorCU=;
 b=qu/isdsg+niDM614L+j2nS2FH6/z9hlITvyOfGx1V1y62RSsvAHGiCWA
 je2dpjPyu5z9268xc+3shgDD2kVlpiwZXacLwGK8bLX1mtLpZuZN0H9BV
 Tl4159gVZbLQzd+TGLdw+KmID7RX9F7cC2cJ8VU2jRvwNmnOWpUyZ+xjb E=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 09 Feb 2022 18:16:02 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg08-lv.qualcomm.com with ESMTP; 09 Feb 2022 18:16:02 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 026255005A0; Wed,  9 Feb 2022 18:16:02 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/12] Hexagon (tests/tcg/hexagon) fix inline asm in
 preg_alias.c
Date: Wed,  9 Feb 2022 18:15:53 -0800
Message-Id: <20220210021556.9217-10-tsimpson@quicinc.com>
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

UmVwbGFjZSBjb25zZWN1dGl2ZSBpbmxpbmUgYXNtIGJsb2NrcyB3aXRoIGEgc2luZ2xlIG9uZSB3
aXRoIHByb3BlcgpvdXRwdXRzL2lucHV0cy9jbG9iYmVycyByYXRoZXIgdGhhbiBtYWtpbmcgYXNz
dW1wdGlvbnMgYWJvdXQgcmVnaXN0ZXIKdmFsdWVzIGJlaW5nIGNhcnJpZWQgYmV0d2VlbiBzZXBh
cmF0ZSBibG9ja3MuCgpSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVu
ZGVyc29uQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNv
bkBxdWljaW5jLmNvbT4KLS0tCiB0ZXN0cy90Y2cvaGV4YWdvbi9wcmVnX2FsaWFzLmMgfCA0NiAr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5z
ZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL2hleGFn
b24vcHJlZ19hbGlhcy5jIGIvdGVzdHMvdGNnL2hleGFnb24vcHJlZ19hbGlhcy5jCmluZGV4IDBj
YWM0NjliNzguLjlmN2IxMjU5OTggMTAwNjQ0Ci0tLSBhL3Rlc3RzL3RjZy9oZXhhZ29uL3ByZWdf
YWxpYXMuYworKysgYi90ZXN0cy90Y2cvaGV4YWdvbi9wcmVnX2FsaWFzLmMKQEAgLTEsNSArMSw1
IEBACiAvKgotICogIENvcHlyaWdodChjKSAyMDE5LTIwMjEgUXVhbGNvbW0gSW5ub3ZhdGlvbiBD
ZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAqICBDb3B5cmlnaHQoYykgMjAxOS0y
MDIyIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQu
CiAgKgogICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJp
YnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKQEAgLTU3LDE3ICs1NywxNSBA
QCB0eXBlZGVmIHVuaW9uIHsKIAogc3RhdGljIGlubGluZSB2b2lkIGNyZWdfYWxpYXMoaW50IGN2
YWwsIFBSZWdzICpwcmVncykKIHsKLSAgdW5zaWduZWQgY2hhciB2YWw7Ci0gIGFzbSB2b2xhdGls
ZSgiYzQgPSAlMCIgOiA6ICJyIihjdmFsKSk7Ci0KLSAgYXNtIHZvbGF0aWxlKCIlMCA9IHAwIiA6
ICI9ciIodmFsKSk7Ci0gIHByZWdzLT5wcmVncy5wMCA9IHZhbDsKLSAgYXNtIHZvbGF0aWxlKCIl
MCA9IHAxIiA6ICI9ciIodmFsKSk7Ci0gIHByZWdzLT5wcmVncy5wMSA9IHZhbDsKLSAgYXNtIHZv
bGF0aWxlKCIlMCA9IHAyIiA6ICI9ciIodmFsKSk7Ci0gIHByZWdzLT5wcmVncy5wMiA9IHZhbDsK
LSAgYXNtIHZvbGF0aWxlKCIlMCA9IHAzIiA6ICI9ciIodmFsKSk7Ci0gIHByZWdzLT5wcmVncy5w
MyA9IHZhbDsKKyAgYXNtKCJjNCA9ICU0XG5cdCIKKyAgICAgICIlMCA9IHAwXG5cdCIKKyAgICAg
ICIlMSA9IHAxXG5cdCIKKyAgICAgICIlMiA9IHAyXG5cdCIKKyAgICAgICIlMyA9IHAzXG5cdCIK
KyAgICAgIDogIj1yIihwcmVncy0+cHJlZ3MucDApLCAiPXIiKHByZWdzLT5wcmVncy5wMSksCisg
ICAgICAgICI9ciIocHJlZ3MtPnByZWdzLnAyKSwgIj1yIihwcmVncy0+cHJlZ3MucDMpCisgICAg
ICA6ICJyIihjdmFsKQorICAgICAgOiAiYzQiLCAicDAiLCAicDEiLCAicDIiLCAicDMiKTsKIH0K
IAogaW50IGVycjsKQEAgLTgzLDE5ICs4MSwxOSBAQCBzdGF0aWMgdm9pZCBjaGVjayhpbnQgdmFs
LCBpbnQgZXhwZWN0KQogc3RhdGljIGlubGluZSB2b2lkIGNyZWdfYWxpYXNfcGFpcih1bnNpZ25l
ZCBpbnQgY3ZhbCwgUFJlZ3MgKnByZWdzKQogewogICB1bnNpZ25lZCBsb25nIGxvbmcgY3ZhbF9w
YWlyID0gKDB4ZGVhZGJlZWZVTEwgPDwgMzIpIHwgY3ZhbDsKLSAgdW5zaWduZWQgY2hhciB2YWw7
CiAgIGludCBjNTsKLSAgYXNtIHZvbGF0aWxlKCJjNTo0ID0gJTAiIDogOiAiciIoY3ZhbF9wYWly
KSk7Ci0KLSAgYXNtIHZvbGF0aWxlKCIlMCA9IHAwIiA6ICI9ciIodmFsKSk7Ci0gIHByZWdzLT5w
cmVncy5wMCA9IHZhbDsKLSAgYXNtIHZvbGF0aWxlKCIlMCA9IHAxIiA6ICI9ciIodmFsKSk7Ci0g
IHByZWdzLT5wcmVncy5wMSA9IHZhbDsKLSAgYXNtIHZvbGF0aWxlKCIlMCA9IHAyIiA6ICI9ciIo
dmFsKSk7Ci0gIHByZWdzLT5wcmVncy5wMiA9IHZhbDsKLSAgYXNtIHZvbGF0aWxlKCIlMCA9IHAz
IiA6ICI9ciIodmFsKSk7Ci0gIHByZWdzLT5wcmVncy5wMyA9IHZhbDsKLSAgYXNtIHZvbGF0aWxl
KCIlMCA9IGM1IiA6ICI9ciIoYzUpKTsKKworICBhc20gKCJjNTo0ID0gJTVcblx0IgorICAgICAg
ICIlMCA9IHAwXG5cdCIKKyAgICAgICAiJTEgPSBwMVxuXHQiCisgICAgICAgIiUyID0gcDJcblx0
IgorICAgICAgICIlMyA9IHAzXG5cdCIKKyAgICAgICAiJTQgPSBjNVxuXHQiCisgICAgICAgOiAi
PXIiKHByZWdzLT5wcmVncy5wMCksICI9ciIocHJlZ3MtPnByZWdzLnAxKSwKKyAgICAgICAgICI9
ciIocHJlZ3MtPnByZWdzLnAyKSwgIj1yIihwcmVncy0+cHJlZ3MucDMpLCAiPXIiKGM1KQorICAg
ICAgIDogInIiKGN2YWxfcGFpcikKKyAgICAgICA6ICJjNCIsICJjNSIsICJwMCIsICJwMSIsICJw
MiIsICJwMyIpOworCiAgIGNoZWNrKGM1LCAweGRlYWRiZWVmKTsKIH0KIAotLSAKMi4xNy4xCgo=

