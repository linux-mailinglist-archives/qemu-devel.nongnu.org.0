Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58FF3C9415
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 00:57:05 +0200 (CEST)
Received: from localhost ([::1]:55170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3noO-00085x-Tb
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 18:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m3nmn-0005xs-J8
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 18:55:25 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:13841)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m3nml-0002o5-CL
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 18:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1626303323; x=1657839323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sy8UhoHoxLv4XNIivUUYfhG0ldQxky+kpkIk88v941Q=;
 b=IFMgVi7OLBk8rbKEyATAlXcdq4vqjZKPMDG+hJFP0TiZCto+D5F0Zs5q
 PFH4VCMDGJpHxYNQm0omrT608OVVmJ+FIFCIAvPl8PMSnrZZV0TIKxvCR
 2hRa7mgZ+Ae+O0+XT0bweLPUjSDwuiKZqbwikWpCKzr78EsSIwonT7PS8 s=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Jul 2021 15:55:19 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 14 Jul 2021 15:55:18 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id D31374BF; Wed, 14 Jul 2021 17:55:18 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] Hexagon (target/hexagon) remove put_user_*/get_user_*
Date: Wed, 14 Jul 2021 17:55:08 -0500
Message-Id: <1626303309-7946-2-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626303309-7946-1-git-send-email-tsimpson@quicinc.com>
References: <1626303309-7946-1-git-send-email-tsimpson@quicinc.com>
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
Cc: ale@rev.ng, bcain@quicinc.com, alex.bennee@linaro.org,
 richard.henderson@linaro.org, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UmVwbGFjZSBwdXRfdXNlcl8qIHdpdGggY3B1X3N0Kl9kYXRhX3JhClJlcGxhY2UgZ2V0X3VzZXJf
KiB3aXRoIGNwdV9sZCpfZGF0YV9yYQoKU2luY2UgdGhlc2UgZnVuY3Rpb25zIG5lZWQgdGhlIFBD
LCB3ZSBtYXJrIGxvYWQvc3RvcmUgaW5zdHJ1Y3Rpb25zCndpdGggdGhlIEFfSU1QTElDSVRfUkVB
RFNfUEMgYXR0cmlidXRlIGluIGhleF9jb21tb24ucHkKClN1Z2dlc3RlZC1ieTogUmljaGFyZCBI
ZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFRh
eWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdvbi9v
cF9oZWxwZXIuYyAgIHwgMzkgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiB0YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5IHwgIDIgKysKIDIgZmlsZXMgY2hhbmdlZCwg
MjAgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hl
eGFnb24vb3BfaGVscGVyLmMgYi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYwppbmRleCA0NTk1
NTU5Li5jNWI3MDhkIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYworKysg
Yi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYwpAQCAtMTcsNiArMTcsNyBAQAogCiAjaW5jbHVk
ZSAicWVtdS9vc2RlcC5oIgogI2luY2x1ZGUgInFlbXUuaCIKKyNpbmNsdWRlICJleGVjL2NwdV9s
ZHN0LmgiCiAjaW5jbHVkZSAiZXhlYy9oZWxwZXItcHJvdG8uaCIKICNpbmNsdWRlICJmcHUvc29m
dGZsb2F0LmgiCiAjaW5jbHVkZSAiY3B1LmgiCkBAIC0xNDAsMjIgKzE0MSwyMiBAQCB2b2lkIEhF
TFBFUihkZWJ1Z19jaGVja19zdG9yZV93aWR0aCkoQ1BVSGV4YWdvblN0YXRlICplbnYsIGludCBz
bG90LCBpbnQgY2hlY2spCiAKIHZvaWQgSEVMUEVSKGNvbW1pdF9zdG9yZSkoQ1BVSGV4YWdvblN0
YXRlICplbnYsIGludCBzbG90X251bSkKIHsKLSAgICBzd2l0Y2ggKGVudi0+bWVtX2xvZ19zdG9y
ZXNbc2xvdF9udW1dLndpZHRoKSB7CisgICAgdGFyZ2V0X3Vsb25nIHBjID0gZW52LT5ncHJbSEVY
X1JFR19QQ107CisgICAgdWludDhfdCB3aWR0aCA9IGVudi0+bWVtX2xvZ19zdG9yZXNbc2xvdF9u
dW1dLndpZHRoOworICAgIHRhcmdldF91bG9uZyB2YSA9IGVudi0+bWVtX2xvZ19zdG9yZXNbc2xv
dF9udW1dLnZhOworCisgICAgc3dpdGNoICh3aWR0aCkgewogICAgIGNhc2UgMToKLSAgICAgICAg
cHV0X3VzZXJfdTgoZW52LT5tZW1fbG9nX3N0b3Jlc1tzbG90X251bV0uZGF0YTMyLAotICAgICAg
ICAgICAgICAgICAgICBlbnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS52YSk7CisgICAgICAg
IGNwdV9zdGJfZGF0YV9yYShlbnYsIHZhLCBlbnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS5k
YXRhMzIsIHBjKTsKICAgICAgICAgYnJlYWs7CiAgICAgY2FzZSAyOgotICAgICAgICBwdXRfdXNl
cl91MTYoZW52LT5tZW1fbG9nX3N0b3Jlc1tzbG90X251bV0uZGF0YTMyLAotICAgICAgICAgICAg
ICAgICAgICAgZW52LT5tZW1fbG9nX3N0b3Jlc1tzbG90X251bV0udmEpOworICAgICAgICBjcHVf
c3R3X2RhdGFfcmEoZW52LCB2YSwgZW52LT5tZW1fbG9nX3N0b3Jlc1tzbG90X251bV0uZGF0YTMy
LCBwYyk7CiAgICAgICAgIGJyZWFrOwogICAgIGNhc2UgNDoKLSAgICAgICAgcHV0X3VzZXJfdTMy
KGVudi0+bWVtX2xvZ19zdG9yZXNbc2xvdF9udW1dLmRhdGEzMiwKLSAgICAgICAgICAgICAgICAg
ICAgIGVudi0+bWVtX2xvZ19zdG9yZXNbc2xvdF9udW1dLnZhKTsKKyAgICAgICAgY3B1X3N0bF9k
YXRhX3JhKGVudiwgdmEsIGVudi0+bWVtX2xvZ19zdG9yZXNbc2xvdF9udW1dLmRhdGEzMiwgcGMp
OwogICAgICAgICBicmVhazsKICAgICBjYXNlIDg6Ci0gICAgICAgIHB1dF91c2VyX3U2NChlbnYt
Pm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS5kYXRhNjQsCi0gICAgICAgICAgICAgICAgICAgICBl
bnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS52YSk7CisgICAgICAgIGNwdV9zdHFfZGF0YV9y
YShlbnYsIHZhLCBlbnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS5kYXRhNjQsIHBjKTsKICAg
ICAgICAgYnJlYWs7CiAgICAgZGVmYXVsdDoKICAgICAgICAgZ19hc3NlcnRfbm90X3JlYWNoZWQo
KTsKQEAgLTM5MywzNyArMzk0LDMzIEBAIHN0YXRpYyB2b2lkIGNoZWNrX25vc2h1ZihDUFVIZXhh
Z29uU3RhdGUgKmVudiwgdWludDMyX3Qgc2xvdCkKIHN0YXRpYyB1aW50OF90IG1lbV9sb2FkMShD
UFVIZXhhZ29uU3RhdGUgKmVudiwgdWludDMyX3Qgc2xvdCwKICAgICAgICAgICAgICAgICAgICAg
ICAgICB0YXJnZXRfdWxvbmcgdmFkZHIpCiB7Ci0gICAgdWludDhfdCByZXR2YWw7CisgICAgdGFy
Z2V0X3Vsb25nIHBjID0gZW52LT5ncHJbSEVYX1JFR19QQ107CiAgICAgY2hlY2tfbm9zaHVmKGVu
diwgc2xvdCk7Ci0gICAgZ2V0X3VzZXJfdTgocmV0dmFsLCB2YWRkcik7Ci0gICAgcmV0dXJuIHJl
dHZhbDsKKyAgICByZXR1cm4gY3B1X2xkdWJfZGF0YV9yYShlbnYsIHZhZGRyLCBwYyk7CiB9CiAK
IHN0YXRpYyB1aW50MTZfdCBtZW1fbG9hZDIoQ1BVSGV4YWdvblN0YXRlICplbnYsIHVpbnQzMl90
IHNsb3QsCiAgICAgICAgICAgICAgICAgICAgICAgICAgIHRhcmdldF91bG9uZyB2YWRkcikKIHsK
LSAgICB1aW50MTZfdCByZXR2YWw7CisgICAgdGFyZ2V0X3Vsb25nIHBjID0gZW52LT5ncHJbSEVY
X1JFR19QQ107CiAgICAgY2hlY2tfbm9zaHVmKGVudiwgc2xvdCk7Ci0gICAgZ2V0X3VzZXJfdTE2
KHJldHZhbCwgdmFkZHIpOwotICAgIHJldHVybiByZXR2YWw7CisgICAgcmV0dXJuIGNwdV9sZHV3
X2RhdGFfcmEoZW52LCB2YWRkciwgcGMpOwogfQogCiBzdGF0aWMgdWludDMyX3QgbWVtX2xvYWQ0
KENQVUhleGFnb25TdGF0ZSAqZW52LCB1aW50MzJfdCBzbG90LAogICAgICAgICAgICAgICAgICAg
ICAgICAgICB0YXJnZXRfdWxvbmcgdmFkZHIpCiB7Ci0gICAgdWludDMyX3QgcmV0dmFsOworICAg
IHRhcmdldF91bG9uZyBwYyA9IGVudi0+Z3ByW0hFWF9SRUdfUENdOwogICAgIGNoZWNrX25vc2h1
ZihlbnYsIHNsb3QpOwotICAgIGdldF91c2VyX3UzMihyZXR2YWwsIHZhZGRyKTsKLSAgICByZXR1
cm4gcmV0dmFsOworICAgIHJldHVybiBjcHVfbGRsX2RhdGFfcmEoZW52LCB2YWRkciwgcGMpOwog
fQogCiBzdGF0aWMgdWludDY0X3QgbWVtX2xvYWQ4KENQVUhleGFnb25TdGF0ZSAqZW52LCB1aW50
MzJfdCBzbG90LAogICAgICAgICAgICAgICAgICAgICAgICAgICB0YXJnZXRfdWxvbmcgdmFkZHIp
CiB7Ci0gICAgdWludDY0X3QgcmV0dmFsOworICAgIHRhcmdldF91bG9uZyBwYyA9IGVudi0+Z3By
W0hFWF9SRUdfUENdOwogICAgIGNoZWNrX25vc2h1ZihlbnYsIHNsb3QpOwotICAgIGdldF91c2Vy
X3U2NChyZXR2YWwsIHZhZGRyKTsKLSAgICByZXR1cm4gcmV0dmFsOworICAgIHJldHVybiBjcHVf
bGRxX2RhdGFfcmEoZW52LCB2YWRkciwgcGMpOwogfQogCiAvKiBGbG9hdGluZyBwb2ludCAqLwpk
aWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vaGV4X2NvbW1vbi5weSBiL3RhcmdldC9oZXhhZ29u
L2hleF9jb21tb24ucHkKaW5kZXggYjNiNTM0MC4uMTY4NzJhMiAxMDA3NTUKLS0tIGEvdGFyZ2V0
L2hleGFnb24vaGV4X2NvbW1vbi5weQorKysgYi90YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5
CkBAIC02OSw2ICs2OSw4IEBAIGRlZiBhZGRfcWVtdV9tYWNyb19hdHRyaWIobmFtZSwgYXR0cmli
KToKIGRlZiBjYWxjdWxhdGVfYXR0cmlicygpOgogICAgIGFkZF9xZW11X21hY3JvX2F0dHJpYign
ZlJFQURfUEMnLCAnQV9JTVBMSUNJVF9SRUFEU19QQycpCiAgICAgYWRkX3FlbXVfbWFjcm9fYXR0
cmliKCdmVFJBUCcsICdBX0lNUExJQ0lUX1JFQURTX1BDJykKKyAgICBhZGRfcWVtdV9tYWNyb19h
dHRyaWIoJ2ZMT0FEJywgJ0FfSU1QTElDSVRfUkVBRFNfUEMnKQorICAgIGFkZF9xZW11X21hY3Jv
X2F0dHJpYignZlNUT1JFJywgJ0FfSU1QTElDSVRfUkVBRFNfUEMnKQogICAgIGFkZF9xZW11X21h
Y3JvX2F0dHJpYignZldSSVRFX1AwJywgJ0FfV1JJVEVTX1BSRURfUkVHJykKICAgICBhZGRfcWVt
dV9tYWNyb19hdHRyaWIoJ2ZXUklURV9QMScsICdBX1dSSVRFU19QUkVEX1JFRycpCiAgICAgYWRk
X3FlbXVfbWFjcm9fYXR0cmliKCdmV1JJVEVfUDInLCAnQV9XUklURVNfUFJFRF9SRUcnKQotLSAK
Mi43LjQKCg==

