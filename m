Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6615166D86C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 09:42:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHhWH-0008PU-1l; Tue, 17 Jan 2023 03:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pHhWD-0008NU-7E; Tue, 17 Jan 2023 03:40:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pHhW8-0006Dn-Na; Tue, 17 Jan 2023 03:40:32 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30H7acG4032133; Tue, 17 Jan 2023 08:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hUtIWcXkaK0zhQo/zDuMeTqSNlO4JA5uzDe6ixbDzvU=;
 b=UCwfgYBpsqerizYa4nJ2eStT8wODwP1GzRw/h7IWLH3wWz1hGcYsKAlahk+qzDVbNDLt
 WzDh9RZPJh+Xbufh8T0FmzJ5wDHXXYOnrASZX8iwrwu9DP5kKSlRIcpORfKVQ8vy09Bz
 dbW5/2zOK8w6qH6hkXCz4xURILWeHRIgIFDl9JVjx5THOYep+pimu/H/YONK2PLljrl3
 7yGYsVuoxQeXxrPSGyt/5VELgBH6ak0N34GgweksMWiJTE8jwukpZct8CTdCRr3cadqg
 OEr01xwwnmwu+ReE1YmvObKDFSGsxvhBn0RIM29MjfZ/39lkQISWf7sH0SmS1Pk9QZi9 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5egnkm5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 08:40:17 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30H716C0004954;
 Tue, 17 Jan 2023 08:40:16 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5egnkm4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 08:40:16 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30H8K4dK006223;
 Tue, 17 Jan 2023 08:40:14 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3n3knfkjac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 08:40:14 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30H8eAaN46268676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Jan 2023 08:40:10 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C7242004B;
 Tue, 17 Jan 2023 08:40:10 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6E8120040;
 Tue, 17 Jan 2023 08:40:09 +0000 (GMT)
Received: from [9.171.42.166] (unknown [9.171.42.166])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 17 Jan 2023 08:40:09 +0000 (GMT)
Message-ID: <a386bb49-72de-6edc-9873-70ec59e475ab@linux.ibm.com>
Date: Tue, 17 Jan 2023 09:40:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Sebastian Mitterle
 <smitterl@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
References: <20230116174607.2459498-1-clg@kaod.org>
 <20230116174607.2459498-3-clg@kaod.org>
Content-Language: en-US
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v3 2/3] s390x/pv: Introduce a s390_pv_check() helper for
 runtime
In-Reply-To: <20230116174607.2459498-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CKPDxB-Jw4y4UnY227xdYYDrS1qv1prZ
X-Proofpoint-ORIG-GUID: lX0gYjf8IlfPMqyShJT2DdYHJmFbUK8H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_04,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301170066
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097, SPF_HELO_NONE=0.001,
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

T24gMS8xNi8yMyAxODo0NiwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6DQo+IEZyb206IEPD
qWRyaWMgTGUgR29hdGVyIDxjbGdAcmVkaGF0LmNvbT4NCj4gDQo+IElmIGEgc2VjdXJlIGtl
cm5lbCBpcyBzdGFydGVkIGluIGEgbm9uLXByb3RlY3RlZCBWTSwgdGhlIE9TIHdpbGwgaGFu
Zw0KPiBkdXJpbmcgYm9vdCB3aXRob3V0IGdpdmluZyBhIHByb3BlciBlcnJvciBtZXNzYWdl
IHRvIHRoZSB1c2VyLg0KDQpEaWRuJ3Qgd2UgZXN0YWJsaXNoIHRoYXQgeW91IHdlcmUgbWlz
c2luZyB0aGUgSU9NTVUgZmxhZyBzbyB0aGlzIA0Kc3RhdGVtZW50IGlzbid0IGNvcnJlY3Qg
YW55bW9yZT8NCg0KDQpJIGhhdmVuJ3QgeWV0IGZ1bGx5IGluZ2VzdGVkIG15IGNvZmZlZSwg
YnV0IGZyb20gd2hhdCBJIHVuZGVyc3RhbmQgeW91IA0Kd291bGQgYmxvY2sgYSBzd2l0Y2gg
aW50byBQViBtb2RlIGlmIGNncyBpcyBub3Qgc2V0LiBXaGljaCB3b3VsZCBtZWFuIA0KdGhh
dCBQViBLVk0gdW5pdCB0ZXN0cyB3b3VsZG4ndCBzdGFydCBhbnltb3JlIGFzIHdlbGwgYXMg
YW55IFZNcyB0aGF0IA0KaGF2ZSB0aGUgdW5wYWNrIGZlYXR1cmUgYnV0IG5vdCBjZ3MuDQoN
CkFuZCB0aGF0J3Mgbm90IHNvbWV0aGluZyB0aGF0IHdlIHdhbnQuDQoNCllvdSBjYW4gc3Rh
cnQgYSBQViBWTSB3aXRob3V0IGNncyBpZiB1bnBhY2sgaXMgaW4gdGhlIENQVSBtb2RlbC4g
VGhlIA0KT05MWSByZXF1aXJlbWVudCB0aGF0IHdlIHNob3VsZCBmYWlsIG9uIGlzIHVucGFj
ay4NCg0KSGF2ZSBhIGxvb2sgYXQgd2hhdCBEYXZpZCBHaWJzb24gcHV0IGluIHRoZSBjb21t
aXQgbWVzc2FnZSB3aGVuIGhlIA0KaW50cm9kdWNlZCB0aGF0IGluIDY1MTYxNWQ5Og0KDQoi
IiINClRvIGludGVncmF0ZSB0aGlzIHdpdGggdGhlIG9wdGlvbiB1c2VkIGJ5IG90aGVyIHBs
YXRmb3Jtcywgd2UNCmltcGxlbWVudCB0aGUgZm9sbG93aW5nIGNvbXByb21pc2U6DQoNCiAg
LSBXaGVuIHRoZSBjb25maWRlbnRpYWwtZ3Vlc3Qtc3VwcG9ydCBvcHRpb24gaXMgc2V0LCBz
MzkwIHdpbGwNCiAgICByZWNvZ25pemUgaXQsIHZlcmlmeSB0aGF0IHRoZSBDUFUgY2FuIHN1
cHBvcnQgUFYgKGZhaWxpbmcgaWYgbm90KQ0KICAgIGFuZCBzZXQgdmlydGlvIGRlZmF1bHQg
b3B0aW9ucyBuZWNlc3NhcnkgZm9yIGVuY3J5cHRlZCBvciBwcm90ZWN0ZWQNCiAgICBndWVz
dHMsIGFzIG9uIG90aGVyIHBsYXRmb3Jtcy4gIGkuZS4gaWYgY29uZmlkZW50aWFsLWd1ZXN0
LXN1cHBvcnQNCiAgICBpcyBzZXQsIHdlIHdpbGwgZWl0aGVyIGNyZWF0ZSBhIGd1ZXN0IGNh
cGFibGUgb2YgZW50ZXJpbmcgUFYgbW9kZSwNCiAgICBvciBmYWlsIG91dHJpZ2h0Lg0KDQog
IC0gSWYgY29uZmlkZW50aWFsLWd1ZXN0LXN1cHBvcnQgaXMgbm90IHNldCwgZ3Vlc3RzIG1p
Z2h0IHN0aWxsIGJlDQogICAgYWJsZSB0byBlbnRlciBQViBtb2RlLCBpZiB0aGUgQ1BVIGhh
cyB0aGUgcmlnaHQgbW9kZWwuICBUaGlzIG1heSBiZQ0KICAgIGEgbGl0dGxlIHN1cnByaXNp
bmcsIGJ1dCBzaG91bGRuJ3QgYWN0dWFsbHkgYmUgaGFybWZ1bC4NCiIiIg0KDQo=

