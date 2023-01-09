Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CC2662917
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:53:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEtW6-0005OP-GY; Mon, 09 Jan 2023 09:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pEtW3-0005Kh-2z; Mon, 09 Jan 2023 09:52:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pEtW0-0003fO-MC; Mon, 09 Jan 2023 09:52:46 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309E0KWi005345; Mon, 9 Jan 2023 14:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : from : to : cc : references : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6TeXVBxDfEcgflVjHwCkhSXgN08UOeOt0Nf+3m9FVys=;
 b=U8z4w0V2zds3xWoJkb0JnUGgDUUzFpxp5CG51ZgZdpzTMxY/dZ085Iu92ojFLxyFMWwh
 0Gf16Ew2BuKymTFDgHnfCOErYd9tsBpc151vUgLhLiNtl6jviNY25fcvSsMyMcNAsyqL
 Yogu8Y1XV6rmRJfEVrmPGYe7pP/gmM7/6fVmTxcGghwufd2Qjqv8re6lQszKheMkBlRo
 MAtLLAp+YVIIbgNh5chAXCvzmuQsYijiGg2jjTTDawxMrwKM2okowM/Gxn5gGGe9gcnT
 rYLL4XNYlNPtLx1CbKPM0qjXLZ4a+KBwxYCD9wPw1+0o0YRyOLNRRkf8HR1QjIIwSe8n jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjgdrf9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 14:52:40 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309EFvlm008259;
 Mon, 9 Jan 2023 14:52:39 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjgdrf8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 14:52:39 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3095oZit029843;
 Mon, 9 Jan 2023 14:52:37 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3my00fj7vw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 14:52:36 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 309EqXqP52298066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Jan 2023 14:52:33 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48B3F20040;
 Mon,  9 Jan 2023 14:52:33 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5DC320043;
 Mon,  9 Jan 2023 14:52:32 +0000 (GMT)
Received: from [9.171.16.4] (unknown [9.171.16.4])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Jan 2023 14:52:32 +0000 (GMT)
Message-ID: <a6aa35a8-c3fe-47d8-3a80-38cb8d94fdba@linux.ibm.com>
Date: Mon, 9 Jan 2023 15:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
From: Janosch Frank <frankja@linux.ibm.com>
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
 <d4ec20fc-5b68-ee04-c387-4e87428d6c7f@linux.ibm.com>
Subject: Re: [PATCH v2 3/4] s390x/pv: Introduce a s390_pv_check() helper for
 runtime
In-Reply-To: <d4ec20fc-5b68-ee04-c387-4e87428d6c7f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rBO825rX8U-WhJd5WIwZboWdoj7VS9vi
X-Proofpoint-ORIG-GUID: KQeWy4ZhoKDtQI4dt7Gj9jzE83O5dcCd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_08,2023-01-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090105
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

T24gMS85LzIzIDE1OjMxLCBKYW5vc2NoIEZyYW5rIHdyb3RlOg0KPiBPbiAxLzkvMjMgMTQ6
NTMsIEPDqWRyaWMgTGUgR29hdGVyIHdyb3RlOg0KPj4gT24gMS85LzIzIDE0OjQ1LCBKYW5v
c2NoIEZyYW5rIHdyb3RlOg0KPj4+IE9uIDEvOS8yMyAxNDozMCwgQ8OpZHJpYyBMZSBHb2F0
ZXIgd3JvdGU6DQo+Pj4+IE9uIDEvOS8yMyAxMDo0OSwgSmFub3NjaCBGcmFuayB3cm90ZToN
Cj4+Pj4+IE9uIDEvOS8yMyAxMDoyNywgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6DQo+Pj4+
Pj4gT24gMS85LzIzIDEwOjA0LCBKYW5vc2NoIEZyYW5rIHdyb3RlOg0KPj4+Pj4+PiBPbiAx
LzYvMjMgMDg6NTMsIEPDqWRyaWMgTGUgR29hdGVyIHdyb3RlOg0KPj4+Pj4+Pj4gRnJvbTog
Q8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0ByZWRoYXQuY29tPg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+
IElmIGEgc2VjdXJlIGtlcm5lbCBpcyBzdGFydGVkIGluIGEgbm9uLXByb3RlY3RlZCBWTSwg
dGhlIE9TIHdpbGwgaGFuZw0KPj4+Pj4+Pj4gZHVyaW5nIGJvb3Qgd2l0aG91dCBnaXZpbmcg
YSBwcm9wZXIgZXJyb3IgbWVzc2FnZSB0byB0aGUgdXNlci4NCj4+Pj4+Pj4NCj4+Pj4+Pj4g
TW9zdCBvZiB0aGUgdGltZSB5b3Ugc2VlIG5vdGhpbmcgaW4gdGhlIGNvbnNvbGUgYmVjYXVz
ZSBsaWJ2aXJ0IGlzIHRvbyBzbG93LiBJZiB5b3Ugc3RhcnQgdGhlIFZNIGluIHBhdXNlZCBt
b2RlLCBhdHRhY2ggYSBjb25zb2xlIGFuZCB0aGVuIHJlc3VtZSBpdCwgdGhlbiB5b3UnbGwg
c2VlIGEgbmljZSBlcnJvciBtZXNzYWdlLg0KPj4+Pj4+DQo+Pj4+Pj4gSWYgeW91IHdhaXQg
bG9uZyBlbm91Z2gsIHRoZSBWTSBmYWlscyB0byBtb3VudCAvIGFuZCBmYWxscyBpbnRvIHRo
ZSBkcmFjdXQNCj4+Pj4+PiBpbml0cmFtcy4NCj4+Pj4+DQo+Pj4+PiBJIGhhdmUgdGhlIGZl
ZWxpbmcgdGhhdCB3ZSdyZSBub3QgdGFsa2luZyBhYm91dCB0aGUgc2FtZSB0aGluZyBoZXJl
Lj4NCj4+Pj4gICDCoMKgID4gQSBQViBWTSBhbHdheXMgc3RhcnRzIG91dCBhcyBhIG5vbi1Q
ViBWTSBhbmQgaXMgcHV0IGludG8gUFYgbW9kZSB2aWEgdHdvIGRpYWczMDggc3ViY29kZXMg
KDggJiAxMCkuIEFMTCBQViBzdWJjb2RlcyAoOCAtIDEwKSBhcmUgc3BlYyBleGNlcHRpb25z
IGlmIHRoZSBob3N0IGlzbid0IGVuYWJsZWQgZm9yIFBWLg0KPj4+Pg0KPj4+PiBUaGUgY29y
bmVyIGNhc2UgdGhpcyBwYXRjaCBpcyB0cnlpbmcgdG8gYWRkcmVzcyBpcyBmb3IgYSBQVi1l
bmFibGVkIGhvc3QsDQo+Pj4+IGEgc2VjdXJlIGVuYWJsZWQgT1MgYW5kICFQVi1lbmFibGVk
IFFFTVUuDQo+Pj4+DQo+Pj4+IFBsZWFzZSBydW4gdGhpcyBjb21tYW5kIG9uIGEgc2VjdXJl
IGRpc2sgaW1hZ2UgOg0KPj4+Pg0KPj4+PiAgIMKgwqDCoCBxZW11LXN5c3RlbS1zMzkweCAt
TSBzMzkwLWNjdy12aXJ0aW8gLWFjY2VsIGt2bSAtZHJpdmUgZmlsZT08ZmlsZT4saWY9dmly
dGlvLGZvcm1hdD1xY293MiAtbm9ncmFwaGljIC1ub2RlZmF1bHRzIC1zZXJpYWwgbW9uOnN0
ZGlvDQo+Pj4+DQo+Pj4+IGFuZCB0ZWxsIG1lIHdoYXQgeW91IGdldC4NCj4+Pj4NCj4+Pg0K
Pj4+IHFlbXUtc3lzdGVtLXMzOTB4IC1NIHMzOTAtY2N3LXZpcnRpbyAtYWNjZWwga3ZtIC1k
cml2ZSBmaWxlPXUyMjA0LnFjb3cyLGlmPXZpcnRpbyxmb3JtYXQ9cWNvdzIgLW5vZ3JhcGhp
YyAtbm9kZWZhdWx0cyAtc2VyaWFsIG1vbjpzdGRpbw0KPj4+IExPQURQQVJNPVvCoMKgwqDC
oMKgwqDCoCBdDQo+Pj4gVXNpbmcgdmlydGlvLWJsay4NCj4+PiBVc2luZyBTQ1NJIHNjaGVt
ZS4NCj4+PiAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLg0KPj4+IFNlY3VyZSB1bnBhY2sgZmFjaWxpdHkg
aXMgbm90IGF2YWlsYWJsZQ0KPj4NCj4+IFllcy4gVGhhdCdzIHdpdGggYSAhUFYtZW5hYmxl
ZCBob3N0LiBDb3JyZWN0ID8NCj4+DQo+PiBDYW4geW91IHRyeSB3aXRoIHByb3RfdmlydD0x
IG9uIHRoZSBob3N0IHBsZWFzZSA/DQo+IA0KPiBXaXRoIHByb3RfdmlydD0xIGl0IGJvb3Rz
IHVudGlsIGl0IGRvZXNuJ3QgZmluZCB0aGUgZmlsZSBzeXN0ZW0gKGF0DQo+IGxlYXN0IGlm
IHlvdSBnaXZlIGl0IGEgYml0IG1vcmUgbWVtb3J5IHRoYW4gdGhlIHN0YW5kYXJkIDI1Nk1C
KToNCj4gDQo+IHFlbXUtc3lzdGVtLXMzOTB4IC1NIHMzOTAtY2N3LXZpcnRpbyAtYWNjZWwg
a3ZtIC1kcml2ZQ0KPiBmaWxlPXUyMjA0LnFjb3cyLGlmPXZpcnRpbyxmb3JtYXQ9cWNvdzIg
LW5vZ3JhcGhpYyAtbm9kZWZhdWx0cyAtc2VyaWFsDQo+IG1vbjpzdGRpbyAtbSA0MDk2DQo+
IFtMaW51eCBib290IHN0dWZmXQ0KPiBBTEVSVCEgIC9kZXYvZGlzay9ieS1wYXRoL2Njdy0w
LjAuMDAwMC1wYXJ0MSBkb2VzIG5vdCBleGlzdC4gIERyb3BwaW5nDQo+IHRvIGEgc2hlbGwh
DQo+IA0KDQpJLmUuIGl0IGJvb3RzIGludG8gc2VjdXJlIG1vZGUganVzdCBmaW5lLg0KDQpO
b3cgaWYgeW91IGFkZCBpb21tdV9wbGF0Zm9ybT10cnVlIHRvIHRoZSBkZXZpY2UgdGhlbiBp
dCdsbCBldmVuIGJvb3QgDQpmcm9tIGRpc2suDQoNClNvIHdlJ2QgcmF0aGVyIG5lZWQgYW4g
ZXJyb3IgbWVzc2FnZSBpZiB5b3UgYXR0YWNoIGEgZGV2aWNlIHdpdGhvdXQgdGhlIA0KaW9t
bXUgYmVpbmcgc2V0IHRvIHRydWUuIFRoZSB3aG9sZSB0b3BpYyBvZiBQViBpb21tdSBwcm9i
bGVtcyBoYXMgYSBmZXcgDQp3aW5kaW5ncyB3aGljaCBJIGRvbid0IGZ1bGx5IHdhbnQgdG8g
YnJpbmcgdG8gZWxlY3Ryb25pYyBwYXBlciByaWdodCBub3cuDQoNCkVpdGhlciB5b3Ugc3Rh
cnQgYSBzZWN1cmUgZ3Vlc3QgdGhhdCBoYXMgZGV2aWNlcyB3aXRoIG1hbnVhbCBpb21tdSAN
CmVudHJpZXMgb3IgeW91IGdvIHRoZSBsYXVuY2ggc2VjdXJpdHkgcm91dGUgYW5kIGxldCBs
aWJ2aXJ0L3FlbXUgaGFuZGxlIA0KaXQgZm9yIHlvdS4NCg==

