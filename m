Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE46248B05
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 18:05:29 +0200 (CEST)
Received: from localhost ([::1]:57484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8476-0006SY-Hr
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 12:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1k83tm-0007nC-QZ
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 11:51:44 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:12947)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1k83tj-0005sa-Cn
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 11:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1597765899; x=1629301899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w6tiKpk4csTikjQRQqrcLl3i8YzkM8G9GGhrIgGFbQU=;
 b=EbXLUWFk3TwfQMuJnk9sgiG2jO13k3qH1sYXZ9pQ99Rv/XvmpkeILIdR
 5zb1A6itdRgQT6KfkbEZ5cnolacnkSM3TEV4SWrAUUfqsv5CPi13bQwDm
 zWBBOm+x41KzHazXtkXpaLij8nnm2kwalIhI1tAk06gkZSaOEFu5ZtyFh 8=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Aug 2020 08:50:58 -0700
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 18 Aug 2020 08:50:57 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 9B1AB8F7; Tue, 18 Aug 2020 10:50:57 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 20/34] Hexagon (target/hexagon) generator phase 1 - C
 preprocessor for semantics
Date: Tue, 18 Aug 2020 10:50:33 -0500
Message-Id: <1597765847-16637-21-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597765847-16637-1-git-send-email-tsimpson@quicinc.com>
References: <1597765847-16637-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 11:50:57
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: ale@rev.ng, riku.voipio@iki.fi, richard.henderson@linaro.org,
 laurent@vivier.eu, tsimpson@quicinc.com, philmd@redhat.com,
 aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UnVuIHRoZSBDIHByZXByb2Nlc3NvciBhY3Jvc3MgdGhlIGluc3RydWN0aW9uIGRlZmluaXRpb24g
ZmlsZXMgYW5kIG1hY3JvCmRlZmluaXRvaW4gZmlsZSB0byBleHBhbmQgbWFjcm9zIGFuZCBwcmVw
YXJlIHRoZSBzZW1hbnRpY3NfZ2VuZXJhdGVkLnB5aW5jCmZpbGUuICBUaGUgcmVzdWx0aW5nIGZp
bGUgY29udGFpbnMgb25lIGVudHJ5IHdpdGggdGhlIHNlbWFudGljcyBmb3IgZWFjaAppbnN0cnVj
dGlvbiBhbmQgb25lIGxpbmUgd2l0aCB0aGUgaW5zdHJ1Y3Rpb24gYXR0cmlidXRlcyBhc3NvY2lh
dGVkIHdpdGgKZWFjaCBtYWNyby4KClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2lt
cHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdvbi9nZW5fc2VtYW50aWNzLmMgfCA4
OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA4OCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGFyZ2V0L2hleGFnb24v
Z2VuX3NlbWFudGljcy5jCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VuX3NlbWFudGlj
cy5jIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3NlbWFudGljcy5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAuLjFiMTk4Y2IKLS0tIC9kZXYvbnVsbAorKysgYi90YXJnZXQvaGV4YWdv
bi9nZW5fc2VtYW50aWNzLmMKQEAgLTAsMCArMSw4OCBAQAorLyoKKyAqICBDb3B5cmlnaHQoYykg
MjAxOS0yMDIwIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVz
ZXJ2ZWQuCisgKgorICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJl
ZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRo
ZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyAqICB0aGUgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBv
cgorICogIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisgKgorICogIFRoaXMg
cHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVs
LAorICogIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVk
IHdhcnJhbnR5IG9mCisgKiAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElD
VUxBUiBQVVJQT1NFLiAgU2VlIHRoZQorICogIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZv
ciBtb3JlIGRldGFpbHMuCisgKgorICogIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkg
b2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisgKiAgYWxvbmcgd2l0aCB0aGlzIHBy
b2dyYW07IGlmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyAqLwor
CisvKgorICogVGhpcyBwcm9ncmFtIGdlbmVyYXRlcyB0aGUgc2VtYW50aWNzIGZpbGUgdGhhdCBp
cyBwcm9jZXNzZWQgYnkKKyAqIHRoZSBkb19xZW11LnB5IHNjcmlwdC4gIFdlIHVzZSB0aGUgQyBw
cmVwb3JjZXNzb3IgdG8gbWFuaXB1bGF0ZSB0aGUKKyAqIGZpbGVzIGltcG9ydGVkIGZyb20gdGhl
IEhleGFnb24gYXJjaGl0ZWN0dXJlIGxpYnJhcnkuCisgKi8KKworI2luY2x1ZGUgPHN0ZGlvLmg+
CisjZGVmaW5lIFNUUklOR0laRShYKSAjWAorCitpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJn
dltdKQoreworICAgIEZJTEUgKm91dGZpbGU7CisKKyAgICBpZiAoYXJnYyAhPSAyKSB7CisgICAg
ICAgIGZwcmludGYoc3RkZXJyLCAiVXNhZ2U6IGdlbl9zZW1hbnRpY3Mgb3VwdHB1dGZpbGVcbiIp
OworICAgICAgICByZXR1cm4gLTE7CisgICAgfQorICAgIG91dGZpbGUgPSBmb3Blbihhcmd2WzFd
LCAidyIpOworICAgIGlmIChvdXRmaWxlID09IE5VTEwpIHsKKyAgICAgICAgZnByaW50ZihzdGRl
cnIsICJDYW5ub3Qgb3BlbiAlcyBmb3Igd3JpdGluZ1xuIiwgYXJndlsxXSk7CisgICAgICAgIHJl
dHVybiAtMTsKKyAgICB9CisKKy8qCisgKiBQcm9jZXNzIHRoZSBpbnN0cnVjdGlvbiBkZWZpbml0
aW9ucworICogICAgIFNjYWxhciBjb3JlIGluc3RydWN0aW9ucyBoYXZlIHRoZSBmb2xsb3dpbmcg
Zm9ybQorICogICAgICAgICBRNklOU04oQTJfYWRkLCJSZDMyPWFkZChSczMyLFJ0MzIpIixBVFRS
SUJTKCksCisgKiAgICAgICAgICJBZGQgMzItYml0IHJlZ2lzdGVycyIsCisgKiAgICAgICAgIHsg
UmRWPVJzVitSdFY7fSkKKyAqLworI2RlZmluZSBRNklOU04oVEFHLCBCRUgsIEFUVFJJQlMsIERF
U0NSLCBTRU0pIFwKKyAgICBkbyB7IFwKKyAgICAgICAgZnByaW50ZihvdXRmaWxlLCAiU0VNQU5U
SUNTKCBcXFxuIiBcCisgICAgICAgICAgICAgICAgICAgICAgICAgIiAgICBcIiVzXCIsIFxcXG4i
IFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAiICAgICVzLCBcXFxuIiBcCisgICAgICAgICAg
ICAgICAgICAgICAgICAgIiAgICBcIlwiXCIlc1wiXCJcIiBcXFxuIiBcCisgICAgICAgICAgICAg
ICAgICAgICAgICAgIilcbiIsIFwKKyAgICAgICAgICAgICAgICAjVEFHLCBTVFJJTkdJWkUoQkVI
KSwgU1RSSU5HSVpFKFNFTSkpOyBcCisgICAgICAgIGZwcmludGYob3V0ZmlsZSwgIkFUVFJJQlVU
RVMoIFxcXG4iIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAiICAgIFwiJXNcIiwgXFxcbiIg
XAorICAgICAgICAgICAgICAgICAgICAgICAgICIgICAgXCIlc1wiIFxcXG4iIFwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAiKVxuIiwgXAorICAgICAgICAgICAgICAgICNUQUcsIFNUUklOR0la
RShBVFRSSUJTKSk7IFwKKyAgICB9IHdoaWxlICgwKTsKKyNpbmNsdWRlICJpbXBvcnRlZC9hbGxp
ZGVmcy5kZWYiCisjdW5kZWYgUTZJTlNOCisKKy8qCisgKiBQcm9jZXNzIHRoZSBtYWNybyBkZWZp
bml0aW9ucworICogICAgIE1hY3JvcyBkZWZpbml0aW9ucyBoYXZlIHRoZSBmb2xsb3dpbmcgZm9y
bQorICogICAgICAgICBERUZfTUFDUk8oCisgKiAgICAgICAgICAgICBmTFNCTkVXMCwKKyAqICAg
ICAgICAgICAgIHByZWRsb2dfcmVhZCh0aHJlYWQsMCksCisgKiAgICAgICAgICAgICAoKQorICog
ICAgICAgICApCisgKiBUaGUgaW1wb3J0YW50IHBhcnQgaGVyZSBpcyB0aGUgYXR0cmlidXRlcy4g
IFdoZW5ldmVyIGFuIGluc3RydWN0aW9uCisgKiBpbnZva2VzIGEgbWFjcm8sIHdlIGFkZCB0aGUg
bWFjcm8ncyBhdHRyaWJ1dGVzIHRvIHRoZSBpbnN0cnVjdGlvbi4KKyAqLworI2RlZmluZSBERUZf
TUFDUk8oTU5BTUUsIEJFSCwgQVRUUlMpIFwKKyAgICBmcHJpbnRmKG91dGZpbGUsICJNQUNST0FU
VFJJQiggXFxcbiIgXAorICAgICAgICAgICAgICAgICAgICAgIiAgICBcIiVzXCIsIFxcXG4iIFwK
KyAgICAgICAgICAgICAgICAgICAgICIgICAgXCJcIlwiJXNcIlwiXCIsIFxcXG4iIFwKKyAgICAg
ICAgICAgICAgICAgICAgICIgICAgXCIlc1wiIFxcXG4iIFwKKyAgICAgICAgICAgICAgICAgICAg
ICIpXG4iLCBcCisgICAgICAgICAgICAjTU5BTUUsIFNUUklOR0laRShCRUgpLCBTVFJJTkdJWkUo
QVRUUlMpKTsKKyNpbmNsdWRlICJpbXBvcnRlZC9tYWNyb3MuZGVmIgorI3VuZGVmIERFRl9NQUNS
TworCisgICAgZmNsb3NlKG91dGZpbGUpOworICAgIHJldHVybiAwOworfQotLSAKMi43LjQKCg==

