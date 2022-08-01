Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4895866D4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 11:28:00 +0200 (CEST)
Received: from localhost ([::1]:43722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIRiQ-0003tA-Qv
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 05:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oIRgo-0002Sj-AO; Mon, 01 Aug 2022 05:26:18 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27158
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oIRgm-0002ST-AJ; Mon, 01 Aug 2022 05:26:18 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2718NuSo022768;
 Mon, 1 Aug 2022 09:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TVwXfYYrIobYi75BDn9BP8aPODQfC48DAdE9/CL6z04=;
 b=pM1xDXvD59xBLQx2gDosJys9fNF1QZ2xDyTelHEtPLwG3sYOszX8QvTAHsMeZcHdAgkb
 /4DbuFsRyiramJY6O/IMps83h8ImQFojG1sgwMjwtS2JFD0Xr8647lszIAFAzOSx+tGP
 OertxvMsgFf5CAe3b0Q2+CpcaPouSmywXPdJShpQiibt8O3Wgms4irJ+PqlZYEw5cQic
 NqF1Za/YTs2V9SQNQWpyzRe/I8Du0akS0UjlIN3eshmpMOAJFUDw/Uk/a62d9iNxdCSb
 BJlWH1u0c57Kf1NXEwUYgoC8N3cXT5ty5tPT7sdyjbLpO4nFl51K6Xjd5GNf2hoFxMnG 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hp9g3w6qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Aug 2022 09:26:14 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2718PJno000356;
 Mon, 1 Aug 2022 09:26:14 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hp9g3w6q0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Aug 2022 09:26:14 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2719KWtV004438;
 Mon, 1 Aug 2022 09:26:12 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3hmv98sfwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Aug 2022 09:26:12 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2719Q9EN19136958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Aug 2022 09:26:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FE2A42056;
 Mon,  1 Aug 2022 09:26:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9043D42052;
 Mon,  1 Aug 2022 09:26:08 +0000 (GMT)
Received: from [9.145.41.76] (unknown [9.145.41.76])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  1 Aug 2022 09:26:08 +0000 (GMT)
Message-ID: <d8dbb35b-c460-4248-1435-eb37a705826f@linux.ibm.com>
Date: Mon, 1 Aug 2022 11:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 11/17] dump/dump: Add section string table support
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo"
 <pbonzini@redhat.com>, mhartmay@linux.ibm.com,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 imbrenda@linux.ibm.com, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 seiden@linux.ibm.com, scgl@linux.ibm.com
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-12-frankja@linux.ibm.com>
 <CAMxuvawu-q-Fe4ZXU2Bc1gwLfpQCCw3HxWhbBK6+8exkM1b+nw@mail.gmail.com>
 <e24cff5c-3171-69dc-3e17-d4f773be6f2b@linux.ibm.com>
 <CAJ+F1CL8qm4qiHbKyE2YCAZ1ZVMKF-UAR6f39zMgw2Xdq7zCgQ@mail.gmail.com>
 <7fe6312d-d523-2f3d-56de-ed73e267a851@linux.ibm.com>
 <CAJ+F1C+CqaeKzxPsCFfvbAo+gvG_PF+B7Ex0WJgBymJQWU8eNQ@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <CAJ+F1C+CqaeKzxPsCFfvbAo+gvG_PF+B7Ex0WJgBymJQWU8eNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9YRugFW22wkCOCuty4Rsjn0xqpFva1a3
X-Proofpoint-ORIG-GUID: mxj802mb5qYT3h4ItsHnxl96mIjyb5iG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_05,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208010043
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
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

T24gNy8yOC8yMiAxNTo0MSwgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOg0KPiBIaQ0KPiAN
Cj4gT24gVHVlLCBKdWwgMjYsIDIwMjIgYXQgNjoyNiBQTSBKYW5vc2NoIEZyYW5rIDxmcmFu
a2phQGxpbnV4LmlibS5jb20+IHdyb3RlOg0KPiANCj4+IE9uIDcvMjYvMjIgMTU6MTIsIE1h
cmMtQW5kcsOpIEx1cmVhdSB3cm90ZToNCj4+PiBPbiBUdWUsIEp1bCAyNiwgMjAyMiBhdCA0
OjU1IFBNIEphbm9zY2ggRnJhbmsgPGZyYW5ramFAbGludXguaWJtLmNvbT4NCj4+IHdyb3Rl
Og0KPj4+DQo+Pj4+IE9uIDcvMjYvMjIgMTM6MjUsIE1hcmMtQW5kcsOpIEx1cmVhdSB3cm90
ZToNCj4+Pj4+IEhpDQo+Pj4+Pg0KPj4+Pj4gT24gVHVlLCBKdWwgMjYsIDIwMjIgYXQgMToy
MyBQTSBKYW5vc2NoIEZyYW5rIDxmcmFua2phQGxpbnV4LmlibS5jb20+DQo+Pj4+IHdyb3Rl
Og0KPj4+Pj4+DQo+Pj4+Pj4gQXMgc2VjdGlvbnMgZG9uJ3QgaGF2ZSBhIHR5cGUgbGlrZSB0
aGUgbm90ZXMgZG8gd2UgbmVlZCBhbm90aGVyIHdheSB0bw0KPj4+Pj4+IGRldGVybWluZSB0
aGVpciBjb250ZW50cy4gVGhlIHN0cmluZyB0YWJsZSBhbGxvd3MgdXMgdG8gYXNzaWduIGVh
Y2gNCj4+Pj4+PiBzZWN0aW9uIGFuIGlkZW50aWZpY2F0aW9uIHN0cmluZyB3aGljaCBhcmNo
aXRlY3R1cmVzIGNhbiB0aGVuIHVzZSB0bw0KPj4+Pj4+IHRhZyB0aGVpciBzZWN0aW9ucyB3
aXRoLg0KPj4+Pj4+DQo+Pj4+Pj4gVGhlcmUgd2lsbCBiZSBubyBzdHJpbmcgdGFibGUgaWYg
dGhlIGFyY2hpdGVjdHVyZSBkb2Vzbid0IGFkZCBjdXN0b20NCj4+Pj4+PiBzZWN0aW9ucyB3
aGljaCBhcmUgaW50cm9kdWNlZCBpbiBhIGZvbGxvd2luZyBwYXRjaC4NCj4+Pj4+Pg0KPj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IEphbm9zY2ggRnJhbmsgPGZyYW5ramFAbGludXguaWJtLmNv
bT4NCj4+IFsuLi5dDQo+Pj4+IFsuLl0NCj4+Pj4+PiAgICAgICAgIHMtPmxlbmd0aCA9IGxl
bmd0aDsNCj4+Pj4+PiArICAgIC8qIEZpcnN0IGluZGV4IGlzIDAsIGl0J3MgdGhlIHNwZWNp
YWwgbnVsbCBuYW1lICovDQo+Pj4+Pj4gKyAgICBzLT5zdHJpbmdfdGFibGVfYnVmID0gZ19h
cnJheV9uZXcoRkFMU0UsIFRSVUUsIDEpOw0KPj4+Pj4+ICsgICAgLyoNCj4+Pj4+PiArICAg
ICAqIEFsbG9jYXRlIHRoZSBudWxsIG5hbWUsIGR1ZSB0byB0aGUgY2xlYXJpbmcgb3B0aW9u
IHNldCB0byB0cnVlDQo+Pj4+Pj4gKyAgICAgKiBpdCB3aWxsIGJlIDAuDQo+Pj4+Pj4gKyAg
ICAgKi8NCj4+Pj4+PiArICAgIGdfYXJyYXlfc2V0X3NpemUocy0+c3RyaW5nX3RhYmxlX2J1
ZiwgMSk7DQo+Pj4+Pg0KPj4+Pj4gSSB3b25kZXIgaWYgR0J5dGVBcnJheSB3b3VsZG4ndCBi
ZSBtb3JlIGFwcHJvcHJpYXRlLCBldmVuIGlmIGl0DQo+Pj4+PiBkb2Vzbid0IGhhdmUgdGhl
IGNsZWFyaW5nIG9wdGlvbi4gSWYgaXQncyBqdXN0IGZvciBvbmUgYnl0ZSwgLi4uDQo+Pj4+
DQo+Pj4+IEkgZG9uJ3QgcmVhbGx5IGNhcmUgYnV0IEkgbmVlZCBhIGRlY2lzaW9uIG9uIGl0
IHRvIGNoYW5nZSBpdCA6KQ0KPj4+Pg0KPj4+DQo+Pj4gSSBoYXZlbid0IHRyaWVkLCBidXQg
SSB0aGluayBpdCB3b3VsZCBiZSBhIGJldHRlciBmaXQuDQo+Pg0KPj4gTG9va2luZyBhdCB0
aGlzIGEgc2Vjb25kIHRpbWUgdGhlcmUncyBhbiBpc3N1ZSB5b3Ugc2hvdWxkIGNvbnNpZGVy
Og0KPj4NCj4+IEdCeXRlQXJyYXkgdXNlcyBndWludDggd2hpbGUgdGhlIEdBcnJheSB1c2Vz
IGdjaGFycyB3aGljaCBhcmUgYXBwYXJlbnRseQ0KPj4gY29tcGF0aWJsZSB3aXRoIG5vcm1h
bCBDIGNoYXJzLg0KPj4NCj4+IEkuZS4gSSBuZWVkIHRvIGNhc3QgYWxsIHN0cmluZ3MgdG8g
KGNvbnN0IGd1aW50OCAqKSB3aGVuIGFwcGVuZGluZyB0aGVtDQo+PiB0byB0aGUgR0J5dGVB
cnJheS4NCj4+DQo+IA0KPiBBZ2gsIGJvcmluZy4uIHdlbGwsIHdlIGFsc28gaGF2ZSBpbmNs
dWRlL3FlbXUvYnVmZmVyLmggdGhhdCBjb3VsZCBiZQ0KPiBjb25zaWRlcmVkIHBlcmhhcHMN
Cj4gDQoNCldoeSBzaG91bGQgSSBjaGFuZ2UgaXQgdG8gc29tZXRoaW5nIHRoYXQncyBoYXJk
bHkgYmVpbmcgdXNlZCwgaS5lLiANCndoYXQncyB0aGUgcHJvYmxlbSBoZXJlPw0K

