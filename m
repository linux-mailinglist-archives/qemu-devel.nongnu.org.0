Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64803BC41E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 01:36:23 +0200 (CEST)
Received: from localhost ([::1]:57182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Y8U-0006BS-NR
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 19:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m0Y6y-0003Hn-LU
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 19:34:48 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:37360)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m0Y6w-0004dv-F9
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 19:34:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1625528086; x=1657064086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=87+RL1jrLfkPP+//35JfY4rVGRV6zKvS4dl/OoqSMEY=;
 b=xoLDbnfkaULe92Ws8lO04YoBZgXun6M36dZ4oSPj+uBT2RPIKzpbocaI
 ukNnNf+hSx2XS7vCwJ9jnxUrQCkjvD6Monb+UT1UuBC1wIA3JKXbJMRe4
 S26gZ7rV/jdfKE/5PsoTYJ1dvv3mgiuLj4sNUMzSe9UAvn03xdagANkJM M=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 05 Jul 2021 16:34:38 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 05 Jul 2021 16:34:38 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id F1542144A; Mon,  5 Jul 2021 18:34:37 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/20] Hexagon HVX (target/hexagon) helper functions
Date: Mon,  5 Jul 2021 18:34:26 -0500
Message-Id: <1625528074-19440-13-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
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

Q29tbWl0IHZlY3RvciBzdG9yZXMgKG1hc2tlZCBhbmQgc2NhdHRlci9nYXRoZXIpCkxvZyB2ZWN0
b3IgcmVnaXN0ZXIgd3JpdGVzCkFkZCB0aGUgZXhlY3V0aW9uIGNvdW50ZXJzIHRvIHRoZSBkZWJ1
ZyBsb2cKClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNv
bT4KLS0tCiB0YXJnZXQvaGV4YWdvbi9oZWxwZXIuaCAgICB8ICAxICsKIHRhcmdldC9oZXhhZ29u
L29wX2hlbHBlci5jIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLQogMiBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2hlbHBlci5oIGIvdGFyZ2V0L2hleGFnb24v
aGVscGVyLmgKaW5kZXggY2EyMDFmYi4uZTQxYTVhMSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFn
b24vaGVscGVyLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vaGVscGVyLmgKQEAgLTIzLDYgKzIzLDcg
QEAgREVGX0hFTFBFUl8xKGRlYnVnX3N0YXJ0X3BhY2tldCwgdm9pZCwgZW52KQogREVGX0hFTFBF
Ul9GTEFHU18zKGRlYnVnX2NoZWNrX3N0b3JlX3dpZHRoLCBUQ0dfQ0FMTF9OT19XRywgdm9pZCwg
ZW52LCBpbnQsIGludCkKIERFRl9IRUxQRVJfRkxBR1NfMyhkZWJ1Z19jb21taXRfZW5kLCBUQ0df
Q0FMTF9OT19XRywgdm9pZCwgZW52LCBpbnQsIGludCkKIERFRl9IRUxQRVJfMihjb21taXRfc3Rv
cmUsIHZvaWQsIGVudiwgaW50KQorREVGX0hFTFBFUl8xKGNvbW1pdF9odnhfc3RvcmVzLCB2b2lk
LCBlbnYpCiBERUZfSEVMUEVSX0ZMQUdTXzQoZmNpcmNhZGQsIFRDR19DQUxMX05PX1JXR19TRSwg
czMyLCBzMzIsIHMzMiwgczMyLCBzMzIpCiBERUZfSEVMUEVSX0ZMQUdTXzEoZmJyZXYsIFRDR19D
QUxMX05PX1JXR19TRSwgaTMyLCBpMzIpCiBERUZfSEVMUEVSXzMoc2ZyZWNpcGEsIGk2NCwgZW52
LCBmMzIsIGYzMikKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jIGIvdGFy
Z2V0L2hleGFnb24vb3BfaGVscGVyLmMKaW5kZXggNDU5NTU1OS4uNGUxOTZmOSAxMDA2NDQKLS0t
IGEvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vb3BfaGVs
cGVyLmMKQEAgLTI1LDYgKzI1LDggQEAKICNpbmNsdWRlICJhcmNoLmgiCiAjaW5jbHVkZSAiaGV4
X2FyY2hfdHlwZXMuaCIKICNpbmNsdWRlICJmbWFfZW11LmgiCisjaW5jbHVkZSAibW12ZWMvbW12
ZWMuaCIKKyNpbmNsdWRlICJtbXZlYy9tYWNyb3MuaCIKIAogI2RlZmluZSBTRl9CSUFTICAgICAg
ICAxMjcKICNkZWZpbmUgU0ZfTUFOVEJJVFMgICAgMjMKQEAgLTE2Miw2ICsxNjQsNTAgQEAgdm9p
ZCBIRUxQRVIoY29tbWl0X3N0b3JlKShDUFVIZXhhZ29uU3RhdGUgKmVudiwgaW50IHNsb3RfbnVt
KQogICAgIH0KIH0KIAordm9pZCBIRUxQRVIoY29tbWl0X2h2eF9zdG9yZXMpKENQVUhleGFnb25T
dGF0ZSAqZW52KQoreworICAgIGludCBpOworCisgICAgLyogTm9ybWFsIChwb3NzaWJseSBtYXNr
ZWQpIHZlY3RvciBzdG9yZSAqLworICAgIGZvciAoaSA9IDA7IGkgPCBWU1RPUkVTX01BWDsgaSsr
KSB7CisgICAgICAgIGlmIChlbnYtPnZzdG9yZV9wZW5kaW5nW2ldKSB7CisgICAgICAgICAgICBl
bnYtPnZzdG9yZV9wZW5kaW5nW2ldID0gMDsKKyAgICAgICAgICAgIHRhcmdldF91bG9uZyB2YSA9
IGVudi0+dnN0b3JlW2ldLnZhOworICAgICAgICAgICAgaW50IHNpemUgPSBlbnYtPnZzdG9yZVtp
XS5zaXplOworICAgICAgICAgICAgZm9yIChpbnQgaiA9IDA7IGogPCBzaXplOyBqKyspIHsKKyAg
ICAgICAgICAgICAgICBpZiAoZW52LT52c3RvcmVbaV0ubWFzay51YltqXSkgeworICAgICAgICAg
ICAgICAgICAgICBwdXRfdXNlcl91OChlbnYtPnZzdG9yZVtpXS5kYXRhLnViW2pdLCB2YSArIGop
OworICAgICAgICAgICAgICAgIH0KKyAgICAgICAgICAgIH0KKyAgICAgICAgfQorICAgIH0KKwor
ICAgIC8qIFNjYXR0ZXIgc3RvcmUgKi8KKyAgICBpZiAoZW52LT52dGNtX3BlbmRpbmcpIHsKKyAg
ICAgICAgZW52LT52dGNtX3BlbmRpbmcgPSBmYWxzZTsKKyAgICAgICAgaWYgKGVudi0+dnRjbV9s
b2cub3ApIHsKKyAgICAgICAgICAgIC8qIE5lZWQgdG8gcGVyZm9ybSB0aGUgc2NhdHRlciByZWFk
L21vZGlmeS93cml0ZSBhdCBjb21taXQgdGltZSAqLworICAgICAgICAgICAgaWYgKGVudi0+dnRj
bV9sb2cub3Bfc2l6ZSA9PSAyKSB7CisgICAgICAgICAgICAgICAgU0NBVFRFUl9PUF9XUklURV9U
T19NRU0odWludDE2X3QpOworICAgICAgICAgICAgfSBlbHNlIGlmIChlbnYtPnZ0Y21fbG9nLm9w
X3NpemUgPT0gNCkgeworICAgICAgICAgICAgICAgIC8qIFdvcmQgU2NhdHRlciArPSAqLworICAg
ICAgICAgICAgICAgIFNDQVRURVJfT1BfV1JJVEVfVE9fTUVNKHVpbnQzMl90KTsKKyAgICAgICAg
ICAgIH0gZWxzZSB7CisgICAgICAgICAgICAgICAgZ19hc3NlcnRfbm90X3JlYWNoZWQoKTsKKyAg
ICAgICAgICAgIH0KKyAgICAgICAgfSBlbHNlIHsKKyAgICAgICAgICAgIGZvciAoaSA9IDA7IGkg
PCBlbnYtPnZ0Y21fbG9nLnNpemU7IGkrKykgeworICAgICAgICAgICAgICAgIGlmIChlbnYtPnZ0
Y21fbG9nLm1hc2sudWJbaV0gIT0gMCkgeworICAgICAgICAgICAgICAgICAgICBwdXRfdXNlcl91
OChlbnYtPnZ0Y21fbG9nLmRhdGEudWJbaV0sIGVudi0+dnRjbV9sb2cudmFbaV0pOworICAgICAg
ICAgICAgICAgICAgICBlbnYtPnZ0Y21fbG9nLm1hc2sudWJbaV0gPSAwOworICAgICAgICAgICAg
ICAgICAgICBlbnYtPnZ0Y21fbG9nLmRhdGEudWJbaV0gPSAwOworICAgICAgICAgICAgICAgIH0K
KworICAgICAgICAgICAgfQorICAgICAgICB9CisgICAgfQorfQorCiBzdGF0aWMgdm9pZCBwcmlu
dF9zdG9yZShDUFVIZXhhZ29uU3RhdGUgKmVudiwgaW50IHNsb3QpCiB7CiAgICAgaWYgKCEoZW52
LT5zbG90X2NhbmNlbGxlZCAmICgxIDw8IHNsb3QpKSkgewpAQCAtMjQwLDkgKzI4NiwxMCBAQCB2
b2lkIEhFTFBFUihkZWJ1Z19jb21taXRfZW5kKShDUFVIZXhhZ29uU3RhdGUgKmVudiwgaW50IGhh
c19zdDAsIGludCBoYXNfc3QxKQogICAgIEhFWF9ERUJVR19MT0coIk5leHQgUEMgPSAiIFRBUkdF
VF9GTVRfbHggIlxuIiwgZW52LT5uZXh0X1BDKTsKICAgICBIRVhfREVCVUdfTE9HKCJFeGVjIGNv
dW50ZXJzOiBwa3QgPSAiIFRBUkdFVF9GTVRfbHgKICAgICAgICAgICAgICAgICAgICIsIGluc24g
PSAiIFRBUkdFVF9GTVRfbHgKLSAgICAgICAgICAgICAgICAgICJcbiIsCisgICAgICAgICAgICAg
ICAgICAiLCBodnggPSAiIFRBUkdFVF9GTVRfbHggIlxuIiwKICAgICAgICAgICAgICAgICAgIGVu
di0+Z3ByW0hFWF9SRUdfUUVNVV9QS1RfQ05UXSwKLSAgICAgICAgICAgICAgICAgIGVudi0+Z3By
W0hFWF9SRUdfUUVNVV9JTlNOX0NOVF0pOworICAgICAgICAgICAgICAgICAgZW52LT5ncHJbSEVY
X1JFR19RRU1VX0lOU05fQ05UXSwKKyAgICAgICAgICAgICAgICAgIGVudi0+Z3ByW0hFWF9SRUdf
UUVNVV9IVlhfQ05UXSk7CiAKIH0KIAotLSAKMi43LjQKCg==

