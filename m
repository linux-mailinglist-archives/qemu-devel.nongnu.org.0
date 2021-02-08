Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DFC312A49
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 06:55:31 +0100 (CET)
Received: from localhost ([::1]:56192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8zWE-00089E-Ou
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 00:55:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l8zNz-0007eq-Cf
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 00:47:03 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:14448)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l8zNq-0006Sz-S1
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 00:46:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1612763210; x=1644299210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hKnZt+m24Kq8FMZMIu0H8sNgGymmZDDNaqyl7LFGzQA=;
 b=OF5Ed5wGPd+RkmDOtit5Iws1QSpoqyPkIG+6J/aOZxMGsGiIjseI755o
 SRv/MBz+W2jpZtOXWFy+IyeKuMRcWzVvTU7btMEi6BWeRAAux6I3IzTWi
 b7yzJoxTKaazEJNz7C+eCJMvY5jWFK0Iu49LZMH4yBhCrZagvWxDtczIm 8=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Feb 2021 21:46:31 -0800
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg03-sd.qualcomm.com with ESMTP; 07 Feb 2021 21:46:30 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 20B864147; Sun,  7 Feb 2021 23:46:30 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 19/35] Hexagon (target/hexagon) generator phase 1 - C
 preprocessor for semantics
Date: Sun,  7 Feb 2021 23:46:09 -0600
Message-Id: <1612763186-18161-20-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, tsimpson@quicinc.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UnVuIHRoZSBDIHByZXByb2Nlc3NvciBhY3Jvc3MgdGhlIGluc3RydWN0aW9uIGRlZmluaXRpb24g
ZmlsZXMgYW5kIG1hY3JvCmRlZmluaXRpb24gZmlsZSB0byBleHBhbmQgbWFjcm9zIGFuZCBwcmVw
YXJlIHRoZSBzZW1hbnRpY3NfZ2VuZXJhdGVkLnB5aW5jCmZpbGUuICBUaGUgcmVzdWx0aW5nIGZp
bGUgY29udGFpbnMgb25lIGVudHJ5IHdpdGggdGhlIHNlbWFudGljcyBmb3IgZWFjaAppbnN0cnVj
dGlvbiBhbmQgb25lIGxpbmUgd2l0aCB0aGUgaW5zdHJ1Y3Rpb24gYXR0cmlidXRlcyBhc3NvY2lh
dGVkIHdpdGgKZWFjaCBtYWNyby4KClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2lt
cHNvbkBxdWljaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxm
NGJ1Z0BhbXNhdC5vcmc+Ci0tLQogdGFyZ2V0L2hleGFnb24vZ2VuX3NlbWFudGljcy5jIHwgODgg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgODggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRhcmdldC9oZXhhZ29uL2dl
bl9zZW1hbnRpY3MuYwoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl9zZW1hbnRpY3Mu
YyBiL3RhcmdldC9oZXhhZ29uL2dlbl9zZW1hbnRpY3MuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwLi5jNWZjY2VjCi0tLSAvZGV2L251bGwKKysrIGIvdGFyZ2V0L2hleGFnb24v
Z2VuX3NlbWFudGljcy5jCkBAIC0wLDAgKzEsODggQEAKKy8qCisgKiAgQ29weXJpZ2h0KGMpIDIw
MTktMjAyMSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2Vy
dmVkLgorICoKKyAqICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRp
c3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorICogIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUg
R05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CisgKiAgdGhlIEZyZWUg
U29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IK
KyAqICAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorICoKKyAqICBUaGlzIHBy
b2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwK
KyAqICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3
YXJyYW50eSBvZgorICogIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VM
QVIgUFVSUE9TRS4gIFNlZSB0aGUKKyAqICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3Ig
bW9yZSBkZXRhaWxzLgorICoKKyAqICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9m
IHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorICogIGFsb25nIHdpdGggdGhpcyBwcm9n
cmFtOyBpZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisgKi8KKwor
LyoKKyAqIFRoaXMgcHJvZ3JhbSBnZW5lcmF0ZXMgdGhlIHNlbWFudGljcyBmaWxlIHRoYXQgaXMg
cHJvY2Vzc2VkIGJ5CisgKiB0aGUgZG9fcWVtdS5weSBzY3JpcHQuICBXZSB1c2UgdGhlIEMgcHJl
cG9yY2Vzc29yIHRvIG1hbmlwdWxhdGUgdGhlCisgKiBmaWxlcyBpbXBvcnRlZCBmcm9tIHRoZSBI
ZXhhZ29uIGFyY2hpdGVjdHVyZSBsaWJyYXJ5LgorICovCisKKyNpbmNsdWRlIDxzdGRpby5oPgor
I2RlZmluZSBTVFJJTkdJWkUoWCkgI1gKKworaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3Zb
XSkKK3sKKyAgICBGSUxFICpvdXRmaWxlOworCisgICAgaWYgKGFyZ2MgIT0gMikgeworICAgICAg
ICBmcHJpbnRmKHN0ZGVyciwgIlVzYWdlOiBnZW5fc2VtYW50aWNzIG91cHRwdXRmaWxlXG4iKTsK
KyAgICAgICAgcmV0dXJuIDE7CisgICAgfQorICAgIG91dGZpbGUgPSBmb3Blbihhcmd2WzFdLCAi
dyIpOworICAgIGlmIChvdXRmaWxlID09IE5VTEwpIHsKKyAgICAgICAgZnByaW50ZihzdGRlcnIs
ICJDYW5ub3Qgb3BlbiAlcyBmb3Igd3JpdGluZ1xuIiwgYXJndlsxXSk7CisgICAgICAgIHJldHVy
biAxOworICAgIH0KKworLyoKKyAqIFByb2Nlc3MgdGhlIGluc3RydWN0aW9uIGRlZmluaXRpb25z
CisgKiAgICAgU2NhbGFyIGNvcmUgaW5zdHJ1Y3Rpb25zIGhhdmUgdGhlIGZvbGxvd2luZyBmb3Jt
CisgKiAgICAgICAgIFE2SU5TTihBMl9hZGQsIlJkMzI9YWRkKFJzMzIsUnQzMikiLEFUVFJJQlMo
KSwKKyAqICAgICAgICAgIkFkZCAzMi1iaXQgcmVnaXN0ZXJzIiwKKyAqICAgICAgICAgeyBSZFY9
UnNWK1J0Vjt9KQorICovCisjZGVmaW5lIFE2SU5TTihUQUcsIEJFSCwgQVRUUklCUywgREVTQ1Is
IFNFTSkgXAorICAgIGRvIHsgXAorICAgICAgICBmcHJpbnRmKG91dGZpbGUsICJTRU1BTlRJQ1Mo
IFxcXG4iIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAiICAgIFwiJXNcIiwgXFxcbiIgXAor
ICAgICAgICAgICAgICAgICAgICAgICAgICIgICAgJXMsIFxcXG4iIFwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAiICAgIFwiXCJcIiVzXCJcIlwiIFxcXG4iIFwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAiKVxuIiwgXAorICAgICAgICAgICAgICAgICNUQUcsIFNUUklOR0laRShCRUgpLCBT
VFJJTkdJWkUoU0VNKSk7IFwKKyAgICAgICAgZnByaW50ZihvdXRmaWxlLCAiQVRUUklCVVRFUygg
XFxcbiIgXAorICAgICAgICAgICAgICAgICAgICAgICAgICIgICAgXCIlc1wiLCBcXFxuIiBcCisg
ICAgICAgICAgICAgICAgICAgICAgICAgIiAgICBcIiVzXCIgXFxcbiIgXAorICAgICAgICAgICAg
ICAgICAgICAgICAgICIpXG4iLCBcCisgICAgICAgICAgICAgICAgI1RBRywgU1RSSU5HSVpFKEFU
VFJJQlMpKTsgXAorICAgIH0gd2hpbGUgKDApOworI2luY2x1ZGUgImltcG9ydGVkL2FsbGlkZWZz
LmRlZiIKKyN1bmRlZiBRNklOU04KKworLyoKKyAqIFByb2Nlc3MgdGhlIG1hY3JvIGRlZmluaXRp
b25zCisgKiAgICAgTWFjcm9zIGRlZmluaXRpb25zIGhhdmUgdGhlIGZvbGxvd2luZyBmb3JtCisg
KiAgICAgICAgIERFRl9NQUNSTygKKyAqICAgICAgICAgICAgIGZMU0JORVcwLAorICogICAgICAg
ICAgICAgcHJlZGxvZ19yZWFkKHRocmVhZCwwKSwKKyAqICAgICAgICAgICAgICgpCisgKiAgICAg
ICAgICkKKyAqIFRoZSBpbXBvcnRhbnQgcGFydCBoZXJlIGlzIHRoZSBhdHRyaWJ1dGVzLiAgV2hl
bmV2ZXIgYW4gaW5zdHJ1Y3Rpb24KKyAqIGludm9rZXMgYSBtYWNybywgd2UgYWRkIHRoZSBtYWNy
bydzIGF0dHJpYnV0ZXMgdG8gdGhlIGluc3RydWN0aW9uLgorICovCisjZGVmaW5lIERFRl9NQUNS
TyhNTkFNRSwgQkVILCBBVFRSUykgXAorICAgIGZwcmludGYob3V0ZmlsZSwgIk1BQ1JPQVRUUklC
KCBcXFxuIiBcCisgICAgICAgICAgICAgICAgICAgICAiICAgIFwiJXNcIiwgXFxcbiIgXAorICAg
ICAgICAgICAgICAgICAgICAgIiAgICBcIlwiXCIlc1wiXCJcIiwgXFxcbiIgXAorICAgICAgICAg
ICAgICAgICAgICAgIiAgICBcIiVzXCIgXFxcbiIgXAorICAgICAgICAgICAgICAgICAgICAgIilc
biIsIFwKKyAgICAgICAgICAgICNNTkFNRSwgU1RSSU5HSVpFKEJFSCksIFNUUklOR0laRShBVFRS
UykpOworI2luY2x1ZGUgImltcG9ydGVkL21hY3Jvcy5kZWYiCisjdW5kZWYgREVGX01BQ1JPCisK
KyAgICBmY2xvc2Uob3V0ZmlsZSk7CisgICAgcmV0dXJuIDA7Cit9Ci0tIAoyLjcuNAoK

