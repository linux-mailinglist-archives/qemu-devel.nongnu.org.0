Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71C642A1C0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 12:16:49 +0200 (CEST)
Received: from localhost ([::1]:45356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maEq0-00046v-N8
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 06:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1maEkv-0000Ws-3A
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:11:33 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:12894)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1maEkt-0007HY-0a
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:11:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1634033491; x=1665569491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g9R1vRfdagec/a9VxyFTac7JPkP0JPaSU/5EiQHOoRs=;
 b=O77zmNc0JjPeRVmRYTt1GwYLdREbn0fueI7G0tTLp65RDHLzfKm4HcGJ
 OAiLIUwf4iZEhG5rnaG/KQEtV/SvExy6t8NAiSacOpA7CDG77JOsymtzj
 s7j6qNbL+Idhivbp8RSVyNpeO71B2eOyL0pCrRJnDtttaEYCP+RevrTWG w=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 12 Oct 2021 03:11:24 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 12 Oct 2021 03:11:22 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 412151279; Tue, 12 Oct 2021 05:11:22 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/30] Hexagon HVX (target/hexagon) instruction attributes
Date: Tue, 12 Oct 2021 05:10:42 -0500
Message-Id: <1634033468-23566-5-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
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

QWNrZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3Jn
PgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0t
LQogdGFyZ2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5pbmMgfCAyMiArKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rh
cmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmguaW5jIGIvdGFyZ2V0L2hleGFnb24vYXR0cmlic19k
ZWYuaC5pbmMKaW5kZXggMzgxNTUwOS4uNDEzOGE3YSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFn
b24vYXR0cmlic19kZWYuaC5pbmMKKysrIGIvdGFyZ2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5p
bmMKQEAgLTQxLDYgKzQxLDI3IEBAIERFRl9BVFRSSUIoU1RPUkUsICJTdG9yZXMgdG8gbWVtb3J5
IiwgIiIsICIiKQogREVGX0FUVFJJQihNRU1MSUtFLCAiTWVtb3J5LWxpa2UgaW5zdHJ1Y3Rpb24i
LCAiIiwgIiIpCiBERUZfQVRUUklCKE1FTUxJS0VfUEFDS0VUX1JVTEVTLCAiZm9sbG93cyBNZW1v
cnktbGlrZSBwYWNrZXQgcnVsZXMiLCAiIiwgIiIpCiAKKy8qIFY2IFZlY3RvciBhdHRyaWJ1dGVz
ICovCitERUZfQVRUUklCKENWSSwgIkV4ZWN1dGVzIG9uIHRoZSBIVlggZXh0ZW5zaW9uIiwgIiIs
ICIiKQorCitERUZfQVRUUklCKENWSV9ORVcsICJOZXcgdmFsdWUgbWVtb3J5IGluc3RydWN0aW9u
IGV4ZWN1dGVzIG9uIEhWWCIsICIiLCAiIikKK0RFRl9BVFRSSUIoQ1ZJX1ZNLCAiTWVtb3J5IGlu
c3RydWN0aW9uIGV4ZWN1dGVzIG9uIEhWWCIsICIiLCAiIikKK0RFRl9BVFRSSUIoQ1ZJX1ZQLCAi
UGVybXV0ZSBpbnN0cnVjdGlvbiBleGVjdXRlcyBvbiBIVlgiLCAiIiwgIiIpCitERUZfQVRUUklC
KENWSV9WUF9WUywgIkRvdWJsZSB2ZWN0b3IgcGVybXV0ZS9zaGZ0IGluc24gZXhlY3V0ZXMgb24g
SFZYIiwgIiIsICIiKQorREVGX0FUVFJJQihDVklfVlgsICJNdWx0aXBseSBpbnN0cnVjdGlvbiBl
eGVjdXRlcyBvbiBIVlgiLCAiIiwgIiIpCitERUZfQVRUUklCKENWSV9WWF9EViwgIkRvdWJsZSB2
ZWN0b3IgbXVsdGlwbHkgaW5zbiBleGVjdXRlcyBvbiBIVlgiLCAiIiwgIiIpCitERUZfQVRUUklC
KENWSV9WUywgIlNoaWZ0IGluc3RydWN0aW9uIGV4ZWN1dGVzIG9uIEhWWCIsICIiLCAiIikKK0RF
Rl9BVFRSSUIoQ1ZJX1ZTX1ZYLCAiUGVybXV0ZS9zaGlmdCBhbmQgbXVsdGlwbHkgaW5zbiBleGVj
dXRlcyBvbiBIVlgiLCAiIiwgIiIpCitERUZfQVRUUklCKENWSV9WQSwgIkFMVSBpbnN0cnVjdGlv
biBleGVjdXRlcyBvbiBIVlgiLCAiIiwgIiIpCitERUZfQVRUUklCKENWSV9WQV9EViwgIkRvdWJs
ZSB2ZWN0b3IgYWx1IGluc3RydWN0aW9uIGV4ZWN1dGVzIG9uIEhWWCIsICIiLCAiIikKK0RFRl9B
VFRSSUIoQ1ZJXzRTTE9ULCAiQ29uc3VtZXMgYWxsIHRoZSB2ZWN0b3IgZXhlY3V0aW9uIHJlc291
cmNlcyIsICIiLCAiIikKK0RFRl9BVFRSSUIoQ1ZJX1RNUCwgIlRyYW5zaWVudCBNZW1vcnkgTG9h
ZCBub3Qgd3JpdHRlbiB0byByZWdpc3RlciIsICIiLCAiIikKK0RFRl9BVFRSSUIoQ1ZJX0dBVEhF
UiwgIkNWSSBHYXRoZXIgb3BlcmF0aW9uIiwgIiIsICIiKQorREVGX0FUVFJJQihDVklfU0NBVFRF
UiwgIkNWSSBTY2F0dGVyIG9wZXJhdGlvbiIsICIiLCAiIikKK0RFRl9BVFRSSUIoQ1ZJX1NDQVRU
RVJfUkVMRUFTRSwgIkNWSSBTdG9yZSBSZWxlYXNlIGZvciBzY2F0dGVyIiwgIiIsICIiKQorREVG
X0FUVFJJQihDVklfVE1QX0RTVCwgIkNWSSBpbnN0cnVjdGlvbiB0aGF0IGRvZXNuJ3Qgd3JpdGUg
YSByZWdpc3RlciIsICIiLCAiIikKK0RFRl9BVFRSSUIoQ1ZJX1NMT1QyMywgIkNhbiBleGVjdXRl
IGluIHNsb3QgMiBvciBzbG90IDMgKEhWWCkiLCAiIiwgIiIpCisKIAogLyogQ2hhbmdlLW9mLWZs
b3cgYXR0cmlidXRlcyAqLwogREVGX0FUVFJJQihKVU1QLCAiSnVtcC10eXBlIGluc3RydWN0aW9u
IiwgIiIsICIiKQpAQCAtODYsNiArMTA3LDcgQEAgREVGX0FUVFJJQihIV0xPT1AxX0VORCwgIkVu
ZHMgSFcgbG9vcDEiLCAiIiwgIiIpCiBERUZfQVRUUklCKERDWkVST0EsICJkY3plcm9hIHR5cGUi
LCAiIiwgIiIpCiBERUZfQVRUUklCKElDRkxVU0hPUCwgImljZmx1c2ggb3AgdHlwZSIsICIiLCAi
IikKIERFRl9BVFRSSUIoRENGTFVTSE9QLCAiZGNmbHVzaCBvcCB0eXBlIiwgIiIsICIiKQorREVG
X0FUVFJJQihMMkZMVVNIT1AsICJsMmZsdXNoIG9wIHR5cGUiLCAiIiwgIiIpCiBERUZfQVRUUklC
KERDRkVUQ0gsICJkY2ZldGNoIHR5cGUiLCAiIiwgIiIpCiAKIERFRl9BVFRSSUIoTDJGRVRDSCwg
Ikluc3RydWN0aW9uIGlzIGwyZmV0Y2ggdHlwZSIsICIiLCAiIikKLS0gCjIuNy40Cgo=

