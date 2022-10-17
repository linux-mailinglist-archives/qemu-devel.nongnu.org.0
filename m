Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F176010D9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 16:13:52 +0200 (CEST)
Received: from localhost ([::1]:59992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okQsJ-0007Z3-7K
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 10:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okQez-0001uU-Fo; Mon, 17 Oct 2022 10:00:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25382
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okQex-0008KT-Ep; Mon, 17 Oct 2022 10:00:05 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29HDdH3o009756;
 Mon, 17 Oct 2022 14:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fx8RzQoHZf/05C+449csLtLI/LaR6CYjq23e6veSqK4=;
 b=dSFOi5nDenV+eaeOxn3l5GS2JBl/YJMmTZW5ScybZWVv6wzA2juIMoqLiioK09aIjj4b
 AuJLGAvpxHMthnCZAkI2ixjn9BBYLjQA65B6aTd5ZFvD7fjF4ILxxDFbUQJywhCm8d5Q
 v+69QtsGjqFbdCP+vs4pa1xzd4bTf6gZzE2u9kA1v0BjYUC1OeEQqoiyPogpnv3aCi01
 oogaxHV184MiSz1qJhcHe/oubMd0fC7u5klTiexPB3pPgVd0UCGjo6lyTrCfFCTjHB6F
 FufpIPv7S9pb5yz0mrBHvWst2xDsIFthmCd9x5+RVZVoopuqFxa/pAKJ3DOQn4XXyeAl rA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86x8kb3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 14:00:01 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29HDsnJU030945;
 Mon, 17 Oct 2022 14:00:00 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86x8kb18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 14:00:00 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29HDqQEe015532;
 Mon, 17 Oct 2022 13:59:59 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3k7mg9abtv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 13:59:58 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29HDxtHI32965366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Oct 2022 13:59:55 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5221A405D;
 Mon, 17 Oct 2022 13:59:55 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D346A4059;
 Mon, 17 Oct 2022 13:59:55 +0000 (GMT)
Received: from [9.171.12.155] (unknown [9.171.12.155])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Oct 2022 13:59:55 +0000 (GMT)
Message-ID: <3a50cd3b-b130-a411-d89d-cd6e5eed7656@linux.ibm.com>
Date: Mon, 17 Oct 2022 15:59:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v6 02/10] dump: Write ELF section headers right after ELF
 header
To: Marc Hartmayer <mhartmay@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com,
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
References: <20221017083822.43118-1-frankja@linux.ibm.com>
 <20221017083822.43118-3-frankja@linux.ibm.com> <87edv6ehtm.fsf@linux.ibm.com>
Content-Language: en-US
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <87edv6ehtm.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qMz10jvSJyldZ6_2gWggI6Q_oAan5XRS
X-Proofpoint-GUID: 0TOThovnyzTz1KhjTgsclhFad7t-v5T_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_11,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170076
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMTAvMTcvMjIgMTQ6NDksIE1hcmMgSGFydG1heWVyIHdyb3RlOg0KPiBKYW5vc2NoIEZy
YW5rIDxmcmFua2phQGxpbnV4LmlibS5jb20+IHdyaXRlczoNCj4gDQo+PiBMZXQncyBzdGFy
dCBidW5kbGluZyB0aGUgd3JpdGVzIG9mIHRoZSBoZWFkZXJzIGFuZCBvZiB0aGUgZGF0YSBz
byB3ZQ0KPj4gaGF2ZSBhIGNsZWFyIG9yZGVyaW5nIGJldHdlZW4gdGhlbS4gU2luY2UgdGhl
IEVMRiBoZWFkZXIgdXNlcyBvZmZzZXRzDQo+PiB0byB0aGUgaGVhZGVycyB3ZSBjYW4gZnJl
ZWx5IG9yZGVyIHRoZW0uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmFub3NjaCBGcmFuayA8
ZnJhbmtqYUBsaW51eC5pYm0uY29tPg0KPj4gLS0tDQo+PiAgIGR1bXAvZHVtcC5jIHwgMzEg
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L2R1bXAvZHVtcC5jIGIvZHVtcC9kdW1wLmMNCj4+IGluZGV4IGU3YTNiNTRlYmUuLmIxNjhh
MjUzMjEgMTAwNjQ0DQo+PiAtLS0gYS9kdW1wL2R1bXAuYw0KPj4gKysrIGIvZHVtcC9kdW1w
LmMNCj4+IEBAIC01ODMsNiArNTgzLDggQEAgc3RhdGljIHZvaWQgZHVtcF9iZWdpbihEdW1w
U3RhdGUgKnMsIEVycm9yICoqZXJycCkNCj4+ICAgICAgICAqICAgLS0tLS0tLS0tLS0tLS0N
Cj4+ICAgICAgICAqICAgfCAgZWxmIGhlYWRlciB8DQo+PiAgICAgICAgKiAgIC0tLS0tLS0t
LS0tLS0tDQo+PiArICAgICAqICAgfCAgc2N0bl9oZHIgICB8DQo+PiArICAgICAqICAgLS0t
LS0tLS0tLS0tLS0NCj4gDQo+IFdoaWxlIHlvdeKAmXJlIGF0IGl0LCBJIHdvdWxkIHN1Z2dl
c3QgdG8gYWRkIHRoZSBsb2NhdGlvbiBmb3IgdGhlIHByb2dyYW0NCj4gaGVhZGVycyAocGhk
cikgYXMgd2VsbC4gVGhpcyB3b3VsZCBpdCBtYWtlIGVhc2llciB0byB1bmRlcnN0YW5kIHRo
ZQ0KPiBtZW1vcnkgbGF5b3V0ICYgdGhlIGNvZGUgYmVsb3cgYXMgd2VsbC4NCj4gDQo+IEkg
Z3Vlc3MgaXQgbG9va3MgbGlrZToNCj4gDQo+IOKApg0KPiAtLS0tLS0tLS0tLS0tLS0NCj4g
fCAgc2N0bl9oZHIgICB8DQo+IC0tLS0tLS0tLS0tLS0tLQ0KPiB8ICBwcm9nX2hkciAgIHwN
Cj4gLS0tLS0tLS0tLS0tLS0tDQo+IOKApg0KPiANCj4gDQo+IFvigKZzbmlwXQ0KPiANCg0K
DQpUaGV5IGFyZSBhbHJlYWR5IGluIHRoZXJlLCBoYXZlIGEgbG9vayBhdCB0aGUgUFRfKiBl
bnRyaWVzLiBJJ3ZlIGxlZnQgDQp0aGVtIGxpa2UgdGhpcyBiZWNhdXNlIEkgYXNzdW1lZCB0
aGF0IHRoZSBvcmlnaW5hbCBhdXRob3Igd2FudGVkIHRvIG1ha2UgDQphIHBvaW50IGJ5IGhh
dmluZyB0aGVtIGxpa2UgdGhpcy4NCiANCiANCiANCg0KICAgICAgKiAgIC0tLS0tLS0tLS0t
LS0tIA0KIA0KIA0KDQogICAgICAqICAgfCAgZWxmIGhlYWRlciB8IA0KIA0KIA0KDQogICAg
ICAqICAgLS0tLS0tLS0tLS0tLS0gDQogDQogDQoNCiAgICAgICogICB8ICBzY3RuX2hkciAg
IHwgDQogDQogDQoNCiAgICAgICogICAtLS0tLS0tLS0tLS0tLSANCiANCiANCg0KICAgICAg
KiAgIHwgIFBUX05PVEUgICAgfCANCiANCiANCg0KICAgICAgKiAgIC0tLS0tLS0tLS0tLS0t
IA0KIA0KIA0KDQogICAgICAqICAgfCAgUFRfTE9BRCAgICB8IA0KIA0KIA0KDQogICAgICAq
ICAgLS0tLS0tLS0tLS0tLS0gDQogDQogDQoNCiAgICAgICogICB8ICAuLi4uLi4gICAgIHwg
DQogDQogDQoNCiAgICAgICogICAtLS0tLS0tLS0tLS0tLSANCiANCiANCg0KICAgICAgKiAg
IHwgIFBUX0xPQUQgICAgfCANCiANCiANCg0KICAgICAgKiAgIC0tLS0tLS0tLS0tLS0tDQo=


