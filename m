Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE0466237C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 11:51:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEpjJ-0004YX-DP; Mon, 09 Jan 2023 05:50:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pEpig-0004Qw-OV; Mon, 09 Jan 2023 05:49:41 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pEpie-0001oZ-Kk; Mon, 09 Jan 2023 05:49:34 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3098eDcO015648; Mon, 9 Jan 2023 10:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KCUMgB43Tt7+VuHzmp6SsLNavkAA2gvmZPVVBWmrDlw=;
 b=SzybosKMk3WDDuyQDXxWHj2uHbTKyxGLXWBvHl5QoJ6lexcowxcNJC/urGCbuJYfDwSl
 EsgIcsg+9Jmik3eutTp0pI29xfvwCmmqptvxHr/X5Ae4M5FM6siNbPgiI8rirLycKgFP
 zEqKQqbYsVD2fwYsWUGr9/gOWd53As8Ck0mcvM0zjpOJAUoO50FE/5uZPG37ygKQHiK1
 ktG++6BDlbmoMP2xzgUfzN7nd1GMJYOT5UCncUOvzjQ+WnDA80wfjfbqLgEszTYDgk5a
 hxXuYohold5scoq7hDYgs9qLz3yQ+fffIeRkSiggQ4FeK+xneRG+27+F/ujbps5HN7CQ Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjp1tamu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 10:49:23 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309AdYCw002360;
 Mon, 9 Jan 2023 10:49:22 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjp1tamd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 10:49:22 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3098vsA4000654;
 Mon, 9 Jan 2023 10:49:20 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3my0c6jstj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 10:49:20 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 309AnGxd46858576
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Jan 2023 10:49:16 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2A442004B;
 Mon,  9 Jan 2023 10:49:16 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F47420040;
 Mon,  9 Jan 2023 10:49:16 +0000 (GMT)
Received: from [9.171.16.4] (unknown [9.171.16.4])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Jan 2023 10:49:16 +0000 (GMT)
Message-ID: <1412c190-61fa-b0bb-b327-709838545a77@linux.ibm.com>
Date: Mon, 9 Jan 2023 11:49:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 2/4] s390x/pv: Check for support on the host
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
 <20230106075330.3662549-3-clg@kaod.org>
 <2b69a682-692b-7151-caec-132182fa2e08@linux.ibm.com>
 <6f591414-a65e-345b-f194-840e2a160b2b@kaod.org>
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <6f591414-a65e-345b-f194-840e2a160b2b@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: msNN0Ix_aiI1xPiRFCNdBJMRmJsuJnri
X-Proofpoint-GUID: qLaT6wvTAkJ7Mb4NuBsb2spDKsgNyX2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_03,2023-01-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090075
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

T24gMS85LzIzIDEwOjQ0LCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToNCj4gT24gMS85LzIz
IDA5OjQ1LCBKYW5vc2NoIEZyYW5rIHdyb3RlOg0KPj4gT24gMS82LzIzIDA4OjUzLCBDw6lk
cmljIExlIEdvYXRlciB3cm90ZToNCj4+PiBGcm9tOiBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QHJlZGhhdC5jb20+DQo+Pj4NCj4+PiBTdXBwb3J0IGZvciBwcm90ZWN0ZWQgVk1zIHNob3Vs
ZCBoYXZlIGJlZW4gZW5hYmxlZCBvbiB0aGUgaG9zdCB3aXRoDQo+Pj4gdGhlIGtlcm5lbCBw
YXJhbWV0ZXIgJ3Byb3RfdmlydD0xJy4gSWYgdGhlIGhhcmR3YXJlIHN1cHBvcnRzIHRoZQ0K
Pj4+IGZlYXR1cmUsIGl0IGlzIHJlZmxlY3RlZCB1bmRlciBzeXNmcy4NCj4+Pg0KPj4+IFJl
dmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4NCj4+PiBTaWduZWQt
b2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQHJlZGhhdC5jb20+DQo+Pg0KPj4gQW55
IHJlYXNvbiB3aHkgeW91IGRpZG4ndCB1c2UgS1ZNX0NBUF9TMzkwX1BST1RFQ1RFRD8NCj4g
DQo+IEkgdGhpbmsgbXkgc2V0dXAgd2FzIGluY29ycmVjdCB3aGVuIEkgZGlkIHRoZSBwYXRj
aC4gSSBqdXN0IHZlcmlmaWVkIGFuZCBRRU1VDQo+IGluZGVlZCByZXBvcnRzIDoNCj4gDQo+
ICAgIHFlbXUtc3lzdGVtLXMzOTB4OiBDUFUgbW9kZWwgZG9lcyBub3Qgc3VwcG9ydCBQcm90
ZWN0ZWQgVmlydHVhbGl6YXRpb24NCj4gDQo+IHdoaWNoIG1lYW5zIFMzOTBfRkVBVF9VTlBB
Q0sgd2FzIG5vdCBzZXQuDQo+IA0KPiANCj4+IFRoZSBzeXNmcyBpbnRlcmZhY2UgaXNuJ3Qg
bWVhbnQgdG8gYmUgcGFyc2VkIGJ5IHByb2dyYW1zLCBpdCdzIGJlZW4gaW50cm9kdWNlZCBm
b3IgaHVtYW5zLiBNb3N0IG9mIHRoZSBpbnRlcmZhY2UncyBkYXRhIGhhcyB0aGVyZWZvcmUg
YmVlbiBtYWRlIGF2YWlsYWJsZSB2aWEgdGhlIFVWIGluZm8gQVBJLg0KPiANCj4gV2VsbCwg
UUVNVSBpcyB1c2VyIHNwYWNlIGFuZCBkb2VzIHBlZWsgYXJvdW5kIGluIHN5c2ZzIHRvIGNv
bGxlY3Qgc29tZSBpbmZvLg0KPiBVbm5lZWRlZCBpbiB0aGF0IGNhc2UuDQoNCkkgbWVhbnQg
dGhlIFVWL1BWIHN5c2ZzIGZpbGVzLCBub3Qgc3lzZnMgaW4gZ2VuZXJhbCA6KQ0KDQoNCg==


