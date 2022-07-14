Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6C5574997
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:50:44 +0200 (CEST)
Received: from localhost ([::1]:60226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBvUZ-0003u7-Sv
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBvKV-0003Ny-GW; Thu, 14 Jul 2022 05:40:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBvKS-0005vO-VE; Thu, 14 Jul 2022 05:40:18 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26E9CC7T025939;
 Thu, 14 Jul 2022 09:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Azrtdo3XKnrUQHO6bMqh3x6TvljDKE7+wFCShMcny+E=;
 b=j4hIK0gs+X2Ps+E+fw1jPaNW6+WRp0oVdoNHwjD4TDTBp5UFLuKG5SgRGIQNru3BT+kv
 qu2J9yAF/i1NUK4XJ+P2HUaKqVBX/FmmjGL+rC2bkU/mdMe//Z6cb6kStN2WYGSoOcAV
 czmJhueE7VrrPveoXu/f01tTU+UgKOpN8ZRFCg7MuPyKzMuZA0SJmkxfGu+146NVt8OZ
 ZZdjdpI9XY4wTvzPuMuWu/ZtO63Kj8JXKi4DN4i2W99ab3AJxfV4dCE0gG2+mLxf2fF2
 8GCW+zYkIqetyZKqJyvEQB+tOxydLu/vsnrKtasx7tMxEkTBDyqCRhtaQ2TCUugHFc6L kQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3haga28nse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 09:40:13 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26E9DFdi028051;
 Thu, 14 Jul 2022 09:40:13 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3haga28nr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 09:40:13 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26E9aIbl018824;
 Thu, 14 Jul 2022 09:40:11 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3h71a8xvhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 09:40:10 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26E9e7h322348244
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 09:40:07 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F450A4054;
 Thu, 14 Jul 2022 09:40:07 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D06B0A4060;
 Thu, 14 Jul 2022 09:40:06 +0000 (GMT)
Received: from [9.145.62.186] (unknown [9.145.62.186])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jul 2022 09:40:06 +0000 (GMT)
Message-ID: <77707836-f835-39e6-858c-297990ae9b0c@linux.ibm.com>
Date: Thu, 14 Jul 2022 11:40:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 01/11] dump: Cleanup memblock usage
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo"
 <pbonzini@redhat.com>, mhartmay@linux.ibm.com,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 imbrenda@linux.ibm.com, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 "Henderson, Richard" <richard.henderson@linaro.org>
References: <20220713130322.25517-1-frankja@linux.ibm.com>
 <20220713130322.25517-2-frankja@linux.ibm.com>
 <CAMxuvaz=erLFMasq1CK_Y1Ku+dU0ZMR3EPF8ehDnPjQ94R9Rfw@mail.gmail.com>
 <fd62d8e8-a9f0-1e19-c8da-c8f31248983e@linux.ibm.com>
 <CAMxuvaxJ7e6A4n-UOiUKWwh9-9k-yP-rUR47PYER3RT=vzLBCg@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <CAMxuvaxJ7e6A4n-UOiUKWwh9-9k-yP-rUR47PYER3RT=vzLBCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rMQVPkXvZylqxf5qtckDe1C7RiBCrGro
X-Proofpoint-GUID: 7X7GMvWaBYkIVQ-xWONy2JuymHcp5ZPS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-14_06,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207140039
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

T24gNy8xMy8yMiAxNzozNSwgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOg0KPiBIaQ0KPiAN
Cj4gT24gV2VkLCBKdWwgMTMsIDIwMjIgYXQgNzozMCBQTSBKYW5vc2NoIEZyYW5rIDxmcmFu
a2phQGxpbnV4LmlibS5jb20+IHdyb3RlOg0KPj4NCj4+IE9uIDcvMTMvMjIgMTc6MDksIE1h
cmMtQW5kcsOpIEx1cmVhdSB3cm90ZToNCj4+PiBIaQ0KPj4+DQo+Pj4gT24gV2VkLCBKdWwg
MTMsIDIwMjIgYXQgNTowNyBQTSBKYW5vc2NoIEZyYW5rIDxmcmFua2phQGxpbnV4LmlibS5j
b20+IHdyb3RlOg0KPj4+Pg0KPj4+PiBUaGUgaXRlcmF0aW9uIG92ZXIgdGhlIG1lbWJsb2Nr
cyBpcyBoYXJkIHRvIHVuZGVyc3RhbmQgc28gaXQncyBhYm91dA0KPj4+PiB0aW1lIHRvIGNs
ZWFuIGl0IHVwLg0KPj4+Pg0KPj4+PiBzdHJ1Y3QgRHVtcFN0YXRlJ3MgbmV4dF9ibG9jayBh
bmQgc3RhcnQgbWVtYmVycyBjYW4gYW5kIHNob3VsZCBiZQ0KPj4+PiBsb2NhbCB2YXJpYWJs
ZXMgd2l0aGluIHRoZSBpdGVyYXRvci4NCj4+Pj4NCj4+Pj4gSW5zdGVhZCBvZiBtYW51YWxs
eSBncmFiYmluZyB0aGUgbmV4dCBtZW1ibG9jayB3ZSBjYW4gdXNlDQo+Pj4+IFFUQUlMUV9G
T1JFQUNIIHRvIGl0ZXJhdGUgb3ZlciBhbGwgbWVtYmxvY2tzLg0KPj4+Pg0KPj4+PiBUaGUg
YmVnaW4gYW5kIGxlbmd0aCBmaWVsZHMgaW4gdGhlIER1bXBTdGF0ZSBoYXZlIGJlZW4gbGVm
dCB1bnRvdWNoZWQNCj4+Pj4gc2luY2UgdGhlIHFtcCBhcmd1bWVudHMgc2hhcmUgdGhlaXIg
bmFtZXMuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphbm9zY2ggRnJhbmsgPGZyYW5r
amFAbGludXguaWJtLmNvbT4NCj4+Pg0KPj4+IEFmdGVyIHRoaXMgcGF0Y2g6DQo+Pj4gLi9x
ZW11LXN5c3RlbS14ODZfNjQgLW1vbml0b3Igc3RkaW8gLVMNCj4+PiAocWVtdSkgZHVtcC1n
dWVzdC1tZW1vcnkgZm9vDQo+Pj4gRXJyb3I6IGR1bXA6IGZhaWxlZCB0byBzYXZlIG1lbW9y
eTogQmFkIGFkZHJlc3MNCj4+DQo+PiBJZiB5b3UgaGF2ZSBtb3JlIHdheXMgdG8gY2hlY2sg
Zm9yIGR1bXAgZXJyb3JzIHRoZW4gcGxlYXNlIHNlbmQgdGhlbSB0bw0KPj4gbWUuIEknbSBh
d2FyZSB0aGF0IHRoaXMgbWlnaHQgbm90IGhhdmUgYmVlbiBhIDEwMCUgY29udmVyc2lvbiBh
bmQgSSdtIGENCj4+IGJpdCB0ZXJyaWZpZWQgYWJvdXQgdGhlIGZhY3QgdGhhdCB0aGlzIHdp
bGwgYWZmZWN0IGFsbCBhcmNoaXRlY3R1cmVzLg0KPiANCj4gU2FtZSBmZWVsaW5nIGhlcmUu
IE1heWJlIGl0J3MgYWJvdXQgdGltZSB0byB3cml0ZSByZWFsIGR1bXAgdGVzdHMhDQoNCldl
IGhhdmUgdGVzdHMgZm9yIHMzOTAgYW5kIEkndmUgcHJvbXB0ZWQgZm9yIHRlc3RzIHdpdGgg
ZmlsdGVyaW5nIHNvIHdlIA0KY2FuIGFsc28gY292ZXIgdGhhdC4gVW5mb3J0dW5hdGVseSBz
MzkwIGRpZmZlcnMgaW4gdGhlIHVzZSBvZiBtZW1vcnkgDQpiZWNhdXNlIHdlIG9ubHkgaGF2
ZSBvbmUgbGFyZ2UgYmxvY2sgd2hpY2ggaGlkIHRoaXMgZXJyb3IgZnJvbSBtZS4NCg0KDQo+
Pj4NCj4+Pj4gKyAgICAgICAgaWYgKGJsb2NrLT50YXJnZXRfc3RhcnQgPj0gZmlsdGVyX2Fy
ZWFfc3RhcnQgKyBmaWx0ZXJfYXJlYV9sZW5ndGggfHwNCj4+Pj4gKyAgICAgICAgICAgIGJs
b2NrLT50YXJnZXRfZW5kIDw9IGZpbHRlcl9hcmVhX3N0YXJ0KSB7DQo+Pj4+ICsgICAgICAg
ICAgICByZXR1cm4gLTE7DQo+Pj4+ICsgICAgICAgIH0NCj4+Pj4gKyAgICAgICAgaWYgKGZp
bHRlcl9hcmVhX3N0YXJ0ID4gYmxvY2stPnRhcmdldF9zdGFydCkgew0KPj4+PiArICAgICAg
ICAgICAgcmV0dXJuIGZpbHRlcl9hcmVhX3N0YXJ0IC0gYmxvY2stPnRhcmdldF9zdGFydDsN
Cj4+Pj4gKyAgICAgICAgfQ0KPj4+PiArICAgIH0NCj4+Pj4gKyAgICByZXR1cm4gYmxvY2st
PnRhcmdldF9zdGFydDsNCj4+Pg0KPj4+IFRoaXMgdXNlZCB0byBiZSAwLiBDaGFuZ2luZyB0
aGF0LCBJIHRoaW5rIHRoZSBwYXRjaCBsb29rcyBnb29kLg0KPj4+IEFsdGhvdWdoIGl0IGNv
dWxkIHBlcmhhcHMgYmUgc3BsaXR0ZWQgdG8gaW50cm9kdWNlIHRoZSB0d28gZnVuY3Rpb25z
Lg0KPj4NCj4+IFllcyBidXQgdGhlIDAgd2FzIHVzZWQgdG8gaW5kaWNhdGUgdGhhdCB3ZSB3
b3VsZCBoYXZlIG5lZWRlZCBjb250aW51ZQ0KPj4gaXRlcmF0aW5nIGFuZCB0aGUgaXRlcmF0
aW9uIGlzIGRvbmUgdmlhIG90aGVyIG1lYW5zIGluIHRoaXMgcGF0Y2guDQo+Pg0KPj4gT3Ig
YW0gSSBtaXNzaW5nIHNvbWV0aGluZz8NCg0KSGFkIGEgbG9vaywgdHVybnMgb3V0IEkgbWlz
c2VkIHNvbWV0aGluZy4NCg0KPiANCj4gV2VsbCwgeW91IGNoYW5nZWQgdGhlIHdheSB0aGUg
bG9vcCB1c2VkIHRvIHdvcmsuIGl0IHVzZWQgdG8gcmV0dXJuIDEvMA0KPiB0byBpbmRpY2F0
ZSBzdG9wL2NvbnRpbnVlIGFuZCByZWx5IG9uIHMtPnN0YXJ0IC8gcy0+bmV4dF9ibG9jay4g
Tm93DQo+IHlvdSByZXR1cm4gbWVtYmxvY2tfc3RhcnQuDQoNCk1heWJlIHdlIHNob3VsZCBj
YWxsIHRoaXMgImR1bXBfZ2V0X21lbWJsb2NrX3N0YXJ0X29mZnNldCgpIiB0byBtYWtlIGl0
IA0KY2xlYXJlciB0aGF0IHdlIGRvbid0IHJldHVybiBibG9jay0+dGFyZ2V0X3N0YXJ0IGku
ZS4gYSBzdGFydCBhZGRyZXNzIA0KYnV0IHJhdGhlciBhbiBvZmZzZXQgdGhhdCB3ZSB0YWNr
IG9uIHRoZSBob3N0IGFkZHJlc3MgdG8gcmVhZCB0aGUgbWVtb3J5Pw0KDQo+IA0KPj4NCj4+
Pg0KPj4+PiArfQ0KPj4+PiAgICAjZW5kaWYNCj4+Pj4gLS0NCj4+Pj4gMi4zNC4xDQo+Pj4+
DQo+Pj4NCj4+Pg0KPj4NCj4gDQo+IA0KDQo=

