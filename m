Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ECA3F1BF7
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:53:24 +0200 (CEST)
Received: from localhost ([::1]:44184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGjQ4-0005cI-13
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mGjOD-0003Sj-A1
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:51:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33860
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mGjOA-0007w8-Eu
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:51:28 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17JEoGVL122815; Thu, 19 Aug 2021 10:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6qbst79VvWn0gJ2JswanGpjtbmhotvQ7EVqts8nitbE=;
 b=rGs+A+ZdD0vLp7dlVRDwGnh9PypKR3eA5uDRwb7AKZ9lEPbRZK2edSAPh+PmHuYu4/35
 bU8Lyn1EgQeVOS1XVRR6TL2jIzFfzNXGt4kg33XnNYm7bqzbkJYWMahEf5t+v01iyMkt
 bd1u5fR0CPQcy7eO1D/iAjycuD2GmqN6l1G54LnJCqIiNuwOqiWu5hY5RMYaPO2Kvi7z
 nYuMMf+D5VoxHKBUBfGX1XwXevC6v8m+BShaUMXsSDIrHGLEr0MbizrutRrtAHg5l7Wg
 u6XwGPZQHGUauyPVaJqrcs3/CAYkviwkL3cP4Zy34uE1wh/V54TD3utF+rOxWvDwq1NQ 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3agp20rrks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 10:51:24 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17JEoIwg125085;
 Thu, 19 Aug 2021 10:51:24 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3agp20rrjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 10:51:24 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17JEbWsv005821;
 Thu, 19 Aug 2021 14:51:22 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3ae5f8gdec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 14:51:22 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17JEpJxx57082308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Aug 2021 14:51:20 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E249F11C052;
 Thu, 19 Aug 2021 14:51:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC9F011C054;
 Thu, 19 Aug 2021 14:51:19 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.161.250])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 Aug 2021 14:51:19 +0000 (GMT)
Subject: Re: [PULL 6/7] meson: fix meson 0.58 warning with libvhost-user
 subproject
To: pbonzini@redhat.com
References: <20210729124713.208422-7-pbonzini@redhat.com>
 <20210819084303.320682-1-borntraeger@de.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <81b25fdd-fb8e-8781-bb93-42f0b42e59fc@de.ibm.com>
Date: Thu, 19 Aug 2021 16:51:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210819084303.320682-1-borntraeger@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5XxDsVOKSQaPeytqrSyYWI9P3fYrvHTd
X-Proofpoint-GUID: p5ib16Rnp9s--qaSvw2qaO2h7DFVQfJM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-19_05:2021-08-17,
 2021-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=865 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108190085
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.591,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDE5LjA4LjIxIDEwOjQzLCBDaHJpc3RpYW4gQm9ybnRyYWVnZXIgd3JvdGU6DQo+
IEludGVyZXN0aW5nbHkgZW5vdWdoIHRoaXMgYnJlYWtzIG15IHJwbWJ1aWxkIChib3RoIHJw
bWJ1aWxkIGFuZCBtb2NrKS4NCj4gKG1vc3RseSB3aXRoIGEgbW9kaWZpZWQgZjM1IHNwZWMg
ZmlsZSk6DQo+IA0KPiBjYyAtSXN1YnByb2plY3RzL2xpYnZob3N0LXVzZXIvbGlidmhvc3Qt
dXNlci5hLnAgLUlzdWJwcm9qZWN0cy9saWJ2aG9zdC11c2VyIC1JLi4vc3VicHJvamVjdHMv
bGlidmhvc3QtdXNlciAtZmRpYWdub3N0aWNzLWNvbG9yPWF1dG8gLXBpcGUgLVdhbGwgLVdp
bnZhbGlkLXBjaCAtc3RkPWdudTExIC1PMiAtZyAtVV9GT1JUSUZZX1NPVVJDRSAtRF9GT1JU
SUZZX1NPVVJDRT0yIC1tNjQgLURfRklMRV9PRkZTRVRfQklUUz02NCAtRF9MQVJHRUZJTEVf
U09VUkNFIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVdyZWR1bmRhbnQtZGVjbHMgLVd1bmRlZiAt
V3dyaXRlLXN0cmluZ3MgLVdtaXNzaW5nLXByb3RvdHlwZXMgLWZuby1zdHJpY3QtYWxpYXNp
bmcgLWZuby1jb21tb24gLWZ3cmFwdiAtTzIgLWZleGNlcHRpb25zIC1nIC1ncmVjb3JkLWdj
Yy1zd2l0Y2hlcyAtV2FsbCAtV2Vycm9yPWZvcm1hdC1zZWN1cml0eSAtV3AsLURfRk9SVElG
WV9TT1VSQ0U9MiAtV3AsLURfR0xJQkNYWF9BU1NFUlRJT05TIC1zcGVjcz0vdXNyL2xpYi9y
cG0vcmVkaGF0L3JlZGhhdC1oYXJkZW5lZC1jYzEgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25n
IC1zcGVjcz0vdXNyL2xpYi9ycG0vcmVkaGF0L3JlZGhhdC1hbm5vYmluLWNjMSAtbTY0IC1t
YXJjaD16RUMxMiAtbXR1bmU9ejEzIC1mYXN5bmNocm9ub3VzLXVud2luZC10YWJsZXMgLWZz
dGFjay1jbGFzaC1wcm90ZWN0aW9uIC1Xb2xkLXN0eWxlLWRlY2xhcmF0aW9uIC1Xb2xkLXN0
eWxlLWRlZmluaXRpb24gLVd0eXBlLWxpbWl0cyAtV2Zvcm1hdC1zZWN1cml0eSAtV2Zvcm1h
dC15MmsgLVdpbml0LXNlbGYgLVdpZ25vcmVkLXF1YWxpZmllcnMgLVdlbXB0eS1ib2R5IC1X
bmVzdGVkLWV4dGVybnMgLVdlbmRpZi1sYWJlbHMgLVdleHBhbnNpb24tdG8tZGVmaW5lZCAt
V2ltcGxpY2l0LWZhbGx0aHJvdWdoPTIgLVduby1taXNzaW5nLWluY2x1ZGUtZGlycyAtV25v
LXNoaWZ0LW5lZ2F0aXZlLXZhbHVlIC1Xbm8tcHNhYmkgLWZzdGFjay1wcm90ZWN0b3Itc3Ry
b25nIC1EU1RBUF9TRFRfVjIgLWZQSUUgLXB0aHJlYWQgLURfR05VX1NPVVJDRSAtTUQgLU1R
IHN1YnByb2plY3RzL2xpYnZob3N0LXVzZXIvbGlidmhvc3QtdXNlci5hLnAvbGlidmhvc3Qt
dXNlci5jLm8gLU1GIHN1YnByb2plY3RzL2xpYnZob3N0LXVzZXIvbGlidmhvc3QtdXNlci5h
LnAvbGlidmhvc3QtdXNlci5jLm8uZCAtbyBzdWJwcm9qZWN0cy9saWJ2aG9zdC11c2VyL2xp
YnZob3N0LXVzZXIuYS5wL2xpYnZob3N0LXVzZXIuYy5vIC1jIC4uL3N1YnByb2plY3RzL2xp
YnZob3N0LXVzZXIvbGlidmhvc3QtdXNlci5jDQo+IC4uL3N1YnByb2plY3RzL2xpYnZob3N0
LXVzZXIvbGlidmhvc3QtdXNlci5jOjQzOjEwOiBmYXRhbCBlcnJvcjogaW5jbHVkZS9hdG9t
aWMuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiAgICAgNDMgfCAjaW5jbHVkZSAi
aW5jbHVkZS9hdG9taWMuaCINCj4gICAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fn5+DQo+IGNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuDQo+IA0KDQpMb29rcyBsaWtlIHRoZSBs
aW5rIGluIHRoZSB0YXIueHogZmlsZSBpcyBicm9rZW4uIFdlIGRvIHVzZSBzY3JpcHRzL2Fy
Y2hpdmUtc291cmNlLnNoLg0KV2lsbCBsb29rIGZ1cnRoZXIuDQo=

