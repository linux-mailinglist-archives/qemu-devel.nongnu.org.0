Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176A75865F0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 09:58:43 +0200 (CEST)
Received: from localhost ([::1]:43328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIQK2-0003c3-76
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 03:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oIQH2-0000nQ-C5; Mon, 01 Aug 2022 03:55:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oIQH0-0004Iw-Rv; Mon, 01 Aug 2022 03:55:36 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2717sa35010886;
 Mon, 1 Aug 2022 07:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6D61z44ec+YbU6iW4JysrrsAeLtIDqaOg3t84ENnol8=;
 b=BWc8swX1oQCACHkxoF+J2qWr8L2X5I4ZTeI18TKkzgLKpx00ibsF34yH8qtXpowQWvgI
 99gLiEGLlDY3s98+EPCiNbLkmlkMX8I9z6NxNtDChVmvU5MPrQOEnfvcVQRCKKr0buZU
 48XMpAFCoIV5hcFi7eWYOQc63iCQU9Q4rauSst8z/UmwyFapn6P7DI4wPvN3cY7AJZ3n
 HqxnydsOcS6Y42fqWYRrW7H31oEckW0Ig3f3KEJW5pZflYTC+8aY4sEoYaYn7ISQrZNQ
 cpdb2UpXqcSIvZaMGb6fCYaWUJ1bTaRH99A+byKGRK9zniXlvQ9I4AEdN4CNuXFtBw78 Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hp6brycsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Aug 2022 07:55:33 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27176STv014384;
 Mon, 1 Aug 2022 07:55:32 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hp6brycre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Aug 2022 07:55:32 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2717psBK011585;
 Mon, 1 Aug 2022 07:55:30 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3hmv98hvwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Aug 2022 07:55:29 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2717tQ8a28312040
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Aug 2022 07:55:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 963A142041;
 Mon,  1 Aug 2022 07:55:26 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BE2342045;
 Mon,  1 Aug 2022 07:55:26 +0000 (GMT)
Received: from [9.145.41.76] (unknown [9.145.41.76])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  1 Aug 2022 07:55:26 +0000 (GMT)
Message-ID: <512f6ffc-babc-89db-391f-ef60e43c9f35@linux.ibm.com>
Date: Mon, 1 Aug 2022 09:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 09/17] dump: Reorder struct DumpState
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-10-frankja@linux.ibm.com>
 <9bd3bbda-f6e2-4a1c-9ccb-637c0ff07500@linux.ibm.com>
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <9bd3bbda-f6e2-4a1c-9ccb-637c0ff07500@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6u4FYakSMdM8TeNg79BNZqvwtLR6UTaT
X-Proofpoint-ORIG-GUID: fqxFf3vm-1MlfK2rmwUCxGIcsQMDYiEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_03,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208010035
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gNy8yOS8yMiAxOToyMSwgSmFuaXMgU2Nob2V0dGVybC1HbGF1c2NoIHdyb3RlOg0KPiBP
biA3LzI2LzIyIDExOjIyLCBKYW5vc2NoIEZyYW5rIHdyb3RlOg0KPj4gTGV0J3MgbW92ZSBF
TEYgcmVsYXRlZCBtZW1iZXJzIGludG8gb25lIGJsb2NrIGFuZCBndWVzdCBtZW1vcnkgcmVs
YXRlZA0KPj4gb25lcyBpbnRvIGFub3RoZXIgdG8gaW1wcm92ZSByZWFkYWJpbGl0eS4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYW5vc2NoIEZyYW5rIDxmcmFua2phQGxpbnV4LmlibS5j
b20+DQo+PiBSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVy
c29uQGxpbmFyby5vcmc+DQo+PiBSZXZpZXdlZC1ieTogTWFyYy1BbmRyw6kgTHVyZWF1IDxt
YXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20+DQo+PiAtLS0NCj4+ICAgaW5jbHVkZS9zeXNl
bXUvZHVtcC5oIHwgMTYgKysrKysrKysrLS0tLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3N5c2VtdS9kdW1wLmggYi9pbmNsdWRlL3N5c2VtdS9kdW1wLmgNCj4+IGluZGV4
IDY4NjU1NWY5MDguLjM5MzdhZmUwZjkgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL3N5c2Vt
dS9kdW1wLmgNCj4+ICsrKyBiL2luY2x1ZGUvc3lzZW11L2R1bXAuaA0KPj4gQEAgLTE1NCwx
NSArMTU0LDggQEAgdHlwZWRlZiBzdHJ1Y3QgRHVtcFN0YXRlIHsNCj4+ICAgICAgIEd1ZXN0
UGh5c0Jsb2NrTGlzdCBndWVzdF9waHlzX2Jsb2NrczsNCj4+ICAgICAgIEFyY2hEdW1wSW5m
byBkdW1wX2luZm87DQo+PiAgICAgICBNZW1vcnlNYXBwaW5nTGlzdCBsaXN0Ow0KPj4gLSAg
ICB1aW50MzJfdCBwaGRyX251bTsNCj4+IC0gICAgdWludDMyX3Qgc2hkcl9udW07DQo+PiAg
ICAgICBib29sIHJlc3VtZTsNCj4+ICAgICAgIGJvb2wgZGV0YWNoZWQ7DQo+PiAtICAgIHNz
aXplX3Qgbm90ZV9zaXplOw0KPj4gLSAgICBod2FkZHIgc2hkcl9vZmZzZXQ7DQo+PiAtICAg
IGh3YWRkciBwaGRyX29mZnNldDsNCj4+IC0gICAgaHdhZGRyIHNlY3Rpb25fb2Zmc2V0Ow0K
Pj4gLSAgICBod2FkZHIgbm90ZV9vZmZzZXQ7DQo+PiAgICAgICBod2FkZHIgbWVtb3J5X29m
ZnNldDsNCj4+ICAgICAgIGludCBmZDsNCj4+ICAgDQo+PiBAQCAtMTcxLDYgKzE2NCwxNSBA
QCB0eXBlZGVmIHN0cnVjdCBEdW1wU3RhdGUgew0KPj4gICAgICAgaW50NjRfdCBiZWdpbjsg
ICAgICAgICAgICAgLyogU3RhcnQgYWRkcmVzcyBvZiB0aGUgY2h1bmsgd2Ugd2FudCB0byBk
dW1wICovDQo+PiAgICAgICBpbnQ2NF90IGxlbmd0aDsgICAgICAgICAgICAvKiBMZW5ndGgg
b2YgdGhlIGR1bXAgd2Ugd2FudCB0byBkdW1wICovDQo+PiAgIA0KPj4gKyAgICAvKiBFbGYg
ZHVtcCByZWxhdGVkIGRhdGEgKi8NCj4+ICsgICAgdWludDMyX3QgcGhkcl9udW07DQo+PiAr
ICAgIHVpbnQzMl90IHNoZHJfbnVtOw0KPj4gKyAgICB1aW50MzJfdCBzaF9pbmZvOw0KPiAN
Cj4gV2h5IGlzIHRoaXMgXiBoZXJlPw0KDQpSZS1iYXNlIGRhbWFnZQ0KDQo+IA0KPj4gKyAg
ICBzc2l6ZV90IG5vdGVfc2l6ZTsNCj4+ICsgICAgaHdhZGRyIHNoZHJfb2Zmc2V0Ow0KPj4g
KyAgICBod2FkZHIgcGhkcl9vZmZzZXQ7DQo+PiArICAgIGh3YWRkciBub3RlX29mZnNldDsN
Cj4+ICsNCj4+ICAgICAgIHZvaWQgKmVsZl9oZWFkZXI7DQo+PiAgICAgICB2b2lkICplbGZf
c2VjdGlvbl9oZHJzOw0KPj4gICAgICAgdWludDY0X3QgZWxmX3NlY3Rpb25fZGF0YV9zaXpl
Ow0KPiANCg0K

