Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAAA6620EA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:06:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEo59-0004PK-1l; Mon, 09 Jan 2023 04:04:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pEo4z-0004O0-9s; Mon, 09 Jan 2023 04:04:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pEo4x-00035V-8T; Mon, 09 Jan 2023 04:04:28 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3098aj3r007840; Mon, 9 Jan 2023 09:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ve8p6Q5mS6dd2p59Xtx/2DUfTGNZsdWh/rj4TozNzbM=;
 b=DjBybHHozP0cb5T9f6/qNcKhOWZyzSEoG/MH3YIggyvcEBzG2Pe6uEsrE3GjOml8WpJE
 X752AVU1k0CGd7WFAtgaZu9bTutD2UHSVkzN288g5Wu4SQc2XCoB6XVlts4hPsCG9hCG
 JS2nCH1JzPh4bM1y4aY+adU9e3p9V5sWuSQYQYUWgKLWhN8AFRti6aRSZbAjmFa71Tr3
 o8ZPKjK4pIUASjHqbJcSZfcX28PRDbF87jaaUmZVXCb/FnEjKJRVb5mFp+EX19N4TLGB
 RHBgylMJAXpEr+PCxMZ9p0j5eg366YZOGcr9lojEGt7ABrNA354cRorpL3A0qHYUtyhg tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjta7tuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 09:04:16 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3098bGW2022612;
 Mon, 9 Jan 2023 09:04:16 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjta7tte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 09:04:16 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30993ubF000526;
 Mon, 9 Jan 2023 09:04:13 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3my0c6jnc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 09:04:13 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30994ARq24314526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Jan 2023 09:04:10 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F06D20040;
 Mon,  9 Jan 2023 09:04:10 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 887B220049;
 Mon,  9 Jan 2023 09:04:09 +0000 (GMT)
Received: from [9.171.16.4] (unknown [9.171.16.4])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Jan 2023 09:04:09 +0000 (GMT)
Message-ID: <49bf32c7-4a44-a3c9-29b5-b6580113700c@linux.ibm.com>
Date: Mon, 9 Jan 2023 10:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
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
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v2 3/4] s390x/pv: Introduce a s390_pv_check() helper for
 runtime
In-Reply-To: <20230106075330.3662549-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YBj-yzBqhsKCOGxai4UUEUiRvpF5cYq1
X-Proofpoint-GUID: 1fyX1A0uMwNOBrbDQLgJQ9Kxfy3oko4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_03,2023-01-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 mlxlogscore=798
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090063
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

T24gMS82LzIzIDA4OjUzLCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToNCj4gRnJvbTogQ8Op
ZHJpYyBMZSBHb2F0ZXIgPGNsZ0ByZWRoYXQuY29tPg0KPiANCj4gSWYgYSBzZWN1cmUga2Vy
bmVsIGlzIHN0YXJ0ZWQgaW4gYSBub24tcHJvdGVjdGVkIFZNLCB0aGUgT1Mgd2lsbCBoYW5n
DQo+IGR1cmluZyBib290IHdpdGhvdXQgZ2l2aW5nIGEgcHJvcGVyIGVycm9yIG1lc3NhZ2Ug
dG8gdGhlIHVzZXIuDQoNCk1vc3Qgb2YgdGhlIHRpbWUgeW91IHNlZSBub3RoaW5nIGluIHRo
ZSBjb25zb2xlIGJlY2F1c2UgbGlidmlydCBpcyB0b28gDQpzbG93LiBJZiB5b3Ugc3RhcnQg
dGhlIFZNIGluIHBhdXNlZCBtb2RlLCBhdHRhY2ggYSBjb25zb2xlIGFuZCB0aGVuIA0KcmVz
dW1lIGl0LCB0aGVuIHlvdSdsbCBzZWUgYSBuaWNlIGVycm9yIG1lc3NhZ2UuDQoNCj4gDQo+
IFBlcmZvcm0gdGhlIGNoZWNrcyBvbiBDb25maWRlbnRpYWwgR3Vlc3Qgc3VwcG9ydCBhdCBy
dW50aW1lIHdpdGggYW4NCj4gaGVscGVyIGNhbGxlZCBmcm9tIHRoZSBzZXJ2aWNlIGNhbGwg
c3dpdGNoaW5nIHRoZSBndWVzdCB0byBwcm90ZWN0ZWQNCj4gbW9kZS4NCg0KSWYgd2UgZG9u
J3QgaGF2ZSBQViBzdXBwb3J0IHRoZW4gdGhlIHN1YmNvZGVzID49OCBhcmUgYSBzcGVjaWZp
Y2F0aW9uIA0KZXhjZXB0aW9uIHNvIHRoaXMgaXMgbmV2ZXIgZXhlY3V0ZWQgQUZBSUsuDQoN
Cj4gICAgICAgaWYgKGVudi0+cHN3Lm1hc2sgJiBQU1dfTUFTS19QU1RBVEUpIHsNCj4gICAg
ICAgICAgIHMzOTBfcHJvZ3JhbV9pbnRlcnJ1cHQoZW52LCBQR01fUFJJVklMRUdFRCwgcmEp
Ow0KPiBAQCAtMTc2LDYgKzE3NywxMiBAQCBvdXQ6DQo+ICAgICAgICAgICAgICAgcmV0dXJu
Ow0KPiAgICAgICAgICAgfQ0KPiAgIA0KPiArICAgICAgICBpZiAoIXMzOTBfcHZfY2hlY2so
JmxvY2FsX2VycikpIHsNCj4gKyAgICAgICAgICAgIGVycm9yX3JlcG9ydF9lcnIobG9jYWxf
ZXJyKTsNCj4gKyAgICAgICAgICAgIGVudi0+cmVnc1tyMSArIDFdID0gRElBR18zMDhfUkNf
SU5WQUxfRk9SX1BWOw0KPiArICAgICAgICAgICAgcmV0dXJuOw0KPiArICAgICAgICB9DQo+
ICsNCj4gICAgICAgICAgIHMzOTBfaXBsX3Jlc2V0X3JlcXVlc3QoY3MsIFMzOTBfUkVTRVRf
UFYpOw0KPiAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgIGRlZmF1bHQ6DQoNCg==

