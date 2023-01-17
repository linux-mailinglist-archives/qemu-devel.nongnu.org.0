Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAC266D9F8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 10:31:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHiHV-0003R0-Dh; Tue, 17 Jan 2023 04:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pHiHQ-0003Ny-NT; Tue, 17 Jan 2023 04:29:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pHiHM-0001fD-9m; Tue, 17 Jan 2023 04:29:20 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30H9AVnt030608; Tue, 17 Jan 2023 09:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4lX149oMkt8RNYV6Q5jfiPZVp+wTYAZsyIgK1WGRADU=;
 b=E+bspgnTjzqmBh+3/mIe3QbQ4Ddyfcg9yDvyZ8nSPXpsSfXteCbBTpBsOLgt/aRy5uPg
 OA0U4yKK1TXytlrKZjBi1JH5cTt/FHs9Gp3KUXamfZppvYZZKDdvzmS7+gzDhGZOTAe8
 /MU2afNCZzuSdweaPOf7Y168dnKbU8w5NXeixr+nlcJySNUQdJSO08iBQFK54ZOWCaKM
 ip/333pnD5mjaBXSHNzwi1HvUc91BQpymgrtI52LlbXqd/PS4YJHxoIqqZzaXfNOBI02
 vDZTHqsab180jHnpClqm67P4JNj/+AvcianpmIGn/L6Of84j4Mme6+zwqvQsMqsKFidS 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5pwbu2y4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 09:29:04 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30H9MFMp013270;
 Tue, 17 Jan 2023 09:29:04 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5pwbu2x3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 09:29:03 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30GFbHN0025842;
 Tue, 17 Jan 2023 09:29:01 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3n3m16jkwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 09:29:00 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30H9SvnX41091450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Jan 2023 09:28:57 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11A3420043;
 Tue, 17 Jan 2023 09:28:57 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DBDC2004B;
 Tue, 17 Jan 2023 09:28:56 +0000 (GMT)
Received: from [9.171.42.166] (unknown [9.171.42.166])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 17 Jan 2023 09:28:56 +0000 (GMT)
Message-ID: <dbe5d9d0-c83b-556d-88bf-92a05d8c624c@linux.ibm.com>
Date: Tue, 17 Jan 2023 10:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Sebastian Mitterle
 <smitterl@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
References: <20230116174607.2459498-1-clg@kaod.org>
 <20230116174607.2459498-3-clg@kaod.org>
 <a386bb49-72de-6edc-9873-70ec59e475ab@linux.ibm.com>
 <e87024f2-6ecf-1015-cc8c-604b17e139e2@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v3 2/3] s390x/pv: Introduce a s390_pv_check() helper for
 runtime
In-Reply-To: <e87024f2-6ecf-1015-cc8c-604b17e139e2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: drSkDP4WA8jEsovbNCs6zE3QKJEs3NEo
X-Proofpoint-ORIG-GUID: XYZUXG2_nocGZRRQ-E2CGST7yZmfJU79
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_04,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=752
 clxscore=1015 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170075
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097, SPF_HELO_NONE=0.001,
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

T24gMS8xNy8yMyAxMDowOSwgVGhvbWFzIEh1dGggd3JvdGU6DQo+IE9uIDE3LzAxLzIwMjMg
MDkuNDAsIEphbm9zY2ggRnJhbmsgd3JvdGU6DQo+PiBPbiAxLzE2LzIzIDE4OjQ2LCBDw6lk
cmljIExlIEdvYXRlciB3cm90ZToNCj4+PiBGcm9tOiBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QHJlZGhhdC5jb20+DQo+Pj4NCj4+PiBJZiBhIHNlY3VyZSBrZXJuZWwgaXMgc3RhcnRlZCBp
biBhIG5vbi1wcm90ZWN0ZWQgVk0sIHRoZSBPUyB3aWxsIGhhbmcNCj4+PiBkdXJpbmcgYm9v
dCB3aXRob3V0IGdpdmluZyBhIHByb3BlciBlcnJvciBtZXNzYWdlIHRvIHRoZSB1c2VyLg0K
Pj4NCj4+IERpZG4ndCB3ZSBlc3RhYmxpc2ggdGhhdCB5b3Ugd2VyZSBtaXNzaW5nIHRoZSBJ
T01NVSBmbGFnIHNvIHRoaXMgc3RhdGVtZW50DQo+PiBpc24ndCBjb3JyZWN0IGFueW1vcmU/
DQo+Pg0KPj4NCj4+IEkgaGF2ZW4ndCB5ZXQgZnVsbHkgaW5nZXN0ZWQgbXkgY29mZmVlLCBi
dXQgZnJvbSB3aGF0IEkgdW5kZXJzdGFuZCB5b3Ugd291bGQNCj4+IGJsb2NrIGEgc3dpdGNo
IGludG8gUFYgbW9kZSBpZiBjZ3MgaXMgbm90IHNldC4gV2hpY2ggd291bGQgbWVhbiB0aGF0
IFBWIEtWTQ0KPj4gdW5pdCB0ZXN0cyB3b3VsZG4ndCBzdGFydCBhbnltb3JlIGFzIHdlbGwg
YXMgYW55IFZNcyB0aGF0IGhhdmUgdGhlIHVucGFjaw0KPj4gZmVhdHVyZSBidXQgbm90IGNn
cy4NCj4+DQo+PiBBbmQgdGhhdCdzIG5vdCBzb21ldGhpbmcgdGhhdCB3ZSB3YW50Lg0KPj4N
Cj4+IFlvdSBjYW4gc3RhcnQgYSBQViBWTSB3aXRob3V0IGNncyBpZiB1bnBhY2sgaXMgaW4g
dGhlIENQVSBtb2RlbC4gVGhlIE9OTFkNCj4+IHJlcXVpcmVtZW50IHRoYXQgd2Ugc2hvdWxk
IGZhaWwgb24gaXMgdW5wYWNrLg0KPiANCj4gU28gd291bGQgaXQgbWFrZSBzZW5zZSB0byBj
aGVjayBmb3IgUzM5MF9GRUFUX1VOUEFDSyAob3Igc29tZXRoaW5nIGVsc2U/KQ0KPiBoZXJl
LCBvciBzaG91bGQgdGhlIHBhdGNoIGNvbXBsZXRlbHkgYmUgZHJvcHBlZCBpbnN0ZWFkPw0K
DQpTdWJjb2RlcyA4IC0gMTAgYWxyZWFkeSByZXN1bHQgaW4gYSBzcGVjIFBHTSBmb3IgIXVu
cGFjayBhbmQgaWYgbWVtb3J5IA0Kc2VydmVzIG1lIHJpZ2h0IHRoZW4gTWFyYyB3aWxsIGNh
dGNoIHRoYXQgYW5kIHByaW50IGEgd2FybmluZyBpbiB0aGUgDQpnZW5wcm90aW1nIGtlcm5l
bDoNCg0KaWYgKHN1YmNvZGUgPj0gRElBRzMwOF9QVl9TRVQgJiYgIXMzOTBfaGFzX2ZlYXQo
UzM5MF9GRUFUX1VOUEFDSykpIHsNCiAgICAgICAgIHMzOTBfcHJvZ3JhbV9pbnRlcnJ1cHQo
ZW52LCBQR01fU1BFQ0lGSUNBVElPTiwgcmEpOw0KICAgICAgICAgcmV0dXJuOw0KfQ0KDQpT
byBvdGhlciB0aGFuIHNodWZmbGluZyBjb2RlIGFyb3VuZCBJIHNlZSBubyBiZW5lZml0IGlu
IHRoaXMgcGF0Y2guDQo=

