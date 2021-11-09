Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3B744B1C3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 18:08:13 +0100 (CET)
Received: from localhost ([::1]:47450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUbU-0005QZ-Mz
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 12:08:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1mkUVW-0004cm-I8; Tue, 09 Nov 2021 12:02:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25508
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1mkUVQ-00050M-VW; Tue, 09 Nov 2021 12:02:02 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A9G4XGh026186; 
 Tue, 9 Nov 2021 17:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=O/JO59sSuDXvOqBQ4udhnCuVA5OueC2BjDnpiFsf5Bk=;
 b=f8cnaXuBCHG0X5aho/7EU8BN5+F6KSiMH66WgZZMRKNlPhp+Xg/9Jn7+8Qx+rNdKeTew
 0uvHCILqG/UjLtO0XxiDCTuPvx76oAvHl31IyDOshzupQlcgOcYwJ45BFrB50B30BCqZ
 6H2/5xe/EFnhKp2mQZuumfog//JQopw7Aq10j/G6ZFOLAdOvofUI3SbC/XHMCBZMKW5i
 xs6laJhMp2OkAAgEYs1yzNc3CLyQF4ot2MdxhiyInIf63frMlyGkp0VvW+5sR+hvexYX
 avHfv2J/ndN2iBr5VDwzmoVsC2G8xvjwEYszTx/zk37evSAOq5aAvOsou3STfk5lNeiI SQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c7tmj4k1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 17:01:55 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A9Go9ZM023531;
 Tue, 9 Nov 2021 17:01:54 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c7tmj4k0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 17:01:54 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A9GgFkP019499;
 Tue, 9 Nov 2021 17:01:53 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3c5hba8ps6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 17:01:52 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A9H1nPt41025876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Nov 2021 17:01:49 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DD16AE05A;
 Tue,  9 Nov 2021 17:01:49 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13A88AE063;
 Tue,  9 Nov 2021 17:01:49 +0000 (GMT)
Received: from [9.145.25.95] (unknown [9.145.25.95])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  9 Nov 2021 17:01:48 +0000 (GMT)
Message-ID: <a7cbf646-0ad6-e33d-3e32-ce2400e2f96f@linux.ibm.com>
Date: Tue, 9 Nov 2021 18:01:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Collin Walling <walling@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20211108211311.33834-1-walling@linux.ibm.com>
 <430b5c19-73dd-a006-8999-925fd757dbe2@de.ibm.com>
 <548d32dd-e087-9068-26c4-5facb44392a9@linux.ibm.com>
 <d02aef01-f620-2094-ce79-976ed1635d1d@linux.ibm.com>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v2] s390x: kvm: adjust diag318 resets to retain data
In-Reply-To: <d02aef01-f620-2094-ce79-976ed1635d1d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EiGfLidUlmfuiZTfDNoDQOHUrJ33cSX1
X-Proofpoint-GUID: et5h-4Vv0s_Iz8g6bxoSpAULcBXw5uRS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_04,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090098
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, cohuck@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMTEvOS8yMSAxNjo1OCwgQ29sbGluIFdhbGxpbmcgd3JvdGU6DQo+IE9uIDExLzkvMjEg
MDU6NDgsIEphbm9zY2ggRnJhbmsgd3JvdGU6DQo+PiBPbiAxMS85LzIxIDA4OjMyLCBDaHJp
c3RpYW4gQm9ybnRyYWVnZXIgd3JvdGU6DQo+Pj4NCj4+Pg0KPj4+IEFtIDA4LjExLjIxIHVt
IDIyOjEzIHNjaHJpZWIgQ29sbGluIFdhbGxpbmc6DQo+Pj4+IFRoZSBDUE5DIHBvcnRpb24g
b2YgdGhlIGRpYWcgMzE4IGRhdGEgaXMgZXJyb25lb3VzbHkgcmVzZXQgZHVyaW5nIGFuDQo+
Pj4+IGluaXRpYWwgQ1BVIHJlc2V0IGNhdXNlZCBieSBTSUdQLiBMZXQncyBnbyBhaGVhZCBh
bmQgcmVsb2NhdGUgdGhlDQo+Pj4+IGRpYWczMThfaW5mbyBmaWVsZCB3aXRoaW4gdGhlIENQ
VVMzOTBYU3RhdGUgc3RydWN0IHN1Y2ggdGhhdCBpdCBpcw0KPj4+PiBvbmx5IHplcm9lZCBk
dXJpbmcgYSBjbGVhciByZXNldC4gVGhpcyB3YXksIHRoZSBDUE5DIHdpbGwgYmUgcmV0YWlu
ZWQNCj4+Pj4gZm9yIGVhY2ggVkNQVSBpbiB0aGUgY29uZmlndXJhdGlvbiBhZnRlciB0aGUg
ZGlhZyAzMTggaW5zdHJ1Y3Rpb24NCj4+Pj4gaGFzIGJlZW4gaW52b2tlZC4NCj4+Pj4NCj4+
Pj4gQWRkaXRpb25hbGx5LCB0aGUgZGlhZyAzMTggZGF0YSByZXNldCBpcyBoYW5kbGVkIHZp
YSB0aGUgQ1BVIHJlc2V0DQo+Pj4+IGNvZGUgZHVyaW5nIGEgY2xlYXIgcmVzZXQuIFRoaXMg
bWVhbnMgc29tZSBvZiB0aGUgZGlhZyAzMTgtc3BlY2lmaWMNCj4+Pj4gcmVzZXQgY29kZSBj
YW4gbm93IGJlIHJlbW92ZWQuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IENvbGxpbiBX
YWxsaW5nIDx3YWxsaW5nQGxpbnV4LmlibS5jb20+DQo+Pj4+IEZpeGVzOiBmYWJkYWRhOTM1
N2IgKCJzMzkwOiBndWVzdCBzdXBwb3J0IGZvciBkaWFnbm9zZSAweDMxOCIpDQo+Pj4+IFJl
cG9ydGVkLWJ5OiBDaHJpc3RpYW4gQm9ybnRyYWVnZXIgPGJvcm50cmFlZ2VyQGRlLmlibS5j
b20+DQo+Pj4NCj4+PiBJdCB3b3VsZCBiZSBnb29kIHRvIGFkZCBhdCBsZWFzdCBhIGNvbW1l
bnQgaW4gdGhlIGRpYWczMDggaGFuZGxlcnMNCj4+PiB3aGVyZSB0aGUgdmFsdWUgb2YgY3Bu
YyBpcyByZXNldHRlZCBkdXJpbmcgdGhlIHJlc2V0cyB0aGF0IEphbm9zY2gNCj4+PiBtZW50
aW9uZWQuDQo+Pj4+DQo+Pj4+IC0tLQ0KPj4+Pg0KPj4+PiBDaGFuZ2Vsb2c6DQo+Pj4+DQo+
Pj4+ICDCoMKgwqDCoHYyDQo+Pj4+ICDCoMKgwqDCoC0gaGFuZGxlciB1c2VzIHJ1bl9vbl9j
cHUgYWdhaW4NCj4+Pj4gIMKgwqDCoMKgLSByZXdvcmRlZCBjb21taXQgbWVzc2FnZSBzbGln
aHRseQ0KPj4+PiAgwqDCoMKgwqAtIGFkZGVkIGZpeGVzIGFuZCByZXBvcnRlZC1ieSB0YWdz
DQo+Pj4+DQo+Pj4+IC0tLQ0KPj4+PiAgwqDCoCBody9zMzkweC9zMzkwLXZpcnRpby1jY3cu
Y8KgwqAgfMKgIDMgLS0tDQo+Pj4+ICDCoMKgIHRhcmdldC9zMzkweC9jcHUtc3lzZW11LmPC
oMKgwqAgfMKgIDcgLS0tLS0tLQ0KPj4+PiAgwqDCoCB0YXJnZXQvczM5MHgvY3B1LmjCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgNSArKy0tLQ0KPj4+PiAgwqDCoCB0YXJnZXQvczM5MHgv
a3ZtL2t2bS5jwqDCoMKgwqDCoMKgIHwgMTQgKysrKystLS0tLS0tLS0NCj4+Pj4gIMKgwqAg
dGFyZ2V0L3MzOTB4L2t2bS9rdm1fczM5MHguaCB8wqAgMSAtDQo+Pj4+ICDCoMKgIDUgZmls
ZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+
Pj4gZGlmZiAtLWdpdCBhL2h3L3MzOTB4L3MzOTAtdmlydGlvLWNjdy5jIGIvaHcvczM5MHgv
czM5MC12aXJ0aW8tY2N3LmMNCj4+Pj4gaW5kZXggNjUzNTg3ZWE2Mi4uNTFkY2I4M2IwYyAx
MDA2NDQNCj4+Pj4gLS0tIGEvaHcvczM5MHgvczM5MC12aXJ0aW8tY2N3LmMNCj4+Pj4gKysr
IGIvaHcvczM5MHgvczM5MC12aXJ0aW8tY2N3LmMNCj4+Pj4gQEAgLTQ4OSw5ICs0ODksNiBA
QCBzdGF0aWMgdm9pZCBzMzkwX21hY2hpbmVfcmVzZXQoTWFjaGluZVN0YXRlDQo+Pj4+ICpt
YWNoaW5lKQ0KPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ19hc3NlcnRfbm90X3JlYWNo
ZWQoKTsNCj4+Pj4gIMKgwqDCoMKgwqDCoCB9DQo+Pj4+ICDCoMKgIC3CoMKgwqAgQ1BVX0ZP
UkVBQ0godCkgew0KPj4+PiAtwqDCoMKgwqDCoMKgwqAgcnVuX29uX2NwdSh0LCBzMzkwX2Rv
X2NwdV9zZXRfZGlhZzMxOCwNCj4+Pj4gUlVOX09OX0NQVV9IT1NUX1VMT05HKDApKTsNCj4+
Pj4gLcKgwqDCoCB9DQo+Pg0KPj4gVGhpcyBuZWVkcyB0byBzdGF5IGZvciB0aGUgbW92ZSB0
byB0aGUgY2xlYXIgcmVzZXQgYXJlYSB0byB3b3JrIG9uIG90aGVyDQo+PiBkaWFnMzA4IHN1
YmNvZGVzLiBUaGUgcmVzZXQgd2lsbCB0aGVuIGJlIGRvbmUgdHdpY2UgZm9yIHRoZSBjbGVh
ciByZXNldA0KPj4gYnV0IHRoYXQncyBmaW5lLg0KPj4NCj4+IE1vdmluZyB0aGUgZGlhZzMx
OCBkYXRhIGludG8gdGhlIGNsZWFyIGFyZWEgbWVhbnMgd2Ugb25seSByZXNldCBpdCBvbiBh
DQo+PiBmdWxsIGNwdSByZXNldCB3aGljaCBpcyBvbmx5IGRvbmUgZm9yIGRpYWdub3NlIDMw
OCBzdWJjb2RlIDAgYW5kIG1heWJlIGENCj4+IFFFTVUgcmVzZXQsIEkgZGlkbid0IGZ1bGx5
IGZvbGxvdyB0aGUgY29kZSB0aGVyZS4NCj4+DQo+PiBUaGUgb3RoZXIgc3ViY29kZXMgZG8g
YW4gaW5pdGlhbCByZXNldCBvbiB0aGUgY2FsbGluZyBjcHUgYW5kIG5vcm1hbA0KPj4gcmVz
ZXRzIG9uIHRoZSBvdGhlcnMgb3IganVzdCBub3JtYWwgcmVzZXRzIHdoaWNoIGRvbid0IHRv
dWNoIHRoZSAzMTgNCj4+IGRhdGEgaWYgd2UgbW92ZSBpdCBpbnRvIHRoZSBjbGVhciByZXNl
dCBhcmVhLg0KPj4+IE9yIGRpZCBJIG1pc3Mgc29tZXRoaW5nIGZ1bmRhbWVudGFsIGhlcmU/
DQo+Pg0KPj4NCj4gV2hpbGUgdGhlIGRpYWczMTggZGF0YSB3aWxsIG5vdCBiZSBjbGVhcmVk
IGR1cmluZyBhbiBpbml0aWFsIGFuZCBsb2FkDQo+IG5vcm1hbCByZXNldHMgX2RpcmVjdGx5
XywgdGhlIHMzOTBfbWFjaGluZV9yZXNldCBmdW5jdGlvbiBlbmRzIHdpdGggdGhlDQo+IGNh
bGwgYmVsb3c6DQo+IA0KPj4+PiAgwqDCoMKgwqDCoMKgIHMzOTBfaXBsX2NsZWFyX3Jlc2V0
X3JlcXVlc3QoKTsNCj4+Pj4gIMKgwqAgfQ0KPiANCj4gVGhlIGNsZWFyIHJlc2V0IHJlcXVl
c3QgaXMgaW52b2tlZCBhZnRlciBlYWNoIG9mIHRoZSByZXNldCB0eXBlcyBhdCB0aGUNCj4g
dGFpbCBlbmQgb2YgdGhlIGZ1bmN0aW9uLiBCZWNhdXNlIG9mIHRoaXMsIHRoZSBkaWFnMzE4
IGRhdGEgd2lsbCBiZQ0KPiByZXNldCBkdXJpbmcgdGhlIDMwOCBzdWJjb2RlcyBieSB3YXkg
b2YgdGhlIGNsZWFyIHJlc2V0IGF0IHRoZSBlbmQuDQoNClRoaXMgY2hhbmdlcyBhIGZldyB2
YWx1ZXMgaW4gaXBsLmMgYW5kIGlzIG5vdCBpbiBmYWN0IGEgY3B1IGNsZWFyIHJlc2V0Lg0K
DQpRRU1VIGtub3dzIGEgbG90IG9mIHJlc2V0cy4gVGhlIFZNIHJlc2V0cyBoZXJlIG1haW5s
eSBkZXBpY3QgZGlhZ25vc2UgDQozMDggc3ViY29kZXMgd2hpY2ggc2V0IHRoZSBjcHVzIGFu
ZCB0aGUgY2hhbm5lbCBzdWJzeXN0ZW0gaW50byBhIA0Kc3BlY2lmaWMgc3RhdGUgZm9yIHRo
ZSBwdXJwb3NlIG9mIElQTCAoc3ViY29kZSAzIGFuZCA0IGFyZSBob3cgd2UgSVBMLCANCnN1
YmNvZGUgMTAgaXMgUFYgSVBMKS4NCg0KVGhlIENQVSByZXNldHMgY2FuIGJlIHRyaWdnZXJl
ZCBieSBTSUdQIChub3JtYWwgYW5kIGluaXRpYWwsIE5PVCBjbGVhciANCnJlc2V0KSBvciBh
cmUgdHJpZ2dlcmVkIGFzIHBhcnQgb2YgYSBWTSByZXNldCBtZW50aW9uZWQgYWJvdmUuDQoN
Cj4gDQo+Pj4+ICDCoMKgIGRpZmYgLS1naXQgYS90YXJnZXQvczM5MHgvY3B1LXN5c2VtdS5j
IGIvdGFyZ2V0L3MzOTB4L2NwdS1zeXNlbXUuYw0KPj4+PiBpbmRleCA1NDcxZTAxZWU4Li42
ZDlmNmQ0NDAyIDEwMDY0NA0KPj4+PiAtLS0gYS90YXJnZXQvczM5MHgvY3B1LXN5c2VtdS5j
DQo+Pj4+ICsrKyBiL3RhcmdldC9zMzkweC9jcHUtc3lzZW11LmMNCj4+Pj4gQEAgLTI5OSwx
MCArMjk5LDMgQEAgdm9pZCBzMzkwX2VuYWJsZV9jc3Nfc3VwcG9ydChTMzkwQ1BVICpjcHUp
DQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBrdm1fczM5MF9lbmFibGVfY3NzX3N1cHBv
cnQoY3B1KTsNCj4+Pj4gIMKgwqDCoMKgwqDCoCB9DQo+Pj4+ICDCoMKgIH0NCj4+Pj4gLQ0K
Pj4+PiAtdm9pZCBzMzkwX2RvX2NwdV9zZXRfZGlhZzMxOChDUFVTdGF0ZSAqY3MsIHJ1bl9v
bl9jcHVfZGF0YSBhcmcpDQo+Pj4+IC17DQo+Pj4+IC3CoMKgwqAgaWYgKGt2bV9lbmFibGVk
KCkpIHsNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGt2bV9zMzkwX3NldF9kaWFnMzE4KGNzLCBh
cmcuaG9zdF91bG9uZyk7DQo+Pj4+IC3CoMKgwqAgfQ0KPj4+PiAtfQ0KPj4+PiBkaWZmIC0t
Z2l0IGEvdGFyZ2V0L3MzOTB4L2NwdS5oIGIvdGFyZ2V0L3MzOTB4L2NwdS5oDQo+Pj4+IGlu
ZGV4IDMxNTNkMDUzZTkuLjFiOTRiOTFkODcgMTAwNjQ0DQo+Pj4+IC0tLSBhL3RhcmdldC9z
MzkweC9jcHUuaA0KPj4+PiArKysgYi90YXJnZXQvczM5MHgvY3B1LmgNCj4+Pj4gQEAgLTYz
LDYgKzYzLDggQEAgc3RydWN0IENQVVMzOTBYU3RhdGUgew0KPj4+PiAgwqDCoMKgwqDCoMKg
IHVpbnQ2NF90IGV0b2tlbjvCoMKgwqDCoMKgwqAgLyogZXRva2VuICovDQo+Pj4+ICDCoMKg
wqDCoMKgwqAgdWludDY0X3QgZXRva2VuX2V4dGVuc2lvbjsgLyogZXRva2VuIGV4dGVuc2lv
biAqLw0KPj4+PiAgwqDCoCArwqDCoMKgIHVpbnQ2NF90IGRpYWczMThfaW5mbzsNCj4+Pj4g
Kw0KPj4+PiAgwqDCoMKgwqDCoMKgIC8qIEZpZWxkcyB1cCB0byB0aGlzIHBvaW50IGFyZSBu
b3QgY2xlYXJlZCBieSBpbml0aWFsIENQVQ0KPj4+PiByZXNldCAqLw0KPj4+PiAgwqDCoMKg
wqDCoMKgIHN0cnVjdCB7fSBzdGFydF9pbml0aWFsX3Jlc2V0X2ZpZWxkczsNCj4+Pj4gIMKg
wqAgQEAgLTExOCw4ICsxMjAsNiBAQCBzdHJ1Y3QgQ1BVUzM5MFhTdGF0ZSB7DQo+Pj4+ICDC
oMKgwqDCoMKgwqAgdWludDE2X3QgZXh0ZXJuYWxfY2FsbF9hZGRyOw0KPj4+PiAgwqDCoMKg
wqDCoMKgIERFQ0xBUkVfQklUTUFQKGVtZXJnZW5jeV9zaWduYWxzLCBTMzkwX01BWF9DUFVT
KTsNCj4+Pj4gIMKgwqAgLcKgwqDCoCB1aW50NjRfdCBkaWFnMzE4X2luZm87DQo+Pj4+IC0N
Cj4+Pj4gIMKgwqAgI2lmICFkZWZpbmVkKENPTkZJR19VU0VSX09OTFkpDQo+Pj4+ICDCoMKg
wqDCoMKgwqAgdWludDY0X3QgdGxiX2ZpbGxfdGVjO8KgwqAgLyogdHJhbnNsYXRpb24gZXhj
ZXB0aW9uIGNvZGUgZHVyaW5nDQo+Pj4+IHRsYl9maWxsICovDQo+Pj4+ICDCoMKgwqDCoMKg
wqAgaW50IHRsYl9maWxsX2V4YzvCoMKgwqDCoMKgwqDCoCAvKiBleGNlcHRpb24gbnVtYmVy
IHNlZW4gZHVyaW5nDQo+Pj4+IHRsYl9maWxsICovDQo+Pj4+IEBAIC03ODAsNyArNzgwLDYg
QEAgaW50IHMzOTBfc2V0X21lbW9yeV9saW1pdCh1aW50NjRfdCBuZXdfbGltaXQsDQo+Pj4+
IHVpbnQ2NF90ICpod19saW1pdCk7DQo+Pj4+ICDCoMKgIHZvaWQgczM5MF9zZXRfbWF4X3Bh
Z2VzaXplKHVpbnQ2NF90IHBhZ2VzaXplLCBFcnJvciAqKmVycnApOw0KPj4+PiAgwqDCoCB2
b2lkIHMzOTBfY21tYV9yZXNldCh2b2lkKTsNCj4+Pj4gIMKgwqAgdm9pZCBzMzkwX2VuYWJs
ZV9jc3Nfc3VwcG9ydChTMzkwQ1BVICpjcHUpOw0KPj4+PiAtdm9pZCBzMzkwX2RvX2NwdV9z
ZXRfZGlhZzMxOChDUFVTdGF0ZSAqY3MsIHJ1bl9vbl9jcHVfZGF0YSBhcmcpOw0KPj4+PiAg
wqDCoCBpbnQgczM5MF9hc3NpZ25fc3ViY2hfaW9ldmVudGZkKEV2ZW50Tm90aWZpZXIgKm5v
dGlmaWVyLCB1aW50MzJfdA0KPj4+PiBzY2hfaWQsDQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
bnQgdnEsIGJvb2wgYXNzaWduKTsNCj4+Pj4gIMKgwqAgI2lmbmRlZiBDT05GSUdfVVNFUl9P
TkxZDQo+Pj4+IGRpZmYgLS1naXQgYS90YXJnZXQvczM5MHgva3ZtL2t2bS5jIGIvdGFyZ2V0
L3MzOTB4L2t2bS9rdm0uYw0KPj4+PiBpbmRleCA1YjFmZGI1NWM0Li44OTcwZDljYTU1IDEw
MDY0NA0KPj4+PiAtLS0gYS90YXJnZXQvczM5MHgva3ZtL2t2bS5jDQo+Pj4+ICsrKyBiL3Rh
cmdldC9zMzkweC9rdm0va3ZtLmMNCj4+Pj4gQEAgLTE1NzYsMTYgKzE1NzYsMTMgQEAgc3Rh
dGljIGludCBoYW5kbGVfc3dfYnJlYWtwb2ludChTMzkwQ1BVICpjcHUsDQo+Pj4+IHN0cnVj
dCBrdm1fcnVuICpydW4pDQo+Pj4+ICDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9FTlQ7DQo+
Pj4+ICDCoMKgIH0NCj4+Pj4gIMKgwqAgLXZvaWQga3ZtX3MzOTBfc2V0X2RpYWczMTgoQ1BV
U3RhdGUgKmNzLCB1aW50NjRfdCBkaWFnMzE4X2luZm8pDQo+Pj4+ICtzdGF0aWMgdm9pZCBz
ZXRfZGlhZ18zMTgoQ1BVU3RhdGUgKmNzLCBydW5fb25fY3B1X2RhdGEgYXJnKQ0KPj4+PiAg
wqDCoCB7DQo+Pj4+ICDCoMKgwqDCoMKgwqAgQ1BVUzM5MFhTdGF0ZSAqZW52ID0gJlMzOTBf
Q1BVKGNzKS0+ZW52Ow0KPj4+PiAgwqDCoCAtwqDCoMKgIC8qIEZlYXQgYml0IGlzIHNldCBv
bmx5IGlmIEtWTSBzdXBwb3J0cyBzeW5jIGZvciBkaWFnMzE4ICovDQo+Pj4+IC3CoMKgwqAg
aWYgKHMzOTBfaGFzX2ZlYXQoUzM5MF9GRUFUX0RJQUdfMzE4KSkgew0KPj4+PiAtwqDCoMKg
wqDCoMKgwqAgZW52LT5kaWFnMzE4X2luZm8gPSBkaWFnMzE4X2luZm87DQo+Pj4+IC3CoMKg
wqDCoMKgwqDCoCBjcy0+a3ZtX3J1bi0+cy5yZWdzLmRpYWczMTggPSBkaWFnMzE4X2luZm87
DQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBjcy0+a3ZtX3J1bi0+a3ZtX2RpcnR5X3JlZ3MgfD0g
S1ZNX1NZTkNfRElBRzMxODsNCj4+Pj4gLcKgwqDCoCB9DQo+Pj4+ICvCoMKgwqAgZW52LT5k
aWFnMzE4X2luZm8gPSBhcmcuaG9zdF91bG9uZzsNCj4+Pj4gK8KgwqDCoCBjcy0+a3ZtX3J1
bi0+cy5yZWdzLmRpYWczMTggPSBhcmcuaG9zdF91bG9uZzsNCj4+Pj4gK8KgwqDCoCBjcy0+
a3ZtX3J1bi0+a3ZtX2RpcnR5X3JlZ3MgfD0gS1ZNX1NZTkNfRElBRzMxODsNCj4+Pj4gIMKg
wqAgfQ0KPj4+PiAgwqDCoCDCoMKgIHN0YXRpYyB2b2lkIGhhbmRsZV9kaWFnXzMxOChTMzkw
Q1BVICpjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4pDQo+Pj4+IEBAIC0xNjA0LDggKzE2MDEs
NyBAQCBzdGF0aWMgdm9pZCBoYW5kbGVfZGlhZ18zMTgoUzM5MENQVSAqY3B1LA0KPj4+PiBz
dHJ1Y3Qga3ZtX3J1biAqcnVuKQ0KPj4+PiAgwqDCoMKgwqDCoMKgIH0NCj4+Pj4gIMKgwqAg
wqDCoMKgwqDCoMKgIENQVV9GT1JFQUNIKHQpIHsNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHJ1
bl9vbl9jcHUodCwgczM5MF9kb19jcHVfc2V0X2RpYWczMTgsDQo+Pj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUlVOX09OX0NQVV9IT1NUX1VMT05HKGRpYWcz
MThfaW5mbykpOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgcnVuX29uX2NwdSh0LCBzZXRfZGlh
Z18zMTgsDQo+Pj4+IFJVTl9PTl9DUFVfSE9TVF9VTE9ORyhkaWFnMzE4X2luZm8pKTsNCj4+
Pj4gIMKgwqDCoMKgwqDCoCB9DQo+Pj4+ICDCoMKgIH0NCj4+Pj4gIMKgwqAgZGlmZiAtLWdp
dCBhL3RhcmdldC9zMzkweC9rdm0va3ZtX3MzOTB4LmgNCj4+Pj4gYi90YXJnZXQvczM5MHgv
a3ZtL2t2bV9zMzkweC5oDQo+Pj4+IGluZGV4IDA1YTVlMWU2ZjQuLjhjMjQ0ZWU4NGQgMTAw
NjQ0DQo+Pj4+IC0tLSBhL3RhcmdldC9zMzkweC9rdm0va3ZtX3MzOTB4LmgNCj4+Pj4gKysr
IGIvdGFyZ2V0L3MzOTB4L2t2bS9rdm1fczM5MHguaA0KPj4+PiBAQCAtNDQsNiArNDQsNSBA
QCB2b2lkIGt2bV9zMzkwX3NldF9tYXhfcGFnZXNpemUodWludDY0X3QgcGFnZXNpemUsDQo+
Pj4+IEVycm9yICoqZXJycCk7DQo+Pj4+ICDCoMKgIHZvaWQga3ZtX3MzOTBfY3J5cHRvX3Jl
c2V0KHZvaWQpOw0KPj4+PiAgwqDCoCB2b2lkIGt2bV9zMzkwX3Jlc3RhcnRfaW50ZXJydXB0
KFMzOTBDUFUgKmNwdSk7DQo+Pj4+ICDCoMKgIHZvaWQga3ZtX3MzOTBfc3RvcF9pbnRlcnJ1
cHQoUzM5MENQVSAqY3B1KTsNCj4+Pj4gLXZvaWQga3ZtX3MzOTBfc2V0X2RpYWczMTgoQ1BV
U3RhdGUgKmNzLCB1aW50NjRfdCBkaWFnMzE4X2luZm8pOw0KPj4+PiAgwqDCoCDCoMKgICNl
bmRpZiAvKiBLVk1fUzM5MFhfSCAqLw0KPj4+Pg0KPj4NCj4+DQo+IA0KPiANCg0K

