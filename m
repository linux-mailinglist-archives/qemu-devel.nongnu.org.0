Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945226628A5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:36:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEtBw-00050Q-BG; Mon, 09 Jan 2023 09:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pEtBt-0004z5-3m; Mon, 09 Jan 2023 09:31:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pEtBq-0001ea-S1; Mon, 09 Jan 2023 09:31:56 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309DXaVq013739; Mon, 9 Jan 2023 14:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KlxyT75mFHjzrQ6uJgTiaDt1Th4adhf5+wTUmQVtGWg=;
 b=JRPWEqjNLWES4XTGV9NBe6vBgFmz6jUZGULEZ8gqL1p0tTONVl48/CgyC3l1ZOhT8To5
 hPCfXCZottejtjrGX3mzv8o0/Aid0lezacqsrjnPljh2IWoSCUqxlQ+C9p06eNxM0mea
 Ygg5S3rL9iImXIupDc0fS7bTQkkcnnSKnjvgIXE1PEzRejk7dqmqd7a2P0EK/9lCcs7m
 hlnrWWi2iNHSTM/mjgrmEbbWT0n5C8mn8p/ltDWm0QJ70P3OvWhj/L71NBs8vZId8ME+
 piZnD8O1hM8FQGbngh6+fp4orDs1XDjaxNrVkEMtHDgm4K/hK8RlLmFtO6gBSFSw39Me ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjkpfr8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 14:31:51 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309E6LdI031432;
 Mon, 9 Jan 2023 14:31:51 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjkpfr80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 14:31:50 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3099BTcU025135;
 Mon, 9 Jan 2023 14:31:49 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3my0c6k2f7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 14:31:48 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 309EVjlF46137662
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Jan 2023 14:31:45 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6050A2004D;
 Mon,  9 Jan 2023 14:31:45 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E01CF20040;
 Mon,  9 Jan 2023 14:31:44 +0000 (GMT)
Received: from [9.171.16.4] (unknown [9.171.16.4])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Jan 2023 14:31:44 +0000 (GMT)
Message-ID: <d4ec20fc-5b68-ee04-c387-4e87428d6c7f@linux.ibm.com>
Date: Mon, 9 Jan 2023 15:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 3/4] s390x/pv: Introduce a s390_pv_check() helper for
 runtime
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
References: <20230106075330.3662549-1-clg@kaod.org>
 <20230106075330.3662549-4-clg@kaod.org>
 <49bf32c7-4a44-a3c9-29b5-b6580113700c@linux.ibm.com>
 <bc3ec4b4-1c7a-a4a9-01ea-78fca7ad10c6@kaod.org>
 <8e04a10e-8978-494c-5d0f-2507e78134aa@linux.ibm.com>
 <d9194b49-9841-87b5-6355-b7d5f82da6b6@kaod.org>
 <6d121914-9add-88ab-1650-9735e1fada73@linux.ibm.com>
 <c333500f-307b-7521-c768-99e00509dd15@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <c333500f-307b-7521-c768-99e00509dd15@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: r5d2BepStbZL615pz39gEJx1tCSAO7OZ
X-Proofpoint-GUID: RIQNAw1vG3-_mtfrfEIUmIpw_2FNTdLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_08,2023-01-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=983 spamscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090101
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

T24gMS85LzIzIDE0OjUzLCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToNCj4gT24gMS85LzIz
IDE0OjQ1LCBKYW5vc2NoIEZyYW5rIHdyb3RlOg0KPj4gT24gMS85LzIzIDE0OjMwLCBDw6lk
cmljIExlIEdvYXRlciB3cm90ZToNCj4+PiBPbiAxLzkvMjMgMTA6NDksIEphbm9zY2ggRnJh
bmsgd3JvdGU6DQo+Pj4+IE9uIDEvOS8yMyAxMDoyNywgQ8OpZHJpYyBMZSBHb2F0ZXIgd3Jv
dGU6DQo+Pj4+PiBPbiAxLzkvMjMgMTA6MDQsIEphbm9zY2ggRnJhbmsgd3JvdGU6DQo+Pj4+
Pj4gT24gMS82LzIzIDA4OjUzLCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToNCj4+Pj4+Pj4g
RnJvbTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0ByZWRoYXQuY29tPg0KPj4+Pj4+Pg0KPj4+
Pj4+PiBJZiBhIHNlY3VyZSBrZXJuZWwgaXMgc3RhcnRlZCBpbiBhIG5vbi1wcm90ZWN0ZWQg
Vk0sIHRoZSBPUyB3aWxsIGhhbmcNCj4+Pj4+Pj4gZHVyaW5nIGJvb3Qgd2l0aG91dCBnaXZp
bmcgYSBwcm9wZXIgZXJyb3IgbWVzc2FnZSB0byB0aGUgdXNlci4NCj4+Pj4+Pg0KPj4+Pj4+
IE1vc3Qgb2YgdGhlIHRpbWUgeW91IHNlZSBub3RoaW5nIGluIHRoZSBjb25zb2xlIGJlY2F1
c2UgbGlidmlydCBpcyB0b28gc2xvdy4gSWYgeW91IHN0YXJ0IHRoZSBWTSBpbiBwYXVzZWQg
bW9kZSwgYXR0YWNoIGEgY29uc29sZSBhbmQgdGhlbiByZXN1bWUgaXQsIHRoZW4geW91J2xs
IHNlZSBhIG5pY2UgZXJyb3IgbWVzc2FnZS4NCj4+Pj4+DQo+Pj4+PiBJZiB5b3Ugd2FpdCBs
b25nIGVub3VnaCwgdGhlIFZNIGZhaWxzIHRvIG1vdW50IC8gYW5kIGZhbGxzIGludG8gdGhl
IGRyYWN1dA0KPj4+Pj4gaW5pdHJhbXMuDQo+Pj4+DQo+Pj4+IEkgaGF2ZSB0aGUgZmVlbGlu
ZyB0aGF0IHdlJ3JlIG5vdCB0YWxraW5nIGFib3V0IHRoZSBzYW1lIHRoaW5nIGhlcmUuPg0K
Pj4+ICDCoMKgID4gQSBQViBWTSBhbHdheXMgc3RhcnRzIG91dCBhcyBhIG5vbi1QViBWTSBh
bmQgaXMgcHV0IGludG8gUFYgbW9kZSB2aWEgdHdvIGRpYWczMDggc3ViY29kZXMgKDggJiAx
MCkuIEFMTCBQViBzdWJjb2RlcyAoOCAtIDEwKSBhcmUgc3BlYyBleGNlcHRpb25zIGlmIHRo
ZSBob3N0IGlzbid0IGVuYWJsZWQgZm9yIFBWLg0KPj4+DQo+Pj4gVGhlIGNvcm5lciBjYXNl
IHRoaXMgcGF0Y2ggaXMgdHJ5aW5nIHRvIGFkZHJlc3MgaXMgZm9yIGEgUFYtZW5hYmxlZCBo
b3N0LA0KPj4+IGEgc2VjdXJlIGVuYWJsZWQgT1MgYW5kICFQVi1lbmFibGVkIFFFTVUuDQo+
Pj4NCj4+PiBQbGVhc2UgcnVuIHRoaXMgY29tbWFuZCBvbiBhIHNlY3VyZSBkaXNrIGltYWdl
IDoNCj4+Pg0KPj4+ICDCoMKgwqAgcWVtdS1zeXN0ZW0tczM5MHggLU0gczM5MC1jY3ctdmly
dGlvIC1hY2NlbCBrdm0gLWRyaXZlIGZpbGU9PGZpbGU+LGlmPXZpcnRpbyxmb3JtYXQ9cWNv
dzIgLW5vZ3JhcGhpYyAtbm9kZWZhdWx0cyAtc2VyaWFsIG1vbjpzdGRpbw0KPj4+DQo+Pj4g
YW5kIHRlbGwgbWUgd2hhdCB5b3UgZ2V0Lg0KPj4+DQo+Pg0KPj4gcWVtdS1zeXN0ZW0tczM5
MHggLU0gczM5MC1jY3ctdmlydGlvIC1hY2NlbCBrdm0gLWRyaXZlIGZpbGU9dTIyMDQucWNv
dzIsaWY9dmlydGlvLGZvcm1hdD1xY293MiAtbm9ncmFwaGljIC1ub2RlZmF1bHRzIC1zZXJp
YWwgbW9uOnN0ZGlvDQo+PiBMT0FEUEFSTT1bwqDCoMKgwqDCoMKgwqAgXQ0KPj4gVXNpbmcg
dmlydGlvLWJsay4NCj4+IFVzaW5nIFNDU0kgc2NoZW1lLg0KPj4gLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4NCj4+IFNlY3VyZSB1bnBhY2sgZmFjaWxpdHkgaXMgbm90IGF2YWlsYWJsZQ0KPiANCj4g
WWVzLiBUaGF0J3Mgd2l0aCBhICFQVi1lbmFibGVkIGhvc3QuIENvcnJlY3QgPw0KPiANCj4g
Q2FuIHlvdSB0cnkgd2l0aCBwcm90X3ZpcnQ9MSBvbiB0aGUgaG9zdCBwbGVhc2UgPw0KDQpX
aXRoIHByb3RfdmlydD0xIGl0IGJvb3RzIHVudGlsIGl0IGRvZXNuJ3QgZmluZCB0aGUgZmls
ZSBzeXN0ZW0gKGF0IA0KbGVhc3QgaWYgeW91IGdpdmUgaXQgYSBiaXQgbW9yZSBtZW1vcnkg
dGhhbiB0aGUgc3RhbmRhcmQgMjU2TUIpOg0KDQpxZW11LXN5c3RlbS1zMzkweCAtTSBzMzkw
LWNjdy12aXJ0aW8gLWFjY2VsIGt2bSAtZHJpdmUgDQpmaWxlPXUyMjA0LnFjb3cyLGlmPXZp
cnRpbyxmb3JtYXQ9cWNvdzIgLW5vZ3JhcGhpYyAtbm9kZWZhdWx0cyAtc2VyaWFsIA0KbW9u
OnN0ZGlvIC1tIDQwOTYNCltMaW51eCBib290IHN0dWZmXQ0KQUxFUlQhICAvZGV2L2Rpc2sv
YnktcGF0aC9jY3ctMC4wLjAwMDAtcGFydDEgZG9lcyBub3QgZXhpc3QuICBEcm9wcGluZyAN
CnRvIGEgc2hlbGwhDQoNCg==

