Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301994ED741
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:49:07 +0200 (CEST)
Received: from localhost ([::1]:52156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZrQP-0005n4-Q6
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:49:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZrOd-0004mp-0D
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:47:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZrOa-0007Kz-Qa
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:47:14 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22V8sdZk019574; 
 Thu, 31 Mar 2022 09:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bzjAW7dyTC/sXHUWIscr0mGKCIuVDfTS8wrHrXREviA=;
 b=W9h5PnqHRd/V+Eo1IqJQOS+7bqnZ/pZ2y5nOhprtVbvJYiXd1JaZ/XtIx3KTQEX4Ht8I
 lv0jdA9ycw3DS3fy001Zxic07uu5WCYEAKEaUtFR3kQuyM5dpoeE0psSsudYwcAfFxGF
 nD9cUjfdfDOlfTYQ0H3yEkQ7QqiDLFnfPz2L+73rfM+eH016crCZBVCPLG9defZDPaS5
 nHYNlm2zoUAXs+chWBCtwf1nMX+YDwaApaO38qLI1eKyh62f1OBB0wINtG5JEY+9L6KX
 vvoQ5Ju2j2UiYLT/eOiDPu/crzojovIqKRc9uMhzG/E9pZy8SgLdqG/e4+AwR2/bbfEr cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f5972h0q9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 09:47:10 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22V9l9Qt014661;
 Thu, 31 Mar 2022 09:47:09 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f5972h0pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 09:47:09 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22V9egB0000907;
 Thu, 31 Mar 2022 09:47:07 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3f1tf92e02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 09:47:07 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22V9lB1D33685994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Mar 2022 09:47:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55E2E11C04C;
 Thu, 31 Mar 2022 09:47:05 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18AD911C052;
 Thu, 31 Mar 2022 09:47:05 +0000 (GMT)
Received: from [9.145.159.108] (unknown [9.145.159.108])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 31 Mar 2022 09:47:05 +0000 (GMT)
Message-ID: <e88ab8c0-8ec0-150c-e1ad-e171f4bd6a65@linux.ibm.com>
Date: Thu, 31 Mar 2022 11:47:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20220330123603.107120-1-frankja@linux.ibm.com>
 <20220330123603.107120-3-frankja@linux.ibm.com>
 <CAJ+F1CKk9_4PZqQ_ixAcQxpfVe6rgUkULV3EkpBRYgKi2B9Kdg@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v3 2/9] dump: Remove the sh_info variable
In-Reply-To: <CAJ+F1CKk9_4PZqQ_ixAcQxpfVe6rgUkULV3EkpBRYgKi2B9Kdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0WAbnvMsRSjvyKCxnGVDxunn6wh3_53Q
X-Proofpoint-GUID: bHRkGUttdw3_CHuUumXSLXw_GjeRmVLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-31_03,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 adultscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203310052
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMy8zMS8yMiAxMDo1OCwgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOg0KPiBIaQ0KPiAN
Cj4gT24gV2VkLCBNYXIgMzAsIDIwMjIgYXQgNDo0OCBQTSBKYW5vc2NoIEZyYW5rIDxmcmFu
a2phQGxpbnV4LmlibS5jb20+IHdyb3RlOg0KPiANCj4+IFRoZXJlJ3Mgbm8gbmVlZCB0byBo
YXZlIHBoZHJfbnVtIGFuZCBzaF9pbmZvIGF0IHRoZSBzYW1lIHRpbWUuIFdlIGNhbg0KPj4g
bWFrZSBwaGRyX251bSAzMiBiaXQgYW5kIHNldCBQTl9YTlVNIHdoZW4gd2Ugd3JpdGUgdGhl
IGhlYWRlciBpZg0KPj4gcGhkcl9udW0gPj0gUE5fWE5VTS4NCj4+DQo+IA0KPiBJIGFtIG5v
dCBmb25kIG9mIHRoaXMgY2hhbmdlIHRiaCwgbWl4aW5nIHZhcmlhYmxlcywgY2FzdGluZyBh
IHUzMiB0byB1MTYuLg0KPiANCj4gQ291bGQgeW91IHByb3ZpZGUgbW9yZSBtb3RpdmF0aW9u
PyBUaGlzIHNlZW1zIHRvIGNvbnRyYWRpY3QgYWxzbyB5b3VyDQo+IGNsZWFudXAgYXBwcm9h
Y2ggaW4gdGhlIGxhdGVyIHBhdGNoICJBZGQgbW9yZSBvZmZzZXQgdmFyaWFibGVzIi4NCg0K
SSBjYW4ndCBmdWxseSBmb2xsb3cgeW91IHRoZXJlLiBXaGVyZSBkbyBJIGNhc3QgdG8gdTE2
IG9yIG1peCB2YXJpYWJsZXM/DQoNCk15IGlkZWEgZm9yIHRoaXMgY2hhbmdlOg0KcGhfbnVt
IGlzIG1hZGUgaW5kZXBlbmRlbnQgb2YgdGhlIGRhdGEgc3RydWN0dXJlIHRoYXQgaXQgZW5k
cyB1cCBpbi4gV2UgDQp1c2UgcGhfbnVtIGFzIHRoZSBvbmx5IHNvdXJjZSBmb3IgZGVjaXNp
b25zIGFuZCBlbGYgc3RydWN0dXJlIA0KbWFuaXB1bGF0aW9uIGRvd24gdGhlIGxpbmUgc2lu
Y2UgaXQgY29udGFpbnMgdGhlIG1heGltdW0gcG9zc2libGUgbnVtYmVyIA0Kb2Ygc2VjdGlv
biBoZWFkZXJzLg0KDQpUaGlzIHdheSB3ZSBtb3ZlIHRoZSBleHRyYSBoYW5kbGluZyB0byB0
aGUgbG9jYXRpb25zIHdoZXJlIGl0IGJlbG9uZ3MgDQphbmQgd2hlcmUgYW4gZXhwbGFuYXRp
b24gZm9yIHRoYXQgYmVoYXZpb3IgbWFrZXMgbW9zdCBzZW5zZToNClRoZSBlaGRyIHdyaXRl
IGZ1bmN0aW9uIGFuZCB0aGUgc2VjdGlvbiB3cml0ZSBmdW5jdGlvbg0KDQpXaXRob3V0IGtu
b3dpbmcgdGhlIEVMRiBzcGVjLCBjb3VsZCB5b3UgdGVsbCBtZSB3aGF0IHNoX2luZm8gc3Rv
cmVzIHdoZW4gDQpmaXJzdCByZWFkaW5nIHRoaXMgY29kZT8gR29pbmcgZnJvbSB0aGUgbmFt
ZSBpdCBtaWdodCBiZSBzZWN0aW9uIGhlYWRlciANCmluZm9ybWF0aW9uLCB3aGF0ZXZlciB0
aGF0IHdvdWxkIG1lYW4uDQoNCkknZCBiZSBoYXBweSB0byBhZGQgY29tbWVudHMgdG8gd3Jp
dGVfZWxmKDMyfDY0KV9oZWFkZXIoKSB0aG91Z2ggc28gaXQncyANCmEgYml0IG1vcmUgY2xl
YXIgd2h5IHdlIG5lZWQgdG8gc2V0IFBOX1hOVU0uIEkndmUgYWxyZWFkeSBhZGRlZCBvbmUg
dG8gDQpkdW1wX2JlZ2luIGJ1dCB0aGF0J3Mgbm90IHdoZXJlIHdlIHVzZSBQTl9YTlVNLg0K
Pj4gU2lnbmVkLW9mZi1ieTogSmFub3NjaCBGcmFuayA8ZnJhbmtqYUBsaW51eC5pYm0uY29t
Pg0KPj4gUmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNv
bkBsaW5hcm8ub3JnPg0KPj4gLS0tDQo+PiAgIGR1bXAvZHVtcC5jICAgICAgICAgICB8IDM0
ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+ICAgaW5jbHVkZS9zeXNl
bXUvZHVtcC5oIHwgIDMgKy0tDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9u
cygrKSwgMjIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2R1bXAvZHVtcC5j
IGIvZHVtcC9kdW1wLmMNCj4+IGluZGV4IDU4YzQ5MjNmY2UuLjBlNjE4N2M5NjIgMTAwNjQ0
DQo+PiAtLS0gYS9kdW1wL2R1bXAuYw0KPj4gKysrIGIvZHVtcC9kdW1wLmMNCj4+IEBAIC0x
MjQsNiArMTI0LDcgQEAgc3RhdGljIGludCBmZF93cml0ZV92bWNvcmUoY29uc3Qgdm9pZCAq
YnVmLCBzaXplX3QNCj4+IHNpemUsIHZvaWQgKm9wYXF1ZSkNCj4+DQo+PiAgIHN0YXRpYyB2
b2lkIHdyaXRlX2VsZjY0X2hlYWRlcihEdW1wU3RhdGUgKnMsIEVycm9yICoqZXJycCkNCj4+
ICAgew0KPj4gKyAgICB1aW50MTZfdCBwaG51bSA9IHMtPnBoZHJfbnVtID49IFBOX1hOVU0g
PyBQTl9YTlVNIDogcy0+cGhkcl9udW07DQo+Pg0KPiANCj4gUGxlYXNlIHVzZSBNSU4oKQ0K
PiANCj4gDQo+PiAgICAgICBFbGY2NF9FaGRyIGVsZl9oZWFkZXI7DQo+PiAgICAgICBpbnQg
cmV0Ow0KPj4NCj4+IEBAIC0xMzgsOSArMTM5LDkgQEAgc3RhdGljIHZvaWQgd3JpdGVfZWxm
NjRfaGVhZGVyKER1bXBTdGF0ZSAqcywgRXJyb3INCj4+ICoqZXJycCkNCj4+ICAgICAgIGVs
Zl9oZWFkZXIuZV9laHNpemUgPSBjcHVfdG9fZHVtcDE2KHMsIHNpemVvZihlbGZfaGVhZGVy
KSk7DQo+PiAgICAgICBlbGZfaGVhZGVyLmVfcGhvZmYgPSBjcHVfdG9fZHVtcDY0KHMsIHNp
emVvZihFbGY2NF9FaGRyKSk7DQo+PiAgICAgICBlbGZfaGVhZGVyLmVfcGhlbnRzaXplID0g
Y3B1X3RvX2R1bXAxNihzLCBzaXplb2YoRWxmNjRfUGhkcikpOw0KPj4gLSAgICBlbGZfaGVh
ZGVyLmVfcGhudW0gPSBjcHVfdG9fZHVtcDE2KHMsIHMtPnBoZHJfbnVtKTsNCj4+ICsgICAg
ZWxmX2hlYWRlci5lX3BobnVtID0gY3B1X3RvX2R1bXAxNihzLCBwaG51bSk7DQo+PiAgICAg
ICBpZiAocy0+aGF2ZV9zZWN0aW9uKSB7DQo+PiAtICAgICAgICB1aW50NjRfdCBzaG9mZiA9
IHNpemVvZihFbGY2NF9FaGRyKSArIHNpemVvZihFbGY2NF9QaGRyKSAqDQo+PiBzLT5zaF9p
bmZvOw0KPj4gKyAgICAgICAgdWludDY0X3Qgc2hvZmYgPSBzaXplb2YoRWxmNjRfRWhkcikg
KyBzaXplb2YoRWxmNjRfUGhkcikgKg0KPj4gcy0+cGhkcl9udW07DQo+Pg0KPj4gICAgICAg
ICAgIGVsZl9oZWFkZXIuZV9zaG9mZiA9IGNwdV90b19kdW1wNjQocywgc2hvZmYpOw0KPj4g
ICAgICAgICAgIGVsZl9oZWFkZXIuZV9zaGVudHNpemUgPSBjcHVfdG9fZHVtcDE2KHMsIHNp
emVvZihFbGY2NF9TaGRyKSk7DQo+PiBAQCAtMTU1LDYgKzE1Niw3IEBAIHN0YXRpYyB2b2lk
IHdyaXRlX2VsZjY0X2hlYWRlcihEdW1wU3RhdGUgKnMsIEVycm9yDQo+PiAqKmVycnApDQo+
Pg0KPj4gICBzdGF0aWMgdm9pZCB3cml0ZV9lbGYzMl9oZWFkZXIoRHVtcFN0YXRlICpzLCBF
cnJvciAqKmVycnApDQo+PiAgIHsNCj4+ICsgICAgdWludDE2X3QgcGhudW0gPSBzLT5waGRy
X251bSA+PSBQTl9YTlVNID8gUE5fWE5VTSA6IHMtPnBoZHJfbnVtOw0KPj4NCj4gDQo+IHNh
bWUNCj4gDQo+IA0KPj4gICAgICAgRWxmMzJfRWhkciBlbGZfaGVhZGVyOw0KPj4gICAgICAg
aW50IHJldDsNCj4+DQo+PiBAQCAtMTY5LDkgKzE3MSw5IEBAIHN0YXRpYyB2b2lkIHdyaXRl
X2VsZjMyX2hlYWRlcihEdW1wU3RhdGUgKnMsIEVycm9yDQo+PiAqKmVycnApDQo+PiAgICAg
ICBlbGZfaGVhZGVyLmVfZWhzaXplID0gY3B1X3RvX2R1bXAxNihzLCBzaXplb2YoZWxmX2hl
YWRlcikpOw0KPj4gICAgICAgZWxmX2hlYWRlci5lX3Bob2ZmID0gY3B1X3RvX2R1bXAzMihz
LCBzaXplb2YoRWxmMzJfRWhkcikpOw0KPj4gICAgICAgZWxmX2hlYWRlci5lX3BoZW50c2l6
ZSA9IGNwdV90b19kdW1wMTYocywgc2l6ZW9mKEVsZjMyX1BoZHIpKTsNCj4+IC0gICAgZWxm
X2hlYWRlci5lX3BobnVtID0gY3B1X3RvX2R1bXAxNihzLCBzLT5waGRyX251bSk7DQo+PiAr
ICAgIGVsZl9oZWFkZXIuZV9waG51bSA9IGNwdV90b19kdW1wMTYocywgcGhudW0pOw0KPj4g
ICAgICAgaWYgKHMtPmhhdmVfc2VjdGlvbikgew0KPj4gLSAgICAgICAgdWludDMyX3Qgc2hv
ZmYgPSBzaXplb2YoRWxmMzJfRWhkcikgKyBzaXplb2YoRWxmMzJfUGhkcikgKg0KPj4gcy0+
c2hfaW5mbzsNCj4+ICsgICAgICAgIHVpbnQzMl90IHNob2ZmID0gc2l6ZW9mKEVsZjMyX0Vo
ZHIpICsgc2l6ZW9mKEVsZjMyX1BoZHIpICoNCj4+IHMtPnBoZHJfbnVtOw0KPj4NCj4+ICAg
ICAgICAgICBlbGZfaGVhZGVyLmVfc2hvZmYgPSBjcHVfdG9fZHVtcDMyKHMsIHNob2ZmKTsN
Cj4+ICAgICAgICAgICBlbGZfaGVhZGVyLmVfc2hlbnRzaXplID0gY3B1X3RvX2R1bXAxNihz
LCBzaXplb2YoRWxmMzJfU2hkcikpOw0KPj4gQEAgLTM1OCwxMiArMzYwLDEyIEBAIHN0YXRp
YyB2b2lkIHdyaXRlX2VsZl9zZWN0aW9uKER1bXBTdGF0ZSAqcywgaW50DQo+PiB0eXBlLCBF
cnJvciAqKmVycnApDQo+PiAgICAgICBpZiAodHlwZSA9PSAwKSB7DQo+PiAgICAgICAgICAg
c2hkcl9zaXplID0gc2l6ZW9mKEVsZjMyX1NoZHIpOw0KPj4gICAgICAgICAgIG1lbXNldCgm
c2hkcjMyLCAwLCBzaGRyX3NpemUpOw0KPj4gLSAgICAgICAgc2hkcjMyLnNoX2luZm8gPSBj
cHVfdG9fZHVtcDMyKHMsIHMtPnNoX2luZm8pOw0KPj4gKyAgICAgICAgc2hkcjMyLnNoX2lu
Zm8gPSBjcHVfdG9fZHVtcDMyKHMsIHMtPnBoZHJfbnVtKTsNCj4+ICAgICAgICAgICBzaGRy
ID0gJnNoZHIzMjsNCj4+ICAgICAgIH0gZWxzZSB7DQo+PiAgICAgICAgICAgc2hkcl9zaXpl
ID0gc2l6ZW9mKEVsZjY0X1NoZHIpOw0KPj4gICAgICAgICAgIG1lbXNldCgmc2hkcjY0LCAw
LCBzaGRyX3NpemUpOw0KPj4gLSAgICAgICAgc2hkcjY0LnNoX2luZm8gPSBjcHVfdG9fZHVt
cDMyKHMsIHMtPnNoX2luZm8pOw0KPj4gKyAgICAgICAgc2hkcjY0LnNoX2luZm8gPSBjcHVf
dG9fZHVtcDMyKHMsIHMtPnBoZHJfbnVtKTsNCj4+ICAgICAgICAgICBzaGRyID0gJnNoZHI2
NDsNCj4+ICAgICAgIH0NCj4+DQo+PiBAQCAtNDc4LDEzICs0ODAsNiBAQCBzdGF0aWMgdm9p
ZCB3cml0ZV9lbGZfbG9hZHMoRHVtcFN0YXRlICpzLCBFcnJvcg0KPj4gKiplcnJwKQ0KPj4g
ICAgICAgaHdhZGRyIG9mZnNldCwgZmlsZXN6Ow0KPj4gICAgICAgTWVtb3J5TWFwcGluZyAq
bWVtb3J5X21hcHBpbmc7DQo+PiAgICAgICB1aW50MzJfdCBwaGRyX2luZGV4ID0gMTsNCj4+
IC0gICAgdWludDMyX3QgbWF4X2luZGV4Ow0KPj4gLQ0KPj4gLSAgICBpZiAocy0+aGF2ZV9z
ZWN0aW9uKSB7DQo+PiAtICAgICAgICBtYXhfaW5kZXggPSBzLT5zaF9pbmZvOw0KPj4gLSAg
ICB9IGVsc2Ugew0KPj4gLSAgICAgICAgbWF4X2luZGV4ID0gcy0+cGhkcl9udW07DQo+PiAt
ICAgIH0NCj4+DQo+PiAgICAgICBRVEFJTFFfRk9SRUFDSChtZW1vcnlfbWFwcGluZywgJnMt
Pmxpc3QuaGVhZCwgbmV4dCkgew0KPj4gICAgICAgICAgIGdldF9vZmZzZXRfcmFuZ2UobWVt
b3J5X21hcHBpbmctPnBoeXNfYWRkciwNCj4+IEBAIC01MDIsNyArNDk3LDcgQEAgc3RhdGlj
IHZvaWQgd3JpdGVfZWxmX2xvYWRzKER1bXBTdGF0ZSAqcywgRXJyb3IgKiplcnJwKQ0KPj4g
ICAgICAgICAgICAgICByZXR1cm47DQo+PiAgICAgICAgICAgfQ0KPj4NCj4+IC0gICAgICAg
IGlmIChwaGRyX2luZGV4ID49IG1heF9pbmRleCkgew0KPj4gKyAgICAgICAgaWYgKHBoZHJf
aW5kZXggPj0gcy0+cGhkcl9udW0pIHsNCj4+ICAgICAgICAgICAgICAgYnJlYWs7DQo+PiAg
ICAgICAgICAgfQ0KPj4gICAgICAgfQ0KPj4gQEAgLTE4MDEsMjIgKzE3OTYsMjEgQEAgc3Rh
dGljIHZvaWQgZHVtcF9pbml0KER1bXBTdGF0ZSAqcywgaW50IGZkLCBib29sDQo+PiBoYXNf
Zm9ybWF0LA0KPj4gICAgICAgICAgIHMtPnBoZHJfbnVtICs9IHMtPmxpc3QubnVtOw0KPj4g
ICAgICAgICAgIHMtPmhhdmVfc2VjdGlvbiA9IGZhbHNlOw0KPj4gICAgICAgfSBlbHNlIHsN
Cj4+ICsgICAgICAgIC8qIHNoX2luZm8gb2Ygc2VjdGlvbiAwIGhvbGRzIHRoZSByZWFsIG51
bWJlciBvZiBwaGRycyAqLw0KPj4gICAgICAgICAgIHMtPmhhdmVfc2VjdGlvbiA9IHRydWU7
DQo+PiAtICAgICAgICBzLT5waGRyX251bSA9IFBOX1hOVU07DQo+PiAtICAgICAgICBzLT5z
aF9pbmZvID0gMTsgLyogUFRfTk9URSAqLw0KPj4NCj4+ICAgICAgICAgICAvKiB0aGUgdHlw
ZSBvZiBzaGRyLT5zaF9pbmZvIGlzIHVpbnQzMl90LCBzbyB3ZSBzaG91bGQgYXZvaWQNCj4+
IG92ZXJmbG93ICovDQo+PiAgICAgICAgICAgaWYgKHMtPmxpc3QubnVtIDw9IFVJTlQzMl9N
QVggLSAxKSB7DQo+PiAtICAgICAgICAgICAgcy0+c2hfaW5mbyArPSBzLT5saXN0Lm51bTsN
Cj4+ICsgICAgICAgICAgICBzLT5waGRyX251bSArPSBzLT5saXN0Lm51bTsNCj4+ICAgICAg
ICAgICB9IGVsc2Ugew0KPj4gLSAgICAgICAgICAgIHMtPnNoX2luZm8gPSBVSU5UMzJfTUFY
Ow0KPj4gKyAgICAgICAgICAgIHMtPnBoZHJfbnVtID0gVUlOVDMyX01BWDsNCj4+ICAgICAg
ICAgICB9DQo+PiAgICAgICB9DQo+Pg0KPj4gICAgICAgaWYgKHMtPmR1bXBfaW5mby5kX2Ns
YXNzID09IEVMRkNMQVNTNjQpIHsNCj4+ICAgICAgICAgICBpZiAocy0+aGF2ZV9zZWN0aW9u
KSB7DQo+PiAgICAgICAgICAgICAgIHMtPm1lbW9yeV9vZmZzZXQgPSBzaXplb2YoRWxmNjRf
RWhkcikgKw0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoRWxm
NjRfUGhkcikgKiBzLT5zaF9pbmZvICsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc2l6ZW9mKEVsZjY0X1BoZHIpICogcy0+cGhkcl9udW0gKw0KPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKEVsZjY0X1NoZHIpICsgcy0+bm90ZV9z
aXplOw0KPj4gICAgICAgICAgIH0gZWxzZSB7DQo+PiAgICAgICAgICAgICAgIHMtPm1lbW9y
eV9vZmZzZXQgPSBzaXplb2YoRWxmNjRfRWhkcikgKw0KPj4gQEAgLTE4MjUsNyArMTgxOSw3
IEBAIHN0YXRpYyB2b2lkIGR1bXBfaW5pdChEdW1wU3RhdGUgKnMsIGludCBmZCwgYm9vbA0K
Pj4gaGFzX2Zvcm1hdCwNCj4+ICAgICAgIH0gZWxzZSB7DQo+PiAgICAgICAgICAgaWYgKHMt
PmhhdmVfc2VjdGlvbikgew0KPj4gICAgICAgICAgICAgICBzLT5tZW1vcnlfb2Zmc2V0ID0g
c2l6ZW9mKEVsZjMyX0VoZHIpICsNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2l6ZW9mKEVsZjMyX1BoZHIpICogcy0+c2hfaW5mbyArDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNpemVvZihFbGYzMl9QaGRyKSAqIHMtPnBoZHJfbnVtICsN
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihFbGYzMl9TaGRy
KSArIHMtPm5vdGVfc2l6ZTsNCj4+ICAgICAgICAgICB9IGVsc2Ugew0KPj4gICAgICAgICAg
ICAgICBzLT5tZW1vcnlfb2Zmc2V0ID0gc2l6ZW9mKEVsZjMyX0VoZHIpICsNCj4+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL3N5c2VtdS9kdW1wLmggYi9pbmNsdWRlL3N5c2VtdS9kdW1wLmgN
Cj4+IGluZGV4IDI1MDE0M2NiNWEuLmI0NjNmYzljMDIgMTAwNjQ0DQo+PiAtLS0gYS9pbmNs
dWRlL3N5c2VtdS9kdW1wLmgNCj4+ICsrKyBiL2luY2x1ZGUvc3lzZW11L2R1bXAuaA0KPj4g
QEAgLTE1NCw4ICsxNTQsNyBAQCB0eXBlZGVmIHN0cnVjdCBEdW1wU3RhdGUgew0KPj4gICAg
ICAgR3Vlc3RQaHlzQmxvY2tMaXN0IGd1ZXN0X3BoeXNfYmxvY2tzOw0KPj4gICAgICAgQXJj
aER1bXBJbmZvIGR1bXBfaW5mbzsNCj4+ICAgICAgIE1lbW9yeU1hcHBpbmdMaXN0IGxpc3Q7
DQo+PiAtICAgIHVpbnQxNl90IHBoZHJfbnVtOw0KPj4gLSAgICB1aW50MzJfdCBzaF9pbmZv
Ow0KPj4gKyAgICB1aW50MzJfdCBwaGRyX251bTsNCj4+ICAgICAgIGJvb2wgaGF2ZV9zZWN0
aW9uOw0KPj4gICAgICAgYm9vbCByZXN1bWU7DQo+PiAgICAgICBib29sIGRldGFjaGVkOw0K
Pj4gLS0NCj4+IDIuMzIuMA0KPj4NCj4+DQo+Pg0KPiANCg0K

