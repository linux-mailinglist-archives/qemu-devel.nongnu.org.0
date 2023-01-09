Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B17BD66278A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:45:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEsTC-0003Zd-2g; Mon, 09 Jan 2023 08:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pEsT9-0003X6-2f; Mon, 09 Jan 2023 08:45:43 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pEsT6-0006pb-Te; Mon, 09 Jan 2023 08:45:42 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309DLP7U032493; Mon, 9 Jan 2023 13:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OJFyFRygFSpsiHCnsemP+C2ts/KN9MjWl6mxONqLDBQ=;
 b=pekle8hX6hN8uYBqxBBFWvmXx3TSZsmCXaqUaCOPvi3jhYq+SU5zlpr9/HxhooQTE1a/
 A5/uGrceTSLwsU5lGAloHgSCUm9iJ27Tq2F5EkYKtsAQdL1Mb0uU+sQBNmCj8PmAs/ur
 SDrnT9NnWzcnqAo/+CRdvCfMJ3ycbV3ey/FEOvBNxKPv/RZfSiN0/jBgDGndKAXjjf+A
 kmFdE412FQxbUq2wrYp17jPYyK+WDdHpH3PzlJjkUoh7klk3vk8ppgUreODYu5nAJq4J
 EebHWUzb1A8AQ05/IJ1k9JMn6lXSUV8HvWeDar8aXOcRKNPPd967DN6yCKw620yj4xQ6 kQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjdmefa8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 13:45:32 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309DiaGZ005220;
 Mon, 9 Jan 2023 13:45:31 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjdmef9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 13:45:31 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30970v4E029813;
 Mon, 9 Jan 2023 13:45:29 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3my00fj5th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 13:45:29 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 309DjPtC23396992
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Jan 2023 13:45:26 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 975782004D;
 Mon,  9 Jan 2023 13:45:25 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29BE020049;
 Mon,  9 Jan 2023 13:45:25 +0000 (GMT)
Received: from [9.171.16.4] (unknown [9.171.16.4])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Jan 2023 13:45:25 +0000 (GMT)
Message-ID: <6d121914-9add-88ab-1650-9735e1fada73@linux.ibm.com>
Date: Mon, 9 Jan 2023 14:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 3/4] s390x/pv: Introduce a s390_pv_check() helper for
 runtime
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
 <8e04a10e-8978-494c-5d0f-2507e78134aa@linux.ibm.com>
 <d9194b49-9841-87b5-6355-b7d5f82da6b6@kaod.org>
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <d9194b49-9841-87b5-6355-b7d5f82da6b6@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NwAAKMzLTWuyUct3daxtEryhDeQn8-Xr
X-Proofpoint-ORIG-GUID: gxFwhEsPnCBqs44Y39ubYQYW_9KIP5V4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_07,2023-01-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090097
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

T24gMS85LzIzIDE0OjMwLCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToNCj4gT24gMS85LzIz
IDEwOjQ5LCBKYW5vc2NoIEZyYW5rIHdyb3RlOg0KPj4gT24gMS85LzIzIDEwOjI3LCBDw6lk
cmljIExlIEdvYXRlciB3cm90ZToNCj4+PiBPbiAxLzkvMjMgMTA6MDQsIEphbm9zY2ggRnJh
bmsgd3JvdGU6DQo+Pj4+IE9uIDEvNi8yMyAwODo1MywgQ8OpZHJpYyBMZSBHb2F0ZXIgd3Jv
dGU6DQo+Pj4+PiBGcm9tOiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQHJlZGhhdC5jb20+DQo+
Pj4+Pg0KPj4+Pj4gSWYgYSBzZWN1cmUga2VybmVsIGlzIHN0YXJ0ZWQgaW4gYSBub24tcHJv
dGVjdGVkIFZNLCB0aGUgT1Mgd2lsbCBoYW5nDQo+Pj4+PiBkdXJpbmcgYm9vdCB3aXRob3V0
IGdpdmluZyBhIHByb3BlciBlcnJvciBtZXNzYWdlIHRvIHRoZSB1c2VyLg0KPj4+Pg0KPj4+
PiBNb3N0IG9mIHRoZSB0aW1lIHlvdSBzZWUgbm90aGluZyBpbiB0aGUgY29uc29sZSBiZWNh
dXNlIGxpYnZpcnQgaXMgdG9vIHNsb3cuIElmIHlvdSBzdGFydCB0aGUgVk0gaW4gcGF1c2Vk
IG1vZGUsIGF0dGFjaCBhIGNvbnNvbGUgYW5kIHRoZW4gcmVzdW1lIGl0LCB0aGVuIHlvdSds
bCBzZWUgYSBuaWNlIGVycm9yIG1lc3NhZ2UuDQo+Pj4NCj4+PiBJZiB5b3Ugd2FpdCBsb25n
IGVub3VnaCwgdGhlIFZNIGZhaWxzIHRvIG1vdW50IC8gYW5kIGZhbGxzIGludG8gdGhlIGRy
YWN1dA0KPj4+IGluaXRyYW1zLg0KPj4NCj4+IEkgaGF2ZSB0aGUgZmVlbGluZyB0aGF0IHdl
J3JlIG5vdCB0YWxraW5nIGFib3V0IHRoZSBzYW1lIHRoaW5nIGhlcmUuPg0KPiAgICA+IEEg
UFYgVk0gYWx3YXlzIHN0YXJ0cyBvdXQgYXMgYSBub24tUFYgVk0gYW5kIGlzIHB1dCBpbnRv
IFBWIG1vZGUgdmlhIHR3byBkaWFnMzA4IHN1YmNvZGVzICg4ICYgMTApLiBBTEwgUFYgc3Vi
Y29kZXMgKDggLSAxMCkgYXJlIHNwZWMgZXhjZXB0aW9ucyBpZiB0aGUgaG9zdCBpc24ndCBl
bmFibGVkIGZvciBQVi4NCj4gDQo+IFRoZSBjb3JuZXIgY2FzZSB0aGlzIHBhdGNoIGlzIHRy
eWluZyB0byBhZGRyZXNzIGlzIGZvciBhIFBWLWVuYWJsZWQgaG9zdCwNCj4gYSBzZWN1cmUg
ZW5hYmxlZCBPUyBhbmQgIVBWLWVuYWJsZWQgUUVNVS4NCj4gDQo+IFBsZWFzZSBydW4gdGhp
cyBjb21tYW5kIG9uIGEgc2VjdXJlIGRpc2sgaW1hZ2UgOg0KPiANCj4gICAgIHFlbXUtc3lz
dGVtLXMzOTB4IC1NIHMzOTAtY2N3LXZpcnRpbyAtYWNjZWwga3ZtIC1kcml2ZSBmaWxlPTxm
aWxlPixpZj12aXJ0aW8sZm9ybWF0PXFjb3cyIC1ub2dyYXBoaWMgLW5vZGVmYXVsdHMgLXNl
cmlhbCBtb246c3RkaW8NCj4gDQo+IGFuZCB0ZWxsIG1lIHdoYXQgeW91IGdldC4NCj4gDQoN
CnFlbXUtc3lzdGVtLXMzOTB4IC1NIHMzOTAtY2N3LXZpcnRpbyAtYWNjZWwga3ZtIC1kcml2
ZSANCmZpbGU9dTIyMDQucWNvdzIsaWY9dmlydGlvLGZvcm1hdD1xY293MiAtbm9ncmFwaGlj
IC1ub2RlZmF1bHRzIC1zZXJpYWwgDQptb246c3RkaW8NCkxPQURQQVJNPVsgICAgICAgIF0N
ClVzaW5nIHZpcnRpby1ibGsuDQpVc2luZyBTQ1NJIHNjaGVtZS4NCi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uDQpTZWN1cmUgdW5wYWNrIGZhY2lsaXR5IGlzIG5vdCBhdmFpbGFibGUNCg0KDQo+IFRo
YW5rcywNCj4gDQo+IEMuDQoNCg==

