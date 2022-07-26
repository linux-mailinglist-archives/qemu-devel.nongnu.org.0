Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0141958155B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 16:33:25 +0200 (CEST)
Received: from localhost ([::1]:33940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGLch-0007vc-8T
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 10:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGLWD-00034v-HQ; Tue, 26 Jul 2022 10:26:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGLWA-0004lB-3k; Tue, 26 Jul 2022 10:26:40 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QELush028200;
 Tue, 26 Jul 2022 14:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KCACFV1KvrQDWRwJf5gTN+wRcvyTq03omYmTfHVKcfk=;
 b=SJhd0QRa32lK7VB09XJdfpEDZaHWTjb1O6EVGGvB1i3v7zjxSVYcbh3zSpJyo7lLv2v2
 AOFHrYeMF5TbOmOgJduLdna82hCs21a+vt1TegwR0aeSNBBsAWvpTke3JqjDIlDuzFO0
 W7qzOc1OTpSrcmisUHcAjuXY+7ehhqfBpOE8IkW2KZ+PdP+Jq0/ViNPTZ62Pd5w/22DN
 gLUNYHYGMI0lrq/V3BLleVelOOFANYLb8ZdDc30XwlSnSkt3CiK72hqORX8KQgjCJecb
 wljoySpDPnk/nYp8/8aXELIi+5BWGCokSuK0BuTJ19jnpwrhSOVKsXd7LDydC5iOTgbk jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjhygg48k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 14:26:36 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QEMqas031294;
 Tue, 26 Jul 2022 14:26:36 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjhygg47b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 14:26:36 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26QELdDl005766;
 Tue, 26 Jul 2022 14:26:34 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3hg96wkw7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 14:26:34 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26QEQUO216646456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 14:26:30 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4FFEA405B;
 Tue, 26 Jul 2022 14:26:30 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6901DA405F;
 Tue, 26 Jul 2022 14:26:30 +0000 (GMT)
Received: from [9.145.6.94] (unknown [9.145.6.94])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jul 2022 14:26:30 +0000 (GMT)
Message-ID: <7fe6312d-d523-2f3d-56de-ed73e267a851@linux.ibm.com>
Date: Tue, 26 Jul 2022 16:26:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 11/17] dump/dump: Add section string table support
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo"
 <pbonzini@redhat.com>, mhartmay@linux.ibm.com,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 imbrenda@linux.ibm.com, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 seiden@linux.ibm.com, scgl@linux.ibm.com
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-12-frankja@linux.ibm.com>
 <CAMxuvawu-q-Fe4ZXU2Bc1gwLfpQCCw3HxWhbBK6+8exkM1b+nw@mail.gmail.com>
 <e24cff5c-3171-69dc-3e17-d4f773be6f2b@linux.ibm.com>
 <CAJ+F1CL8qm4qiHbKyE2YCAZ1ZVMKF-UAR6f39zMgw2Xdq7zCgQ@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <CAJ+F1CL8qm4qiHbKyE2YCAZ1ZVMKF-UAR6f39zMgw2Xdq7zCgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WX5VjYKL34Z8fn3FAbpZohXI_939ezcf
X-Proofpoint-ORIG-GUID: WQ0_82qZZ8FBOFP_UFri4Is_uCGPuWyf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260054
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

T24gNy8yNi8yMiAxNToxMiwgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOg0KPiBPbiBUdWUs
IEp1bCAyNiwgMjAyMiBhdCA0OjU1IFBNIEphbm9zY2ggRnJhbmsgPGZyYW5ramFAbGludXgu
aWJtLmNvbT4gd3JvdGU6DQo+IA0KPj4gT24gNy8yNi8yMiAxMzoyNSwgTWFyYy1BbmRyw6kg
THVyZWF1IHdyb3RlOg0KPj4+IEhpDQo+Pj4NCj4+PiBPbiBUdWUsIEp1bCAyNiwgMjAyMiBh
dCAxOjIzIFBNIEphbm9zY2ggRnJhbmsgPGZyYW5ramFAbGludXguaWJtLmNvbT4NCj4+IHdy
b3RlOg0KPj4+Pg0KPj4+PiBBcyBzZWN0aW9ucyBkb24ndCBoYXZlIGEgdHlwZSBsaWtlIHRo
ZSBub3RlcyBkbyB3ZSBuZWVkIGFub3RoZXIgd2F5IHRvDQo+Pj4+IGRldGVybWluZSB0aGVp
ciBjb250ZW50cy4gVGhlIHN0cmluZyB0YWJsZSBhbGxvd3MgdXMgdG8gYXNzaWduIGVhY2gN
Cj4+Pj4gc2VjdGlvbiBhbiBpZGVudGlmaWNhdGlvbiBzdHJpbmcgd2hpY2ggYXJjaGl0ZWN0
dXJlcyBjYW4gdGhlbiB1c2UgdG8NCj4+Pj4gdGFnIHRoZWlyIHNlY3Rpb25zIHdpdGguDQo+
Pj4+DQo+Pj4+IFRoZXJlIHdpbGwgYmUgbm8gc3RyaW5nIHRhYmxlIGlmIHRoZSBhcmNoaXRl
Y3R1cmUgZG9lc24ndCBhZGQgY3VzdG9tDQo+Pj4+IHNlY3Rpb25zIHdoaWNoIGFyZSBpbnRy
b2R1Y2VkIGluIGEgZm9sbG93aW5nIHBhdGNoLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBKYW5vc2NoIEZyYW5rIDxmcmFua2phQGxpbnV4LmlibS5jb20+DQpbLi4uXQ0KPj4gWy4u
XQ0KPj4+PiAgICAgICAgcy0+bGVuZ3RoID0gbGVuZ3RoOw0KPj4+PiArICAgIC8qIEZpcnN0
IGluZGV4IGlzIDAsIGl0J3MgdGhlIHNwZWNpYWwgbnVsbCBuYW1lICovDQo+Pj4+ICsgICAg
cy0+c3RyaW5nX3RhYmxlX2J1ZiA9IGdfYXJyYXlfbmV3KEZBTFNFLCBUUlVFLCAxKTsNCj4+
Pj4gKyAgICAvKg0KPj4+PiArICAgICAqIEFsbG9jYXRlIHRoZSBudWxsIG5hbWUsIGR1ZSB0
byB0aGUgY2xlYXJpbmcgb3B0aW9uIHNldCB0byB0cnVlDQo+Pj4+ICsgICAgICogaXQgd2ls
bCBiZSAwLg0KPj4+PiArICAgICAqLw0KPj4+PiArICAgIGdfYXJyYXlfc2V0X3NpemUocy0+
c3RyaW5nX3RhYmxlX2J1ZiwgMSk7DQo+Pj4NCj4+PiBJIHdvbmRlciBpZiBHQnl0ZUFycmF5
IHdvdWxkbid0IGJlIG1vcmUgYXBwcm9wcmlhdGUsIGV2ZW4gaWYgaXQNCj4+PiBkb2Vzbid0
IGhhdmUgdGhlIGNsZWFyaW5nIG9wdGlvbi4gSWYgaXQncyBqdXN0IGZvciBvbmUgYnl0ZSwg
Li4uDQo+Pg0KPj4gSSBkb24ndCByZWFsbHkgY2FyZSBidXQgSSBuZWVkIGEgZGVjaXNpb24g
b24gaXQgdG8gY2hhbmdlIGl0IDopDQo+Pg0KPiANCj4gSSBoYXZlbid0IHRyaWVkLCBidXQg
SSB0aGluayBpdCB3b3VsZCBiZSBhIGJldHRlciBmaXQuDQoNCkxvb2tpbmcgYXQgdGhpcyBh
IHNlY29uZCB0aW1lIHRoZXJlJ3MgYW4gaXNzdWUgeW91IHNob3VsZCBjb25zaWRlcjoNCg0K
R0J5dGVBcnJheSB1c2VzIGd1aW50OCB3aGlsZSB0aGUgR0FycmF5IHVzZXMgZ2NoYXJzIHdo
aWNoIGFyZSBhcHBhcmVudGx5IA0KY29tcGF0aWJsZSB3aXRoIG5vcm1hbCBDIGNoYXJzLg0K
DQpJLmUuIEkgbmVlZCB0byBjYXN0IGFsbCBzdHJpbmdzIHRvIChjb25zdCBndWludDggKikg
d2hlbiBhcHBlbmRpbmcgdGhlbSANCnRvIHRoZSBHQnl0ZUFycmF5Lg0K

