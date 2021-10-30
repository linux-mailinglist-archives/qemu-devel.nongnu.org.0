Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623D54406BE
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 03:34:54 +0200 (CEST)
Received: from localhost ([::1]:34282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgdGn-0003EP-HI
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 21:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mgd3W-0002xQ-Qu
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 21:21:10 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:10785)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mgd3P-0001fC-N1
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 21:21:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635556863; x=1667092863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p4YEtO7pmrUAC2vv/+UP7wB9QjIbRVzfl83/noliWG4=;
 b=A+jI5878aNacX68fREWNr4bnCkmMpbcQ6/4wDDaQZ+IQCTmH/lP/OaNw
 NEYOgJTxFm3Cehh2tTl986xsLSWJpM3fvCbhXlTSvHWbMeXqKc89Fhv+g
 UndlU9sHrrd0G64/lVHD7KYkJd0Ib9ub+D51v6sk+YQaDOlTwpcrp9z46 g=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 29 Oct 2021 18:20:58 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 29 Oct 2021 18:20:57 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 06B4C285A; Fri, 29 Oct 2021 20:20:57 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/30] Hexagon HVX (target/hexagon) instruction utility
 functions
Date: Fri, 29 Oct 2021 20:20:29 -0500
Message-Id: <1635556849-18120-11-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635556849-18120-1-git-send-email-tsimpson@quicinc.com>
References: <1635556849-18120-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

RnVuY3Rpb25zIHRvIHN1cHBvcnQgc2NhdHRlci9nYXRoZXIKQWRkIG5ldyBmaWxlIHRvIHRhcmdl
dC9oZXhhZ29uL21lc29uLmJ1aWxkCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNp
bXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vbW12ZWMvc3lzdGVtX2V4dF9t
bXZlYy5oIHwgMjUgKysrKysrKysrKysrKysrKysrCiB0YXJnZXQvaGV4YWdvbi9tbXZlYy9zeXN0
ZW1fZXh0X21tdmVjLmMgfCA0NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHRh
cmdldC9oZXhhZ29uL21lc29uLmJ1aWxkICAgICAgICAgICAgICB8ICAxICsKIDMgZmlsZXMgY2hh
bmdlZCwgNzMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRhcmdldC9oZXhhZ29u
L21tdmVjL3N5c3RlbV9leHRfbW12ZWMuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHRhcmdldC9oZXhh
Z29uL21tdmVjL3N5c3RlbV9leHRfbW12ZWMuYwoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29u
L21tdmVjL3N5c3RlbV9leHRfbW12ZWMuaCBiL3RhcmdldC9oZXhhZ29uL21tdmVjL3N5c3RlbV9l
eHRfbW12ZWMuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5iY2VmYmZmCi0t
LSAvZGV2L251bGwKKysrIGIvdGFyZ2V0L2hleGFnb24vbW12ZWMvc3lzdGVtX2V4dF9tbXZlYy5o
CkBAIC0wLDAgKzEsMjUgQEAKKy8qCisgKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMSBRdWFsY29t
bSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgorICoKKyAqICBU
aGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5k
L29yIG1vZGlmeQorICogIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CisgKiAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IKKyAqICAoYXQgeW91ciBv
cHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorICoKKyAqICBUaGlzIHByb2dyYW0gaXMgZGlzdHJp
YnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyAqICBidXQgV0lUSE9V
VCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorICog
IE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNl
ZSB0aGUKKyAqICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgor
ICoKKyAqICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZQorICogIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHNl
ZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisgKi8KKworI2lmbmRlZiBIRVhBR09O
X1NZU1RFTV9FWFRfTU1WRUNfSAorI2RlZmluZSBIRVhBR09OX1NZU1RFTV9FWFRfTU1WRUNfSAor
Cit2b2lkIG1lbV9nYXRoZXJfc3RvcmUoQ1BVSGV4YWdvblN0YXRlICplbnYsIHRhcmdldF91bG9u
ZyB2YWRkciwgaW50IHNsb3QpOwordm9pZCBtZW1fdmVjdG9yX3NjYXR0ZXJfaW5pdChDUFVIZXhh
Z29uU3RhdGUgKmVudik7Cit2b2lkIG1lbV92ZWN0b3JfZ2F0aGVyX2luaXQoQ1BVSGV4YWdvblN0
YXRlICplbnYpOworCisjZW5kaWYKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL21tdmVjL3N5
c3RlbV9leHRfbW12ZWMuYyBiL3RhcmdldC9oZXhhZ29uL21tdmVjL3N5c3RlbV9leHRfbW12ZWMu
YwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi44MzUxZjJjCi0tLSAvZGV2L251
bGwKKysrIGIvdGFyZ2V0L2hleGFnb24vbW12ZWMvc3lzdGVtX2V4dF9tbXZlYy5jCkBAIC0wLDAg
KzEsNDcgQEAKKy8qCisgKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMSBRdWFsY29tbSBJbm5vdmF0
aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgorICoKKyAqICBUaGlzIHByb2dy
YW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlm
eQorICogIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UgYXMgcHVibGlzaGVkIGJ5CisgKiAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0
aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IKKyAqICAoYXQgeW91ciBvcHRpb24pIGFu
eSBsYXRlciB2ZXJzaW9uLgorICoKKyAqICBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4g
dGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyAqICBidXQgV0lUSE9VVCBBTlkgV0FS
UkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorICogIE1FUkNIQU5U
QUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKKyAq
ICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorICoKKyAqICBZ
b3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZQorICogIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHNlZSA8aHR0cDov
L3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisgKi8KKworI2luY2x1ZGUgInFlbXUvb3NkZXAuaCIK
KyNpbmNsdWRlICJjcHUuaCIKKyNpbmNsdWRlICJtbXZlYy9zeXN0ZW1fZXh0X21tdmVjLmgiCisK
K3ZvaWQgbWVtX2dhdGhlcl9zdG9yZShDUFVIZXhhZ29uU3RhdGUgKmVudiwgdGFyZ2V0X3Vsb25n
IHZhZGRyLCBpbnQgc2xvdCkKK3sKKyAgICBzaXplX3Qgc2l6ZSA9IHNpemVvZihNTVZlY3Rvcik7
CisKKyAgICBlbnYtPnZzdG9yZV9wZW5kaW5nW3Nsb3RdID0gMTsKKyAgICBlbnYtPnZzdG9yZVtz
bG90XS52YSAgID0gdmFkZHI7CisgICAgZW52LT52c3RvcmVbc2xvdF0uc2l6ZSA9IHNpemU7Cisg
ICAgbWVtY3B5KCZlbnYtPnZzdG9yZVtzbG90XS5kYXRhLnViWzBdLCAmZW52LT50bXBfVlJlZ3Nb
MF0sIHNpemUpOworCisgICAgLyogT24gYSBnYXRoZXIgc3RvcmUsIG92ZXJ3cml0ZSB0aGUgc3Rv
cmUgbWFzayB0byBlbXVsYXRlIGRyb3BwZWQgZ2F0aGVycyAqLworICAgIGJpdG1hcF9jb3B5KGVu
di0+dnN0b3JlW3Nsb3RdLm1hc2ssIGVudi0+dnRjbV9sb2cubWFzaywgc2l6ZSk7Cit9CisKK3Zv
aWQgbWVtX3ZlY3Rvcl9zY2F0dGVyX2luaXQoQ1BVSGV4YWdvblN0YXRlICplbnYpCit7CisgICAg
Yml0bWFwX3plcm8oZW52LT52dGNtX2xvZy5tYXNrLCBNQVhfVkVDX1NJWkVfQllURVMpOworCisg
ICAgZW52LT52dGNtX3BlbmRpbmcgPSB0cnVlOworICAgIGVudi0+dnRjbV9sb2cub3AgPSBmYWxz
ZTsKKyAgICBlbnYtPnZ0Y21fbG9nLm9wX3NpemUgPSAwOworfQorCit2b2lkIG1lbV92ZWN0b3Jf
Z2F0aGVyX2luaXQoQ1BVSGV4YWdvblN0YXRlICplbnYpCit7CisgICAgYml0bWFwX3plcm8oZW52
LT52dGNtX2xvZy5tYXNrLCBNQVhfVkVDX1NJWkVfQllURVMpOworfQpkaWZmIC0tZ2l0IGEvdGFy
Z2V0L2hleGFnb24vbWVzb24uYnVpbGQgYi90YXJnZXQvaGV4YWdvbi9tZXNvbi5idWlsZAppbmRl
eCBjNmQ4NThmLi4wYmZhYTQxIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9tZXNvbi5idWls
ZAorKysgYi90YXJnZXQvaGV4YWdvbi9tZXNvbi5idWlsZApAQCAtMTc0LDYgKzE3NCw3IEBAIGhl
eGFnb25fc3MuYWRkKGZpbGVzKAogICAgICdwcmludGluc24uYycsCiAgICAgJ2FyY2guYycsCiAg
ICAgJ2ZtYV9lbXUuYycsCisgICAgJ21tdmVjL3N5c3RlbV9leHRfbW12ZWMuYycsCiApKQogCiB0
YXJnZXRfYXJjaCArPSB7J2hleGFnb24nOiBoZXhhZ29uX3NzfQotLSAKMi43LjQKCg==

