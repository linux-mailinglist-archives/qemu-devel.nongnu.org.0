Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344E7694B37
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 16:34:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRapF-0002KF-7V; Mon, 13 Feb 2023 10:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1pRapB-0002Iq-4p; Mon, 13 Feb 2023 10:33:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1pRap8-0006Ty-8p; Mon, 13 Feb 2023 10:33:00 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DFCCYm000473; Mon, 13 Feb 2023 15:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=aU1Mg7IyNTa/8sJTXGITJlQ/vhJcN83B3WxLmHnuhFQ=;
 b=Zrd1DA87wokvI9TYV3Sq2lkb23TGhKcXK2k9FSuO68Z5oLu9LDN1KYOeEoAvqJS2/3N2
 7s//WCn5gwf6CucdC6O11FS8oq3c5scA8Y6+oCPw3Gt5t4nPro6uj4e/sxBQ+qZeFzLJ
 IwyPaRyG+4wetVMXWqxwVh8EkAZGCW7l5nMNkmUHbkDg7f72/ssMEeA345HFUbvROf3c
 fbVqBHSdoC4xL8O/aTTSKhWjkzMZ+L+Cbbrfw7t74WeqKDPrU3dq6mgG47URQGb39Hyg
 qE3MO8ZyUY0ZhvxOXvgHHf7X8IeaN3tM7gr3yo28e6SRznnyXzZpfEfcir8/SNjDJLRE WA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqqmsremm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 15:28:37 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DFDcTW003809;
 Mon, 13 Feb 2023 15:28:36 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqqmsrekw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 15:28:36 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31DCwHwL020674;
 Mon, 13 Feb 2023 15:28:35 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3np2n6u4ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 15:28:35 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31DFSX4W29753932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 15:28:34 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D30C458056;
 Mon, 13 Feb 2023 15:28:33 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F03295803F;
 Mon, 13 Feb 2023 15:28:31 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.60.89.68]) by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Feb 2023 15:28:31 +0000 (GMT)
Message-ID: <93702d8efee3b8b7123ca13ea5c7512669cbc3ad.camel@linux.ibm.com>
Subject: Re: [PATCH v2 14/19] hw/scsi/scsi-bus: Inline two uses of
 scsi_bus_from_device()
From: Eric Farman <farman@linux.ibm.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>, Li Qiang
 <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, David
 Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Fam
 Zheng <fam@euphon.net>
Date: Mon, 13 Feb 2023 10:28:31 -0500
In-Reply-To: <20230213070820.76881-15-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
 <20230213070820.76881-15-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NbU2PUqoZM5BkuYQu8DsnEoVS0oZg92B
X-Proofpoint-ORIG-GUID: _XCuXuaFi-bdi-p18GLN5aW2XR-m2X14
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_09,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 clxscore=1011
 malwarescore=0 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302130136
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

T24gTW9uLCAyMDIzLTAyLTEzIGF0IDA4OjA4ICswMTAwLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1k
QGxpbmFyby5vcmc+CgpBY2tlZC1ieTogRXJpYyBGYXJtYW4gPGZhcm1hbkBsaW51eC5pYm0uY29t
PgoKPiAtLS0KPiDCoGh3L3MzOTB4L2lwbC5jwqDCoMKgwqDCoMKgwqDCoCB8IDcgKystLS0tLQo+
IMKgaHcvc2NzaS9zY3NpLWJ1cy5jwqDCoMKgwqAgfCAyICstCj4gwqBpbmNsdWRlL2h3L3Njc2kv
c2NzaS5oIHwgNSAtLS0tLQo+IMKgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEx
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9ody9zMzkweC9pcGwuYyBiL2h3L3MzOTB4
L2lwbC5jCj4gaW5kZXggODYxMjY4NGQ0OC4uNGY3ZjRlNjBkNiAxMDA2NDQKPiAtLS0gYS9ody9z
MzkweC9pcGwuYwo+ICsrKyBiL2h3L3MzOTB4L2lwbC5jCj4gQEAgLTM2NiwxMSArMzY2LDggQEAg
c3RhdGljIENjd0RldmljZQo+ICpzMzkwX2dldF9jY3dfZGV2aWNlKERldmljZVN0YXRlICpkZXZf
c3QsIGludCAqZGV2dHlwZSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2N3X2RldiA9IEND
V19ERVZJQ0UodmZpb19jY3dfZGV2KTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdG1wX2R0
ID0gQ0NXX0RFVlRZUEVfVkZJTzsKPiDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgU0NTSURldmljZSAqc2QgPSAoU0NTSURldmljZSAqKQo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2JqZWN0X2R5bmFtaWNfY2FzdChPQkpFQ1QoZGV2
X3N0KSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUWVBFX1NDU0lfREVWSUNFKTsKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoc2QpIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFND
U0lCdXMgKnNidXMgPSBzY3NpX2J1c19mcm9tX2RldmljZShzZCk7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKG9iamVjdF9keW5hbWljX2Nhc3QoT0JKRUNUKGRldl9zdCksCj4gVFlQRV9T
Q1NJX0RFVklDRSkpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNDU0lCdXMg
KnNidXMgPQo+IFNDU0lfQlVTKHFkZXZfZ2V0X3BhcmVudF9idXMoZGV2X3N0KSk7Cj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVmlydElPRGV2aWNlICp2ZGV2ID0gKFZpcnRJT0Rl
dmljZSAqKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2JqZWN0
X2R5bmFtaWNfY2FzdChPQkpFQ1Qoc2J1cy0+cWJ1cy5wYXJlbnQpLAo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFRZUEVfVklSVElPX0RFVklDRSk7Cj4gZGlmZiAtLWdpdCBhL2h3L3Njc2kvc2Nz
aS1idXMuYyBiL2h3L3Njc2kvc2NzaS1idXMuYwo+IGluZGV4IGM0NTI1NTE1YWIuLmVlNzJiODZi
MTMgMTAwNjQ0Cj4gLS0tIGEvaHcvc2NzaS9zY3NpLWJ1cy5jCj4gKysrIGIvaHcvc2NzaS9zY3Np
LWJ1cy5jCj4gQEAgLTY3OSw3ICs2NzksNyBAQCBTQ1NJUmVxdWVzdCAqc2NzaV9yZXFfYWxsb2Mo
Y29uc3QgU0NTSVJlcU9wcwo+ICpyZXFvcHMsIFNDU0lEZXZpY2UgKmQsCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDMyX3QgdGFn
LCB1aW50MzJfdCBsdW4sIHZvaWQKPiAqaGJhX3ByaXZhdGUpCj4gwqB7Cj4gwqDCoMKgwqAgU0NT
SVJlcXVlc3QgKnJlcTsKPiAtwqDCoMKgIFNDU0lCdXMgKmJ1cyA9IHNjc2lfYnVzX2Zyb21fZGV2
aWNlKGQpOwo+ICvCoMKgwqAgU0NTSUJ1cyAqYnVzID0gU0NTSV9CVVMocWRldl9nZXRfcGFyZW50
X2J1cyhERVZJQ0UoZCkpKTsKPiDCoMKgwqDCoCBCdXNTdGF0ZSAqcWJ1cyA9IEJVUyhidXMpOwo+
IMKgwqDCoMKgIGNvbnN0IGludCBtZW1zZXRfb2ZmID0gb2Zmc2V0b2YoU0NTSVJlcXVlc3QsIHNl
bnNlKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCArIHNpemVvZihyZXEtPnNlbnNlKTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9zY3Np
L3Njc2kuaCBiL2luY2x1ZGUvaHcvc2NzaS9zY3NpLmgKPiBpbmRleCBlYjU1OGMxNDVhLi5lMzI2
M2RlYzBkIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvaHcvc2NzaS9zY3NpLmgKPiArKysgYi9pbmNs
dWRlL2h3L3Njc2kvc2NzaS5oCj4gQEAgLTE3NSwxMSArMTc1LDYgQEAgc3RhdGljIGlubGluZSB2
b2lkIHNjc2lfYnVzX2luaXQoU0NTSUJ1cyAqYnVzLAo+IHNpemVfdCBidXNfc2l6ZSwKPiDCoMKg
wqDCoCBzY3NpX2J1c19pbml0X25hbWVkKGJ1cywgYnVzX3NpemUsIGhvc3QsIGluZm8sIE5VTEwp
Owo+IMKgfQo+IMKgCj4gLXN0YXRpYyBpbmxpbmUgU0NTSUJ1cyAqc2NzaV9idXNfZnJvbV9kZXZp
Y2UoU0NTSURldmljZSAqZCkKPiAtewo+IC3CoMKgwqAgcmV0dXJuIFNDU0lfQlVTKHFkZXZfZ2V0
X3BhcmVudF9idXMoREVWSUNFKGQpKSk7Cj4gLX0KPiAtCj4gwqBTQ1NJRGV2aWNlICpzY3NpX2J1
c19sZWdhY3lfYWRkX2RyaXZlKFNDU0lCdXMgKmJ1cywgQmxvY2tCYWNrZW5kCj4gKmJsaywKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGludCB1bml0LCBib29sIHJlbW92YWJsZSwgaW50Cj4gYm9vdGlu
ZGV4LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vbCBzaGFyZV9ydywKCg==


