Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9AB4CA72A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 15:05:35 +0100 (CET)
Received: from localhost ([::1]:49330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPbi-0003mP-D6
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 09:05:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nPOLf-0000eO-9r
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:44:55 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nPOLc-00045P-Km
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:44:54 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222C0adV026319
 for <qemu-devel@nongnu.org>; Wed, 2 Mar 2022 12:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=yNX/crsaW4jNkHNmlG95Z6ROuRMDFkoqspGUCkEiTrA=;
 b=J7ZugJ/ZYih03qx1ZvBy9L8+IDcAGBnXEUmX9WyrrbWs1Xb08Xd+YRC+mc1PQl+ceFtU
 kjiFIi/0847GS82Ybqs9PQySMUBgXTAYivv2g+Uw9t+1kS/YLeq8KC8J//w4vL54RFyn
 ziB2OijNcyRgQGH5VS6SFQ+UsVbI2carLBYCapnGuJljcJURpJ67aOW14CerbxR0MarD
 yDsuP0SXcZXYLt4cz/9kZBUOclUcteEJVUU1Vcb50JUS/V1clj4WGZUGww2I7fC8Nnh1
 3sVuSOPuq9rBkLlSMjERH+be7rmNQyKlwIDO/+GDW5IX0iHxC71nYX6zSDySbntEKA0a 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6bpvhq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:44:50 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222CIS1t026204
 for <qemu-devel@nongnu.org>; Wed, 2 Mar 2022 12:44:49 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6bpvhp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 12:44:49 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222CgoZv007162;
 Wed, 2 Mar 2022 12:44:46 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 3efbfj5b16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 12:44:46 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222Cii9p53084534
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 12:44:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86FE852050;
 Wed,  2 Mar 2022 12:44:44 +0000 (GMT)
Received: from [9.145.51.38] (unknown [9.145.51.38])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 55E915204F;
 Wed,  2 Mar 2022 12:44:44 +0000 (GMT)
Message-ID: <104c2aa7-2b0f-c5f4-a996-561d960c7701@linux.ibm.com>
Date: Wed, 2 Mar 2022 13:44:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 7/7] dump: Consolidate elf note function
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220301142213.28568-1-frankja@linux.ibm.com>
 <20220301142213.28568-8-frankja@linux.ibm.com>
 <CAMxuvazk2MYoXj1Gku3F5sepwUVuo-Q6Ts8sYkrQHtJ0jnytjQ@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <CAMxuvazk2MYoXj1Gku3F5sepwUVuo-Q6Ts8sYkrQHtJ0jnytjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QjGWmrpgEtv390O7a_ztf70D2gOgwADL
X-Proofpoint-ORIG-GUID: KbMTfqS4JDvEKqM0PFk_1IaVUh8f7M9R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_06,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=887
 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020054
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMy8yLzIyIDExOjMwLCBNYXJjLUFuZHLDqSBMdXJlYXUgd3JvdGU6DQo+IEhpDQo+IA0K
PiBPbiBUdWUsIE1hciAxLCAyMDIyIGF0IDY6MjIgUE0gSmFub3NjaCBGcmFuayA8ZnJhbmtq
YUBsaW51eC5pYm0uY29tPiB3cm90ZToNCj4+DQo+PiBKdXN0IGxpa2Ugd2l0aCB0aGUgb3Ro
ZXIgd3JpdGUgZnVuY3Rpb25zIGxldCdzIG1vdmUgdGhlIDMyLzY0IGJpdCBlbGYNCj4+IGhh
bmRsaW5nIHRvIGEgZnVuY3Rpb24gdG8gaW1wcm92ZSByZWFkYWJpbGl0eS4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBKYW5vc2NoIEZyYW5rIDxmcmFua2phQGxpbnV4LmlibS5jb20+DQo+
PiAtLS0NCj4+ICAgZHVtcC9kdW1wLmMgfCAyNCArKysrKysrKysrKysrKysrKy0tLS0tLS0N
Cj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2R1bXAvZHVtcC5jIGIvZHVtcC9kdW1wLmMNCj4+IGlu
ZGV4IDc4NjU0YjljMjcuLjliYTAzOTJlMDAgMTAwNjQ0DQo+PiAtLS0gYS9kdW1wL2R1bXAu
Yw0KPj4gKysrIGIvZHVtcC9kdW1wLmMNCj4+IEBAIC01MDcsNiArNTA3LDIxIEBAIHN0YXRp
YyB2b2lkIHdyaXRlX2VsZl9sb2FkcyhEdW1wU3RhdGUgKnMsIEVycm9yICoqZXJycCkNCj4+
ICAgICAgIH0NCj4+ICAgfQ0KPj4NCj4+ICtzdGF0aWMgdm9pZCB3cml0ZV9lbGZfbm90ZXMo
RHVtcFN0YXRlICpzLCBFcnJvciAqKmVycnApDQo+PiArew0KPj4gKyAgICBFcnJvciAqbG9j
YWxfZXJyID0gTlVMTDsNCj4+ICsNCj4+ICsgICAgaWYgKGR1bXBfaXNfNjRiaXQocykpIHsN
Cj4+ICsgICAgICAgIHdyaXRlX2VsZjY0X25vdGVzKGZkX3dyaXRlX3ZtY29yZSwgcywgJmxv
Y2FsX2Vycik7DQo+PiArICAgIH0gZWxzZSB7DQo+PiArICAgICAgICB3cml0ZV9lbGYzMl9u
b3RlcyhmZF93cml0ZV92bWNvcmUsIHMsICZsb2NhbF9lcnIpOw0KPj4gKyAgICB9DQo+PiAr
ICAgIGlmIChsb2NhbF9lcnIpIHsNCj4+ICsgICAgICAgIGVycm9yX3Byb3BhZ2F0ZShlcnJw
LCBsb2NhbF9lcnIpOw0KPj4gKyAgICAgICAgcmV0dXJuOw0KPj4gKyAgICB9DQo+IA0KPiBQ
bGVhc2UgdXNlICJtb2Rlcm4iLXN0eWxlIEVSUlBfR1VBUkQoKSwgYW5kIGluZGljYXRlIGZh
aWx1cmUgd2l0aCBhDQo+IGJvb2wgKHNlZSBpbmNsdWRlL3FhcGkvZXJyb3IuaCkNCg0KRGlk
bid0IGtub3cgdGhhdCdzIGEgdGhpbmcsIEknbGwgaGF2ZSBhIGxvb2sNCg0KPiANCj4gKHBl
cmhhcHMgdGhpcyBzaG91bGQgYmUgcHJlbGltaW5hcnkgdG8gdGhpcyBzZXJpZXMpDQoNClNv
IHlvdSB3YW50IG1lIHRvIGNoYW5nZSBhbGwgdGhlIGxvY2FsX2Vycm9yICsgZXJyb3JfcHJv
cGFnYXRlKClzIGluIA0KdGhpcyBmaWxlPw0KDQo+IA0KPj4gK30NCj4+ICsNCj4+ICAgLyog
d3JpdGUgZWxmIGhlYWRlciwgUFRfTk9URSBhbmQgZWxmIG5vdGUgdG8gdm1jb3JlLiAqLw0K
Pj4gICBzdGF0aWMgdm9pZCBkdW1wX2JlZ2luKER1bXBTdGF0ZSAqcywgRXJyb3IgKiplcnJw
KQ0KPj4gICB7DQo+PiBAQCAtNTcwLDEzICs1ODUsOCBAQCBzdGF0aWMgdm9pZCBkdW1wX2Jl
Z2luKER1bXBTdGF0ZSAqcywgRXJyb3IgKiplcnJwKQ0KPj4gICAgICAgICAgIH0NCj4+ICAg
ICAgIH0NCj4+DQo+PiAtICAgIGlmIChkdW1wX2lzXzY0Yml0KHMpKSB7DQo+PiAtICAgICAg
ICAvKiB3cml0ZSBub3RlcyB0byB2bWNvcmUgKi8NCj4+IC0gICAgICAgIHdyaXRlX2VsZjY0
X25vdGVzKGZkX3dyaXRlX3ZtY29yZSwgcywgJmxvY2FsX2Vycik7DQo+PiAtICAgIH0gZWxz
ZSB7DQo+PiAtICAgICAgICAvKiB3cml0ZSBub3RlcyB0byB2bWNvcmUgKi8NCj4+IC0gICAg
ICAgIHdyaXRlX2VsZjMyX25vdGVzKGZkX3dyaXRlX3ZtY29yZSwgcywgJmxvY2FsX2Vycik7
DQo+PiAtICAgIH0NCj4+ICsgICAgLyogd3JpdGUgbm90ZXMgdG8gdm1jb3JlICovDQo+PiAr
ICAgIHdyaXRlX2VsZl9ub3RlcyhzLCAmbG9jYWxfZXJyKTsNCj4+ICAgICAgIGlmIChsb2Nh
bF9lcnIpIHsNCj4+ICAgICAgICAgICBlcnJvcl9wcm9wYWdhdGUoZXJycCwgbG9jYWxfZXJy
KTsNCj4+ICAgICAgICAgICByZXR1cm47DQo+PiAtLQ0KPj4gMi4zMi4wDQo+Pg0KPiANCg0K


