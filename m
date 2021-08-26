Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B6D3F8D53
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:51:25 +0200 (CEST)
Received: from localhost ([::1]:56040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJXA-0000is-O6
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJIm-0004SS-49
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:36:32 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:48465)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJIj-00058q-PQ
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:36:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1629999389; x=1661535389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yei8NMkCFC6VxIkfY2k7kdToRDLEY6rgbGETY+k2iMM=;
 b=rNTxXh/X6VDDqXWnMvzfBFkUzb4GxslIcFa1HOIfAUJa8Tx6RPOtg3cV
 dL64jh3vooFjDW8TiExgSacxWtaZZ8tN6IHFSxOrFEHpYQFI+LK01CHur
 tYMhjxq3XPuLtjNI1mWdT/Vv1e/RXFKPEDAj+4unbOEYxwTGsvxCXyaMv I=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Aug 2021 10:36:16 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 26 Aug 2021 10:36:15 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 8503B167F; Thu, 26 Aug 2021 12:36:13 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/30] Hexagon HVX (target/hexagon) helper overrides -
 vector logical ops
Date: Thu, 26 Aug 2021 12:35:46 -0500
Message-Id: <1629999358-25304-19-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629999358-25304-1-git-send-email-tsimpson@quicinc.com>
References: <1629999358-25304-1-git-send-email-tsimpson@quicinc.com>
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
Cc: ale@rev.ng, bcain@quicinc.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggfCA1MiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oIGIvdGFyZ2V0L2hleGFn
b24vZ2VuX3RjZ19odnguaAppbmRleCBhYTM5ZjkyLi4wMmEyOWUwIDEwMDY0NAotLS0gYS90YXJn
ZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4
LmgKQEAgLTM0Niw0ICszNDYsNTYgQEAKICAgICB0Y2dfZ2VuX2d2ZWNfdW1pbihNT184LCBWZFZf
b2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCiAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1N
VmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKIAorLyogVmVjdG9yIGxvZ2ljYWwgb3BzICovCisj
ZGVmaW5lIGZHRU5fVENHX1Y2X3Z4b3IoU0hPUlRDT0RFKSBcCisgICAgdGNnX2dlbl9ndmVjX3hv
cihNT182NCwgVmRWX29mZiwgVnVWX29mZiwgVnZWX29mZiwgXAorICAgICAgICAgICAgICAgICAg
ICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKKworI2RlZmluZSBmR0VOX1RD
R19WNl92YW5kKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19hbmQoTU9fNjQsIFZkVl9v
ZmYsIFZ1Vl9vZmYsIFZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZl
Y3RvciksIHNpemVvZihNTVZlY3RvcikpCisKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdm9yKFNIT1JU
Q09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19vcihNT182NCwgVmRWX29mZiwgVnVWX29mZiwgVnZW
X29mZiwgXAorICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1W
ZWN0b3IpKQorCisjZGVmaW5lIGZHRU5fVENHX1Y2X3Zub3QoU0hPUlRDT0RFKSBcCisgICAgdGNn
X2dlbl9ndmVjX25vdChNT182NCwgVmRWX29mZiwgVnVWX29mZiwgXAorICAgICAgICAgICAgICAg
ICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKKworLyogUSByZWdpc3Rl
ciBsb2dpY2FsIG9wcyAqLworI2RlZmluZSBmR0VOX1RDR19WNl9wcmVkX29yKFNIT1JUQ09ERSkg
XAorICAgIHRjZ19nZW5fZ3ZlY19vcihNT182NCwgUWRWX29mZiwgUXNWX29mZiwgUXRWX29mZiwg
XAorICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1RUmVnKSwgc2l6ZW9mKE1NUVJlZykpCisK
KyNkZWZpbmUgZkdFTl9UQ0dfVjZfcHJlZF9hbmQoU0hPUlRDT0RFKSBcCisgICAgdGNnX2dlbl9n
dmVjX2FuZChNT182NCwgUWRWX29mZiwgUXNWX29mZiwgUXRWX29mZiwgXAorICAgICAgICAgICAg
ICAgICAgICAgc2l6ZW9mKE1NUVJlZyksIHNpemVvZihNTVFSZWcpKQorCisjZGVmaW5lIGZHRU5f
VENHX1Y2X3ByZWRfeG9yKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY194b3IoTU9fNjQs
IFFkVl9vZmYsIFFzVl9vZmYsIFF0Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVv
ZihNTVFSZWcpLCBzaXplb2YoTU1RUmVnKSkKKworI2RlZmluZSBmR0VOX1RDR19WNl9wcmVkX29y
X24oU0hPUlRDT0RFKSBcCisgICAgZG8geyBcCisgICAgICAgIGludHB0cl90IHRtcG9mZiA9IG9m
ZnNldG9mKENQVUhleGFnb25TdGF0ZSwgcXRtcCk7IFwKKyAgICAgICAgdGNnX2dlbl9ndmVjX25v
dChNT182NCwgdG1wb2ZmLCBRdFZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICAgICAgc2l6
ZW9mKE1NUVJlZyksIHNpemVvZihNTVFSZWcpKTsgXAorICAgICAgICB0Y2dfZ2VuX2d2ZWNfb3Io
TU9fNjQsIFFkVl9vZmYsIFFzVl9vZmYsIHRtcG9mZiwgXAorICAgICAgICAgICAgICAgICAgICAg
ICAgc2l6ZW9mKE1NUVJlZyksIHNpemVvZihNTVFSZWcpKTsgXAorICAgIH0gd2hpbGUgKDApCisK
KyNkZWZpbmUgZkdFTl9UQ0dfVjZfcHJlZF9hbmRfbihTSE9SVENPREUpIFwKKyAgICBkbyB7IFwK
KyAgICAgICAgaW50cHRyX3QgdG1wb2ZmID0gb2Zmc2V0b2YoQ1BVSGV4YWdvblN0YXRlLCBxdG1w
KTsgXAorICAgICAgICB0Y2dfZ2VuX2d2ZWNfbm90KE1PXzY0LCB0bXBvZmYsIFF0Vl9vZmYsIFwK
KyAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1RUmVnKSwgc2l6ZW9mKE1NUVJlZykp
OyBcCisgICAgICAgIHRjZ19nZW5fZ3ZlY19hbmQoTU9fNjQsIFFkVl9vZmYsIFFzVl9vZmYsIHRt
cG9mZiwgXAorICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVFSZWcpLCBzaXplb2Yo
TU1RUmVnKSk7IFwKKyAgICB9IHdoaWxlICgwKQorCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ByZWRf
bm90KFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19ub3QoTU9fNjQsIFFkVl9vZmYsIFFz
Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVFSZWcpLCBzaXplb2YoTU1R
UmVnKSkKKwogI2VuZGlmCi0tIAoyLjcuNAoK

