Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE78575D33
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 10:20:33 +0200 (CEST)
Received: from localhost ([::1]:53192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCGYq-0000s8-Qs
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 04:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oCGXJ-0004Dd-5W; Fri, 15 Jul 2022 04:18:57 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oCGXH-000142-02; Fri, 15 Jul 2022 04:18:56 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26F87HQN009514;
 Fri, 15 Jul 2022 08:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=HnmVpJDFtuMiqK+rrkgHscMjhM0KfpDJ0QPdVHC7WcI=;
 b=KxrkhJzbp6p7DnwKuOGDPtX6WFBuwS0aaFLfWaobdANYfbtMFjjOIg2oyX6t1O7CvDHQ
 0qKRLRr4JCHdQooNJLrbqG+QS4Wgv3UhDKaYs9QovtewHeA6tA63SzVO48A8utsdFFHT
 IQFA9qQOndOEwFflfci8zG4veklEOuTAhOYClFGZyy366Flze/KsjumSyVrEub2FTB0w
 lzpcaHLwkw3RwUNQZXBflKKKfEclzDTE8CwSbNN6tC/4K54j4Th3POc1o5Rf4def7b3J
 Tq+Vs3/ISig+vpvbcmshCxUZHs5sVSeaWeSSfcR0wzCfM2e7O4KV2q/iSvDIda3jwIVq FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hb42wgnwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 08:18:49 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26F87JtY009976;
 Fri, 15 Jul 2022 08:18:49 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hb42wgnvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 08:18:48 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26F87HfT026306;
 Fri, 15 Jul 2022 08:18:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3h99s7axtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 08:18:46 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26F8Ihxk17826122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jul 2022 08:18:43 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B2E3AE04D;
 Fri, 15 Jul 2022 08:18:43 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8D1BAE045;
 Fri, 15 Jul 2022 08:18:42 +0000 (GMT)
Received: from [9.145.62.179] (unknown [9.145.62.179])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jul 2022 08:18:42 +0000 (GMT)
Message-ID: <475e9918-aced-1d01-ec67-5615624a9256@linux.ibm.com>
Date: Fri, 15 Jul 2022 10:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 09/11] s390x: Introduce PV query interface
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, Christian Borntraeger <borntraeger@linux.ibm.com>,
 imbrenda@linux.ibm.com, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qemu-s390x list <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220713130322.25517-1-frankja@linux.ibm.com>
 <20220713130322.25517-10-frankja@linux.ibm.com>
 <CAJ+F1C+NuKMHYZWC9w0Q5DpvnyYBExqtk2agRx+7o6v_PjOcug@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <CAJ+F1C+NuKMHYZWC9w0Q5DpvnyYBExqtk2agRx+7o6v_PjOcug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QZIyA6Y_tJbWKTFDOPUWkkMvvEQ3A-OF
X-Proofpoint-GUID: -VqvYvgGDwYDU8DB7M-tA7irz5x5g8Xm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_03,2022-07-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207150034
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

T24gNy8xNS8yMiAxMDoxMCwgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOg0KWy4uLl0NCj4+
ICAgICAgIG1zLT5wdiA9IHRydWU7DQo+Pg0KPj4gKyAgICByYyA9IHMzOTBfcHZfcXVlcnlf
aW5mbygpOw0KPj4gKyAgICBpZiAocmMpIHsNCj4+ICsgICAgICAgIGdvdG8gb3V0X2VycjsN
Cj4+DQo+IA0KPiBNYXliZSBpdCdzIG5vdCBuZWNlc3NhcnkgdG8gbWFrZSBpdCBmYXRhbCBv
biBlcnJvcj8NCj4gDQo+IGxndG0gb3RoZXJ3aXNlDQoNCkhtbSwgeWVzIGFuZCBuby4NClRo
ZSBpbmZvIEFQSSBpcyBmZW5jZWQgYnkgdGhlIGR1bXAgQ0FQIHNvIEkgZG9uJ3QgZXZlciBl
eHBlY3QgYW4gZXJyb3IgDQpoZXJlIGJ1dCBvbiB0aGUgb3RoZXIgaGFuZCBhbiBvcHRpb25h
bCBpbmZvIEFQSSBmYWlsIG1pZ2h0IG5vdCB3YXJyYW50IA0KYW4gZXJyb3IuDQoNCj4gDQo+
IA0KPj4gKyAgICB9DQo+PiArDQo+PiAgICAgICAvKiBTZXQgU0UgaGVhZGVyIGFuZCB1bnBh
Y2sgKi8NCj4+ICAgICAgIHJjID0gczM5MF9pcGxfcHJlcGFyZV9wdl9oZWFkZXIoKTsNCj4+
ICAgICAgIGlmIChyYykgew0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvczM5MHgvcHYu
aCBiL2luY2x1ZGUvaHcvczM5MHgvcHYuaA0KPj4gaW5kZXggMWYxZjU0NWJmYy4uNmZhNTVi
ZjcwZSAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvaHcvczM5MHgvcHYuaA0KPj4gKysrIGIv
aW5jbHVkZS9ody9zMzkweC9wdi5oDQo+PiBAQCAtMzgsNiArMzgsNyBAQCBzdGF0aWMgaW5s
aW5lIGJvb2wgczM5MF9pc19wdih2b2lkKQ0KPj4gICAgICAgcmV0dXJuIGNjdy0+cHY7DQo+
PiAgIH0NCj4+DQo+PiAraW50IHMzOTBfcHZfcXVlcnlfaW5mbyh2b2lkKTsNCj4+ICAgaW50
IHMzOTBfcHZfdm1fZW5hYmxlKHZvaWQpOw0KPj4gICB2b2lkIHMzOTBfcHZfdm1fZGlzYWJs
ZSh2b2lkKTsNCj4+ICAgaW50IHMzOTBfcHZfc2V0X3NlY19wYXJtcyh1aW50NjRfdCBvcmln
aW4sIHVpbnQ2NF90IGxlbmd0aCk7DQo+PiBAQCAtNDYsOCArNDcsMTMgQEAgdm9pZCBzMzkw
X3B2X3ByZXBfcmVzZXQodm9pZCk7DQo+PiAgIGludCBzMzkwX3B2X3ZlcmlmeSh2b2lkKTsN
Cj4+ICAgdm9pZCBzMzkwX3B2X3Vuc2hhcmUodm9pZCk7DQo+PiAgIHZvaWQgczM5MF9wdl9p
bmplY3RfcmVzZXRfZXJyb3IoQ1BVU3RhdGUgKmNzKTsNCj4+ICt1aW50NjRfdCBrdm1fczM5
MF9wdl9kbXBfZ2V0X3NpemVfY3B1KHZvaWQpOw0KPj4gK3VpbnQ2NF90IGt2bV9zMzkwX3B2
X2RtcF9nZXRfc2l6ZV9tZW0odm9pZCk7DQo+PiArdWludDY0X3Qga3ZtX3MzOTBfcHZfZG1w
X2dldF9zaXplX2NvbXBsZXRlKHZvaWQpOw0KPj4gK2Jvb2wga3ZtX3MzOTBfcHZfaW5mb19i
YXNpY192YWxpZCh2b2lkKTsNCj4+ICAgI2Vsc2UgLyogQ09ORklHX0tWTSAqLw0KPj4gICBz
dGF0aWMgaW5saW5lIGJvb2wgczM5MF9pc19wdih2b2lkKSB7IHJldHVybiBmYWxzZTsgfQ0K
Pj4gK3N0YXRpYyBpbmxpbmUgaW50IHMzOTBfcHZfcXVlcnlfaW5mbyh2b2lkKSB7IHJldHVy
biAwOyB9DQo+PiAgIHN0YXRpYyBpbmxpbmUgaW50IHMzOTBfcHZfdm1fZW5hYmxlKHZvaWQp
IHsgcmV0dXJuIDA7IH0NCj4+ICAgc3RhdGljIGlubGluZSB2b2lkIHMzOTBfcHZfdm1fZGlz
YWJsZSh2b2lkKSB7fQ0KPj4gICBzdGF0aWMgaW5saW5lIGludCBzMzkwX3B2X3NldF9zZWNf
cGFybXModWludDY0X3Qgb3JpZ2luLCB1aW50NjRfdCBsZW5ndGgpDQo+PiB7IHJldHVybiAw
OyB9DQo+PiBAQCAtNTYsNiArNjIsMTAgQEAgc3RhdGljIGlubGluZSB2b2lkIHMzOTBfcHZf
cHJlcF9yZXNldCh2b2lkKSB7fQ0KPj4gICBzdGF0aWMgaW5saW5lIGludCBzMzkwX3B2X3Zl
cmlmeSh2b2lkKSB7IHJldHVybiAwOyB9DQo+PiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBzMzkw
X3B2X3Vuc2hhcmUodm9pZCkge30NCj4+ICAgc3RhdGljIGlubGluZSB2b2lkIHMzOTBfcHZf
aW5qZWN0X3Jlc2V0X2Vycm9yKENQVVN0YXRlICpjcykge307DQo+PiArc3RhdGljIGlubGlu
ZSB1aW50NjRfdCBrdm1fczM5MF9wdl9kbXBfZ2V0X3NpemVfY3B1KHZvaWQpIHsgcmV0dXJu
IDA7IH0NCj4+ICtzdGF0aWMgaW5saW5lIHVpbnQ2NF90IGt2bV9zMzkwX3B2X2RtcF9nZXRf
c2l6ZV9tZW0odm9pZCkgeyByZXR1cm4gMDsgfQ0KPj4gK3N0YXRpYyBpbmxpbmUgdWludDY0
X3Qga3ZtX3MzOTBfcHZfZG1wX2dldF9zaXplX2NvbXBsZXRlKHZvaWQpIHsgcmV0dXJuDQo+
PiAwOyB9DQo+PiArc3RhdGljIGlubGluZSBib29sIGt2bV9zMzkwX3B2X2luZm9fYmFzaWNf
dmFsaWQodm9pZCkgeyByZXR1cm4gZmFsc2U7IH0NCj4+ICAgI2VuZGlmIC8qIENPTkZJR19L
Vk0gKi8NCj4+DQo+PiAgIGludCBzMzkwX3B2X2t2bV9pbml0KENvbmZpZGVudGlhbEd1ZXN0
U3VwcG9ydCAqY2dzLCBFcnJvciAqKmVycnApOw0KPj4gLS0NCj4+IDIuMzQuMQ0KPj4NCj4+
DQo+Pg0KPiANCg0K

