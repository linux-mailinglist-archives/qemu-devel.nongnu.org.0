Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C808833C083
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:51:25 +0100 (CET)
Received: from localhost ([::1]:41942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpV6-0004mk-RP
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lLpON-0000Jj-48; Mon, 15 Mar 2021 11:44:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lLpOL-0007oR-C2; Mon, 15 Mar 2021 11:44:26 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FFYp6Y065939; Mon, 15 Mar 2021 11:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : cc : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mRt1KiUPB9vJ+9Y+Y4xRkkDx7Pho+sb0oXZ1lMPdC78=;
 b=H7qsQY90EPd+JTV9l9g5ewool1UJn+PR1/Z7e7wCfgf1LlnpW5Kd1wzdToKEwjZY3jtN
 riFC5r9UI8lHdC5dtD+tW+/f9sruXkmDgsGCN6xLD4sB8WvU1CHYWfADQ1/l8XPdCm6H
 9e4ioUogTVSxuHq5TSkfvdomdYAgRWCNLWjVT/ej9R5xj8MpwsMU60FkbWa+WK/v4uxJ
 1AFsCVErjC956B8D0E9vtpAaL7HBla76jQSQYW1wRoJ7G/KTwCZuRm5J3MC8LgbNtbOh
 1oefjnH9ToYRe5XNoDIgaxBuuPgTQTjO79VUTnT4PaUfAPkLnmMP35KJ/GzRp7DNk3qq 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37aa1ss727-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 11:44:23 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12FFZdWW071209;
 Mon, 15 Mar 2021 11:44:23 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37aa1ss71f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 11:44:23 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FFhCb0018788;
 Mon, 15 Mar 2021 15:44:21 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 378n1811pw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 15:44:21 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12FFi2pJ34472292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 15:44:03 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CB6742041;
 Mon, 15 Mar 2021 15:44:19 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2AA44203F;
 Mon, 15 Mar 2021 15:44:18 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.7.179])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 15:44:18 +0000 (GMT)
Subject: Re: compile warning in i8259.c
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: qemu-devel@nongnu.org, qemu-s390x <qemu-s390x@nongnu.org>
References: <cc283705-a0ee-5ee4-4f9a-b69afce65d8c@de.ibm.com>
Message-ID: <21da022d-7349-ceca-ca88-b7987ac2eb0d@de.ibm.com>
Date: Mon, 15 Mar 2021 16:44:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <cc283705-a0ee-5ee4-4f9a-b69afce65d8c@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_08:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150110
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMTUuMDMuMjEgMTY6MTQsIENocmlzdGlhbiBCb3JudHJhZWdlciB3cm90ZToNCj4gRm9y
IHNvbWUgdGltZSBub3cgSSBkbyBzZWUgdGhlIGZvbGxvd2luZywgd2hlbiBJIGNvbXBpbGUg
eDg2LXNvZnRtbXUgb24gczM5MDoNCj4gDQo+IEZBSUxFRDogbGliY29tbW9uLmZhLnAvaHdf
aW50Y19pODI1OS5jLm8NCj4gY2MgLUlsaWJjb21tb24uZmEucCAtSS4gLUkuLiAtSXFhcGkg
LUl0cmFjZSAtSXVpIC1JdWkvc2hhZGVyIC1JL3Vzci9pbmNsdWRlL2NhcHN0b25lIC1JL3Vz
ci9pbmNsdWRlL2dsaWItMi4wIC1JL3Vzci9saWI2NC9nbGliLTIuMC9pbmNsdWRlIC1JL3Vz
ci9pbmNsdWRlL2xpYm1vdW50IC1JL3Vzci9pbmNsdWRlL2Jsa2lkIC1JL3Vzci9pbmNsdWRl
L2dpby11bml4LTIuMCAtSS91c3IvaW5jbHVkZS9saWJ1c2ItMS4wIC1JL3Vzci9pbmNsdWRl
L3Z0ZS0yLjkxIC1JL3Vzci9pbmNsdWRlL3BhbmdvLTEuMCAtSS91c3IvaW5jbHVkZS9oYXJm
YnV6eiAtSS91c3IvaW5jbHVkZS9mcmVldHlwZTIgLUkvdXNyL2luY2x1ZGUvbGlicG5nMTYg
LUkvdXNyL2luY2x1ZGUvZnJpYmlkaSAtSS91c3IvaW5jbHVkZS9saWJ4bWwyIC1JL3Vzci9p
bmNsdWRlL2NhaXJvIC1JL3Vzci9pbmNsdWRlL3BpeG1hbi0xIC1JL3Vzci9pbmNsdWRlL2d0
ay0zLjAgLUkvdXNyL2luY2x1ZGUvZ2RrLXBpeGJ1Zi0yLjAgLUkvdXNyL2luY2x1ZGUvYXRr
LTEuMCAtSS91c3IvaW5jbHVkZS9hdC1zcGkyLWF0ay8yLjAgLUkvdXNyL2luY2x1ZGUvZGJ1
cy0xLjAgLUkvdXNyL2xpYjY0L2RidXMtMS4wL2luY2x1ZGUgLUkvdXNyL2luY2x1ZGUvYXQt
c3BpLTIuMCAtSS91c3IvaW5jbHVkZS92aXJnbCAtSS91c3IvaW5jbHVkZS9wMTEta2l0LTEg
LUkvdXNyL2luY2x1ZGUvU0RMMiAtSS91c3IvaW5jbHVkZS9jYWNhcmQgLUkvdXNyL2luY2x1
ZGUvbnNzMyAtSS91c3IvaW5jbHVkZS9uc3ByNCAtSS91c3IvaW5jbHVkZS9zbGlycCAtZmRp
YWdub3N0aWNzLWNvbG9yPWF1dG8gLXBpcGUgLVdhbGwgLVdpbnZhbGlkLXBjaCAtV2Vycm9y
IC1zdGQ9Z251OTkgLU8yIC1nIC1pc3lzdGVtIC9ob21lL2Nib3JudHJhL1JFUE9TL3FlbXUv
bGludXgtaGVhZGVycyAtaXN5c3RlbSBsaW51eC1oZWFkZXJzIC1pcXVvdGUgLiAtaXF1b3Rl
IC9ob21lL2Nib3JudHJhL1JFUE9TL3FlbXUgLWlxdW90ZSANCj4gL2hvbWUvY2Jvcm50cmEv
UkVQT1MvcWVtdS9pbmNsdWRlIC1pcXVvdGUgL2hvbWUvY2Jvcm50cmEvUkVQT1MvcWVtdS9k
aXNhcy9saWJ2aXhsIC1pcXVvdGUgL2hvbWUvY2Jvcm50cmEvUkVQT1MvcWVtdS90Y2cvczM5
MCAtaXF1b3RlIC9ob21lL2Nib3JudHJhL1JFUE9TL3FlbXUvYWNjZWwvdGNnIC1wdGhyZWFk
IC1VX0ZPUlRJRllfU09VUkNFIC1EX0ZPUlRJRllfU09VUkNFPTIgLW02NCAtRF9HTlVfU09V
UkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLURfTEFSR0VGSUxFX1NPVVJDRSAtV3N0cmlj
dC1wcm90b3R5cGVzIC1XcmVkdW5kYW50LWRlY2xzIC1XdW5kZWYgLVd3cml0ZS1zdHJpbmdz
IC1XbWlzc2luZy1wcm90b3R5cGVzIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1mbm8tY29tbW9u
IC1md3JhcHYgLVdvbGQtc3R5bGUtZGVjbGFyYXRpb24gLVdvbGQtc3R5bGUtZGVmaW5pdGlv
biAtV3R5cGUtbGltaXRzIC1XZm9ybWF0LXNlY3VyaXR5IC1XZm9ybWF0LXkyayAtV2luaXQt
c2VsZiAtV2lnbm9yZWQtcXVhbGlmaWVycyAtV2VtcHR5LWJvZHkgLVduZXN0ZWQtZXh0ZXJu
cyAtV2VuZGlmLWxhYmVscyAtV2V4cGFuc2lvbi10by1kZWZpbmVkIC1XaW1wbGljaXQtZmFs
bHRocm91Z2g9MiAtV25vLW1pc3NpbmctaW5jbHVkZS1kaXJzIC1Xbm8tc2hpZnQtbmVnYXRp
dmUtdmFsdWUgLVduby1wc2FiaSAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgLWZQSUMgLURT
VFJVQ1RfSU9WRUNfREVGSU5FRCAtRF9SRUVOVFJBTlQgLVduby11bmRlZiAtRF9ERUZBVUxU
X1NPVVJDRSAtRF9YT1BFTl9TT1VSQ0U9NjAwIC1ETkNVUlNFU19XSURFQ0hBUiAtTUQgLU1R
IGxpYmNvbW1vbi5mYS5wL2h3X2ludGNfaTgyNTkuYy5vIC1NRiBsaWJjb21tb24uZmEucC9o
d19pbnRjX2k4MjU5LmMuby5kIC1vIGxpYmNvbW1vbi5mYS5wL2h3X2ludGNfaTgyNTkuYy5v
IC1jIC4uL2h3L2ludGMvaTgyNTkuYw0KPiAuLi9ody9pbnRjL2k4MjU5LmM6IEluIGZ1bmN0
aW9uIOKAmHBpY19yZWFkX2lyceKAmToNCj4gLi4vaHcvaW50Yy9pODI1OS5jOjIwMzoxMzog
ZXJyb3I6IOKAmGlycTLigJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1
bmN0aW9uIFstV2Vycm9yPW1heWJlLXVuaW5pdGlhbGl6ZWRdDQo+ICDCoCAyMDMgfMKgwqDC
oMKgwqDCoMKgwqAgaXJxID0gaXJxMiArIDg7DQo+ICDCoMKgwqDCoMKgIHzCoMKgwqDCoMKg
wqDCoMKgIH5+fn5efn5+fn5+fn5+DQo+IGNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0
ZWQgYXMgZXJyb3JzDQo+IA0KPiANCj4gRHVlIHRvIG90aGVyIGNvbXBpbGUgd2FybmluZ3Mg
SSBmaW5kIHRoaXMgaGFyZCB0byBiaXNlY3QuIEhhcyBhbnlvbmUgc2VlbiB0aGlzIGFzIHdl
bGw/DQoNCmNjIE1pY2hhZWwsIFBhb2xvLA0KDQpTb21ldGhpbmcgbGlrZQ0KDQpkaWZmIC0t
Z2l0IGEvaHcvaW50Yy9pODI1OS5jIGIvaHcvaW50Yy9pODI1OS5jDQppbmRleCAzNDRmZDA0
ZGIxNGQuLjczMzViN2EwNmE2NyAxMDA2NDQNCi0tLSBhL2h3L2ludGMvaTgyNTkuYw0KKysr
IGIvaHcvaW50Yy9pODI1OS5jDQpAQCAtMTc2LDcgKzE3Niw3IEBAIHN0YXRpYyB2b2lkIHBp
Y19pbnRhY2soUElDQ29tbW9uU3RhdGUgKnMsIGludCBpcnEpDQogIGludCBwaWNfcmVhZF9p
cnEoRGV2aWNlU3RhdGUgKmQpDQogIHsNCiAgICAgIFBJQ0NvbW1vblN0YXRlICpzID0gUElD
X0NPTU1PTihkKTsNCi0gICAgaW50IGlycSwgaXJxMiwgaW50bm87DQorICAgIGludCBpcnEs
IGlycTIgPSAwLCBpbnRubzsNCiAgDQogICAgICBpcnEgPSBwaWNfZ2V0X2lycShzKTsNCiAg
ICAgIGlmIChpcnEgPj0gMCkgew0KDQoNCndvdWxkIGRvIHRoZSB0cmljay4gTGV0IG1lIGtu
b3cgaWYgSSBzaG91bGQgZG8gYSBwcm9wZXIgcGF0Y2ggb3IgaWYgeW91IHdhbnQgdG8gaGF2
ZSB0aGluZ3Mgc29sdmVkIGRpZmZlcmVudGx5Lg0K

