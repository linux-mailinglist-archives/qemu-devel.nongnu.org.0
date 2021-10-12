Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940B342A2A9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 12:52:49 +0200 (CEST)
Received: from localhost ([::1]:39810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFOq-0005cv-GB
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 06:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1maElZ-00015Z-EM
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:12:13 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:64100)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1maElW-0007Fq-6b
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1634033530; x=1665569530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QrgjOSAQ4BdDEt4ME1dUQIpj3DiCdnF0aVXkLPPiGpU=;
 b=Q8cMnx1mIyDB6QEZ1ucIoHTf1ZTROrGbo2KHm1AAdM6AQeUmvXVK5Bx2
 A5vjcQ6rUTQT4KW+5rjQCGaJmq1du9fm8ABFVE4EFG0EcmhNB+x0dlsiG
 IXj81Tt4mWGWhus3HSwFJ/BpreUUmSKp+rnr7IWIEAp7XHftzi4gHHabQ E=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Oct 2021 03:11:24 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 12 Oct 2021 03:11:24 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 7C2E617A8; Tue, 12 Oct 2021 05:11:22 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 27/30] Hexagon HVX (tests/tcg/hexagon) vector_add_int test
Date: Tue, 12 Oct 2021 05:11:05 -0500
Message-Id: <1634033468-23566-28-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
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

U2lnbmUtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQog
dGVzdHMvdGNnL2hleGFnb24vdmVjdG9yX2FkZF9pbnQuYyB8IDYxICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiB0ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQg
IHwgIDMgKysKIDIgZmlsZXMgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHRlc3RzL3RjZy9oZXhhZ29uL3ZlY3Rvcl9hZGRfaW50LmMKCmRpZmYgLS1naXQgYS90
ZXN0cy90Y2cvaGV4YWdvbi92ZWN0b3JfYWRkX2ludC5jIGIvdGVzdHMvdGNnL2hleGFnb24vdmVj
dG9yX2FkZF9pbnQuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5kNjAxMGVh
Ci0tLSAvZGV2L251bGwKKysrIGIvdGVzdHMvdGNnL2hleGFnb24vdmVjdG9yX2FkZF9pbnQuYwpA
QCAtMCwwICsxLDYxIEBACisvKgorICogIENvcHlyaWdodChjKSAyMDE5LTIwMjEgUXVhbGNvbW0g
SW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAqCisgKiAgVGhp
cyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9v
ciBtb2RpZnkKKyAqICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQorICogIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCisgKiAgKGF0IHlvdXIgb3B0
aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KKyAqCisgKiAgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1
dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgKiAgYnV0IFdJVEhPVVQg
QU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyAqICBN
RVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUg
dGhlCisgKiAgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyAq
CisgKiAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UKKyAqICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCBzZWUg
PGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorICovCisKKyNpbmNsdWRlIDxzdGRpby5o
PgorCitpbnQgZ0FbNDAxXTsKK2ludCBnQls0MDFdOworaW50IGdDWzQwMV07CisKK3ZvaWQgdmVj
dG9yX2FkZF9pbnQoKQoreworICBpbnQgaTsKKyAgZm9yIChpID0gMDsgaSA8IDQwMDsgaSsrKSB7
CisgICAgZ0FbaV0gPSBnQltpXSArIGdDW2ldOworICB9Cit9CisKK2ludCBtYWluKCkKK3sKKyAg
aW50IGVycm9yID0gMDsKKyAgaW50IGk7CisgIGZvciAoaSA9IDA7IGkgPCA0MDA7IGkrKykgewor
ICAgIGdCW2ldID0gaSAqIDI7CisgICAgZ0NbaV0gPSBpICogMzsKKyAgfQorICBnQVs0MDBdID0g
MTc7CisgIHZlY3Rvcl9hZGRfaW50KCk7CisgIGZvciAoaSA9IDA7IGkgPCA0MDA7IGkrKykgewor
ICAgIGlmIChnQVtpXSAhPSBpICogNSkgeworICAgICAgICBlcnJvcisrOworICAgICAgICBwcmlu
dGYoIkVSUk9SOiBnQlslZF0gPSAlZFx0IiwgaSwgZ0JbaV0pOworICAgICAgICBwcmludGYoImdD
WyVkXSA9ICVkXHQiLCBpLCBnQ1tpXSk7CisgICAgICAgIHByaW50ZigiZ0FbJWRdID0gJWRcbiIs
IGksIGdBW2ldKTsKKyAgICB9CisgIH0KKyAgaWYgKGdBWzQwMF0gIT0gMTcpIHsKKyAgICBlcnJv
cisrOworICAgIHByaW50ZigiRVJST1I6IE92ZXJyYW4gdGhlIGJ1ZmZlclxuIik7CisgIH0KKyAg
aWYgKCFlcnJvcikgeworICAgIHByaW50ZigiUEFTU1xuIik7CisgICAgcmV0dXJuIDA7CisgIH0g
ZWxzZSB7CisgICAgcHJpbnRmKCJGQUlMXG4iKTsKKyAgICByZXR1cm4gMTsKKyAgfQorfQpkaWZm
IC0tZ2l0IGEvdGVzdHMvdGNnL2hleGFnb24vTWFrZWZpbGUudGFyZ2V0IGIvdGVzdHMvdGNnL2hl
eGFnb24vTWFrZWZpbGUudGFyZ2V0CmluZGV4IGMxZTE2NTAuLmIwMTBlZGMgMTAwNjQ0Ci0tLSBh
L3Rlc3RzL3RjZy9oZXhhZ29uL01ha2VmaWxlLnRhcmdldAorKysgYi90ZXN0cy90Y2cvaGV4YWdv
bi9NYWtlZmlsZS50YXJnZXQKQEAgLTM4LDcgKzM4LDEwIEBAIEhFWF9URVNUUyArPSBjaXJjCiBI
RVhfVEVTVFMgKz0gYnJldgogSEVYX1RFU1RTICs9IGxvYWRfdW5wYWNrCiBIRVhfVEVTVFMgKz0g
bG9hZF9hbGlnbgorSEVYX1RFU1RTICs9IHZlY3Rvcl9hZGRfaW50CiBIRVhfVEVTVFMgKz0gYXRv
bWljcwogSEVYX1RFU1RTICs9IGZwc3R1ZmYKIAogVEVTVFMgKz0gJChIRVhfVEVTVFMpCisKK3Zl
Y3Rvcl9hZGRfaW50OiBDRkxBR1MgKz0gLW1odnggLWZ2ZWN0b3JpemUKLS0gCjIuNy40Cgo=

