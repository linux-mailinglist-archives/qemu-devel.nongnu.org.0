Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F98B60DD13
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 10:31:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onbma-0002n2-MQ; Wed, 26 Oct 2022 04:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1onbmQ-0001d8-VA; Wed, 26 Oct 2022 04:28:55 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1onbmO-0003e9-W3; Wed, 26 Oct 2022 04:28:54 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q89CTN020324;
 Wed, 26 Oct 2022 08:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=NEgSkoNasWTG+vdYblYKhV7kqA7miBIF1W2NUhhJrfg=;
 b=DwBczzR8u8UxebeHOjISYGQ8layYbBh8qws2bwnJ0LBy2StlHH68RchT49mn7hyMTFaA
 +5zLn4VygBOAr+eku/qSQGBz+q2je6Hui0noU/3TcUFOm4OeVOdS3TihDA5fjJ2ob1Mg
 SUJ4YF/5Ty1fPVY+9Jz3ltkXl4xyi+lMyiBUJi30icIbOnrUkoTMhw1Y80WWpM47kIHN
 /vT7FZ+cdux/JL77azf+dJzOsg1TK8IHdIZmavP8/cWaR1MeCeL/Bp/LRAa8oDMUkM+P
 D9VstnFHQZsMrwmHPDlIuUo1E3F7m/kwvXSFCszCoiGcvFVHh4oeWgd1d12oKUtM6e+j Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kevysykvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 08:28:48 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29Q8R85L030520;
 Wed, 26 Oct 2022 08:28:47 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kevysykv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 08:28:47 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29Q8LnJe010301;
 Wed, 26 Oct 2022 08:28:46 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3kc859f2yp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 08:28:46 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 29Q8TIQ937617942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Oct 2022 08:29:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5F825204E;
 Wed, 26 Oct 2022 08:28:43 +0000 (GMT)
Received: from [9.171.45.23] (unknown [9.171.45.23])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 96B1E52051;
 Wed, 26 Oct 2022 08:28:43 +0000 (GMT)
Message-ID: <a384dedf-d367-c86d-8776-1b31988827fa@linux.ibm.com>
Date: Wed, 26 Oct 2022 10:28:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PULL v2 00/11] Dump patches
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@gmail.com>
References: <20221025075003.18161-1-marcandre.lureau@redhat.com>
 <CAJSP0QUGGN7KuBzr=8q5erpUiVZUK+kvfgxwfjW6Z3TODYZwJA@mail.gmail.com>
 <CAMxuvawBJC13Xpv4PoaU-piJWaXEBQjaXfbCRbpvOYEzrvqq5A@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <CAMxuvawBJC13Xpv4PoaU-piJWaXEBQjaXfbCRbpvOYEzrvqq5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NKkH6r0AHbAghUIsWNdDbcFsuNKrHTIf
X-Proofpoint-GUID: dCrvER8-XtfxUU0Owwa7_LexRoBs7MGh
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_04,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210260044
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

T24gMTAvMjYvMjIgMDk6NDIsIE1hcmMtQW5kcsOpIEx1cmVhdSB3cm90ZToNCj4gSGkgSmFub3Nj
aA0KPiANCj4gT24gV2VkLCBPY3QgMjYsIDIwMjIgYXQgMTozNyBBTSBTdGVmYW4gSGFqbm9jemkg
PHN0ZWZhbmhhQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPj4gUGxlYXNlIHNvbHZlIHRoaXMgQ0kg
ZmFpbHVyZToNCj4+DQo+PiBjKysgLW8gcWVtdS1zeXN0ZW0tczM5MHggLi4uDQo+PiAvdXNyL2Jp
bi9sZDogbGlicWVtdS1zMzkweC1zb2Z0bW11LmZhLnAvdGFyZ2V0X3MzOTB4X2FyY2hfZHVtcC5j
Lm86IGluDQo+PiBmdW5jdGlvbiBgYXJjaF9zZWN0aW9uc19hZGQnOg0KPj4NCj4+IC9ob21lL2dp
dGxhYi1ydW5uZXIvYnVpbGRzL1kxTVA5VlNZLzAvcWVtdS1wcm9qZWN0L3FlbXUvYnVpbGQvLi4v
dGFyZ2V0L3MzOTB4L2FyY2hfZHVtcC5jOjM5MjoNCj4+IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YGt2bV9zMzkwX2dldF9wcm90ZWN0ZWRfZHVtcCcNCj4+IC91c3IvYmluL2xkOiBsaWJxZW11LXMz
OTB4LXNvZnRtbXUuZmEucC90YXJnZXRfczM5MHhfYXJjaF9kdW1wLmMubzogaW4NCj4+IGZ1bmN0
aW9uIGBjcHVfZ2V0X2R1bXBfaW5mbyc6DQo+Pg0KPj4gL2hvbWUvZ2l0bGFiLXJ1bm5lci9idWls
ZHMvWTFNUDlWU1kvMC9xZW11LXByb2plY3QvcWVtdS9idWlsZC8uLi90YXJnZXQvczM5MHgvYXJj
aF9kdW1wLmM6NDUyOg0KPj4gdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBga3ZtX3MzOTBfZ2V0X3By
b3RlY3RlZF9kdW1wJw0KPj4gY29sbGVjdDI6IGVycm9yOiBsZCByZXR1cm5lZCAxIGV4aXQgc3Rh
dHVzDQo+Pg0KPj4gaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vam9icy8z
MjI2NjczNjQ5DQo+Pg0KPj4NCj4gT2sgdG8gc3F1YXNoIHRoaXMgd2l0aCAiczM5MHg6IEFkZCBw
cm90ZWN0ZWQgZHVtcCBjYXAiIHBhdGNoID8gdGhhdCBzaG91bGQNCj4gc29sdmUgaXQgaG9wZWZ1
bGx5Lg0KDQpTdXJlLCBMR1RNDQoNCj4gDQo+IGRpZmYgLS1naXQgYS90YXJnZXQvczM5MHgva3Zt
L3N0dWJzLmMgYi90YXJnZXQvczM5MHgva3ZtL3N0dWJzLmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uNWZkNjNiOWE3ZQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsr
KyBiL3RhcmdldC9zMzkweC9rdm0vc3R1YnMuYw0KPiBAQCAtMCwwICsxLDEyIEBADQo+ICsvKg0K
PiArICogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXINCj4gKyAqLw0K
PiArDQo+ICsjaW5jbHVkZSAicWVtdS9vc2RlcC5oIg0KPiArDQo+ICsjaW5jbHVkZSAia3ZtX3Mz
OTB4LmgiDQo+ICsNCj4gK2ludCBrdm1fczM5MF9nZXRfcHJvdGVjdGVkX2R1bXAodm9pZCkNCj4g
K3sNCj4gKyAgICByZXR1cm4gZmFsc2U7DQo+ICt9DQo+IGRpZmYgLS1naXQgYS90YXJnZXQvczM5
MHgva3ZtL21lc29uLmJ1aWxkIGIvdGFyZ2V0L3MzOTB4L2t2bS9tZXNvbi5idWlsZA0KPiBpbmRl
eCBkMTM1NjM1NmIxLi5hZWY1MmI2Njg2IDEwMDY0NA0KPiAtLS0gYS90YXJnZXQvczM5MHgva3Zt
L21lc29uLmJ1aWxkDQo+ICsrKyBiL3RhcmdldC9zMzkweC9rdm0vbWVzb24uYnVpbGQNCj4gQEAg
LTEsNiArMSw4IEBADQo+IA0KPiAgIHMzOTB4X3NzLmFkZCh3aGVuOiAnQ09ORklHX0tWTScsIGlm
X3RydWU6IGZpbGVzKA0KPiAgICAgJ2t2bS5jJw0KPiArKSwgaWZfZmFsc2U6IGZpbGVzKA0KPiAr
ICAnc3R1YnMuYycNCj4gICApKQ0KPiANCg0K

