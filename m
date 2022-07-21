Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD05F57CE6F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 17:03:00 +0200 (CEST)
Received: from localhost ([::1]:43656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXhb-0001NJ-Gj
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 11:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEXek-0007q3-PT; Thu, 21 Jul 2022 11:00:02 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEXei-0005g4-2r; Thu, 21 Jul 2022 11:00:02 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LEuQ6v015712;
 Thu, 21 Jul 2022 14:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jZIDMDDDghctZhEpZ4jSqugrXsxjYd6fyreAXWmxejM=;
 b=YiikrfjWsUT2RG1kIVYbB6z5OLl/rf5FyJ85kUZ32OIhMUANyxJn2WqohvlPGQO0t16x
 F+yhDc53UoEIvgYaQqdwuTuW4d6tdAGt8K01MlFPeR/Lpv3KkMJHMx7ablnN7WkyDUBU
 X9hNxvqDlAbVHXsNMbfaB9mSuDtxgHgf0Dt2hKnLdpYLQBgrcVqvDxwm1LGReunX17FR
 GRJh4OA/nPCVBwuc7XdMtCAU0MiB+55cPv8TTI3h1L4flAm13whmh7u8/KAPQ8lxnKfQ
 Gi9knWCXYXCvuko7JRIc6G2xEv56hdUPvKramvw8YnBqS0Tlp5Dsp0OEpKyJhfoVNZ4+ OA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf90nr1vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 14:59:57 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26LExS1d031572;
 Thu, 21 Jul 2022 14:59:57 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf90nr1un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 14:59:57 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26LEojfp023216;
 Thu, 21 Jul 2022 14:59:54 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3hbmy8y2u6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 14:59:54 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26LExpRY23527878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jul 2022 14:59:51 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79B7EA4060;
 Thu, 21 Jul 2022 14:59:51 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 086C4A405F;
 Thu, 21 Jul 2022 14:59:51 +0000 (GMT)
Received: from [9.145.177.237] (unknown [9.145.177.237])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jul 2022 14:59:50 +0000 (GMT)
Message-ID: <3f192788-18ab-42f3-4297-1a8e979d55a1@linux.ibm.com>
Date: Thu, 21 Jul 2022 16:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 05/14] dump: Split write of section headers and data
 and add a prepare step
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo"
 <pbonzini@redhat.com>, mhartmay@linux.ibm.com,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 imbrenda@linux.ibm.com, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 seiden@linux.ibm.com
References: <20220721132256.2171-1-frankja@linux.ibm.com>
 <20220721132256.2171-6-frankja@linux.ibm.com>
 <CAMxuvazYXtCmf9pUvgD2h_GX5wUB-5Y9eWk-Qiiuh=wXF8Mt=A@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <CAMxuvazYXtCmf9pUvgD2h_GX5wUB-5Y9eWk-Qiiuh=wXF8Mt=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qPvgTBNSxaAz4ZI95m8SUwzaS35mTvyu
X-Proofpoint-GUID: qc5zOHqIqi2QdJPFIIw47ctBW9ro2YOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_18,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207210058
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

T24gNy8yMS8yMiAxNjo0MSwgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOg0KPiBPbiBUaHUs
IEp1bCAyMSwgMjAyMiBhdCA1OjIzIFBNIEphbm9zY2ggRnJhbmsgPGZyYW5ramFAbGludXgu
aWJtLmNvbT4gd3JvdGU6DQo+Pg0KPj4gQnkgc3BsaXR0aW5nIHRoZSB3cml0aW5nIG9mIHRo
ZSBzZWN0aW9uIGhlYWRlcnMgYW5kIChmdXR1cmUpIHNlY3Rpb24NCj4+IGRhdGEgd2UgcHJl
cGFyZSBmb3IgdGhlIGFkZGl0aW9uIG9mIGEgc3RyaW5nIHRhYmxlIHNlY3Rpb24gYW5kDQo+
PiBhcmNoaXRlY3R1cmUgc2VjdGlvbnMuDQo+Pg0KPj4gQXQgdGhlIHNhbWUgdGltZSB3ZSBt
b3ZlIHRoZSB3cml0aW5nIG9mIHRoZSBzZWN0aW9uIHRvIHRoZSBlbmQgb2YgdGhlDQo+PiBk
dW1wIHByb2Nlc3MuIFRoaXMgYWxsb3dzIHRoZSB1cGNvbWluZyBhcmNoaXRlY3R1cmUgc2Vj
dGlvbiBjb2RlIHRvDQo+PiBhZGQgZGF0YSBhZnRlciBhbGwgb2YgdGhlIGNvbW1vbiBkdW1w
IGRhdGEgaGFzIGJlZW4gd3JpdHRlbi4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYW5vc2No
IEZyYW5rIDxmcmFua2phQGxpbnV4LmlibS5jb20+DQo+PiAtLS0NCj4+ICAgZHVtcC9kdW1w
LmMgICAgICAgICAgIHwgMTE0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLQ0KPj4gICBpbmNsdWRlL3N5c2VtdS9kdW1wLmggfCAgIDQgKysNCj4+ICAgMiBm
aWxlcyBjaGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvZHVtcC9kdW1wLmMgYi9kdW1wL2R1bXAuYw0KPj4gaW5kZXggMmQw
NGUwNjgxNS4uOTgwNzAyZDQ3NiAxMDA2NDQNCj4+IC0tLSBhL2R1bXAvZHVtcC5jDQo+PiAr
KysgYi9kdW1wL2R1bXAuYw0KPj4gQEAgLTM0MiwzMCArMzQyLDcxIEBAIHN0YXRpYyB2b2lk
IHdyaXRlX2VsZl9waGRyX25vdGUoRHVtcFN0YXRlICpzLCBFcnJvciAqKmVycnApDQo+PiAg
ICAgICB9DQo+PiAgIH0NCj4+DQo+PiAtc3RhdGljIHZvaWQgd3JpdGVfZWxmX3NlY3Rpb24o
RHVtcFN0YXRlICpzLCBpbnQgdHlwZSwgRXJyb3IgKiplcnJwKQ0KPj4gK3N0YXRpYyBzaXpl
X3QgcHJlcGFyZV9lbGZfc2VjdGlvbl9oZHJfemVybyhEdW1wU3RhdGUgKnMsIHZvaWQgKmJ1
ZmYpDQo+PiAgIHsNCj4+IC0gICAgRWxmMzJfU2hkciBzaGRyMzI7DQo+PiAtICAgIEVsZjY0
X1NoZHIgc2hkcjY0Ow0KPj4gLSAgICBpbnQgc2hkcl9zaXplOw0KPj4gLSAgICB2b2lkICpz
aGRyOw0KPj4gLSAgICBpbnQgcmV0Ow0KPj4gKyAgICBpZiAoZHVtcF9pc182NGJpdChzKSkg
ew0KPj4gKyAgICAgICAgRWxmNjRfU2hkciAqc2hkcjY0ID0gYnVmZjsNCj4+DQo+PiAtICAg
IGlmICh0eXBlID09IDApIHsNCj4+IC0gICAgICAgIHNoZHJfc2l6ZSA9IHNpemVvZihFbGYz
Ml9TaGRyKTsNCj4+IC0gICAgICAgIG1lbXNldCgmc2hkcjMyLCAwLCBzaGRyX3NpemUpOw0K
Pj4gLSAgICAgICAgc2hkcjMyLnNoX2luZm8gPSBjcHVfdG9fZHVtcDMyKHMsIHMtPnBoZHJf
bnVtKTsNCj4+IC0gICAgICAgIHNoZHIgPSAmc2hkcjMyOw0KPj4gKyAgICAgICAgc2hkcjY0
LT5zaF9pbmZvID0gY3B1X3RvX2R1bXAzMihzLCBzLT5waGRyX251bSk7DQo+PiAgICAgICB9
IGVsc2Ugew0KPj4gLSAgICAgICAgc2hkcl9zaXplID0gc2l6ZW9mKEVsZjY0X1NoZHIpOw0K
Pj4gLSAgICAgICAgbWVtc2V0KCZzaGRyNjQsIDAsIHNoZHJfc2l6ZSk7DQo+PiAtICAgICAg
ICBzaGRyNjQuc2hfaW5mbyA9IGNwdV90b19kdW1wMzIocywgcy0+cGhkcl9udW0pOw0KPj4g
LSAgICAgICAgc2hkciA9ICZzaGRyNjQ7DQo+PiArICAgICAgICBFbGYzMl9TaGRyICpzaGRy
MzIgPSBidWZmOw0KPj4gKw0KPj4gKyAgICAgICAgc2hkcjMyLT5zaF9pbmZvID0gY3B1X3Rv
X2R1bXAzMihzLCBzLT5waGRyX251bSk7DQo+PiAgICAgICB9DQo+Pg0KPj4gLSAgICByZXQg
PSBmZF93cml0ZV92bWNvcmUoc2hkciwgc2hkcl9zaXplLCBzKTsNCj4+ICsgICAgcmV0dXJu
IGR1bXBfaXNfNjRiaXQocykgPyBzaXplb2YoRWxmNjRfU2hkcikgOiBzaXplb2YoRWxmMzJf
U2hkcik7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIHByZXBhcmVfZWxmX3NlY3Rp
b25faGRycyhEdW1wU3RhdGUgKnMpDQo+PiArew0KPj4gKyAgICB1aW50OF90ICpidWZmX2hk
cjsNCj4+ICsgICAgc2l6ZV90IGxlbiwgc2l6ZW9mX3NoZHI7DQo+PiArDQo+PiArICAgIC8q
DQo+PiArICAgICAqIFNlY3Rpb24gb3JkZXJpbmc6DQo+PiArICAgICAqIC0gSERSIHplcm8g
KGlmIG5lZWRlZCkNCj4+ICsgICAgICovDQo+PiArICAgIHNpemVvZl9zaGRyID0gZHVtcF9p
c182NGJpdChzKSA/IHNpemVvZihFbGY2NF9TaGRyKSA6IHNpemVvZihFbGYzMl9TaGRyKTsN
Cj4+ICsgICAgbGVuID0gc2l6ZW9mX3NoZHIgKiBzLT5zaGRyX251bTsNCj4+ICsgICAgcy0+
ZWxmX3NlY3Rpb25faGRycyA9IGdfbWFsbG9jMChsZW4pOw0KPj4gKyAgICBidWZmX2hkciA9
IHMtPmVsZl9zZWN0aW9uX2hkcnM7DQo+PiArDQo+PiArICAgIC8qIFdyaXRlIHNwZWNpYWwg
c2VjdGlvbiBmaXJzdCAqLw0KPj4gKyAgICBpZiAocy0+cGhkcl9udW0gPT0gUE5fWE5VTSkg
ew0KPj4gKyAgICAgICAgICAgIHByZXBhcmVfZWxmX3NlY3Rpb25faGRyX3plcm8ocywgYnVm
Zl9oZHIpOw0KPiANCj4gIEZyb20gdjIgcmV2aWV3Og0KPiANCj4gRXZlbnR1YWxseSwgZHJv
cCBidWZmX2hkciwgYW5kIHBhc3Mgb25seSAicyIgYXMgYXJndW1lbnQNCg0KWW91IG5lZWQg
dG8gc3BlY2lmeSB3aGF0IHlvdSBtZWFuIGJ5ICJldmVudHVhbGx5IiBoZXJlLg0KDQo+IA0K
PiArIEluZGVudGF0aW9uIGlzIG9mZg0KDQpJIGZpeGVkIHRoYXQgVHVlc2RheSBidXQgc29t
ZWhvdyBpdCBkaWRuJ3QgZW5kIHVwIGluIHRoaXMgbWFpbC4uLg0KSSdsbCBoYXZlIGFub3Ro
ZXIgZ28gYXQgaXQuDQoNCj4gDQo+IA0KPiANCj4+ICsgICAgfQ0KPj4gK30NCj4+ICsNCj4+
ICtzdGF0aWMgdm9pZCBwcmVwYXJlX2VsZl9zZWN0aW9ucyhEdW1wU3RhdGUgKnMsIEVycm9y
ICoqZXJycCkNCj4+ICt7DQo+PiArICAgIGlmICghcy0+c2hkcl9udW0pIHsNCj4+ICsgICAg
ICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBwcmVwYXJlX2VsZl9zZWN0
aW9uX2hkcnMocyk7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIHdyaXRlX2VsZl9z
ZWN0aW9uX2hlYWRlcnMoRHVtcFN0YXRlICpzLCBFcnJvciAqKmVycnApDQo+PiArew0KPj4g
KyAgICBzaXplX3Qgc2l6ZW9mX3NoZHI7DQo+PiArICAgIGludCByZXQ7DQo+PiArDQo+PiAr
ICAgIHNpemVvZl9zaGRyID0gZHVtcF9pc182NGJpdChzKSA/IHNpemVvZihFbGY2NF9TaGRy
KSA6IHNpemVvZihFbGYzMl9TaGRyKTsNCj4+ICsNCj4+ICsgICAgcmV0ID0gZmRfd3JpdGVf
dm1jb3JlKHMtPmVsZl9zZWN0aW9uX2hkcnMsIHMtPnNoZHJfbnVtICogc2l6ZW9mX3NoZHIs
IHMpOw0KPj4gICAgICAgaWYgKHJldCA8IDApIHsNCj4+IC0gICAgICAgIGVycm9yX3NldGdf
ZXJybm8oZXJycCwgLXJldCwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgImR1bXA6
IGZhaWxlZCB0byB3cml0ZSBzZWN0aW9uIGhlYWRlciB0YWJsZSIpOw0KPj4gKyAgICAgICAg
ZXJyb3Jfc2V0Z19lcnJubyhlcnJwLCAtcmV0LCAiZHVtcDogZmFpbGVkIHRvIHdyaXRlIHNl
Y3Rpb24gaGVhZGVycyIpOw0KPj4gKyAgICB9DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB2
b2lkIHdyaXRlX2VsZl9zZWN0aW9ucyhEdW1wU3RhdGUgKnMsIEVycm9yICoqZXJycCkNCj4+
ICt7DQo+PiArICAgIGludCByZXQ7DQo+PiArDQo+PiArICAgIC8qIFdyaXRlIHNlY3Rpb24g
emVybyAqLw0KPj4gKyAgICByZXQgPSBmZF93cml0ZV92bWNvcmUocy0+ZWxmX3NlY3Rpb25f
ZGF0YSwgcy0+ZWxmX3NlY3Rpb25fZGF0YV9zaXplLCBzKTsNCj4+ICsgICAgaWYgKHJldCA8
IDApIHsNCj4+ICsgICAgICAgIGVycm9yX3NldGdfZXJybm8oZXJycCwgLXJldCwgImR1bXA6
IGZhaWxlZCB0byB3cml0ZSBzZWN0aW9uIGRhdGEiKTsNCj4+ICAgICAgIH0NCj4+ICAgfQ0K
Pj4NCj4+IEBAIC01NTcsMTIgKzU5OCwyMiBAQCBzdGF0aWMgdm9pZCBkdW1wX2JlZ2luKER1
bXBTdGF0ZSAqcywgRXJyb3IgKiplcnJwKQ0KPj4gICAgICAgLyogV3JpdGUgZWxmIGhlYWRl
ciB0byBidWZmZXIgKi8NCj4+ICAgICAgIHByZXBhcmVfZWxmX2hlYWRlcihzKTsNCj4+DQo+
PiArICAgIHByZXBhcmVfZWxmX3NlY3Rpb25zKHMsIGVycnApOw0KPj4gKyAgICBpZiAoKmVy
cnApIHsNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gICAgICAg
LyogU3RhcnQgdG8gd3JpdGUgc3R1ZmYgaW50byBmaWxlIGRlc2NyaXB0b3IgKi8NCj4+ICAg
ICAgIHdyaXRlX2VsZl9oZWFkZXIocywgZXJycCk7DQo+PiAgICAgICBpZiAoKmVycnApIHsN
Cj4+ICAgICAgICAgICByZXR1cm47DQo+PiAgICAgICB9DQo+Pg0KPj4gKyAgICB3cml0ZV9l
bGZfc2VjdGlvbl9oZWFkZXJzKHMsIGVycnApOw0KPj4gKyAgICBpZiAoKmVycnApIHsNCj4+
ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gICAgICAgLyogd3JpdGUg
UFRfTk9URSB0byB2bWNvcmUgKi8NCj4+ICAgICAgIHdyaXRlX2VsZl9waGRyX25vdGUocywg
ZXJycCk7DQo+PiAgICAgICBpZiAoKmVycnApIHsNCj4+IEBAIC01NzUsMTQgKzYyNiw2IEBA
IHN0YXRpYyB2b2lkIGR1bXBfYmVnaW4oRHVtcFN0YXRlICpzLCBFcnJvciAqKmVycnApDQo+
PiAgICAgICAgICAgcmV0dXJuOw0KPj4gICAgICAgfQ0KPj4NCj4+IC0gICAgLyogd3JpdGUg
c2VjdGlvbiB0byB2bWNvcmUgKi8NCj4+IC0gICAgaWYgKHMtPnNoZHJfbnVtKSB7DQo+PiAt
ICAgICAgICB3cml0ZV9lbGZfc2VjdGlvbihzLCAxLCBlcnJwKTsNCj4+IC0gICAgICAgIGlm
ICgqZXJycCkgew0KPj4gLSAgICAgICAgICAgIHJldHVybjsNCj4+IC0gICAgICAgIH0NCj4+
IC0gICAgfQ0KPj4gLQ0KPj4gICAgICAgLyogd3JpdGUgbm90ZXMgdG8gdm1jb3JlICovDQo+
PiAgICAgICB3cml0ZV9lbGZfbm90ZXMocywgZXJycCk7DQo+PiAgIH0NCj4+IEBAIC02MTAs
NiArNjUzLDE5IEBAIHN0YXRpYyB2b2lkIGR1bXBfaXRlcmF0ZShEdW1wU3RhdGUgKnMsIEVy
cm9yICoqZXJycCkNCj4+ICAgICAgIH0NCj4+ICAgfQ0KPj4NCj4+ICtzdGF0aWMgdm9pZCBk
dW1wX2VuZChEdW1wU3RhdGUgKnMsIEVycm9yICoqZXJycCkNCj4+ICt7DQo+PiArICAgIEVS
UlBfR1VBUkQoKTsNCj4+ICsNCj4+ICsgICAgaWYgKCFzLT5lbGZfc2VjdGlvbl9kYXRhX3Np
emUpIHsNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKyAgICBzLT5lbGZf
c2VjdGlvbl9kYXRhID0gZ19tYWxsb2MwKHMtPmVsZl9zZWN0aW9uX2RhdGFfc2l6ZSk7DQo+
PiArDQo+PiArICAgIC8qIHdyaXRlIHNlY3Rpb25zIHRvIHZtY29yZSAqLw0KPj4gKyAgICB3
cml0ZV9lbGZfc2VjdGlvbnMocywgZXJycCk7DQo+PiArfQ0KPj4gKw0KPj4gICBzdGF0aWMg
dm9pZCBjcmVhdGVfdm1jb3JlKER1bXBTdGF0ZSAqcywgRXJyb3IgKiplcnJwKQ0KPj4gICB7
DQo+PiAgICAgICBFUlJQX0dVQVJEKCk7DQo+PiBAQCAtNjIwLDYgKzY3NiwxMiBAQCBzdGF0
aWMgdm9pZCBjcmVhdGVfdm1jb3JlKER1bXBTdGF0ZSAqcywgRXJyb3IgKiplcnJwKQ0KPj4g
ICAgICAgfQ0KPj4NCj4+ICAgICAgIGR1bXBfaXRlcmF0ZShzLCBlcnJwKTsNCj4+ICsgICAg
aWYgKCplcnJwKSB7DQo+PiArICAgICAgICByZXR1cm47DQo+PiArICAgIH0NCj4+ICsNCj4+
ICsgICAgLyogV3JpdGUgc2VjdGlvbiBkYXRhIGFmdGVyIG1lbW9yeSBoYXMgYmVlbiBkdW1w
ZWQgKi8NCj4+ICsgICAgZHVtcF9lbmQocywgZXJycCk7DQo+PiAgIH0NCj4+DQo+PiAgIHN0
YXRpYyBpbnQgd3JpdGVfc3RhcnRfZmxhdF9oZWFkZXIoaW50IGZkKQ0KPj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvc3lzZW11L2R1bXAuaCBiL2luY2x1ZGUvc3lzZW11L2R1bXAuaA0KPj4g
aW5kZXggNThmNDFiYmY0NS4uZGFkMTBkZWUwYiAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUv
c3lzZW11L2R1bXAuaA0KPj4gKysrIGIvaW5jbHVkZS9zeXNlbXUvZHVtcC5oDQo+PiBAQCAt
MTcyLDYgKzE3MiwxMCBAQCB0eXBlZGVmIHN0cnVjdCBEdW1wU3RhdGUgew0KPj4gICAgICAg
aW50NjRfdCBsZW5ndGg7ICAgICAgICAgICAgLyogTGVuZ3RoIG9mIHRoZSBkdW1wIHdlIHdh
bnQgdG8gZHVtcCAqLw0KPj4NCj4+ICAgICAgIHZvaWQgKmVsZl9oZWFkZXI7DQo+PiArICAg
IHZvaWQgKmVsZl9zZWN0aW9uX2hkcnM7DQo+PiArICAgIHVpbnQ2NF90IGVsZl9zZWN0aW9u
X2RhdGFfc2l6ZTsNCj4+ICsgICAgdm9pZCAqZWxmX3NlY3Rpb25fZGF0YTsNCj4+ICsNCj4+
ICAgICAgIHVpbnQ4X3QgKm5vdGVfYnVmOyAgICAgICAgICAvKiBidWZmZXIgZm9yIG5vdGVz
ICovDQo+PiAgICAgICBzaXplX3Qgbm90ZV9idWZfb2Zmc2V0OyAgICAgLyogdGhlIHdyaXRp
bmcgcGxhY2UgaW4gbm90ZV9idWYgKi8NCj4+ICAgICAgIHVpbnQzMl90IG5yX2NwdXM7ICAg
ICAgICAgICAvKiBudW1iZXIgb2YgZ3Vlc3QncyBjcHUgKi8NCj4+IC0tDQo+PiAyLjM0LjEN
Cj4+DQo+IA0KDQo=

