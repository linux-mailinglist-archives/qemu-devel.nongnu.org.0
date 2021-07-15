Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7390F3CAE7D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 23:24:02 +0200 (CEST)
Received: from localhost ([::1]:44420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m48pt-0006CK-Ht
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 17:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m48oj-0004Gd-75
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 17:22:49 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:55897)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m48oh-0000h5-B5
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 17:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1626384167; x=1657920167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FqzCIsQOLsmvpaVhsZY/uTtd8uuoptSQtwznbvaiggU=;
 b=kUdRHcI7LNfiMKh+sArFxQg0bB0lh/8QB3XlP2j76L4OEw6tZ8TMsdNu
 jO9OrEis5kNGAK3Z/lRFT/VjhX9ExF30cgtgAMJTzjOar9J4LbAPL13G9
 jCNMVqRWkQtgF2kH+3VS/5AXaMFYlZpbToI99fbMqGR6VSh21JkRdB7QM Q=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Jul 2021 14:22:41 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 15 Jul 2021 14:22:41 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id D0F46FA6; Thu, 15 Jul 2021 16:22:40 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] Hexagon (target/hexagon) remove put_user_*/get_user_*
Date: Thu, 15 Jul 2021 16:22:35 -0500
Message-Id: <1626384156-6248-2-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626384156-6248-1-git-send-email-tsimpson@quicinc.com>
References: <1626384156-6248-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
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
Cc: ale@rev.ng, bcain@quicinc.com, alex.bennee@linaro.org,
 richard.henderson@linaro.org, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UmVwbGFjZSBwdXRfdXNlcl8qIHdpdGggY3B1X3N0Kl9kYXRhX3JhClJlcGxhY2UgZ2V0X3VzZXJf
KiB3aXRoIGNwdV9sZCpfZGF0YV9yYQoKU3VnZ2VzdGVkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8
cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBz
b24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIHRhcmdldC9oZXhhZ29uL29wX2hlbHBlci5j
IHwgMzkgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFy
Z2V0L2hleGFnb24vb3BfaGVscGVyLmMgYi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYwppbmRl
eCA0NTk1NTU5Li5hOTU5ZGJhIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIu
YworKysgYi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYwpAQCAtMTcsNiArMTcsNyBAQAogCiAj
aW5jbHVkZSAicWVtdS9vc2RlcC5oIgogI2luY2x1ZGUgInFlbXUuaCIKKyNpbmNsdWRlICJleGVj
L2NwdV9sZHN0LmgiCiAjaW5jbHVkZSAiZXhlYy9oZWxwZXItcHJvdG8uaCIKICNpbmNsdWRlICJm
cHUvc29mdGZsb2F0LmgiCiAjaW5jbHVkZSAiY3B1LmgiCkBAIC0xNDAsMjIgKzE0MSwyMiBAQCB2
b2lkIEhFTFBFUihkZWJ1Z19jaGVja19zdG9yZV93aWR0aCkoQ1BVSGV4YWdvblN0YXRlICplbnYs
IGludCBzbG90LCBpbnQgY2hlY2spCiAKIHZvaWQgSEVMUEVSKGNvbW1pdF9zdG9yZSkoQ1BVSGV4
YWdvblN0YXRlICplbnYsIGludCBzbG90X251bSkKIHsKLSAgICBzd2l0Y2ggKGVudi0+bWVtX2xv
Z19zdG9yZXNbc2xvdF9udW1dLndpZHRoKSB7CisgICAgdWludHB0cl90IHJhID0gR0VUUEMoKTsK
KyAgICB1aW50OF90IHdpZHRoID0gZW52LT5tZW1fbG9nX3N0b3Jlc1tzbG90X251bV0ud2lkdGg7
CisgICAgdGFyZ2V0X3Vsb25nIHZhID0gZW52LT5tZW1fbG9nX3N0b3Jlc1tzbG90X251bV0udmE7
CisKKyAgICBzd2l0Y2ggKHdpZHRoKSB7CiAgICAgY2FzZSAxOgotICAgICAgICBwdXRfdXNlcl91
OChlbnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS5kYXRhMzIsCi0gICAgICAgICAgICAgICAg
ICAgIGVudi0+bWVtX2xvZ19zdG9yZXNbc2xvdF9udW1dLnZhKTsKKyAgICAgICAgY3B1X3N0Yl9k
YXRhX3JhKGVudiwgdmEsIGVudi0+bWVtX2xvZ19zdG9yZXNbc2xvdF9udW1dLmRhdGEzMiwgcmEp
OwogICAgICAgICBicmVhazsKICAgICBjYXNlIDI6Ci0gICAgICAgIHB1dF91c2VyX3UxNihlbnYt
Pm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS5kYXRhMzIsCi0gICAgICAgICAgICAgICAgICAgICBl
bnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS52YSk7CisgICAgICAgIGNwdV9zdHdfZGF0YV9y
YShlbnYsIHZhLCBlbnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS5kYXRhMzIsIHJhKTsKICAg
ICAgICAgYnJlYWs7CiAgICAgY2FzZSA0OgotICAgICAgICBwdXRfdXNlcl91MzIoZW52LT5tZW1f
bG9nX3N0b3Jlc1tzbG90X251bV0uZGF0YTMyLAotICAgICAgICAgICAgICAgICAgICAgZW52LT5t
ZW1fbG9nX3N0b3Jlc1tzbG90X251bV0udmEpOworICAgICAgICBjcHVfc3RsX2RhdGFfcmEoZW52
LCB2YSwgZW52LT5tZW1fbG9nX3N0b3Jlc1tzbG90X251bV0uZGF0YTMyLCByYSk7CiAgICAgICAg
IGJyZWFrOwogICAgIGNhc2UgODoKLSAgICAgICAgcHV0X3VzZXJfdTY0KGVudi0+bWVtX2xvZ19z
dG9yZXNbc2xvdF9udW1dLmRhdGE2NCwKLSAgICAgICAgICAgICAgICAgICAgIGVudi0+bWVtX2xv
Z19zdG9yZXNbc2xvdF9udW1dLnZhKTsKKyAgICAgICAgY3B1X3N0cV9kYXRhX3JhKGVudiwgdmEs
IGVudi0+bWVtX2xvZ19zdG9yZXNbc2xvdF9udW1dLmRhdGE2NCwgcmEpOwogICAgICAgICBicmVh
azsKICAgICBkZWZhdWx0OgogICAgICAgICBnX2Fzc2VydF9ub3RfcmVhY2hlZCgpOwpAQCAtMzkz
LDM3ICszOTQsMzMgQEAgc3RhdGljIHZvaWQgY2hlY2tfbm9zaHVmKENQVUhleGFnb25TdGF0ZSAq
ZW52LCB1aW50MzJfdCBzbG90KQogc3RhdGljIHVpbnQ4X3QgbWVtX2xvYWQxKENQVUhleGFnb25T
dGF0ZSAqZW52LCB1aW50MzJfdCBzbG90LAogICAgICAgICAgICAgICAgICAgICAgICAgIHRhcmdl
dF91bG9uZyB2YWRkcikKIHsKLSAgICB1aW50OF90IHJldHZhbDsKKyAgICB1aW50cHRyX3QgcmEg
PSBHRVRQQygpOwogICAgIGNoZWNrX25vc2h1ZihlbnYsIHNsb3QpOwotICAgIGdldF91c2VyX3U4
KHJldHZhbCwgdmFkZHIpOwotICAgIHJldHVybiByZXR2YWw7CisgICAgcmV0dXJuIGNwdV9sZHVi
X2RhdGFfcmEoZW52LCB2YWRkciwgcmEpOwogfQogCiBzdGF0aWMgdWludDE2X3QgbWVtX2xvYWQy
KENQVUhleGFnb25TdGF0ZSAqZW52LCB1aW50MzJfdCBzbG90LAogICAgICAgICAgICAgICAgICAg
ICAgICAgICB0YXJnZXRfdWxvbmcgdmFkZHIpCiB7Ci0gICAgdWludDE2X3QgcmV0dmFsOworICAg
IHVpbnRwdHJfdCByYSA9IEdFVFBDKCk7CiAgICAgY2hlY2tfbm9zaHVmKGVudiwgc2xvdCk7Ci0g
ICAgZ2V0X3VzZXJfdTE2KHJldHZhbCwgdmFkZHIpOwotICAgIHJldHVybiByZXR2YWw7CisgICAg
cmV0dXJuIGNwdV9sZHV3X2RhdGFfcmEoZW52LCB2YWRkciwgcmEpOwogfQogCiBzdGF0aWMgdWlu
dDMyX3QgbWVtX2xvYWQ0KENQVUhleGFnb25TdGF0ZSAqZW52LCB1aW50MzJfdCBzbG90LAogICAg
ICAgICAgICAgICAgICAgICAgICAgICB0YXJnZXRfdWxvbmcgdmFkZHIpCiB7Ci0gICAgdWludDMy
X3QgcmV0dmFsOworICAgIHVpbnRwdHJfdCByYSA9IEdFVFBDKCk7CiAgICAgY2hlY2tfbm9zaHVm
KGVudiwgc2xvdCk7Ci0gICAgZ2V0X3VzZXJfdTMyKHJldHZhbCwgdmFkZHIpOwotICAgIHJldHVy
biByZXR2YWw7CisgICAgcmV0dXJuIGNwdV9sZGxfZGF0YV9yYShlbnYsIHZhZGRyLCByYSk7CiB9
CiAKIHN0YXRpYyB1aW50NjRfdCBtZW1fbG9hZDgoQ1BVSGV4YWdvblN0YXRlICplbnYsIHVpbnQz
Ml90IHNsb3QsCiAgICAgICAgICAgICAgICAgICAgICAgICAgIHRhcmdldF91bG9uZyB2YWRkcikK
IHsKLSAgICB1aW50NjRfdCByZXR2YWw7CisgICAgdWludHB0cl90IHJhID0gR0VUUEMoKTsKICAg
ICBjaGVja19ub3NodWYoZW52LCBzbG90KTsKLSAgICBnZXRfdXNlcl91NjQocmV0dmFsLCB2YWRk
cik7Ci0gICAgcmV0dXJuIHJldHZhbDsKKyAgICByZXR1cm4gY3B1X2xkcV9kYXRhX3JhKGVudiwg
dmFkZHIsIHJhKTsKIH0KIAogLyogRmxvYXRpbmcgcG9pbnQgKi8KLS0gCjIuNy40Cgo=

