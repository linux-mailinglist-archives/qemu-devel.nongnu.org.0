Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C375C41288F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 23:56:53 +0200 (CEST)
Received: from localhost ([::1]:35592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRHQ-00065d-PW
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 17:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mSQms-0002qF-J5
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:25:18 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:9868)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mSQmr-00028P-1J
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1632173116; x=1663709116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GhDi0Ss5MPsMVn6Qj/wwelW+QHd4g/miOjOV6ii0Qp8=;
 b=ZtC5jbGNQrFntzf6Mv7Ox6L0zLZMqlOAa764MOJyEtvAdEhp8Rz2mKDd
 TFHaEbqsZrLm+klIbKiT1SbLD0lbenbc4DU0C+wTLaavHa0GjNX2oAYZ5
 OX1lV1b7BpHwxT3jqC/D0JbJZlsX19SyDosnlruYaa1XYZpAt8AndsUPV A=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Sep 2021 14:24:37 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 20 Sep 2021 14:24:37 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id BF2F516D7; Mon, 20 Sep 2021 16:24:35 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/30] Hexagon HVX (target/hexagon) helper overrides -
 vector logical ops
Date: Mon, 20 Sep 2021 16:24:14 -0500
Message-Id: <1632173065-18522-20-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
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

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggfCA1MiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oIGIvdGFyZ2V0L2hleGFn
b24vZ2VuX3RjZ19odnguaAppbmRleCAwMDZiYTc0Li5iZDBhYmM2IDEwMDY0NAotLS0gYS90YXJn
ZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4
LmgKQEAgLTM2Myw0ICszNjMsNTYgQEAgc3RhdGljIGlubGluZSB2b2lkIGFzc2VydF92aGlzdF90
bXAoRGlzYXNDb250ZXh0ICpjdHgpCiAgICAgdGNnX2dlbl9ndmVjX3VtaW4oTU9fOCwgVmRWX29m
ZiwgVnVWX29mZiwgVnZWX29mZiwgXAogICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZl
Y3RvciksIHNpemVvZihNTVZlY3RvcikpCiAKKy8qIFZlY3RvciBsb2dpY2FsIG9wcyAqLworI2Rl
ZmluZSBmR0VOX1RDR19WNl92eG9yKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY194b3Io
TU9fNjQsIFZkVl9vZmYsIFZ1Vl9vZmYsIFZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAg
IHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpCisKKyNkZWZpbmUgZkdFTl9UQ0df
VjZfdmFuZChTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfYW5kKE1PXzY0LCBWZFZfb2Zm
LCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0
b3IpLCBzaXplb2YoTU1WZWN0b3IpKQorCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZvcihTSE9SVENP
REUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfb3IoTU9fNjQsIFZkVl9vZmYsIFZ1Vl9vZmYsIFZ2Vl9v
ZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVj
dG9yKSkKKworI2RlZmluZSBmR0VOX1RDR19WNl92bm90KFNIT1JUQ09ERSkgXAorICAgIHRjZ19n
ZW5fZ3ZlY19ub3QoTU9fNjQsIFZkVl9vZmYsIFZ1Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAg
ICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpCisKKy8qIFEgcmVnaXN0ZXIg
bG9naWNhbCBvcHMgKi8KKyNkZWZpbmUgZkdFTl9UQ0dfVjZfcHJlZF9vcihTSE9SVENPREUpIFwK
KyAgICB0Y2dfZ2VuX2d2ZWNfb3IoTU9fNjQsIFFkVl9vZmYsIFFzVl9vZmYsIFF0Vl9vZmYsIFwK
KyAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NUVJlZyksIHNpemVvZihNTVFSZWcpKQorCisj
ZGVmaW5lIGZHRU5fVENHX1Y2X3ByZWRfYW5kKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3Zl
Y19hbmQoTU9fNjQsIFFkVl9vZmYsIFFzVl9vZmYsIFF0Vl9vZmYsIFwKKyAgICAgICAgICAgICAg
ICAgICAgIHNpemVvZihNTVFSZWcpLCBzaXplb2YoTU1RUmVnKSkKKworI2RlZmluZSBmR0VOX1RD
R19WNl9wcmVkX3hvcihTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfeG9yKE1PXzY0LCBR
ZFZfb2ZmLCBRc1Zfb2ZmLCBRdFZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICBzaXplb2Yo
TU1RUmVnKSwgc2l6ZW9mKE1NUVJlZykpCisKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfcHJlZF9vcl9u
KFNIT1JUQ09ERSkgXAorICAgIGRvIHsgXAorICAgICAgICBpbnRwdHJfdCB0bXBvZmYgPSBvZmZz
ZXRvZihDUFVIZXhhZ29uU3RhdGUsIHF0bXApOyBcCisgICAgICAgIHRjZ19nZW5fZ3ZlY19ub3Qo
TU9fNjQsIHRtcG9mZiwgUXRWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVv
ZihNTVFSZWcpLCBzaXplb2YoTU1RUmVnKSk7IFwKKyAgICAgICAgdGNnX2dlbl9ndmVjX29yKE1P
XzY0LCBRZFZfb2ZmLCBRc1Zfb2ZmLCB0bXBvZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgICAg
IHNpemVvZihNTVFSZWcpLCBzaXplb2YoTU1RUmVnKSk7IFwKKyAgICB9IHdoaWxlICgwKQorCisj
ZGVmaW5lIGZHRU5fVENHX1Y2X3ByZWRfYW5kX24oU0hPUlRDT0RFKSBcCisgICAgZG8geyBcCisg
ICAgICAgIGludHB0cl90IHRtcG9mZiA9IG9mZnNldG9mKENQVUhleGFnb25TdGF0ZSwgcXRtcCk7
IFwKKyAgICAgICAgdGNnX2dlbl9ndmVjX25vdChNT182NCwgdG1wb2ZmLCBRdFZfb2ZmLCBcCisg
ICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NUVJlZyksIHNpemVvZihNTVFSZWcpKTsg
XAorICAgICAgICB0Y2dfZ2VuX2d2ZWNfYW5kKE1PXzY0LCBRZFZfb2ZmLCBRc1Zfb2ZmLCB0bXBv
ZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1RUmVnKSwgc2l6ZW9mKE1N
UVJlZykpOyBcCisgICAgfSB3aGlsZSAoMCkKKworI2RlZmluZSBmR0VOX1RDR19WNl9wcmVkX25v
dChTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfbm90KE1PXzY0LCBRZFZfb2ZmLCBRc1Zf
b2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1RUmVnKSwgc2l6ZW9mKE1NUVJl
ZykpCisKICNlbmRpZgotLSAKMi43LjQKCg==

