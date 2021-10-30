Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEB34406D2
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 03:49:45 +0200 (CEST)
Received: from localhost ([::1]:37162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgdVA-0007Nw-9D
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 21:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mgd3k-00034V-V5
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 21:21:26 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:7471)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mgd3i-0001eC-D0
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 21:21:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635556882; x=1667092882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C6N3UQLENXKPxZvDpXcpbKeNef2SMKmfdFOU8iXZy8Q=;
 b=UMDPoOHbYC7k4MCo6L7yOo+MK3WUAi4NfW9F0Qj3Ra0TpaFp5YJgX226
 8GdPFoO/3tfHBnosrQ3wxjfKUC+9tRAN0+GDdueSM2/9P4iK8Wy2CnBZW
 vDIX8k0zWFD2z3gMU1XZ2OljhIcdVPFmXYxIRUa4qCDLughTu+zUl2gr8 o=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Oct 2021 18:20:59 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 29 Oct 2021 18:20:58 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 3077832EB; Fri, 29 Oct 2021 20:20:57 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 27/30] Hexagon HVX (tests/tcg/hexagon) vector_add_int test
Date: Fri, 29 Oct 2021 20:20:46 -0500
Message-Id: <1635556849-18120-28-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635556849-18120-1-git-send-email-tsimpson@quicinc.com>
References: <1635556849-18120-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
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

UmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnPgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+
Ci0tLQogdGVzdHMvdGNnL2hleGFnb24vdmVjdG9yX2FkZF9pbnQuYyB8IDYxICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50
YXJnZXQgIHwgIDMgKysKIDIgZmlsZXMgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHRlc3RzL3RjZy9oZXhhZ29uL3ZlY3Rvcl9hZGRfaW50LmMKCmRpZmYgLS1n
aXQgYS90ZXN0cy90Y2cvaGV4YWdvbi92ZWN0b3JfYWRkX2ludC5jIGIvdGVzdHMvdGNnL2hleGFn
b24vdmVjdG9yX2FkZF9pbnQuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5k
NjAxMGVhCi0tLSAvZGV2L251bGwKKysrIGIvdGVzdHMvdGNnL2hleGFnb24vdmVjdG9yX2FkZF9p
bnQuYwpAQCAtMCwwICsxLDYxIEBACisvKgorICogIENvcHlyaWdodChjKSAyMDE5LTIwMjEgUXVh
bGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAqCisg
KiAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0
IGFuZC9vciBtb2RpZnkKKyAqICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQorICogIHRoZSBGcmVlIFNvZnR3YXJlIEZv
dW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCisgKiAgKGF0IHlv
dXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KKyAqCisgKiAgVGhpcyBwcm9ncmFtIGlzIGRp
c3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgKiAgYnV0IFdJ
VEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YK
KyAqICBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0Uu
ICBTZWUgdGhlCisgKiAgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWls
cy4KKyAqCisgKiAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UKKyAqICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90
LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorICovCisKKyNpbmNsdWRlIDxz
dGRpby5oPgorCitpbnQgZ0FbNDAxXTsKK2ludCBnQls0MDFdOworaW50IGdDWzQwMV07CisKK3Zv
aWQgdmVjdG9yX2FkZF9pbnQoKQoreworICBpbnQgaTsKKyAgZm9yIChpID0gMDsgaSA8IDQwMDsg
aSsrKSB7CisgICAgZ0FbaV0gPSBnQltpXSArIGdDW2ldOworICB9Cit9CisKK2ludCBtYWluKCkK
K3sKKyAgaW50IGVycm9yID0gMDsKKyAgaW50IGk7CisgIGZvciAoaSA9IDA7IGkgPCA0MDA7IGkr
KykgeworICAgIGdCW2ldID0gaSAqIDI7CisgICAgZ0NbaV0gPSBpICogMzsKKyAgfQorICBnQVs0
MDBdID0gMTc7CisgIHZlY3Rvcl9hZGRfaW50KCk7CisgIGZvciAoaSA9IDA7IGkgPCA0MDA7IGkr
KykgeworICAgIGlmIChnQVtpXSAhPSBpICogNSkgeworICAgICAgICBlcnJvcisrOworICAgICAg
ICBwcmludGYoIkVSUk9SOiBnQlslZF0gPSAlZFx0IiwgaSwgZ0JbaV0pOworICAgICAgICBwcmlu
dGYoImdDWyVkXSA9ICVkXHQiLCBpLCBnQ1tpXSk7CisgICAgICAgIHByaW50ZigiZ0FbJWRdID0g
JWRcbiIsIGksIGdBW2ldKTsKKyAgICB9CisgIH0KKyAgaWYgKGdBWzQwMF0gIT0gMTcpIHsKKyAg
ICBlcnJvcisrOworICAgIHByaW50ZigiRVJST1I6IE92ZXJyYW4gdGhlIGJ1ZmZlclxuIik7Cisg
IH0KKyAgaWYgKCFlcnJvcikgeworICAgIHByaW50ZigiUEFTU1xuIik7CisgICAgcmV0dXJuIDA7
CisgIH0gZWxzZSB7CisgICAgcHJpbnRmKCJGQUlMXG4iKTsKKyAgICByZXR1cm4gMTsKKyAgfQor
fQpkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL2hleGFnb24vTWFrZWZpbGUudGFyZ2V0IGIvdGVzdHMv
dGNnL2hleGFnb24vTWFrZWZpbGUudGFyZ2V0CmluZGV4IDhiMDdhMjguLmM1OThhYzAgMTAwNjQ0
Ci0tLSBhL3Rlc3RzL3RjZy9oZXhhZ29uL01ha2VmaWxlLnRhcmdldAorKysgYi90ZXN0cy90Y2cv
aGV4YWdvbi9NYWtlZmlsZS50YXJnZXQKQEAgLTM4LDggKzM4LDExIEBAIEhFWF9URVNUUyArPSBj
aXJjCiBIRVhfVEVTVFMgKz0gYnJldgogSEVYX1RFU1RTICs9IGxvYWRfdW5wYWNrCiBIRVhfVEVT
VFMgKz0gbG9hZF9hbGlnbgorSEVYX1RFU1RTICs9IHZlY3Rvcl9hZGRfaW50CiBIRVhfVEVTVFMg
Kz0gYXRvbWljcwogSEVYX1RFU1RTICs9IGZwc3R1ZmYKIEhFWF9URVNUUyArPSBvdmVyZmxvdwog
CiBURVNUUyArPSAkKEhFWF9URVNUUykKKwordmVjdG9yX2FkZF9pbnQ6IENGTEFHUyArPSAtbWh2
eCAtZnZlY3Rvcml6ZQotLSAKMi43LjQKCg==

