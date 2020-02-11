Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D3E15872C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 02:00:28 +0100 (CET)
Received: from localhost ([::1]:41794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1Jud-0005cc-PJ
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 20:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33533)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tsimpson@qualcomm.com>) id 1j1Jce-00029E-7G
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:41:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tsimpson@qualcomm.com>) id 1j1Jcd-0000ql-1L
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:41:52 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:59197)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tsimpson@qualcomm.com>)
 id 1j1Jcc-0004rC-Le
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1581381710; x=1612917710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uGi5ah7caznBd1QQl82rntMxjaJe5m7EArAf9o9u7nc=;
 b=WGzJJ3L5dMymjVHLOjgIEZvlyDZw+hTLSVOod58pzCtk2UvMQYEy4Ewd
 R/++NKC9VFPxKhtv/Z/aKFfTYtg6Ne2yXcOEDttKd7Xx0g9w/LfPZnzAg
 ERoJGspnKKnMK+MPQL1hizPEdNdhtQWV9lIGdOg1VjfS9i+goUxSYmlWD I=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Feb 2020 16:41:02 -0800
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 10 Feb 2020 16:41:01 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 8AE191B5F; Mon, 10 Feb 2020 18:41:01 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 45/66] Hexagon TCG generation - step 08
Date: Mon, 10 Feb 2020 18:40:23 -0600
Message-Id: <1581381644-13678-46-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581381644-13678-1-git-send-email-tsimpson@quicinc.com>
References: <1581381644-13678-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 199.106.114.39
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
Cc: riku.voipio@iki.fi, richard.henderson@linaro.org, laurent@vivier.eu,
 Taylor Simpson <tsimpson@quicinc.com>, philmd@redhat.com,
 aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T3ZlcnJpZGUgbWF0aGVtYXRpY2FsIG9wZXJhdGlvbnMgd2l0aCBtb3JlIHRoYW4gb25lIGRlZmlu
aXRpb24KClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNv
bT4KLS0tCiB0YXJnZXQvaGV4YWdvbi9oZWxwZXJfb3ZlcnJpZGVzLmggfCAzMCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vaGVscGVyX292ZXJyaWRlcy5oIGIvdGFyZ2V0L2hl
eGFnb24vaGVscGVyX292ZXJyaWRlcy5oCmluZGV4IGM3NTUwZDUuLmU1NDRkZDUgMTAwNjQ0Ci0t
LSBhL3RhcmdldC9oZXhhZ29uL2hlbHBlcl9vdmVycmlkZXMuaAorKysgYi90YXJnZXQvaGV4YWdv
bi9oZWxwZXJfb3ZlcnJpZGVzLmgKQEAgLTEyMDAsNCArMTIwMCwzNCBAQAogI2RlZmluZSBmV1JB
UF9TTDJfcmV0dXJuX2ZuZXcoR0VOSExQUiwgU0hPUlRDT0RFKSBcCiAgICAgZldSQVBfQ09ORF9S
RVRVUk5fU1VCSU5TTihmTFNCTkVXME5PVCkKIAorLyoKKyAqIE1hdGhlbWF0aWNhbCBvcGVyYXRp
b25zIHdpdGggbW9yZSB0aGFuIG9uZSBkZWZpbml0aW9uIHJlcXVpcmUKKyAqIHNwZWNpYWwgaGFu
ZGxpbmcKKyAqLworLyoKKyAqIEFwcHJveGltYXRlIHJlY2lwcm9jYWwKKyAqIHIzLHAxID0gc2Zy
ZWNpcGEocjAsIHIxKQorICovCisjZGVmaW5lIGZXUkFQX0YyX3NmcmVjaXBhKEdFTkhMUFIsIFNI
T1JUQ09ERSkgXAorICAgIGRvIHsgXAorICAgICAgICBnZW5faGVscGVyX3NmcmVjaXBhX3ZhbChS
ZFYsIGNwdV9lbnYsIFJzViwgUnRWKTsgIFwKKyAgICAgICAgZ2VuX2hlbHBlcl9zZnJlY2lwYV9w
cmVkKFBlViwgY3B1X2VudiwgUnNWLCBSdFYpOyAgXAorICAgIH0gd2hpbGUgKDApCisKKy8qCisg
KiBBcHByb3hpbWF0aW9uIG9mIHRoZSByZWNpcHJvY2FsIHNxdWFyZSByb290CisgKiByMSxwMCA9
IHNmaW52c3FydGEocjApCisgKi8KKyNkZWZpbmUgZldSQVBfRjJfc2ZpbnZzcXJ0YShHRU5ITFBS
LCBTSE9SVENPREUpIFwKKyAgICBkbyB7IFwKKyAgICAgICAgZ2VuX2hlbHBlcl9zZmludnNxcnRh
X3ZhbChSZFYsIGNwdV9lbnYsIFJzVik7IFwKKyAgICAgICAgZ2VuX2hlbHBlcl9zZmludnNxcnRh
X3ByZWQoUGVWLCBjcHVfZW52LCBSc1YpOyBcCisgICAgfSB3aGlsZSAoMCkKKworI2RlZmluZSBm
V1JBUF9BNV9BQ1MoR0VOSExQUiwgU0hPUlRDT0RFKSBcCisgICAgZG8geyBcCisgICAgICAgIGdl
bl9oZWxwZXJfdmFjc2hfdmFsKFJ4eFYsIGNwdV9lbnYsIFJ4eFYsIFJzc1YsIFJ0dFYpOyBcCisg
ICAgICAgIGdlbl9oZWxwZXJfdmFjc2hfcHJlZChQZVYsIGNwdV9lbnYsIFJ4eFYsIFJzc1YsIFJ0
dFYpOyBcCisgICAgfSB3aGlsZSAoMCkKKwogI2VuZGlmCi0tIAoyLjcuNAoK

