Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4559B3F8D4C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:50:35 +0200 (CEST)
Received: from localhost ([::1]:52736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJWH-0006qi-AG
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJIg-0004D3-UZ
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:36:26 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:54743)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJIe-00059Z-1I
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1629999384; x=1661535384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o6MT7T/U/Jx6tyEF3mkvjbYxpWf2evZ2PrbizdR30Xo=;
 b=T5Hj1IAemEt8mssJKBuCTtCvJPIKqNY/it64X17ZdjpM3u45EfAzQHM2
 DsZAbl9ZJiQ9/8QlDDlEGni69EMdaja48TEP9l31NBWgyjw/b+O1a96kb
 up2hwLWhWya4HNVFP2bhwmZ9N+lEP+nURSjx/zl8hbW23z/2GfsOOLGEB 0=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Aug 2021 10:36:15 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 26 Aug 2021 10:36:14 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 6A2611279; Thu, 26 Aug 2021 12:36:13 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/30] Hexagon HVX (target/hexagon) semantics generator
Date: Thu, 26 Aug 2021 12:35:35 -0500
Message-Id: <1629999358-25304-8-git-send-email-tsimpson@quicinc.com>
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

QWRkIEhWWCBzdXBwb3J0IHRvIHRoZSBzZW1hbnRpY3MgZ2VuZXJhdG9yCgpTaWduZWQtb2ZmLWJ5
OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFn
b24vZ2VuX3NlbWFudGljcy5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiB0YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5ICAgfCAxNiArKysrKysrKysrKysrKystCiAy
IGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fc2VtYW50aWNzLmMgYi90YXJnZXQvaGV4YWdvbi9nZW5f
c2VtYW50aWNzLmMKaW5kZXggYzVmY2NlYy4uNGEyYmRkNyAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hl
eGFnb24vZ2VuX3NlbWFudGljcy5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl9zZW1hbnRpY3Mu
YwpAQCAtNDQsNiArNDQsMTEgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAq
ICAgICAgICAgUTZJTlNOKEEyX2FkZCwiUmQzMj1hZGQoUnMzMixSdDMyKSIsQVRUUklCUygpLAog
ICogICAgICAgICAiQWRkIDMyLWJpdCByZWdpc3RlcnMiLAogICogICAgICAgICB7IFJkVj1Sc1Yr
UnRWO30pCisgKiAgICAgSFZYIGluc3RydWN0aW9ucyBoYXZlIHRoZSBmb2xsb3dpbmcgZm9ybQor
ICogICAgICAgICBFWFRJTlNOKFY2X3ZpbnNlcnR3ciwgIlZ4MzIudz12aW5zZXJ0KFJ0MzIpIiwK
KyAqICAgICAgICAgQVRUUklCUyhBX0VYVEVOU0lPTixBX0NWSSxBX0NWSV9WWCksCisgKiAgICAg
ICAgICJJbnNlcnQgV29yZCBTY2FsYXIgaW50byBWZWN0b3IiLAorICogICAgICAgICBWeFYudXdb
MF0gPSBSdFY7KQogICovCiAjZGVmaW5lIFE2SU5TTihUQUcsIEJFSCwgQVRUUklCUywgREVTQ1Is
IFNFTSkgXAogICAgIGRvIHsgXApAQCAtNTksOCArNjQsMjMgQEAgaW50IG1haW4oaW50IGFyZ2Ms
IGNoYXIgKmFyZ3ZbXSkKICAgICAgICAgICAgICAgICAgICAgICAgICAiKVxuIiwgXAogICAgICAg
ICAgICAgICAgICNUQUcsIFNUUklOR0laRShBVFRSSUJTKSk7IFwKICAgICB9IHdoaWxlICgwKTsK
KyNkZWZpbmUgRVhUSU5TTihUQUcsIEJFSCwgQVRUUklCUywgREVTQ1IsIFNFTSkgXAorICAgIGRv
IHsgXAorICAgICAgICBmcHJpbnRmKG91dGZpbGUsICJTRU1BTlRJQ1MoIFxcXG4iIFwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAiICAgIFwiJXNcIiwgXFxcbiIgXAorICAgICAgICAgICAgICAg
ICAgICAgICAgICIgICAgJXMsIFxcXG4iIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAiICAg
IFwiXCJcIiVzXCJcIlwiIFxcXG4iIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAiKVxuIiwg
XAorICAgICAgICAgICAgICAgICNUQUcsIFNUUklOR0laRShCRUgpLCBTVFJJTkdJWkUoU0VNKSk7
IFwKKyAgICAgICAgZnByaW50ZihvdXRmaWxlLCAiQVRUUklCVVRFUyggXFxcbiIgXAorICAgICAg
ICAgICAgICAgICAgICAgICAgICIgICAgXCIlc1wiLCBcXFxuIiBcCisgICAgICAgICAgICAgICAg
ICAgICAgICAgIiAgICBcIiVzXCIgXFxcbiIgXAorICAgICAgICAgICAgICAgICAgICAgICAgICIp
XG4iLCBcCisgICAgICAgICAgICAgICAgI1RBRywgU1RSSU5HSVpFKEFUVFJJQlMpKTsgXAorICAg
IH0gd2hpbGUgKDApOwogI2luY2x1ZGUgImltcG9ydGVkL2FsbGlkZWZzLmRlZiIKICN1bmRlZiBR
NklOU04KKyN1bmRlZiBFWFRJTlNOCiAKIC8qCiAgKiBQcm9jZXNzIHRoZSBtYWNybyBkZWZpbml0
aW9ucwpAQCAtODMsNiArMTAzLDE5IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10p
CiAjaW5jbHVkZSAiaW1wb3J0ZWQvbWFjcm9zLmRlZiIKICN1bmRlZiBERUZfTUFDUk8KIAorLyoK
KyAqIFByb2Nlc3MgdGhlIG1hY3JvcyBmb3IgSFZYCisgKi8KKyNkZWZpbmUgREVGX01BQ1JPKE1O
QU1FLCBCRUgsIEFUVFJTKSBcCisgICAgZnByaW50ZihvdXRmaWxlLCAiTUFDUk9BVFRSSUIoIFxc
XG4iIFwKKyAgICAgICAgICAgICAgICAgICAgICIgICAgXCIlc1wiLCBcXFxuIiBcCisgICAgICAg
ICAgICAgICAgICAgICAiICAgIFwiXCJcIiVzXCJcIlwiLCBcXFxuIiBcCisgICAgICAgICAgICAg
ICAgICAgICAiICAgIFwiJXNcIiBcXFxuIiBcCisgICAgICAgICAgICAgICAgICAgICAiKVxuIiwg
XAorICAgICAgICAgICAgI01OQU1FLCBTVFJJTkdJWkUoQkVIKSwgU1RSSU5HSVpFKEFUVFJTKSk7
CisjaW5jbHVkZSAiaW1wb3J0ZWQvYWxsZXh0X21hY3Jvcy5kZWYiCisjdW5kZWYgREVGX01BQ1JP
CisKICAgICBmY2xvc2Uob3V0ZmlsZSk7CiAgICAgcmV0dXJuIDA7CiB9CmRpZmYgLS1naXQgYS90
YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5IGIvdGFyZ2V0L2hleGFnb24vaGV4X2NvbW1vbi5w
eQppbmRleCBiM2I1MzQwLi5kYWY5YzkxIDEwMDc1NQotLS0gYS90YXJnZXQvaGV4YWdvbi9oZXhf
Y29tbW9uLnB5CisrKyBiL3RhcmdldC9oZXhhZ29uL2hleF9jb21tb24ucHkKQEAgLTE0Myw2ICsx
NDMsOSBAQCBkZWYgY29tcHV0ZV90YWdfaW1tZWRpYXRlcyh0YWcpOgogIyMgICAgICAgICAgUCAg
ICAgICAgICAgICAgICBwcmVkaWNhdGUgcmVnaXN0ZXIKICMjICAgICAgICAgIFIgICAgICAgICAg
ICAgICAgR1BSIHJlZ2lzdGVyCiAjIyAgICAgICAgICBNICAgICAgICAgICAgICAgIG1vZGlmaWVy
IHJlZ2lzdGVyCisjIyAgICAgICAgICBRICAgICAgICAgICAgICAgIEhWWCBwcmVkaWNhdGUgdmVj
dG9yCisjIyAgICAgICAgICBWICAgICAgICAgICAgICAgIEhWWCB2ZWN0b3IgcmVnaXN0ZXIKKyMj
ICAgICAgICAgIE8gICAgICAgICAgICAgICAgSFZYIG5ldyB2ZWN0b3IgcmVnaXN0ZXIKICMjICAg
ICAgcmVnaWQgY2FuIGJlIG9uZSBvZiB0aGUgZm9sbG93aW5nCiAjIyAgICAgICAgICBkLCBlICAg
ICAgICAgICAgIGRlc3RpbmF0aW9uIHJlZ2lzdGVyCiAjIyAgICAgICAgICBkZCAgICAgICAgICAg
ICAgIGRlc3RpbmF0aW9uIHJlZ2lzdGVyIHBhaXIKQEAgLTE3OCw2ICsxODEsOSBAQCBkZWYgaXNf
cmVhZHdyaXRlKHJlZ2lkKToKIGRlZiBpc19zY2FsYXJfcmVnKHJlZ3R5cGUpOgogICAgIHJldHVy
biByZWd0eXBlIGluICJSUEMiCiAKK2RlZiBpc19odnhfcmVnKHJlZ3R5cGUpOgorICAgIHJldHVy
biByZWd0eXBlIGluICJWUSIKKwogZGVmIGlzX29sZF92YWwocmVndHlwZSwgcmVnaWQsIHRhZyk6
CiAgICAgcmV0dXJuIHJlZ3R5cGUrcmVnaWQrJ1YnIGluIHNlbWRpY3RbdGFnXQogCkBAIC0xODcs
NyArMTkzLDggQEAgZGVmIGlzX25ld192YWwocmVndHlwZSwgcmVnaWQsIHRhZyk6CiBkZWYgbmVl
ZF9zbG90KHRhZyk6CiAgICAgaWYgKCdBX0NPTkRFWEVDJyBpbiBhdHRyaWJkaWN0W3RhZ10gb3IK
ICAgICAgICAgJ0FfU1RPUkUnIGluIGF0dHJpYmRpY3RbdGFnXSBvcgotICAgICAgICAnQV9MT0FE
JyBpbiBhdHRyaWJkaWN0W3RhZ10pOgorICAgICAgICAnQV9MT0FEJyBpbiBhdHRyaWJkaWN0W3Rh
Z10gb3IKKyAgICAgICAgJ0FfQ1ZJJyBpbiBhdHRyaWJkaWN0W3RhZ10pOgogICAgICAgICByZXR1
cm4gMQogICAgIGVsc2U6CiAgICAgICAgIHJldHVybiAwCkBAIC0yMDEsNiArMjA4LDEzIEBAIGRl
ZiBuZWVkX2VhKHRhZyk6CiBkZWYgc2tpcF9xZW11X2hlbHBlcih0YWcpOgogICAgIHJldHVybiB0
YWcgaW4gb3ZlcnJpZGVzLmtleXMoKQogCitkZWYgaXNfdG1wX3Jlc3VsdCh0YWcpOgorICAgIHJl
dHVybiAoJ0FfQ1ZJX1RNUCcgaW4gYXR0cmliZGljdFt0YWddIG9yCisgICAgICAgICAgICAnQV9D
VklfVE1QX0RTVCcgaW4gYXR0cmliZGljdFt0YWddKQorCitkZWYgaXNfbmV3X3Jlc3VsdCh0YWcp
OgorICAgIHJldHVybiAoJ0FfQ1ZJX05FVycgaW4gYXR0cmliZGljdFt0YWddKQorCiBkZWYgaW1t
X25hbWUoaW1tbGV0dCk6CiAgICAgcmV0dXJuICIlc2lWIiAlIGltbWxldHQKIAotLSAKMi43LjQK
Cg==

