Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B2C574C77
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 13:50:39 +0200 (CEST)
Received: from localhost ([::1]:57892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBxMc-000722-Ko
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 07:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBxHs-0004dw-Kz; Thu, 14 Jul 2022 07:45:49 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBxHo-0001ug-GD; Thu, 14 Jul 2022 07:45:43 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26EBffG6001069;
 Thu, 14 Jul 2022 11:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xuTvuORtCwOf9Rcz+mqv3HXEwj+jY15kBcqDv548afg=;
 b=Ywhy8/RqaswNbjc7/hU3JVHU9dp08qK32fJMErY8zkk6kxBXuN1DodWQd8jLpT6clKA8
 fCZ0xYm4tJBZ1k4TvIiuJ5ll/REpDJ9HIjLgWovYKSsDo6hWbYoWpI4ItsRXVj9W1nKL
 OyRYPZohyj/p6Fo8zL2wPLYCUnJrP2vjV97EqsPwEFjvNn6rAgi4QKneiGzCXGT56B1a
 Qi0EiUYlN4iNhy+pr51BL/Qdt7Cq0zMEpxtGOND1VOGLE0z65D7+j9l5zgQkstF5wRji
 xogXxVcSGPnBBFXJtbRKiDoeN0nNQ6JTbbWpzAbi5imuk16EoakibqYtgB4L3Z96Z7LG cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hajg902gx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 11:45:37 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26EBiFqJ026312;
 Thu, 14 Jul 2022 11:45:34 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hajg902fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 11:45:34 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26EBKCUB004317;
 Thu, 14 Jul 2022 11:45:30 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3h71a8y1a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 11:45:30 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26EBjRVL21692734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 11:45:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E894A4054;
 Thu, 14 Jul 2022 11:45:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6E0EA405B;
 Thu, 14 Jul 2022 11:45:26 +0000 (GMT)
Received: from [9.145.62.186] (unknown [9.145.62.186])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jul 2022 11:45:26 +0000 (GMT)
Message-ID: <1a3daf50-8b35-57f5-943e-c62039e66da9@linux.ibm.com>
Date: Thu, 14 Jul 2022 13:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
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
 <20220713130322.25517-4-frankja@linux.ibm.com>
 <CAMxuvazSob1cgGiY8euW6Cq4_f37VZhLxjF6PK7kixVFnHukpA@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v2 03/11] dump: Split write of section headers and data
 and add a prepare step
In-Reply-To: <CAMxuvazSob1cgGiY8euW6Cq4_f37VZhLxjF6PK7kixVFnHukpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZALJTmcunSQk_XmtMi2zMO23W6y_t_np
X-Proofpoint-ORIG-GUID: WTn8aYJr1nQPNgHaWMZHh0wUBZ5UcFKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-14_08,2022-07-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207140048
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

T24gNy8xMy8yMiAxNzozMSwgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOg0KPiBIaQ0KPiAN
Cj4gT24gV2VkLCBKdWwgMTMsIDIwMjIgYXQgNTowNyBQTSBKYW5vc2NoIEZyYW5rIDxmcmFu
a2phQGxpbnV4LmlibS5jb20+IHdyb3RlOg0KPj4NCj4+IEJ5IHNwbGl0dGluZyB0aGUgd3Jp
dGluZyBvZiB0aGUgc2VjdGlvbiBoZWFkZXJzIGFuZCAoZnV0dXJlKSBzZWN0aW9uDQo+PiBk
YXRhIHdlIHByZXBhcmUgZm9yIHRoZSBhZGRpdGlvbiBvZiBhIHN0cmluZyB0YWJsZSBzZWN0
aW9uIGFuZA0KPj4gYXJjaGl0ZWN0dXJlIHNlY3Rpb25zLg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IEphbm9zY2ggRnJhbmsgPGZyYW5ramFAbGludXguaWJtLmNvbT4NCj4+IC0tLQ0KDQpb
Li4uXQ0KDQo+PiBAQCAtNTU3LDEyICs2MDAsMjIgQEAgc3RhdGljIHZvaWQgZHVtcF9iZWdp
bihEdW1wU3RhdGUgKnMsIEVycm9yICoqZXJycCkNCj4+ICAgICAgIC8qIFdyaXRlIGVsZiBo
ZWFkZXIgdG8gYnVmZmVyICovDQo+PiAgICAgICBwcmVwYXJlX2VsZl9oZWFkZXIocyk7DQo+
Pg0KPj4gKyAgICBwcmVwYXJlX2VsZl9zZWN0aW9ucyhzLCBlcnJwKTsNCj4+ICsgICAgaWYg
KCplcnJwKSB7DQo+PiArICAgICAgICByZXR1cm47DQo+PiArICAgIH0NCj4+ICsNCj4+ICAg
ICAgIC8qIFN0YXJ0IHRvIHdyaXRlIHN0dWZmIGludG8gZmlsZXMqLw0KPj4gICAgICAgd3Jp
dGVfZWxmX2hlYWRlcihzLCBlcnJwKTsNCj4+ICAgICAgIGlmICgqZXJycCkgew0KPj4gICAg
ICAgICAgIHJldHVybjsNCj4+ICAgICAgIH0NCj4+DQo+PiArICAgIHdyaXRlX2VsZl9zZWN0
aW9uX2hlYWRlcnMocywgZXJycCk7DQo+IA0KPiBXaHkgZG8geW91IHJlb3JkZXIgdGhlIHNl
Y3Rpb25zPyBDb3VsZCB5b3UgZXhwbGFpbiBpbiB0aGUgY29tbWl0DQo+IG1lc3NhZ2Ugd2h5
PyBJcyB0aGlzIGlzIGZvcm1hdCBjb21wbGlhbnQ/IGFuZCB1cGRhdGUgdGhlIGNvbW1lbnQN
Cj4gYWJvdmU/IHRoYW5rcw0KDQoNCkhhdmluZyB0aGUgc2VjdGlvbiBkYXRhIGF0IHRoZSBl
bmQgb2YgdGhlIGZpbGUgaXMgdW5mb3J0dW5hdGVseSBhIHMzOTAgDQpQViByZXF1aXJlbWVu
dCBzaW5jZSB3ZSBjYW4gb25seSBncmFiIHRoZSBlbmNyeXB0ZWQgcGFnZSB0d2Vha3MgYW5k
IA0KY291bnRzICphZnRlciogYWxsIG9mIHRoZSBtZW1vcnkgaGFzIGJlZW4gZW5jcnlwdGVk
Lg0KDQpUaGUgc2VjdGlvbnMgYXJlIHRoZSBtb3N0IG9idmlvdXMgd2F5IHRvIGFkZCBzdWNo
IGRhdGEgdG8gdGhlIGZpbGUgc2luY2UgDQp0aGV5IGFyZSBiYXNpY2FsbHkgdW51c2VkIHJp
Z2h0IG5vdyBhbmQgd2UncmUgYWJsZSB0byB3cml0ZSBhIHN0cmluZyANCnRhYmxlIGF0IHRo
ZSB2ZXJ5IGVuZCBhZnRlciBldmVyeW9uZSByZWdpc3RlcmVkIHRoZWlyIHN0cmluZ3MuDQoN
CkFsbCBvZiB0aGlzIGlzIEVMRiBjb21wbGlhbnQgQUZBSUssIHRoYXQncyB3aHkgZWxmIHNw
ZWNpZmllcyBvZmZzZXRzIG9mIA0KdGhlIGhlYWRlcnMgYW5kIHRoZSBkYXRhLiBGcm9tIHdo
YXQgSSBzZWUgb25seSB0aGUgbWFpbiBlbGYgaGVhZGVyIG5lZWRzIA0KdG8gc3RhcnQgYXQg
b2Zmc2V0IDAuDQo=

