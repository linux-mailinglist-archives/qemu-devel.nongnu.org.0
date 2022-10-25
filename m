Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCA660C67B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:33:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFM9-0007Jp-FE; Tue, 25 Oct 2022 04:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1onELo-0005Om-EG; Tue, 25 Oct 2022 03:27:52 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1onELm-0001xh-Ao; Tue, 25 Oct 2022 03:27:52 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29P7F4qJ007136;
 Tue, 25 Oct 2022 07:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=5p/h6sP4tDb7hVz0btF2r3IXHficBKpWJVwkWoHVHq0=;
 b=HJDisF41cmr8h6ZrPILim+0F6KYEKgSqkKKq8mlpmZmoyDX7eR4J2pFgDBxIKHgVrNyJ
 zsbPktvlPytbkJV3MbeRTZ8gkJAJ6IQEzoWOd3OYXAkr54++FFf0Zi/x7/smyvtKoqJh
 A0/JyeX/EW/44nr7vMvmgCzLz6QuXS8bf9NA7IhiC4qAcTdzdo00JaWkgCtBafcoTPNx
 IKqn1wZpdhA+yz54legJU7irdLs5d1iLcoK7IiQgPIzOPg3RihRCzJ0ZHnyD6pOS32kT
 6iKrsH5+DnYUnTYiYe1UB84HkvLy/AmbSWkdT8j7QVjNNgCfpsHnIp3yCCHmb1gxiTJf Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3keb890f1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Oct 2022 07:27:44 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29P7FLIP008084;
 Tue, 25 Oct 2022 07:27:44 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3keb890f07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Oct 2022 07:27:44 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29P7KRus000572;
 Tue, 25 Oct 2022 07:27:41 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3kc859kfku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Oct 2022 07:27:41 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29P7RcFn50856330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Oct 2022 07:27:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56809A4057;
 Tue, 25 Oct 2022 07:27:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE9C8A404D;
 Tue, 25 Oct 2022 07:27:37 +0000 (GMT)
Received: from [9.171.40.53] (unknown [9.171.40.53])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Oct 2022 07:27:37 +0000 (GMT)
Message-ID: <482b34ad-002b-38fd-ff53-0a537c5b452b@linux.ibm.com>
Date: Tue, 25 Oct 2022 09:27:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v6 09/10] s390x: Add KVM PV dump interface
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, mhartmay@linux.ibm.com,
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
References: <20221017083822.43118-1-frankja@linux.ibm.com>
 <20221017083822.43118-10-frankja@linux.ibm.com>
 <CAJ+F1CJMzq0U8ijgbCVUiT_iKfAmtfuYXR3Bg9GnJmV3WXuH4Q@mail.gmail.com>
Content-Language: en-US
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <CAJ+F1CJMzq0U8ijgbCVUiT_iKfAmtfuYXR3Bg9GnJmV3WXuH4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WRNySgSr_NW3_mZaA1uEBASj4RBr-J1r
X-Proofpoint-GUID: U3fpD9yHexcVbY-RetVQiPoKy1ULWSjy
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210250040
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

T24gMTAvMjQvMjIgMjA6MzYsIE1hcmMtQW5kcsOpIEx1cmVhdSB3cm90ZToNCj4gSGkgSmFub3Nj
aA0KPiANCj4gT24gTW9uLCBPY3QgMTcsIDIwMjIgYXQgMTI6NTMgUE0gSmFub3NjaCBGcmFuayA8
ZnJhbmtqYUBsaW51eC5pYm0uY29tPg0KPiB3cm90ZToNCj4gDQpbLi4uXQ0KPj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvaHcvczM5MHgvcHYuaCBiL2luY2x1ZGUvaHcvczM5MHgvcHYuaA0KPj4gaW5k
ZXggZTVlYTBlY2ExNi4uMzE2NDAwNjY3NCAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvaHcvczM5
MHgvcHYuaA0KPj4gKysrIGIvaW5jbHVkZS9ody9zMzkweC9wdi5oDQo+PiBAQCAtNTEsNiArNTEs
MTAgQEAgdWludDY0X3Qga3ZtX3MzOTBfcHZfZG1wX2dldF9zaXplX2NwdSh2b2lkKTsNCj4+ICAg
dWludDY0X3Qga3ZtX3MzOTBfcHZfZG1wX2dldF9zaXplX21lbV9zdGF0ZSh2b2lkKTsNCj4+ICAg
dWludDY0X3Qga3ZtX3MzOTBfcHZfZG1wX2dldF9zaXplX2NvbXBsZXRpb25fZGF0YSh2b2lkKTsN
Cj4+ICAgYm9vbCBrdm1fczM5MF9wdl9pbmZvX2Jhc2ljX3ZhbGlkKHZvaWQpOw0KPj4gK2ludCBr
dm1fczM5MF9kdW1wX2luaXQodm9pZCk7DQo+PiAraW50IGt2bV9zMzkwX2R1bXBfY3B1KFMzOTBD
UFUgKmNwdSwgdm9pZCAqYnVmZik7DQo+PiAraW50IGt2bV9zMzkwX2R1bXBfbWVtX3N0YXRlKHVp
bnQ2NF90IGFkZHIsIHNpemVfdCBsZW4sIHZvaWQgKmRlc3QpOw0KPj4gK2ludCBrdm1fczM5MF9k
dW1wX2NvbXBsZXRpb25fZGF0YSh2b2lkICpidWZmKTsNCj4+ICAgI2Vsc2UgLyogQ09ORklHX0tW
TSAqLw0KPj4gICBzdGF0aWMgaW5saW5lIGJvb2wgczM5MF9pc19wdih2b2lkKSB7IHJldHVybiBm
YWxzZTsgfQ0KPj4gICBzdGF0aWMgaW5saW5lIGludCBzMzkwX3B2X3F1ZXJ5X2luZm8odm9pZCkg
eyByZXR1cm4gMDsgfQ0KPj4gQEAgLTY2LDYgKzcwLDExIEBAIHN0YXRpYyBpbmxpbmUgdWludDY0
X3QNCj4+IGt2bV9zMzkwX3B2X2RtcF9nZXRfc2l6ZV9jcHUodm9pZCkgeyByZXR1cm4gMDsgfQ0K
Pj4gICBzdGF0aWMgaW5saW5lIHVpbnQ2NF90IGt2bV9zMzkwX3B2X2RtcF9nZXRfc2l6ZV9tZW1f
c3RhdGUodm9pZCkgeyByZXR1cm4NCj4+IDA7IH0NCj4+ICAgc3RhdGljIGlubGluZSB1aW50NjRf
dCBrdm1fczM5MF9wdl9kbXBfZ2V0X3NpemVfY29tcGxldGlvbl9kYXRhKHZvaWQpIHsNCj4+IHJl
dHVybiAwOyB9DQo+PiAgIHN0YXRpYyBpbmxpbmUgYm9vbCBrdm1fczM5MF9wdl9pbmZvX2Jhc2lj
X3ZhbGlkKHZvaWQpIHsgcmV0dXJuIGZhbHNlOyB9DQo+PiArc3RhdGljIGlubGluZSBpbnQga3Zt
X3MzOTBfZHVtcF9pbml0KHZvaWQpIHsgcmV0dXJuIDA7IH0NCj4+ICtzdGF0aWMgaW5saW5lIGlu
dCBrdm1fczM5MF9kdW1wX2NwdShTMzkwQ1BVICpjcHUsIHZvaWQgKmJ1ZmYsIHNpemVfdCBsZW4p
DQo+PiB7IHJldHVybiAwOyB9DQo+PiArc3RhdGljIGlubGluZSBpbnQga3ZtX3MzOTBfZHVtcF9t
ZW1fc3RhdGUodWludDY0X3QgYWRkciwgc2l6ZV90IGxlbiwNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkZXN0KSB7IHJldHVybiAwOyB9DQo+PiAr
c3RhdGljIGlubGluZSBpbnQga3ZtX3MzOTBfZHVtcF9jb21wbGV0aW9uX2RhdGEodm9pZCAqYnVm
ZikgeyByZXR1cm4gMDsgfQ0KPj4gICAjZW5kaWYgLyogQ09ORklHX0tWTSAqLw0KPj4NCj4gDQo+
IA0KPiBUbyBmaXggYnVpbGQgaXNzdWU6DQo+IC4uL3RhcmdldC9zMzkweC9hcmNoX2R1bXAuYw0K
PiAuLi90YXJnZXQvczM5MHgvYXJjaF9kdW1wLmM6IEluIGZ1bmN0aW9uIOKAmHMzOTB4X3dyaXRl
X2VsZjY0X3B24oCZOg0KPiAuLi90YXJnZXQvczM5MHgvYXJjaF9kdW1wLmM6MTk1OjU6IGVycm9y
OiB0b28gZmV3IGFyZ3VtZW50cyB0bw0KPiBmdW5jdGlvbiDigJhrdm1fczM5MF9kdW1wX2NwdeKA
mQ0KPiAxOTUgfCBrdm1fczM5MF9kdW1wX2NwdShjcHUsICZub3RlLT5jb250ZW50cy5keW5hbWlj
KTsNCj4gfCBefn5+fn5+fn5+fn5+fn5+fg0KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vdGFy
Z2V0L3MzOTB4L2FyY2hfZHVtcC5jOjIwOg0KPiAvYnVpbGRzL3FlbXUtcHJvamVjdC9xZW11L2lu
Y2x1ZGUvaHcvczM5MHgvcHYuaDo3NDoxOTogbm90ZTogZGVjbGFyZWQgaGVyZQ0KPiA3NCB8IHN0
YXRpYyBpbmxpbmUgaW50IGt2bV9zMzkwX2R1bXBfY3B1KFMzOTBDUFUgKmNwdSwgdm9pZCAqYnVm
ZiwNCj4gc2l6ZV90IGxlbikgeyByZXR1cm4gMDsgfQ0KPiB8IF5+fn5+fn5+fn5+fn5+fn5+DQo+
IA0KPiBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9qb2JzLzMyMTgyOTU3
NTENCj4gDQo+IENhbiB5b3UgYWNrIHNxdWFzaGluZyB0aGlzIHRvIHRoaXMgcGF0Y2g/Og0KPiAN
Cg0KQWNrDQoNCg==

