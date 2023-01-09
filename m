Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD00662210
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:50:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEomz-0002mx-Tu; Mon, 09 Jan 2023 04:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pEomt-0002ma-BK; Mon, 09 Jan 2023 04:49:51 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pEomr-0008MH-0C; Mon, 09 Jan 2023 04:49:51 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3098e4Qu026075; Mon, 9 Jan 2023 09:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+emUhCsRHF35JkAPgzZ+RvRSO671P9CDN2ZwxqfA7DM=;
 b=N+43nv+ctSpU5H8erpjWLUIsjHR+abHAXhLdMPUxr7e+fajI/lL9CKUMeH5Zjogu0qDs
 pvOEZuNCaf14lShyj+omxKBFv7JueGMzMuCxIi/5SFvncmPrO7P3sw44JmxH552B219e
 51FkCjDKJRU1H6cCiwNjwR6wrKj0uJZC9h8baXbcM4k0V6Gcf4U4zoAh+SpkkaIi4AmX
 VEI0CnrjOuQOAKT4SPDjEcArdrH+3qBU48RMLV1qxxZmxJAFD8lwjoGUSpJRph28UNJh
 Kl5KVXxcg5X9GRwMTbBfQnDyYrgUHBDjOHSb/+P1I2wyYqqsy46H0U+hxe2lhyAdwPdD rA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjht957t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 09:49:37 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3099LUB8007392;
 Mon, 9 Jan 2023 09:49:36 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjht9572-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 09:49:36 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3096IdHs023181;
 Mon, 9 Jan 2023 09:49:34 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3my0c69xda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 09:49:34 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3099nUUG40632788
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Jan 2023 09:49:30 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 640A420043;
 Mon,  9 Jan 2023 09:49:30 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E73F820040;
 Mon,  9 Jan 2023 09:49:29 +0000 (GMT)
Received: from [9.171.16.4] (unknown [9.171.16.4])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Jan 2023 09:49:29 +0000 (GMT)
Message-ID: <8e04a10e-8978-494c-5d0f-2507e78134aa@linux.ibm.com>
Date: Mon, 9 Jan 2023 10:49:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>
References: <20230106075330.3662549-1-clg@kaod.org>
 <20230106075330.3662549-4-clg@kaod.org>
 <49bf32c7-4a44-a3c9-29b5-b6580113700c@linux.ibm.com>
 <bc3ec4b4-1c7a-a4a9-01ea-78fca7ad10c6@kaod.org>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v2 3/4] s390x/pv: Introduce a s390_pv_check() helper for
 runtime
In-Reply-To: <bc3ec4b4-1c7a-a4a9-01ea-78fca7ad10c6@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NMN-Bj_7TmWf6EyBugUzX5GJIKT7QfbP
X-Proofpoint-GUID: 27gwtGuf3LwqMG1CbAui7k2k9J9VGmJO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_03,2023-01-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090067
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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

T24gMS85LzIzIDEwOjI3LCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToNCj4gT24gMS85LzIz
IDEwOjA0LCBKYW5vc2NoIEZyYW5rIHdyb3RlOg0KPj4gT24gMS82LzIzIDA4OjUzLCBDw6lk
cmljIExlIEdvYXRlciB3cm90ZToNCj4+PiBGcm9tOiBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QHJlZGhhdC5jb20+DQo+Pj4NCj4+PiBJZiBhIHNlY3VyZSBrZXJuZWwgaXMgc3RhcnRlZCBp
biBhIG5vbi1wcm90ZWN0ZWQgVk0sIHRoZSBPUyB3aWxsIGhhbmcNCj4+PiBkdXJpbmcgYm9v
dCB3aXRob3V0IGdpdmluZyBhIHByb3BlciBlcnJvciBtZXNzYWdlIHRvIHRoZSB1c2VyLg0K
Pj4NCj4+IE1vc3Qgb2YgdGhlIHRpbWUgeW91IHNlZSBub3RoaW5nIGluIHRoZSBjb25zb2xl
IGJlY2F1c2UgbGlidmlydCBpcyB0b28gc2xvdy4gSWYgeW91IHN0YXJ0IHRoZSBWTSBpbiBw
YXVzZWQgbW9kZSwgYXR0YWNoIGEgY29uc29sZSBhbmQgdGhlbiByZXN1bWUgaXQsIHRoZW4g
eW91J2xsIHNlZSBhIG5pY2UgZXJyb3IgbWVzc2FnZS4NCj4gDQo+IElmIHlvdSB3YWl0IGxv
bmcgZW5vdWdoLCB0aGUgVk0gZmFpbHMgdG8gbW91bnQgLyBhbmQgZmFsbHMgaW50byB0aGUg
ZHJhY3V0DQo+IGluaXRyYW1zLg0KDQpJIGhhdmUgdGhlIGZlZWxpbmcgdGhhdCB3ZSdyZSBu
b3QgdGFsa2luZyBhYm91dCB0aGUgc2FtZSB0aGluZyBoZXJlLg0KDQpBIFBWIFZNIGFsd2F5
cyBzdGFydHMgb3V0IGFzIGEgbm9uLVBWIFZNIGFuZCBpcyBwdXQgaW50byBQViBtb2RlIHZp
YSB0d28gDQpkaWFnMzA4IHN1YmNvZGVzICg4ICYgMTApLiBBTEwgUFYgc3ViY29kZXMgKDgg
LSAxMCkgYXJlIHNwZWMgZXhjZXB0aW9ucyANCmlmIHRoZSBob3N0IGlzbid0IGVuYWJsZWQg
Zm9yIFBWLg0KDQpUaGVyZSBpcyBubyB3YXkgdG8gcnVuIGEgc2VjdXJlIGltYWdlIGluIGEg
bm9uLVBWIGVudmlyb25tZW50LiBXaGF0J3MgDQpiZWluZyBydW4gaXMgYSBub24tc2VjdXJl
IGJvb3Rsb2FkZXIgdGhhdCBpbml0aWF0ZXMgdGhlIHN3aXRjaCBpbnRvIA0Kc2VjdXJlIG1v
ZGUuDQoNCkVpdGhlciB0aGUgc3dpdGNoIGZhaWxzIGFuZCB3ZSByZXR1cm4gd2l0aCBESUFH
XzMwOF9SQ19JTlZBTF9GT1JfUFYgdG8gDQp0aGUgbm9uLVBWIGJvb3Rsb2FkZXIgb3Igd2Ug
c3RhcnQgcnVubmluZyBpbiBQViBtb2RlIGFuZCBfX25ldmVyX18gDQpyZXR1cm4gdG8gdGhl
IGJvb3Rsb2FkZXIgd2l0aG91dCBhIHJlYm9vdC4NCg0KPiANCj4+PiBQZXJmb3JtIHRoZSBj
aGVja3Mgb24gQ29uZmlkZW50aWFsIEd1ZXN0IHN1cHBvcnQgYXQgcnVudGltZSB3aXRoIGFu
DQo+Pj4gaGVscGVyIGNhbGxlZCBmcm9tIHRoZSBzZXJ2aWNlIGNhbGwgc3dpdGNoaW5nIHRo
ZSBndWVzdCB0byBwcm90ZWN0ZWQNCj4+PiBtb2RlLg0KPj4NCj4+IElmIHdlIGRvbid0IGhh
dmUgUFYgc3VwcG9ydCB0aGVuIHRoZSBzdWJjb2RlcyA+PTggYXJlIGEgc3BlY2lmaWNhdGlv
biBleGNlcHRpb24NCj4+IHNvIHRoaXMgaXMgbmV2ZXIgZXhlY3V0ZWQgQUZBSUsuDQo+IA0K
PiBJdCBpcy4gVGhlIHRlc3Qgb24gaHVnZSBwYWdlIHNpemUgd2FzIGFkZGVkIGp1c3QgYWJv
dmUgdGhpcyBjaGFuZ2UuDQoNCkFuZCB0aGUgaHVnZSBwYWdlIHRlc3Qgb25seSBhcHBsaWVz
IGlmIHRoZSBQViBmZWF0dXJlIGlzIGluIHRoZSBjcHVtb2RlbCANCndoaWNoIGFsc28gbWVh
bnMgdGhhdCB0aGUgaG9zdCBpcyBQViBlbmFibGVkIHNpbmNlIGl0J3MgYmFzZWQgb24gdGhl
IA0KY2FwYWJpbGl0eToNCg0KaWYgKHN1YmNvZGUgPj0gRElBRzMwOF9QVl9TRVQgJiYgIXMz
OTBfaGFzX2ZlYXQoUzM5MF9GRUFUX1VOUEFDSykpIHsNCiAgICAgICAgIHMzOTBfcHJvZ3Jh
bV9pbnRlcnJ1cHQoZW52LCBQR01fU1BFQ0lGSUNBVElPTiwgcmEpOw0KICAgICAgICAgcmV0
dXJuOw0KfQ0KDQoNCj4gDQo+IFRoYW5rcywNCj4gDQo+IEMuDQo+IA0KPj4NCj4+PiAgwqDC
oMKgwqDCoCBpZiAoZW52LT5wc3cubWFzayAmIFBTV19NQVNLX1BTVEFURSkgew0KPj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqAgczM5MF9wcm9ncmFtX2ludGVycnVwdChlbnYsIFBHTV9QUklW
SUxFR0VELCByYSk7DQo+Pj4gQEAgLTE3Niw2ICsxNzcsMTIgQEAgb3V0Og0KPj4+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47DQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oCB9DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICghczM5MF9wdl9jaGVjaygmbG9jYWxfZXJy
KSkgew0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVycm9yX3JlcG9ydF9lcnIobG9j
YWxfZXJyKTsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnYtPnJlZ3NbcjEgKyAx
XSA9IERJQUdfMzA4X1JDX0lOVkFMX0ZPUl9QVjsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm47DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4+PiArDQo+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoCBzMzkwX2lwbF9yZXNldF9yZXF1ZXN0KGNzLCBTMzkwX1JFU0VUX1BW
KTsNCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4+ICDCoMKgwqDCoMKgIGRl
ZmF1bHQ6DQo+Pg0KPiANCg0K

