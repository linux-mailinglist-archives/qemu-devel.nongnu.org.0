Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F069857D17A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:28:41 +0200 (CEST)
Received: from localhost ([::1]:47482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZ2W-0000V9-I5
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEZ0N-0006Cb-G5; Thu, 21 Jul 2022 12:26:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEZ0K-0005ra-Om; Thu, 21 Jul 2022 12:26:27 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LFrxcg006098;
 Thu, 21 Jul 2022 16:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dmq2j0007E0AJ6zsZ3bXtdPVxe8A0fv7RMw8gWX4p5g=;
 b=K8QFw/N4FhObAl8MSKy0KpCzil3EU0MjQPYPeDbroKghhp6esWMUUmt7VCUP/XHLSyXK
 knUtXg6TbjGKfWSPFIiwXVCutyojrubLhCNUPct3DAy8BPONTFsLm0vNgvHJZR6BCGJX
 LwskRHLfVblviccFlrEK2aKv6BhJp9yxMcZzhwuyumzY/nX6b5ZT0XK40Hdqzjdz87Wv
 OIKythLWiIihTe5tYjuyXT8NiZoghsWLDmf+4t8WEFcwUbITNj33DTMHOrfCrLiOe36/
 /FfAdGMciejCDfhwF/rdefQOiS8d2LamVMZYoH7rUICCsJ37ENibZpai7xc5fx6P3/4B Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf9um8u39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 16:26:21 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26LGAZEP030128;
 Thu, 21 Jul 2022 16:26:20 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf9um8u2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 16:26:20 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26LGLKl3007482;
 Thu, 21 Jul 2022 16:26:18 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3hbmy8yb36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 16:26:18 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26LGORSZ18481526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jul 2022 16:24:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8ADFCA405F;
 Thu, 21 Jul 2022 16:26:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F7A7A4054;
 Thu, 21 Jul 2022 16:26:15 +0000 (GMT)
Received: from [9.145.177.237] (unknown [9.145.177.237])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jul 2022 16:26:14 +0000 (GMT)
Message-ID: <9a382a24-a921-1544-46e6-92c919f634fa@linux.ibm.com>
Date: Thu, 21 Jul 2022 18:26:14 +0200
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
 seiden@linux.ibm.com
References: <20220721132256.2171-1-frankja@linux.ibm.com>
 <20220721132256.2171-4-frankja@linux.ibm.com>
 <CAMxuvaya0AiW1yvSab_jynHNn+=w2LZhGdgnm6OY6UwSf24YZA@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v3 03/14] dump: Convert GuestPhysBlock iterators and use
 the filter functions
In-Reply-To: <CAMxuvaya0AiW1yvSab_jynHNn+=w2LZhGdgnm6OY6UwSf24YZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dYYUfESzuymPp6y-i11TCIZWXxNOw566
X-Proofpoint-GUID: 1gv7HTmMpw6fGVbKJJLl2SsglbIVocvu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_22,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207210061
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

T24gNy8yMS8yMiAxNjozNiwgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOg0KWy4uXQ0KPj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvc3lzZW11L2R1bXAuaCBiL2luY2x1ZGUvc3lzZW11L2R1
bXAuaA0KPj4gaW5kZXggMmIzOWFiZWVhZS4uNzAyNWU1MDY4MiAxMDA2NDQNCj4+IC0tLSBh
L2luY2x1ZGUvc3lzZW11L2R1bXAuaA0KPj4gKysrIGIvaW5jbHVkZS9zeXNlbXUvZHVtcC5o
DQo+PiBAQCAtMTY2LDExICsxNjYsMTAgQEAgdHlwZWRlZiBzdHJ1Y3QgRHVtcFN0YXRlIHsN
Cj4+ICAgICAgIGh3YWRkciBtZW1vcnlfb2Zmc2V0Ow0KPj4gICAgICAgaW50IGZkOw0KPj4N
Cj4+IC0gICAgR3Vlc3RQaHlzQmxvY2sgKm5leHRfYmxvY2s7DQo+PiAtICAgIHJhbV9hZGRy
X3Qgc3RhcnQ7DQo+PiAtICAgIGJvb2wgaGFzX2ZpbHRlcjsNCj4+IC0gICAgaW50NjRfdCBi
ZWdpbjsNCj4+IC0gICAgaW50NjRfdCBsZW5ndGg7DQo+PiArICAgIC8qIEd1ZXN0IG1lbW9y
eSByZWxhdGVkIGRhdGEgKi8NCj4+ICsgICAgYm9vbCBoYXNfZmlsdGVyOyAgICAgICAgICAg
LyogQXJlIHdlIGR1bXBpbmcgcGFydHMgb2YgdGhlIG1lbW9yeT8gKi8NCj4+ICsgICAgaW50
NjRfdCBiZWdpbjsgICAgICAgICAgICAgLyogU3RhcnQgYWRkcmVzcyBvZiB0aGUgY2h1bmsg
d2Ugd2FudCB0byBkdW1wICovDQo+PiArICAgIGludDY0X3QgbGVuZ3RoOyAgICAgICAgICAg
IC8qIExlbmd0aCBvZiB0aGUgZHVtcCB3ZSB3YW50IHRvIGR1bXAgKi8NCj4+DQo+PiAgICAg
ICB1aW50OF90ICpub3RlX2J1ZjsgICAgICAgICAgLyogYnVmZmVyIGZvciBub3RlcyAqLw0K
Pj4gICAgICAgc2l6ZV90IG5vdGVfYnVmX29mZnNldDsgICAgIC8qIHRoZSB3cml0aW5nIHBs
YWNlIGluIG5vdGVfYnVmICovDQo+PiAtLQ0KPj4gMi4zNC4xDQo+Pg0KPiANCj4gTXkgc3Vn
Z2VzdGlvbiBpbiB2MiByZXZpZXcgd2FzIHRvIGludHJvZHVjZSBlYWNoIGZ1bmN0aW9uICYN
Cj4gcmVmYWN0b3JpbmcgaW5kZXBlbmRlbnRseSwgaWYgcG9zc2libGUuIEFuZCBpdCBsb29r
cyBsaWtlIHRoZQ0KPiB2YWxpZGF0ZV9zdGFydF9ibG9jaygpIGNoYW5nZSBjb3VsZCBiZSBh
IDNyZCBwYXRjaCB0b28uDQo+IA0KPiANCg0KQWxyaWdodCwgSSBqdXN0IHNxdWFzaGVkIGFu
ZCBzcGxpdCB0aGlzIGludG8gNSBwYXRjaGVzOg0KICAqIEludHJvZHVjaW5nIHRoZSAyIG5l
dyBmdW5jdGlvbnMNCiAgKiBDb252ZXJ0aW5nIGR1bXBfaXRlcmF0ZSBhbmQgcmVtb3Zpbmcg
Z2V0X25leHRfYmxvY2sNCiAgKiBnZXRfc3RhcnRfYmxvY2sgLT4gdmFsaWRhdGVfc3RhcnRf
YmxvY2sNCiAgKiBSZW1vdmFsIG9mIG5leHRfYmxvY2sgYW5kIHN0YXJ0IGZyb20gRHVtcFN0
YXRlLCBsYXN0IHVzZXIgd2FzIA0KZ2V0X3N0YXJ0X2Jsb2NrDQogICogUmUtd29yayBvZiBk
dW1wX2NhbGN1bGF0ZV9zaXplDQoNCg0KSSBkb24ndCB0aGluayB3ZSBjYW4gZWFzaWx5IGFk
YXB0IHRvIGR1bXBfZ2V0X21lbWJsb2NrX3NpemUoKSBhbmQgDQpkdW1wX2dldF9tZW1ibG9j
a19zdGFydCgpIGluZGVwZW5kZW50bHkuDQoNCkknbGwgYWxzbyBtb3ZlIHRoZSBEdW1wU3Rh
dGUgY29tbWVudCBodW5rIHRvIHRoZSByZW1vdmFsIG9mIHN0YXJ0IGFuZCANCm5leHRfYmxv
Y2sgdG9tb3Jyb3cuDQo=

