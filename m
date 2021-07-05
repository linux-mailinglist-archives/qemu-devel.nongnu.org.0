Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAA23BC41D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 01:36:22 +0200 (CEST)
Received: from localhost ([::1]:56916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Y8T-00061a-9G
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 19:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m0Y6x-0003Dz-1n
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 19:34:47 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:45004)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m0Y6v-0004dS-9Q
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 19:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1625528085; x=1657064085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=69qBle/eVU9uHtHipj6pV1T2Gy/NBC1dcl+XeNvrcaA=;
 b=sTVRW7QIzcCnKej5qwtGBbknfKhL9K+EdrB3HpQ48baByym8vGtRKt85
 ApNs/oGDq3Qo9ikEfJxAMeZhvqvyI3FliojMkvK0qn/GAUKWllHQxrCus
 CDMYkUhwYazeKOXF03Z0Eist17gR86IpGS8eo3xY1FzMV9rRsWssvwpBu Q=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 05 Jul 2021 16:34:39 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 05 Jul 2021 16:34:38 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id E4C02118C; Mon,  5 Jul 2021 18:34:37 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/20] Hexagon HVX (target/hexagon) semantics generator
Date: Mon,  5 Jul 2021 18:34:22 -0500
Message-Id: <1625528074-19440-9-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
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
Cc: ale@rev.ng, peter.maydell@linaro.org, bcain@quicinc.com,
 richard.henderson@linaro.org, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWRkIEhWWCBzdXBwb3J0IHRvIHRoZSBzZW1hbnRpY3MgZ2VuZXJhdG9yCgpTaWduZWQtb2ZmLWJ5
OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFn
b24vZ2VuX3NlbWFudGljcy5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiB0YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5ICAgfCAgOSArKysrKysrKy0KIDIgZmlsZXMg
Y2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rh
cmdldC9oZXhhZ29uL2dlbl9zZW1hbnRpY3MuYyBiL3RhcmdldC9oZXhhZ29uL2dlbl9zZW1hbnRp
Y3MuYwppbmRleCBjNWZjY2VjLi40YTJiZGQ3IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9n
ZW5fc2VtYW50aWNzLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3NlbWFudGljcy5jCkBAIC00
NCw2ICs0NCwxMSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogICogICAgICAg
ICBRNklOU04oQTJfYWRkLCJSZDMyPWFkZChSczMyLFJ0MzIpIixBVFRSSUJTKCksCiAgKiAgICAg
ICAgICJBZGQgMzItYml0IHJlZ2lzdGVycyIsCiAgKiAgICAgICAgIHsgUmRWPVJzVitSdFY7fSkK
KyAqICAgICBIVlggaW5zdHJ1Y3Rpb25zIGhhdmUgdGhlIGZvbGxvd2luZyBmb3JtCisgKiAgICAg
ICAgIEVYVElOU04oVjZfdmluc2VydHdyLCAiVngzMi53PXZpbnNlcnQoUnQzMikiLAorICogICAg
ICAgICBBVFRSSUJTKEFfRVhURU5TSU9OLEFfQ1ZJLEFfQ1ZJX1ZYKSwKKyAqICAgICAgICAgIklu
c2VydCBXb3JkIFNjYWxhciBpbnRvIFZlY3RvciIsCisgKiAgICAgICAgIFZ4Vi51d1swXSA9IFJ0
VjspCiAgKi8KICNkZWZpbmUgUTZJTlNOKFRBRywgQkVILCBBVFRSSUJTLCBERVNDUiwgU0VNKSBc
CiAgICAgZG8geyBcCkBAIC01OSw4ICs2NCwyMyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAq
YXJndltdKQogICAgICAgICAgICAgICAgICAgICAgICAgICIpXG4iLCBcCiAgICAgICAgICAgICAg
ICAgI1RBRywgU1RSSU5HSVpFKEFUVFJJQlMpKTsgXAogICAgIH0gd2hpbGUgKDApOworI2RlZmlu
ZSBFWFRJTlNOKFRBRywgQkVILCBBVFRSSUJTLCBERVNDUiwgU0VNKSBcCisgICAgZG8geyBcCisg
ICAgICAgIGZwcmludGYob3V0ZmlsZSwgIlNFTUFOVElDUyggXFxcbiIgXAorICAgICAgICAgICAg
ICAgICAgICAgICAgICIgICAgXCIlc1wiLCBcXFxuIiBcCisgICAgICAgICAgICAgICAgICAgICAg
ICAgIiAgICAlcywgXFxcbiIgXAorICAgICAgICAgICAgICAgICAgICAgICAgICIgICAgXCJcIlwi
JXNcIlwiXCIgXFxcbiIgXAorICAgICAgICAgICAgICAgICAgICAgICAgICIpXG4iLCBcCisgICAg
ICAgICAgICAgICAgI1RBRywgU1RSSU5HSVpFKEJFSCksIFNUUklOR0laRShTRU0pKTsgXAorICAg
ICAgICBmcHJpbnRmKG91dGZpbGUsICJBVFRSSUJVVEVTKCBcXFxuIiBcCisgICAgICAgICAgICAg
ICAgICAgICAgICAgIiAgICBcIiVzXCIsIFxcXG4iIFwKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAiICAgIFwiJXNcIiBcXFxuIiBcCisgICAgICAgICAgICAgICAgICAgICAgICAgIilcbiIsIFwK
KyAgICAgICAgICAgICAgICAjVEFHLCBTVFJJTkdJWkUoQVRUUklCUykpOyBcCisgICAgfSB3aGls
ZSAoMCk7CiAjaW5jbHVkZSAiaW1wb3J0ZWQvYWxsaWRlZnMuZGVmIgogI3VuZGVmIFE2SU5TTgor
I3VuZGVmIEVYVElOU04KIAogLyoKICAqIFByb2Nlc3MgdGhlIG1hY3JvIGRlZmluaXRpb25zCkBA
IC04Myw2ICsxMDMsMTkgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICNpbmNs
dWRlICJpbXBvcnRlZC9tYWNyb3MuZGVmIgogI3VuZGVmIERFRl9NQUNSTwogCisvKgorICogUHJv
Y2VzcyB0aGUgbWFjcm9zIGZvciBIVlgKKyAqLworI2RlZmluZSBERUZfTUFDUk8oTU5BTUUsIEJF
SCwgQVRUUlMpIFwKKyAgICBmcHJpbnRmKG91dGZpbGUsICJNQUNST0FUVFJJQiggXFxcbiIgXAor
ICAgICAgICAgICAgICAgICAgICAgIiAgICBcIiVzXCIsIFxcXG4iIFwKKyAgICAgICAgICAgICAg
ICAgICAgICIgICAgXCJcIlwiJXNcIlwiXCIsIFxcXG4iIFwKKyAgICAgICAgICAgICAgICAgICAg
ICIgICAgXCIlc1wiIFxcXG4iIFwKKyAgICAgICAgICAgICAgICAgICAgICIpXG4iLCBcCisgICAg
ICAgICAgICAjTU5BTUUsIFNUUklOR0laRShCRUgpLCBTVFJJTkdJWkUoQVRUUlMpKTsKKyNpbmNs
dWRlICJpbXBvcnRlZC9hbGxleHRfbWFjcm9zLmRlZiIKKyN1bmRlZiBERUZfTUFDUk8KKwogICAg
IGZjbG9zZShvdXRmaWxlKTsKICAgICByZXR1cm4gMDsKIH0KZGlmZiAtLWdpdCBhL3RhcmdldC9o
ZXhhZ29uL2hleF9jb21tb24ucHkgYi90YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5CmluZGV4
IGIzYjUzNDAuLmQwN2U0OGIgMTAwNzU1Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2hleF9jb21tb24u
cHkKKysrIGIvdGFyZ2V0L2hleGFnb24vaGV4X2NvbW1vbi5weQpAQCAtMTQzLDYgKzE0Myw5IEBA
IGRlZiBjb21wdXRlX3RhZ19pbW1lZGlhdGVzKHRhZyk6CiAjIyAgICAgICAgICBQICAgICAgICAg
ICAgICAgIHByZWRpY2F0ZSByZWdpc3RlcgogIyMgICAgICAgICAgUiAgICAgICAgICAgICAgICBH
UFIgcmVnaXN0ZXIKICMjICAgICAgICAgIE0gICAgICAgICAgICAgICAgbW9kaWZpZXIgcmVnaXN0
ZXIKKyMjICAgICAgICAgIFEgICAgICAgICAgICAgICAgSFZYIHByZWRpY2F0ZSB2ZWN0b3IKKyMj
ICAgICAgICAgIFYgICAgICAgICAgICAgICAgSFZYIHZlY3RvciByZWdpc3RlcgorIyMgICAgICAg
ICAgTyAgICAgICAgICAgICAgICBIVlggbmV3IHZlY3RvciByZWdpc3RlcgogIyMgICAgICByZWdp
ZCBjYW4gYmUgb25lIG9mIHRoZSBmb2xsb3dpbmcKICMjICAgICAgICAgIGQsIGUgICAgICAgICAg
ICAgZGVzdGluYXRpb24gcmVnaXN0ZXIKICMjICAgICAgICAgIGRkICAgICAgICAgICAgICAgZGVz
dGluYXRpb24gcmVnaXN0ZXIgcGFpcgpAQCAtMTc4LDYgKzE4MSw5IEBAIGRlZiBpc19yZWFkd3Jp
dGUocmVnaWQpOgogZGVmIGlzX3NjYWxhcl9yZWcocmVndHlwZSk6CiAgICAgcmV0dXJuIHJlZ3R5
cGUgaW4gIlJQQyIKIAorZGVmIGlzX2h2eF9yZWcocmVndHlwZSk6CisgICAgcmV0dXJuIHJlZ3R5
cGUgaW4gIlZRIgorCiBkZWYgaXNfb2xkX3ZhbChyZWd0eXBlLCByZWdpZCwgdGFnKToKICAgICBy
ZXR1cm4gcmVndHlwZStyZWdpZCsnVicgaW4gc2VtZGljdFt0YWddCiAKQEAgLTE4Nyw3ICsxOTMs
OCBAQCBkZWYgaXNfbmV3X3ZhbChyZWd0eXBlLCByZWdpZCwgdGFnKToKIGRlZiBuZWVkX3Nsb3Qo
dGFnKToKICAgICBpZiAoJ0FfQ09OREVYRUMnIGluIGF0dHJpYmRpY3RbdGFnXSBvcgogICAgICAg
ICAnQV9TVE9SRScgaW4gYXR0cmliZGljdFt0YWddIG9yCi0gICAgICAgICdBX0xPQUQnIGluIGF0
dHJpYmRpY3RbdGFnXSk6CisgICAgICAgICdBX0xPQUQnIGluIGF0dHJpYmRpY3RbdGFnXSBvcgor
ICAgICAgICAnQV9DVkknIGluIGF0dHJpYmRpY3RbdGFnXSk6CiAgICAgICAgIHJldHVybiAxCiAg
ICAgZWxzZToKICAgICAgICAgcmV0dXJuIDAKLS0gCjIuNy40Cgo=

