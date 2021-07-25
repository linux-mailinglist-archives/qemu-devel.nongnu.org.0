Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0628F3D5036
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 23:44:08 +0200 (CEST)
Received: from localhost ([::1]:57580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7lup-000337-34
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 17:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m7ltj-0001i7-1T
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 17:42:59 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:59857)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m7ltg-0005XT-Oc
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 17:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1627249376; x=1658785376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dqa8dAoBRBDI+CbqHA2z9ZjY0TfMHUT9JQEwIQ+C78Y=;
 b=hK8ogdlV7QyAmfI6OaHpbIedYSd90bJdnTZ5nIa5FGL4WvhFQro0/vOh
 4I9nY+a2tV2WL1Mts3olQJuTLnSGwYn/K+/pUt0xlAaGiP65ixGw33BOv
 mX6N0/vbbOPx+P/qRUr31RXaqJqDSz/e7IVAlgm1oWhYA5ydHfDvM4/nS M=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Jul 2021 14:42:53 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg03-sd.qualcomm.com with ESMTP; 25 Jul 2021 14:42:53 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id AEEA211E9; Sun, 25 Jul 2021 16:42:52 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 1/2] Hexagon (target/hexagon) remove put_user_*/get_user_*
Date: Sun, 25 Jul 2021 16:42:47 -0500
Message-Id: <1627249368-8366-2-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627249368-8366-1-git-send-email-tsimpson@quicinc.com>
References: <1627249368-8366-1-git-send-email-tsimpson@quicinc.com>
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

UmVwbGFjZSBwdXRfdXNlcl8qIHdpdGggY3B1X3N0Kl9kYXRhX3JhClJlcGxhY2UgZ2V0X3VzZXJf
KiB3aXRoIGNwdV9sZCpfZGF0YV9yYQoKU3VnZ2VzdGVkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8
cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVy
c29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3Ig
U2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ck1lc3NhZ2UtSWQ6IDwxNjI2Mzg0MTU2LTYy
NDgtMi1naXQtc2VuZC1lbWFpbC10c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4
YWdvbi9vcF9oZWxwZXIuYyB8IDM5ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jIGIvdGFyZ2V0L2hleGFnb24v
b3BfaGVscGVyLmMKaW5kZXggNDU5NTU1OS4uYTk1OWRiYSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hl
eGFnb24vb3BfaGVscGVyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMKQEAgLTE3
LDYgKzE3LDcgQEAKIAogI2luY2x1ZGUgInFlbXUvb3NkZXAuaCIKICNpbmNsdWRlICJxZW11Lmgi
CisjaW5jbHVkZSAiZXhlYy9jcHVfbGRzdC5oIgogI2luY2x1ZGUgImV4ZWMvaGVscGVyLXByb3Rv
LmgiCiAjaW5jbHVkZSAiZnB1L3NvZnRmbG9hdC5oIgogI2luY2x1ZGUgImNwdS5oIgpAQCAtMTQw
LDIyICsxNDEsMjIgQEAgdm9pZCBIRUxQRVIoZGVidWdfY2hlY2tfc3RvcmVfd2lkdGgpKENQVUhl
eGFnb25TdGF0ZSAqZW52LCBpbnQgc2xvdCwgaW50IGNoZWNrKQogCiB2b2lkIEhFTFBFUihjb21t
aXRfc3RvcmUpKENQVUhleGFnb25TdGF0ZSAqZW52LCBpbnQgc2xvdF9udW0pCiB7Ci0gICAgc3dp
dGNoIChlbnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS53aWR0aCkgeworICAgIHVpbnRwdHJf
dCByYSA9IEdFVFBDKCk7CisgICAgdWludDhfdCB3aWR0aCA9IGVudi0+bWVtX2xvZ19zdG9yZXNb
c2xvdF9udW1dLndpZHRoOworICAgIHRhcmdldF91bG9uZyB2YSA9IGVudi0+bWVtX2xvZ19zdG9y
ZXNbc2xvdF9udW1dLnZhOworCisgICAgc3dpdGNoICh3aWR0aCkgewogICAgIGNhc2UgMToKLSAg
ICAgICAgcHV0X3VzZXJfdTgoZW52LT5tZW1fbG9nX3N0b3Jlc1tzbG90X251bV0uZGF0YTMyLAot
ICAgICAgICAgICAgICAgICAgICBlbnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS52YSk7Cisg
ICAgICAgIGNwdV9zdGJfZGF0YV9yYShlbnYsIHZhLCBlbnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3Rf
bnVtXS5kYXRhMzIsIHJhKTsKICAgICAgICAgYnJlYWs7CiAgICAgY2FzZSAyOgotICAgICAgICBw
dXRfdXNlcl91MTYoZW52LT5tZW1fbG9nX3N0b3Jlc1tzbG90X251bV0uZGF0YTMyLAotICAgICAg
ICAgICAgICAgICAgICAgZW52LT5tZW1fbG9nX3N0b3Jlc1tzbG90X251bV0udmEpOworICAgICAg
ICBjcHVfc3R3X2RhdGFfcmEoZW52LCB2YSwgZW52LT5tZW1fbG9nX3N0b3Jlc1tzbG90X251bV0u
ZGF0YTMyLCByYSk7CiAgICAgICAgIGJyZWFrOwogICAgIGNhc2UgNDoKLSAgICAgICAgcHV0X3Vz
ZXJfdTMyKGVudi0+bWVtX2xvZ19zdG9yZXNbc2xvdF9udW1dLmRhdGEzMiwKLSAgICAgICAgICAg
ICAgICAgICAgIGVudi0+bWVtX2xvZ19zdG9yZXNbc2xvdF9udW1dLnZhKTsKKyAgICAgICAgY3B1
X3N0bF9kYXRhX3JhKGVudiwgdmEsIGVudi0+bWVtX2xvZ19zdG9yZXNbc2xvdF9udW1dLmRhdGEz
MiwgcmEpOwogICAgICAgICBicmVhazsKICAgICBjYXNlIDg6Ci0gICAgICAgIHB1dF91c2VyX3U2
NChlbnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS5kYXRhNjQsCi0gICAgICAgICAgICAgICAg
ICAgICBlbnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS52YSk7CisgICAgICAgIGNwdV9zdHFf
ZGF0YV9yYShlbnYsIHZhLCBlbnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS5kYXRhNjQsIHJh
KTsKICAgICAgICAgYnJlYWs7CiAgICAgZGVmYXVsdDoKICAgICAgICAgZ19hc3NlcnRfbm90X3Jl
YWNoZWQoKTsKQEAgLTM5MywzNyArMzk0LDMzIEBAIHN0YXRpYyB2b2lkIGNoZWNrX25vc2h1ZihD
UFVIZXhhZ29uU3RhdGUgKmVudiwgdWludDMyX3Qgc2xvdCkKIHN0YXRpYyB1aW50OF90IG1lbV9s
b2FkMShDUFVIZXhhZ29uU3RhdGUgKmVudiwgdWludDMyX3Qgc2xvdCwKICAgICAgICAgICAgICAg
ICAgICAgICAgICB0YXJnZXRfdWxvbmcgdmFkZHIpCiB7Ci0gICAgdWludDhfdCByZXR2YWw7Cisg
ICAgdWludHB0cl90IHJhID0gR0VUUEMoKTsKICAgICBjaGVja19ub3NodWYoZW52LCBzbG90KTsK
LSAgICBnZXRfdXNlcl91OChyZXR2YWwsIHZhZGRyKTsKLSAgICByZXR1cm4gcmV0dmFsOworICAg
IHJldHVybiBjcHVfbGR1Yl9kYXRhX3JhKGVudiwgdmFkZHIsIHJhKTsKIH0KIAogc3RhdGljIHVp
bnQxNl90IG1lbV9sb2FkMihDUFVIZXhhZ29uU3RhdGUgKmVudiwgdWludDMyX3Qgc2xvdCwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdGFyZ2V0X3Vsb25nIHZhZGRyKQogewotICAgIHVpbnQx
Nl90IHJldHZhbDsKKyAgICB1aW50cHRyX3QgcmEgPSBHRVRQQygpOwogICAgIGNoZWNrX25vc2h1
ZihlbnYsIHNsb3QpOwotICAgIGdldF91c2VyX3UxNihyZXR2YWwsIHZhZGRyKTsKLSAgICByZXR1
cm4gcmV0dmFsOworICAgIHJldHVybiBjcHVfbGR1d19kYXRhX3JhKGVudiwgdmFkZHIsIHJhKTsK
IH0KIAogc3RhdGljIHVpbnQzMl90IG1lbV9sb2FkNChDUFVIZXhhZ29uU3RhdGUgKmVudiwgdWlu
dDMyX3Qgc2xvdCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgdGFyZ2V0X3Vsb25nIHZhZGRy
KQogewotICAgIHVpbnQzMl90IHJldHZhbDsKKyAgICB1aW50cHRyX3QgcmEgPSBHRVRQQygpOwog
ICAgIGNoZWNrX25vc2h1ZihlbnYsIHNsb3QpOwotICAgIGdldF91c2VyX3UzMihyZXR2YWwsIHZh
ZGRyKTsKLSAgICByZXR1cm4gcmV0dmFsOworICAgIHJldHVybiBjcHVfbGRsX2RhdGFfcmEoZW52
LCB2YWRkciwgcmEpOwogfQogCiBzdGF0aWMgdWludDY0X3QgbWVtX2xvYWQ4KENQVUhleGFnb25T
dGF0ZSAqZW52LCB1aW50MzJfdCBzbG90LAogICAgICAgICAgICAgICAgICAgICAgICAgICB0YXJn
ZXRfdWxvbmcgdmFkZHIpCiB7Ci0gICAgdWludDY0X3QgcmV0dmFsOworICAgIHVpbnRwdHJfdCBy
YSA9IEdFVFBDKCk7CiAgICAgY2hlY2tfbm9zaHVmKGVudiwgc2xvdCk7Ci0gICAgZ2V0X3VzZXJf
dTY0KHJldHZhbCwgdmFkZHIpOwotICAgIHJldHVybiByZXR2YWw7CisgICAgcmV0dXJuIGNwdV9s
ZHFfZGF0YV9yYShlbnYsIHZhZGRyLCByYSk7CiB9CiAKIC8qIEZsb2F0aW5nIHBvaW50ICovCi0t
IAoyLjcuNAoK

