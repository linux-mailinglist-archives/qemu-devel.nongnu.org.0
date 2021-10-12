Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3EE42A1BB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 12:16:06 +0200 (CEST)
Received: from localhost ([::1]:44276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maEpJ-0003Oz-2x
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 06:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1maEky-0000Zb-HH
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:11:39 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:64080)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1maEkv-0006xP-03
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1634033492; x=1665569492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jl+j4HlqgM8ZVoCTG1T957gz/73q/eVw6Wus25Y8toE=;
 b=vXkU1ipkxss9mznj6h1aHGmQe/KkprsZgTrS7P/kwbvuC/wJuAPyaEAH
 5zltU3nUA7Jp4Wo7Hz26kEopddKAcjxQwUN2sziV7FzXLMYXhDcdFDIeu
 BwdqfGccbjpw2drz1ChlBeC/TzYLcZPShZjU3LPnxvyGjgFmqfUADCpx8 U=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Oct 2021 03:11:24 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 12 Oct 2021 03:11:23 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 497D8141C; Tue, 12 Oct 2021 05:11:22 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/30] Hexagon HVX (target/hexagon) semantics generator
Date: Tue, 12 Oct 2021 05:10:45 -0500
Message-Id: <1634033468-23566-8-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
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

QWRkIEhWWCBzdXBwb3J0IHRvIHRoZSBzZW1hbnRpY3MgZ2VuZXJhdG9yCgpBY2tlZC1ieTogUmlj
aGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYt
Ynk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4
YWdvbi9nZW5fc2VtYW50aWNzLmMgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIHRhcmdldC9oZXhhZ29uL2hleF9jb21tb24ucHkgICB8IDEzICsrKysrKysrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhh
Z29uL2dlbl9zZW1hbnRpY3MuYyBiL3RhcmdldC9oZXhhZ29uL2dlbl9zZW1hbnRpY3MuYwppbmRl
eCBjNWZjY2VjLi40YTJiZGQ3IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5fc2VtYW50
aWNzLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3NlbWFudGljcy5jCkBAIC00NCw2ICs0NCwx
MSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogICogICAgICAgICBRNklOU04o
QTJfYWRkLCJSZDMyPWFkZChSczMyLFJ0MzIpIixBVFRSSUJTKCksCiAgKiAgICAgICAgICJBZGQg
MzItYml0IHJlZ2lzdGVycyIsCiAgKiAgICAgICAgIHsgUmRWPVJzVitSdFY7fSkKKyAqICAgICBI
VlggaW5zdHJ1Y3Rpb25zIGhhdmUgdGhlIGZvbGxvd2luZyBmb3JtCisgKiAgICAgICAgIEVYVElO
U04oVjZfdmluc2VydHdyLCAiVngzMi53PXZpbnNlcnQoUnQzMikiLAorICogICAgICAgICBBVFRS
SUJTKEFfRVhURU5TSU9OLEFfQ1ZJLEFfQ1ZJX1ZYKSwKKyAqICAgICAgICAgIkluc2VydCBXb3Jk
IFNjYWxhciBpbnRvIFZlY3RvciIsCisgKiAgICAgICAgIFZ4Vi51d1swXSA9IFJ0VjspCiAgKi8K
ICNkZWZpbmUgUTZJTlNOKFRBRywgQkVILCBBVFRSSUJTLCBERVNDUiwgU0VNKSBcCiAgICAgZG8g
eyBcCkBAIC01OSw4ICs2NCwyMyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQog
ICAgICAgICAgICAgICAgICAgICAgICAgICIpXG4iLCBcCiAgICAgICAgICAgICAgICAgI1RBRywg
U1RSSU5HSVpFKEFUVFJJQlMpKTsgXAogICAgIH0gd2hpbGUgKDApOworI2RlZmluZSBFWFRJTlNO
KFRBRywgQkVILCBBVFRSSUJTLCBERVNDUiwgU0VNKSBcCisgICAgZG8geyBcCisgICAgICAgIGZw
cmludGYob3V0ZmlsZSwgIlNFTUFOVElDUyggXFxcbiIgXAorICAgICAgICAgICAgICAgICAgICAg
ICAgICIgICAgXCIlc1wiLCBcXFxuIiBcCisgICAgICAgICAgICAgICAgICAgICAgICAgIiAgICAl
cywgXFxcbiIgXAorICAgICAgICAgICAgICAgICAgICAgICAgICIgICAgXCJcIlwiJXNcIlwiXCIg
XFxcbiIgXAorICAgICAgICAgICAgICAgICAgICAgICAgICIpXG4iLCBcCisgICAgICAgICAgICAg
ICAgI1RBRywgU1RSSU5HSVpFKEJFSCksIFNUUklOR0laRShTRU0pKTsgXAorICAgICAgICBmcHJp
bnRmKG91dGZpbGUsICJBVFRSSUJVVEVTKCBcXFxuIiBcCisgICAgICAgICAgICAgICAgICAgICAg
ICAgIiAgICBcIiVzXCIsIFxcXG4iIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAiICAgIFwi
JXNcIiBcXFxuIiBcCisgICAgICAgICAgICAgICAgICAgICAgICAgIilcbiIsIFwKKyAgICAgICAg
ICAgICAgICAjVEFHLCBTVFJJTkdJWkUoQVRUUklCUykpOyBcCisgICAgfSB3aGlsZSAoMCk7CiAj
aW5jbHVkZSAiaW1wb3J0ZWQvYWxsaWRlZnMuZGVmIgogI3VuZGVmIFE2SU5TTgorI3VuZGVmIEVY
VElOU04KIAogLyoKICAqIFByb2Nlc3MgdGhlIG1hY3JvIGRlZmluaXRpb25zCkBAIC04Myw2ICsx
MDMsMTkgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICNpbmNsdWRlICJpbXBv
cnRlZC9tYWNyb3MuZGVmIgogI3VuZGVmIERFRl9NQUNSTwogCisvKgorICogUHJvY2VzcyB0aGUg
bWFjcm9zIGZvciBIVlgKKyAqLworI2RlZmluZSBERUZfTUFDUk8oTU5BTUUsIEJFSCwgQVRUUlMp
IFwKKyAgICBmcHJpbnRmKG91dGZpbGUsICJNQUNST0FUVFJJQiggXFxcbiIgXAorICAgICAgICAg
ICAgICAgICAgICAgIiAgICBcIiVzXCIsIFxcXG4iIFwKKyAgICAgICAgICAgICAgICAgICAgICIg
ICAgXCJcIlwiJXNcIlwiXCIsIFxcXG4iIFwKKyAgICAgICAgICAgICAgICAgICAgICIgICAgXCIl
c1wiIFxcXG4iIFwKKyAgICAgICAgICAgICAgICAgICAgICIpXG4iLCBcCisgICAgICAgICAgICAj
TU5BTUUsIFNUUklOR0laRShCRUgpLCBTVFJJTkdJWkUoQVRUUlMpKTsKKyNpbmNsdWRlICJpbXBv
cnRlZC9hbGxleHRfbWFjcm9zLmRlZiIKKyN1bmRlZiBERUZfTUFDUk8KKwogICAgIGZjbG9zZShv
dXRmaWxlKTsKICAgICByZXR1cm4gMDsKIH0KZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2hl
eF9jb21tb24ucHkgYi90YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5CmluZGV4IGIzYjUzNDAu
LjQ3ZmI2MjggMTAwNzU1Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2hleF9jb21tb24ucHkKKysrIGIv
dGFyZ2V0L2hleGFnb24vaGV4X2NvbW1vbi5weQpAQCAtMTQzLDYgKzE0Myw5IEBAIGRlZiBjb21w
dXRlX3RhZ19pbW1lZGlhdGVzKHRhZyk6CiAjIyAgICAgICAgICBQICAgICAgICAgICAgICAgIHBy
ZWRpY2F0ZSByZWdpc3RlcgogIyMgICAgICAgICAgUiAgICAgICAgICAgICAgICBHUFIgcmVnaXN0
ZXIKICMjICAgICAgICAgIE0gICAgICAgICAgICAgICAgbW9kaWZpZXIgcmVnaXN0ZXIKKyMjICAg
ICAgICAgIFEgICAgICAgICAgICAgICAgSFZYIHByZWRpY2F0ZSB2ZWN0b3IKKyMjICAgICAgICAg
IFYgICAgICAgICAgICAgICAgSFZYIHZlY3RvciByZWdpc3RlcgorIyMgICAgICAgICAgTyAgICAg
ICAgICAgICAgICBIVlggbmV3IHZlY3RvciByZWdpc3RlcgogIyMgICAgICByZWdpZCBjYW4gYmUg
b25lIG9mIHRoZSBmb2xsb3dpbmcKICMjICAgICAgICAgIGQsIGUgICAgICAgICAgICAgZGVzdGlu
YXRpb24gcmVnaXN0ZXIKICMjICAgICAgICAgIGRkICAgICAgICAgICAgICAgZGVzdGluYXRpb24g
cmVnaXN0ZXIgcGFpcgpAQCAtMTc4LDYgKzE4MSw5IEBAIGRlZiBpc19yZWFkd3JpdGUocmVnaWQp
OgogZGVmIGlzX3NjYWxhcl9yZWcocmVndHlwZSk6CiAgICAgcmV0dXJuIHJlZ3R5cGUgaW4gIlJQ
QyIKIAorZGVmIGlzX2h2eF9yZWcocmVndHlwZSk6CisgICAgcmV0dXJuIHJlZ3R5cGUgaW4gIlZR
IgorCiBkZWYgaXNfb2xkX3ZhbChyZWd0eXBlLCByZWdpZCwgdGFnKToKICAgICByZXR1cm4gcmVn
dHlwZStyZWdpZCsnVicgaW4gc2VtZGljdFt0YWddCiAKQEAgLTIwMSw2ICsyMDcsMTMgQEAgZGVm
IG5lZWRfZWEodGFnKToKIGRlZiBza2lwX3FlbXVfaGVscGVyKHRhZyk6CiAgICAgcmV0dXJuIHRh
ZyBpbiBvdmVycmlkZXMua2V5cygpCiAKK2RlZiBpc190bXBfcmVzdWx0KHRhZyk6CisgICAgcmV0
dXJuICgnQV9DVklfVE1QJyBpbiBhdHRyaWJkaWN0W3RhZ10gb3IKKyAgICAgICAgICAgICdBX0NW
SV9UTVBfRFNUJyBpbiBhdHRyaWJkaWN0W3RhZ10pCisKK2RlZiBpc19uZXdfcmVzdWx0KHRhZyk6
CisgICAgcmV0dXJuICgnQV9DVklfTkVXJyBpbiBhdHRyaWJkaWN0W3RhZ10pCisKIGRlZiBpbW1f
bmFtZShpbW1sZXR0KToKICAgICByZXR1cm4gIiVzaVYiICUgaW1tbGV0dAogCi0tIAoyLjcuNAoK

