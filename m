Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A8E444A27
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 22:20:55 +0100 (CET)
Received: from localhost ([::1]:50562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miNgk-0000Jc-4I
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 17:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1miNdc-0002mu-Pk
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:17:40 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:11448)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1miNda-0007DJ-TK
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:17:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635974258; x=1667510258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XC6rw9A7F+UcRCM9yFYGKw/EEw6WCO/AGuJcBv03rzs=;
 b=UxNo/CVq9OMpUgvt4c41oADplAPktRE5+4zOW/JH1PR59rUFDKR7I/Q7
 OTtY8gg6+WeinHD5DW0aUrIrYaIfWFbKAxP1Nj3lYxu+mAl5NFzdewDYv
 O4rtlNPbPH3AjPe8513CI4kZc82w6QKwOPycs2FlsudWRlgqfvg163cb6 U=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 03 Nov 2021 14:17:30 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 03 Nov 2021 14:17:30 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id BAB76304D; Wed,  3 Nov 2021 16:17:28 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 16/30] Hexagon HVX (target/hexagon) helper overrides -
 vector add & sub
Date: Wed,  3 Nov 2021 16:17:13 -0500
Message-Id: <1635974247-1820-17-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635974247-1820-1-git-send-email-tsimpson@quicinc.com>
References: <1635974247-1820-1-git-send-email-tsimpson@quicinc.com>
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnPgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+
Ci0tLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaCB8IDUwICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggYi90YXJnZXQv
aGV4YWdvbi9nZW5fdGNnX2h2eC5oCmluZGV4IDkxNjIzMGUuLmFjMjE0M2UgMTAwNjQ0Ci0tLSBh
L3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmgKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3Rj
Z19odnguaApAQCAtMTU1LDQgKzE1NSw1NCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYXNzZXJ0X3Zo
aXN0X3RtcChEaXNhc0NvbnRleHQgKmN0eCkKICNkZWZpbmUgZkdFTl9UQ0dfVjZfdm5jbW92KFNI
T1JUQ09ERSkgXAogICAgIGZHRU5fVENHX1ZFQ19DTU9WKDApCiAKKy8qIFZlY3RvciBhZGQgLSB2
YXJpb3VzIGZvcm1zICovCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZhZGRiKFNIT1JUQ09ERSkgXAor
ICAgIHRjZ19nZW5fZ3ZlY19hZGQoTU9fOCwgVmRWX29mZiwgVnVWX29mZiwgVnZWX29mZiwgXAor
ICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkK
KworI2RlZmluZSBmR0VOX1RDR19WNl92YWRkaChTSE9SVENZREUpIFwKKyAgICB0Y2dfZ2VuX2d2
ZWNfYWRkKE1PXzE2LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAgICAgICAg
ICAgICAgICBzaXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKQorCisjZGVmaW5lIGZH
RU5fVENHX1Y2X3ZhZGR3KFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19hZGQoTU9fMzIs
IFZkVl9vZmYsIFZ1Vl9vZmYsIFZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVv
ZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpCisKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdmFk
ZGJfZHYoU0hPUlRDT0RFKSBcCisgICAgdGNnX2dlbl9ndmVjX2FkZChNT184LCBWZGRWX29mZiwg
VnV1Vl9vZmYsIFZ2dlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0
b3IpICogMiwgc2l6ZW9mKE1NVmVjdG9yKSAqIDIpCisKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdmFk
ZGhfZHYoU0hPUlRDWURFKSBcCisgICAgdGNnX2dlbl9ndmVjX2FkZChNT18xNiwgVmRkVl9vZmYs
IFZ1dVZfb2ZmLCBWdnZWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVj
dG9yKSAqIDIsIHNpemVvZihNTVZlY3RvcikgKiAyKQorCisjZGVmaW5lIGZHRU5fVENHX1Y2X3Zh
ZGR3X2R2KFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19hZGQoTU9fMzIsIFZkZFZfb2Zm
LCBWdXVWX29mZiwgVnZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZl
Y3RvcikgKiAyLCBzaXplb2YoTU1WZWN0b3IpICogMikKKworLyogVmVjdG9yIHN1YiAtIHZhcmlv
dXMgZm9ybXMgKi8KKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdnN1YmIoU0hPUlRDT0RFKSBcCisgICAg
dGNnX2dlbl9ndmVjX3N1YihNT184LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAg
ICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKQorCisj
ZGVmaW5lIGZHRU5fVENHX1Y2X3ZzdWJoKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19z
dWIoTU9fMTYsIFZkVl9vZmYsIFZ1Vl9vZmYsIFZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAg
ICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpCisKKyNkZWZpbmUgZkdFTl9U
Q0dfVjZfdnN1YncoU0hPUlRDT0RFKSBcCisgICAgdGNnX2dlbl9ndmVjX3N1YihNT18zMiwgVmRW
X29mZiwgVnVWX29mZiwgVnZWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1N
VmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKKworI2RlZmluZSBmR0VOX1RDR19WNl92c3ViYl9k
dihTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfc3ViKE1PXzgsIFZkZFZfb2ZmLCBWdXVW
X29mZiwgVnZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3Rvcikg
KiAyLCBzaXplb2YoTU1WZWN0b3IpICogMikKKworI2RlZmluZSBmR0VOX1RDR19WNl92c3ViaF9k
dihTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfc3ViKE1PXzE2LCBWZGRWX29mZiwgVnV1
Vl9vZmYsIFZ2dlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3Ip
ICogMiwgc2l6ZW9mKE1NVmVjdG9yKSAqIDIpCisKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdnN1Yndf
ZHYoU0hPUlRDT0RFKSBcCisgICAgdGNnX2dlbl9ndmVjX3N1YihNT18zMiwgVmRkVl9vZmYsIFZ1
dVZfb2ZmLCBWdnZWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9y
KSAqIDIsIHNpemVvZihNTVZlY3RvcikgKiAyKQorCiAjZW5kaWYKLS0gCjIuNy40Cgo=

