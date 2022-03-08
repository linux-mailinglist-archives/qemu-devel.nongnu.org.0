Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DFB4D1903
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 14:18:45 +0100 (CET)
Received: from localhost ([::1]:36954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRZjf-0002Sq-Rx
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 08:18:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nRZhO-0001iv-Mk
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 08:16:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63506
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nRZhM-0007HR-Mk
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 08:16:22 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 228BHbuY007667
 for <qemu-devel@nongnu.org>; Tue, 8 Mar 2022 13:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fFO1f58aZivR2AWrrKzOtEmiMTjWKkMRMrEE7vja4x8=;
 b=fUnoUt5svRzjBEXR8c36IE5MQx7sBRleVi8kejtHfafLpn5+IvDZzO9s55V8PS5+kdl6
 RDBuYxVcqsplwPMW2tqKlBt5jZjEf8Sl7Gt/edTbSBWmO2DPNPb4KwwLar4JbBDckGqx
 i6FaPGsJQVBfkmxwUhCUhOptxH1fsyp0SyB3UhMwSM96SJG4K4RdQ9uBoo2gFMW/FUPC
 37/7GFv7RXAd0YtDbiU0xwsoUz6r9gNM6noZO5MSyHozpmw35PnTxb8uBt7i3hJmA2yQ
 mMyT3I6Cup8Tecdh6YcuHx2OUSYRfXOyVX0epleimTxDOxHFMNQci37qPWXitMbTxpok kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ep0hfh2ya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 13:16:17 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 228CwgF7024704
 for <qemu-devel@nongnu.org>; Tue, 8 Mar 2022 13:16:17 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ep0hfh2xu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 13:16:17 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 228D860O030305;
 Tue, 8 Mar 2022 13:16:15 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3ekyg8yha4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 13:16:15 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 228DGDJh58196462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Mar 2022 13:16:13 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26BF65207A;
 Tue,  8 Mar 2022 13:16:13 +0000 (GMT)
Received: from [9.145.148.98] (unknown [9.145.148.98])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id EB4EF52079;
 Tue,  8 Mar 2022 13:16:12 +0000 (GMT)
Message-ID: <4ad130c6-2605-797a-ce91-b433323a35cc@linux.ibm.com>
Date: Tue, 8 Mar 2022 14:16:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20220301142213.28568-1-frankja@linux.ibm.com>
 <20220301142213.28568-2-frankja@linux.ibm.com>
 <CAJ+F1CJVe71E+Wr4T7EB8h1t3kyZ8zVh2HDw2G=oL-Pi2a-xyA@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH 1/7] dump: Introduce shdr_num to decrease complexity
In-Reply-To: <CAJ+F1CJVe71E+Wr4T7EB8h1t3kyZ8zVh2HDw2G=oL-Pi2a-xyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n1zedIIY9jOZy_b9pvRcGeTWsYS5oNM8
X-Proofpoint-ORIG-GUID: BOhpL1W-8-eCgDJOhg9NGPILxxSSquWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-08_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203080069
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMy8xLzIyIDE1OjQyLCBNYXJjLUFuZHLDqSBMdXJlYXUgd3JvdGU6DQo+IEhpDQo+IA0K
PiBPbiBUdWUsIE1hciAxLCAyMDIyIGF0IDY6MzMgUE0gSmFub3NjaCBGcmFuayA8ZnJhbmtq
YUBsaW51eC5pYm0uY29tPiB3cm90ZToNCj4gDQo+PiBMZXQncyBtb3ZlIGZyb20gYSBib29s
ZWFuIHRvIGEgaW50IHZhcmlhYmxlIHdoaWNoIHdpbGwgbGF0ZXIgZW5hYmxlIHVzDQo+PiB0
byBzdG9yZSB0aGUgbnVtYmVyIG9mIHNlY3Rpb25zIHRoYXQgYXJlIGluIHRoZSBkdW1wIGZp
bGUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmFub3NjaCBGcmFuayA8ZnJhbmtqYUBsaW51
eC5pYm0uY29tPg0KPj4gLS0tDQo+PiAgIGR1bXAvZHVtcC5jICAgICAgICAgICB8IDQzICsr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+ICAgaW5jbHVk
ZS9zeXNlbXUvZHVtcC5oIHwgIDIgKy0NCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNl
cnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHVtcC9k
dW1wLmMgYi9kdW1wL2R1bXAuYw0KPj4gaW5kZXggYTg0ZDhiMTU5OC4uNjY5NmQ5ODE5YSAx
MDA2NDQNCj4+IC0tLSBhL2R1bXAvZHVtcC5jDQo+PiArKysgYi9kdW1wL2R1bXAuYw0KPj4g
QEAgLTEzOSwxMiArMTM5LDEyIEBAIHN0YXRpYyB2b2lkIHdyaXRlX2VsZjY0X2hlYWRlcihE
dW1wU3RhdGUgKnMsIEVycm9yDQo+PiAqKmVycnApDQo+PiAgICAgICBlbGZfaGVhZGVyLmVf
cGhvZmYgPSBjcHVfdG9fZHVtcDY0KHMsIHNpemVvZihFbGY2NF9FaGRyKSk7DQo+PiAgICAg
ICBlbGZfaGVhZGVyLmVfcGhlbnRzaXplID0gY3B1X3RvX2R1bXAxNihzLCBzaXplb2YoRWxm
NjRfUGhkcikpOw0KPj4gICAgICAgZWxmX2hlYWRlci5lX3BobnVtID0gY3B1X3RvX2R1bXAx
NihzLCBzLT5waGRyX251bSk7DQo+PiAtICAgIGlmIChzLT5oYXZlX3NlY3Rpb24pIHsNCj4+
ICsgICAgaWYgKHMtPnNoZHJfbnVtKSB7DQo+PiAgICAgICAgICAgdWludDY0X3Qgc2hvZmYg
PSBzaXplb2YoRWxmNjRfRWhkcikgKyBzaXplb2YoRWxmNjRfUGhkcikgKg0KPj4gcy0+c2hf
aW5mbzsNCj4+DQo+PiAgICAgICAgICAgZWxmX2hlYWRlci5lX3Nob2ZmID0gY3B1X3RvX2R1
bXA2NChzLCBzaG9mZik7DQo+PiAgICAgICAgICAgZWxmX2hlYWRlci5lX3NoZW50c2l6ZSA9
IGNwdV90b19kdW1wMTYocywgc2l6ZW9mKEVsZjY0X1NoZHIpKTsNCj4+IC0gICAgICAgIGVs
Zl9oZWFkZXIuZV9zaG51bSA9IGNwdV90b19kdW1wMTYocywgMSk7DQo+PiArICAgICAgICBl
bGZfaGVhZGVyLmVfc2hudW0gPSBjcHVfdG9fZHVtcDE2KHMsIHMtPnNoZHJfbnVtKTsNCj4+
ICAgICAgIH0NCj4+DQo+PiAgICAgICByZXQgPSBmZF93cml0ZV92bWNvcmUoJmVsZl9oZWFk
ZXIsIHNpemVvZihlbGZfaGVhZGVyKSwgcyk7DQo+PiBAQCAtMTcwLDEyICsxNzAsMTIgQEAg
c3RhdGljIHZvaWQgd3JpdGVfZWxmMzJfaGVhZGVyKER1bXBTdGF0ZSAqcywgRXJyb3INCj4+
ICoqZXJycCkNCj4+ICAgICAgIGVsZl9oZWFkZXIuZV9waG9mZiA9IGNwdV90b19kdW1wMzIo
cywgc2l6ZW9mKEVsZjMyX0VoZHIpKTsNCj4+ICAgICAgIGVsZl9oZWFkZXIuZV9waGVudHNp
emUgPSBjcHVfdG9fZHVtcDE2KHMsIHNpemVvZihFbGYzMl9QaGRyKSk7DQo+PiAgICAgICBl
bGZfaGVhZGVyLmVfcGhudW0gPSBjcHVfdG9fZHVtcDE2KHMsIHMtPnBoZHJfbnVtKTsNCj4+
IC0gICAgaWYgKHMtPmhhdmVfc2VjdGlvbikgew0KPj4gKyAgICBpZiAocy0+c2hkcl9udW0p
IHsNCj4+ICAgICAgICAgICB1aW50MzJfdCBzaG9mZiA9IHNpemVvZihFbGYzMl9FaGRyKSAr
IHNpemVvZihFbGYzMl9QaGRyKSAqDQo+PiBzLT5zaF9pbmZvOw0KPj4NCj4+ICAgICAgICAg
ICBlbGZfaGVhZGVyLmVfc2hvZmYgPSBjcHVfdG9fZHVtcDMyKHMsIHNob2ZmKTsNCj4+ICAg
ICAgICAgICBlbGZfaGVhZGVyLmVfc2hlbnRzaXplID0gY3B1X3RvX2R1bXAxNihzLCBzaXpl
b2YoRWxmMzJfU2hkcikpOw0KPj4gLSAgICAgICAgZWxmX2hlYWRlci5lX3NobnVtID0gY3B1
X3RvX2R1bXAxNihzLCAxKTsNCj4+ICsgICAgICAgIGVsZl9oZWFkZXIuZV9zaG51bSA9IGNw
dV90b19kdW1wMTYocywgcy0+c2hkcl9udW0pOw0KPj4gICAgICAgfQ0KPj4NCj4+ICAgICAg
IHJldCA9IGZkX3dyaXRlX3ZtY29yZSgmZWxmX2hlYWRlciwgc2l6ZW9mKGVsZl9oZWFkZXIp
LCBzKTsNCj4+IEBAIC00ODIsNyArNDgyLDcgQEAgc3RhdGljIHZvaWQgd3JpdGVfZWxmX2xv
YWRzKER1bXBTdGF0ZSAqcywgRXJyb3IgKiplcnJwKQ0KPj4gICAgICAgdWludDMyX3QgbWF4
X2luZGV4Ow0KPj4gICAgICAgRXJyb3IgKmxvY2FsX2VyciA9IE5VTEw7DQo+Pg0KPj4gLSAg
ICBpZiAocy0+aGF2ZV9zZWN0aW9uKSB7DQo+PiArICAgIGlmIChzLT5zaGRyX251bSkgew0K
Pj4gICAgICAgICAgIG1heF9pbmRleCA9IHMtPnNoX2luZm87DQo+PiAgICAgICB9IGVsc2Ug
ew0KPj4gICAgICAgICAgIG1heF9pbmRleCA9IHMtPnBoZHJfbnVtOw0KPj4gQEAgLTU2Nyw3
ICs1NjcsNyBAQCBzdGF0aWMgdm9pZCBkdW1wX2JlZ2luKER1bXBTdGF0ZSAqcywgRXJyb3Ig
KiplcnJwKQ0KPj4gICAgICAgICAgIH0NCj4+DQo+PiAgICAgICAgICAgLyogd3JpdGUgc2Vj
dGlvbiB0byB2bWNvcmUgKi8NCj4+IC0gICAgICAgIGlmIChzLT5oYXZlX3NlY3Rpb24pIHsN
Cj4+ICsgICAgICAgIGlmIChzLT5zaGRyX251bSkgew0KPj4gICAgICAgICAgICAgICB3cml0
ZV9lbGZfc2VjdGlvbihzLCAxLCAmbG9jYWxfZXJyKTsNCj4+ICAgICAgICAgICAgICAgaWYg
KGxvY2FsX2Vycikgew0KPj4gICAgICAgICAgICAgICAgICAgZXJyb3JfcHJvcGFnYXRlKGVy
cnAsIGxvY2FsX2Vycik7DQo+PiBAQCAtNTk3LDcgKzU5Nyw3IEBAIHN0YXRpYyB2b2lkIGR1
bXBfYmVnaW4oRHVtcFN0YXRlICpzLCBFcnJvciAqKmVycnApDQo+PiAgICAgICAgICAgfQ0K
Pj4NCj4+ICAgICAgICAgICAvKiB3cml0ZSBzZWN0aW9uIHRvIHZtY29yZSAqLw0KPj4gLSAg
ICAgICAgaWYgKHMtPmhhdmVfc2VjdGlvbikgew0KPj4gKyAgICAgICAgaWYgKHMtPnNoZHJf
bnVtKSB7DQo+PiAgICAgICAgICAgICAgIHdyaXRlX2VsZl9zZWN0aW9uKHMsIDAsICZsb2Nh
bF9lcnIpOw0KPj4gICAgICAgICAgICAgICBpZiAobG9jYWxfZXJyKSB7DQo+PiAgICAgICAg
ICAgICAgICAgICBlcnJvcl9wcm9wYWdhdGUoZXJycCwgbG9jYWxfZXJyKTsNCj4+IEBAIC0x
ODE4LDExICsxODE4LDEyIEBAIHN0YXRpYyB2b2lkIGR1bXBfaW5pdChEdW1wU3RhdGUgKnMs
IGludCBmZCwgYm9vbA0KPj4gaGFzX2Zvcm1hdCwNCj4+ICAgICAgICAqLw0KPj4gICAgICAg
cy0+cGhkcl9udW0gPSAxOyAvKiBQVF9OT1RFICovDQo+PiAgICAgICBpZiAocy0+bGlzdC5u
dW0gPCBVSU5UMTZfTUFYIC0gMikgew0KPj4gKyAgICAgICAgcy0+c2hkcl9udW0gPSAwOw0K
Pj4gICAgICAgICAgIHMtPnBoZHJfbnVtICs9IHMtPmxpc3QubnVtOw0KPj4gLSAgICAgICAg
cy0+aGF2ZV9zZWN0aW9uID0gZmFsc2U7DQo+PiAgICAgICB9IGVsc2Ugew0KPj4gLSAgICAg
ICAgcy0+aGF2ZV9zZWN0aW9uID0gdHJ1ZTsNCj4+ICsgICAgICAgIC8qIHNoX2luZm8gb2Yg
c2VjdGlvbiAwIGhvbGRzIHRoZSByZWFsIG51bWJlciBvZiBwaGRycyAqLw0KPj4NCj4gDQo+
IC4uLg0KPiANCj4gDQo+PiAgICAgICAgICAgcy0+cGhkcl9udW0gPSBQTl9YTlVNOw0KPj4g
KyAgICAgICAgcy0+c2hkcl9udW0gPSAxOw0KPj4gICAgICAgICAgIHMtPnNoX2luZm8gPSAx
OyAvKiBQVF9OT1RFICovDQo+Pg0KPj4gICAgICAgICAgIC8qIHRoZSB0eXBlIG9mIHNoZHIt
PnNoX2luZm8gaXMgdWludDMyX3QsIHNvIHdlIHNob3VsZCBhdm9pZA0KPj4gb3ZlcmZsb3cg
Ki8NCj4+IEBAIC0xODM0LDIzICsxODM1LDE1IEBAIHN0YXRpYyB2b2lkIGR1bXBfaW5pdChE
dW1wU3RhdGUgKnMsIGludCBmZCwgYm9vbA0KPj4gaGFzX2Zvcm1hdCwNCj4+ICAgICAgIH0N
Cj4+DQo+PiAgICAgICBpZiAocy0+ZHVtcF9pbmZvLmRfY2xhc3MgPT0gRUxGQ0xBU1M2NCkg
ew0KPj4gLSAgICAgICAgaWYgKHMtPmhhdmVfc2VjdGlvbikgew0KPj4gLSAgICAgICAgICAg
IHMtPm1lbW9yeV9vZmZzZXQgPSBzaXplb2YoRWxmNjRfRWhkcikgKw0KPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoRWxmNjRfUGhkcikgKiBzLT5zaF9pbmZv
ICsNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKEVsZjY0X1No
ZHIpICsgcy0+bm90ZV9zaXplOw0KPj4gLSAgICAgICAgfSBlbHNlIHsNCj4+IC0gICAgICAg
ICAgICBzLT5tZW1vcnlfb2Zmc2V0ID0gc2l6ZW9mKEVsZjY0X0VoZHIpICsNCj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKEVsZjY0X1BoZHIpICogcy0+cGhk
cl9udW0gKw0KPj4gcy0+bm90ZV9zaXplOw0KPj4gLSAgICAgICAgfQ0KPj4gKyAgICAgICAg
cy0+bWVtb3J5X29mZnNldCA9IHNpemVvZihFbGY2NF9FaGRyKSArDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc2l6ZW9mKEVsZjY0X1BoZHIpICogcy0+c2hfaW5mbyArDQo+
Pg0KPiANCj4gVGhlIGNoYW5nZSAicmVtb3ZpbmcvcmVwbGFjaW5nIHNpemVvZihFbGY2NF9Q
aGRyKSAqIHMtPnBoZHJfbnVtIGJ5ICoNCj4gcy0+c2hfaW5mbyIgc2hvdWxkIGJlIGRvbmUg
YXMgYSBwcmVsaW1pbmFyeSBzdGVwLCB3aXRoIG1vcmUgY29tbWVudHMuDQoNCkkgaGFkIGFu
b3RoZXIgbG9vayBhdCB0aGlzIGFuZCB0aGlzIHBhdGNoIHdvbid0IHdvcmsgd2l0aG91dCB0
aGUgbmV4dCANCnBhdGNoIGFueXdheS4gSSdsbCB0cnkgdG8gcmVjb21iaW5lIGFuZCBzcGxp
dCB0aGUgcGF0Y2hlcyBpbiBhIHdheSB0aGF0IA0KbWFrZXMgdGhpcyBlYXNpZXIgdG8gcmVh
ZC4NCg0KDQo+IA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKEVsZjY0
X1NoZHIpICogcy0+c2hkcl9udW0gKw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
IHMtPm5vdGVfc2l6ZTsNCj4+ICAgICAgIH0gZWxzZSB7DQo+PiAtICAgICAgICBpZiAocy0+
aGF2ZV9zZWN0aW9uKSB7DQo+PiAtICAgICAgICAgICAgcy0+bWVtb3J5X29mZnNldCA9IHNp
emVvZihFbGYzMl9FaGRyKSArDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHNpemVvZihFbGYzMl9QaGRyKSAqIHMtPnNoX2luZm8gKw0KPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzaXplb2YoRWxmMzJfU2hkcikgKyBzLT5ub3RlX3NpemU7DQo+
PiAtICAgICAgICB9IGVsc2Ugew0KPj4gLSAgICAgICAgICAgIHMtPm1lbW9yeV9vZmZzZXQg
PSBzaXplb2YoRWxmMzJfRWhkcikgKw0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzaXplb2YoRWxmMzJfUGhkcikgKiBzLT5waGRyX251bSArDQo+PiBzLT5ub3RlX3Np
emU7DQo+PiAtICAgICAgICB9DQo+PiArICAgICAgICBzLT5tZW1vcnlfb2Zmc2V0ID0gc2l6
ZW9mKEVsZjMyX0VoZHIpICsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXpl
b2YoRWxmMzJfUGhkcikgKiBzLT5zaF9pbmZvICsNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzaXplb2YoRWxmMzJfU2hkcikgKiBzLT5zaGRyX251bSArDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcy0+bm90ZV9zaXplOw0KPj4gICAgICAgfQ0KPj4NCj4+
ICAgICAgIHJldHVybjsNCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3N5c2VtdS9kdW1wLmgg
Yi9pbmNsdWRlL3N5c2VtdS9kdW1wLmgNCj4+IGluZGV4IDI1MDE0M2NiNWEuLjg1NDM0MWRh
MGQgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL3N5c2VtdS9kdW1wLmgNCj4+ICsrKyBiL2lu
Y2x1ZGUvc3lzZW11L2R1bXAuaA0KPj4gQEAgLTE1NSw4ICsxNTUsOCBAQCB0eXBlZGVmIHN0
cnVjdCBEdW1wU3RhdGUgew0KPj4gICAgICAgQXJjaER1bXBJbmZvIGR1bXBfaW5mbzsNCj4+
ICAgICAgIE1lbW9yeU1hcHBpbmdMaXN0IGxpc3Q7DQo+PiAgICAgICB1aW50MTZfdCBwaGRy
X251bTsNCj4+ICsgICAgdWludDMyX3Qgc2hkcl9udW07DQo+PiAgICAgICB1aW50MzJfdCBz
aF9pbmZvOw0KPj4gLSAgICBib29sIGhhdmVfc2VjdGlvbjsNCj4+ICAgICAgIGJvb2wgcmVz
dW1lOw0KPj4gICAgICAgYm9vbCBkZXRhY2hlZDsNCj4+ICAgICAgIHNzaXplX3Qgbm90ZV9z
aXplOw0KPj4gLS0NCj4+IDIuMzIuMA0KPj4NCj4+DQo+Pg0KPiANCg0K

