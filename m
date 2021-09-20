Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EA441281C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 23:33:30 +0200 (CEST)
Received: from localhost ([::1]:58872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSQum-0006Dw-RO
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 17:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mSQmM-0001fz-25
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:24:46 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:9862)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mSQmJ-00023A-Va
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1632173083; x=1663709083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VaetORzfT4gcwXkXdZ5+gtCtM9FwNebeuLD0ecgAWZ8=;
 b=sQQ9qp08lsPNUO+UE6wTSMSbOw62/yiLor+PidSM/vZS7PpALNKn/vBR
 71eK8Y9hJvtBL8vvAeDuy+nKdZrwNCA4yHY4LxjS6dfPD9BEB2tN28o70
 gKVdJYM9k5aMRbRTq3Ii2V0gonE4qBDOo/QEvfEXeYy40wW8M1ujL41J8 I=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Sep 2021 14:24:36 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 20 Sep 2021 14:24:36 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id A2E761418; Mon, 20 Sep 2021 16:24:35 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/30] Hexagon HVX (target/hexagon) semantics generator
Date: Mon, 20 Sep 2021 16:24:02 -0500
Message-Id: <1632173065-18522-8-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
CiB0YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5ICAgfCAxMyArKysrKysrKysrKysrCiAyIGZp
bGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdv
bi9nZW5fc2VtYW50aWNzLmMgYi90YXJnZXQvaGV4YWdvbi9nZW5fc2VtYW50aWNzLmMKaW5kZXgg
YzVmY2NlYy4uNGEyYmRkNyAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vZ2VuX3NlbWFudGlj
cy5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl9zZW1hbnRpY3MuYwpAQCAtNDQsNiArNDQsMTEg
QEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAqICAgICAgICAgUTZJTlNOKEEy
X2FkZCwiUmQzMj1hZGQoUnMzMixSdDMyKSIsQVRUUklCUygpLAogICogICAgICAgICAiQWRkIDMy
LWJpdCByZWdpc3RlcnMiLAogICogICAgICAgICB7IFJkVj1Sc1YrUnRWO30pCisgKiAgICAgSFZY
IGluc3RydWN0aW9ucyBoYXZlIHRoZSBmb2xsb3dpbmcgZm9ybQorICogICAgICAgICBFWFRJTlNO
KFY2X3ZpbnNlcnR3ciwgIlZ4MzIudz12aW5zZXJ0KFJ0MzIpIiwKKyAqICAgICAgICAgQVRUUklC
UyhBX0VYVEVOU0lPTixBX0NWSSxBX0NWSV9WWCksCisgKiAgICAgICAgICJJbnNlcnQgV29yZCBT
Y2FsYXIgaW50byBWZWN0b3IiLAorICogICAgICAgICBWeFYudXdbMF0gPSBSdFY7KQogICovCiAj
ZGVmaW5lIFE2SU5TTihUQUcsIEJFSCwgQVRUUklCUywgREVTQ1IsIFNFTSkgXAogICAgIGRvIHsg
XApAQCAtNTksOCArNjQsMjMgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAg
ICAgICAgICAgICAgICAgICAgICAgICAiKVxuIiwgXAogICAgICAgICAgICAgICAgICNUQUcsIFNU
UklOR0laRShBVFRSSUJTKSk7IFwKICAgICB9IHdoaWxlICgwKTsKKyNkZWZpbmUgRVhUSU5TTihU
QUcsIEJFSCwgQVRUUklCUywgREVTQ1IsIFNFTSkgXAorICAgIGRvIHsgXAorICAgICAgICBmcHJp
bnRmKG91dGZpbGUsICJTRU1BTlRJQ1MoIFxcXG4iIFwKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAiICAgIFwiJXNcIiwgXFxcbiIgXAorICAgICAgICAgICAgICAgICAgICAgICAgICIgICAgJXMs
IFxcXG4iIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAiICAgIFwiXCJcIiVzXCJcIlwiIFxc
XG4iIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAiKVxuIiwgXAorICAgICAgICAgICAgICAg
ICNUQUcsIFNUUklOR0laRShCRUgpLCBTVFJJTkdJWkUoU0VNKSk7IFwKKyAgICAgICAgZnByaW50
ZihvdXRmaWxlLCAiQVRUUklCVVRFUyggXFxcbiIgXAorICAgICAgICAgICAgICAgICAgICAgICAg
ICIgICAgXCIlc1wiLCBcXFxuIiBcCisgICAgICAgICAgICAgICAgICAgICAgICAgIiAgICBcIiVz
XCIgXFxcbiIgXAorICAgICAgICAgICAgICAgICAgICAgICAgICIpXG4iLCBcCisgICAgICAgICAg
ICAgICAgI1RBRywgU1RSSU5HSVpFKEFUVFJJQlMpKTsgXAorICAgIH0gd2hpbGUgKDApOwogI2lu
Y2x1ZGUgImltcG9ydGVkL2FsbGlkZWZzLmRlZiIKICN1bmRlZiBRNklOU04KKyN1bmRlZiBFWFRJ
TlNOCiAKIC8qCiAgKiBQcm9jZXNzIHRoZSBtYWNybyBkZWZpbml0aW9ucwpAQCAtODMsNiArMTAz
LDE5IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAjaW5jbHVkZSAiaW1wb3J0
ZWQvbWFjcm9zLmRlZiIKICN1bmRlZiBERUZfTUFDUk8KIAorLyoKKyAqIFByb2Nlc3MgdGhlIG1h
Y3JvcyBmb3IgSFZYCisgKi8KKyNkZWZpbmUgREVGX01BQ1JPKE1OQU1FLCBCRUgsIEFUVFJTKSBc
CisgICAgZnByaW50ZihvdXRmaWxlLCAiTUFDUk9BVFRSSUIoIFxcXG4iIFwKKyAgICAgICAgICAg
ICAgICAgICAgICIgICAgXCIlc1wiLCBcXFxuIiBcCisgICAgICAgICAgICAgICAgICAgICAiICAg
IFwiXCJcIiVzXCJcIlwiLCBcXFxuIiBcCisgICAgICAgICAgICAgICAgICAgICAiICAgIFwiJXNc
IiBcXFxuIiBcCisgICAgICAgICAgICAgICAgICAgICAiKVxuIiwgXAorICAgICAgICAgICAgI01O
QU1FLCBTVFJJTkdJWkUoQkVIKSwgU1RSSU5HSVpFKEFUVFJTKSk7CisjaW5jbHVkZSAiaW1wb3J0
ZWQvYWxsZXh0X21hY3Jvcy5kZWYiCisjdW5kZWYgREVGX01BQ1JPCisKICAgICBmY2xvc2Uob3V0
ZmlsZSk7CiAgICAgcmV0dXJuIDA7CiB9CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9oZXhf
Y29tbW9uLnB5IGIvdGFyZ2V0L2hleGFnb24vaGV4X2NvbW1vbi5weQppbmRleCBiM2I1MzQwLi40
N2ZiNjI4IDEwMDc1NQotLS0gYS90YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5CisrKyBiL3Rh
cmdldC9oZXhhZ29uL2hleF9jb21tb24ucHkKQEAgLTE0Myw2ICsxNDMsOSBAQCBkZWYgY29tcHV0
ZV90YWdfaW1tZWRpYXRlcyh0YWcpOgogIyMgICAgICAgICAgUCAgICAgICAgICAgICAgICBwcmVk
aWNhdGUgcmVnaXN0ZXIKICMjICAgICAgICAgIFIgICAgICAgICAgICAgICAgR1BSIHJlZ2lzdGVy
CiAjIyAgICAgICAgICBNICAgICAgICAgICAgICAgIG1vZGlmaWVyIHJlZ2lzdGVyCisjIyAgICAg
ICAgICBRICAgICAgICAgICAgICAgIEhWWCBwcmVkaWNhdGUgdmVjdG9yCisjIyAgICAgICAgICBW
ICAgICAgICAgICAgICAgIEhWWCB2ZWN0b3IgcmVnaXN0ZXIKKyMjICAgICAgICAgIE8gICAgICAg
ICAgICAgICAgSFZYIG5ldyB2ZWN0b3IgcmVnaXN0ZXIKICMjICAgICAgcmVnaWQgY2FuIGJlIG9u
ZSBvZiB0aGUgZm9sbG93aW5nCiAjIyAgICAgICAgICBkLCBlICAgICAgICAgICAgIGRlc3RpbmF0
aW9uIHJlZ2lzdGVyCiAjIyAgICAgICAgICBkZCAgICAgICAgICAgICAgIGRlc3RpbmF0aW9uIHJl
Z2lzdGVyIHBhaXIKQEAgLTE3OCw2ICsxODEsOSBAQCBkZWYgaXNfcmVhZHdyaXRlKHJlZ2lkKToK
IGRlZiBpc19zY2FsYXJfcmVnKHJlZ3R5cGUpOgogICAgIHJldHVybiByZWd0eXBlIGluICJSUEMi
CiAKK2RlZiBpc19odnhfcmVnKHJlZ3R5cGUpOgorICAgIHJldHVybiByZWd0eXBlIGluICJWUSIK
KwogZGVmIGlzX29sZF92YWwocmVndHlwZSwgcmVnaWQsIHRhZyk6CiAgICAgcmV0dXJuIHJlZ3R5
cGUrcmVnaWQrJ1YnIGluIHNlbWRpY3RbdGFnXQogCkBAIC0yMDEsNiArMjA3LDEzIEBAIGRlZiBu
ZWVkX2VhKHRhZyk6CiBkZWYgc2tpcF9xZW11X2hlbHBlcih0YWcpOgogICAgIHJldHVybiB0YWcg
aW4gb3ZlcnJpZGVzLmtleXMoKQogCitkZWYgaXNfdG1wX3Jlc3VsdCh0YWcpOgorICAgIHJldHVy
biAoJ0FfQ1ZJX1RNUCcgaW4gYXR0cmliZGljdFt0YWddIG9yCisgICAgICAgICAgICAnQV9DVklf
VE1QX0RTVCcgaW4gYXR0cmliZGljdFt0YWddKQorCitkZWYgaXNfbmV3X3Jlc3VsdCh0YWcpOgor
ICAgIHJldHVybiAoJ0FfQ1ZJX05FVycgaW4gYXR0cmliZGljdFt0YWddKQorCiBkZWYgaW1tX25h
bWUoaW1tbGV0dCk6CiAgICAgcmV0dXJuICIlc2lWIiAlIGltbWxldHQKIAotLSAKMi43LjQKCg==

