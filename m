Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C48F33C07B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:49:42 +0100 (CET)
Received: from localhost ([::1]:39062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpTR-0003PS-AW
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lLpQ9-0001Pu-6n; Mon, 15 Mar 2021 11:46:22 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49848
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lLpQ2-0008WT-S1; Mon, 15 Mar 2021 11:46:16 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FFjs3g170443; Mon, 15 Mar 2021 11:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mNodrghRfc/FS3HwFg7vOLjOB1kgZkHjXsCdwVI1UAM=;
 b=sz9DqX6E2sHxDgM5G71vDEEzCMG2kLgE6GclnT/PDWyfKmAC5OA+S6fg49KcgbCzMw/X
 HBHcYKepHljzCv1pZCylZ3PHECeVQoRac+quet8BQKKETeM6OaJCdB2VFuQPjM4Hcnxk
 6jsRGOvh3wczNRjPrT87HrLgY8VSUrj504kwBbOKifU86uPU5ct10TFZOQtqcDXi4u/n
 y8VKZC/aJ9sw9R8oYjd9cpRI3DrvU5J95TGUD/abbw5LfApa41jl6fZJT0ECFJHGgaZO
 0bW1wKmde7aGfcpyS4x1HbSCY8QoM+LcNe+qe3wp5o/kw3RYCm+cF+f9y1FmKnCFXgh0 NA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37aagq80bs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 11:46:09 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12FFk86k171086;
 Mon, 15 Mar 2021 11:46:08 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37aagq80a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 11:46:08 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FFfrlB028262;
 Mon, 15 Mar 2021 15:46:07 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 378n18924y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 15:46:06 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12FFjlxp35848672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 15:45:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3ED1442041;
 Mon, 15 Mar 2021 15:46:04 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51FE342045;
 Mon, 15 Mar 2021 15:46:03 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.7.179])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 15:46:03 +0000 (GMT)
Subject: Re: compile warning in i8259.c
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x <qemu-s390x@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael S Tsirkin <mst@redhat.com>
References: <cc283705-a0ee-5ee4-4f9a-b69afce65d8c@de.ibm.com>
 <75aed565-c9a6-6ee1-ab92-d2771df83ff0@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <e50c2937-f8ff-8965-0836-352c1673ae3d@de.ibm.com>
Date: Mon, 15 Mar 2021 16:46:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <75aed565-c9a6-6ee1-ab92-d2771df83ff0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_08:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150110
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDE1LjAzLjIxIDE2OjQyLCBUaG9tYXMgSHV0aCB3cm90ZToNCj4gT24gMTUvMDMv
MjAyMSAxNi4xNCwgQ2hyaXN0aWFuIEJvcm50cmFlZ2VyIHdyb3RlOg0KPj4gRm9yIHNvbWUg
dGltZSBub3cgSSBkbyBzZWUgdGhlIGZvbGxvd2luZywgd2hlbiBJIGNvbXBpbGUgeDg2LXNv
ZnRtbXUgb24gczM5MDoNCj4+DQo+PiBGQUlMRUQ6IGxpYmNvbW1vbi5mYS5wL2h3X2ludGNf
aTgyNTkuYy5vDQo+PiBjYyAtSWxpYmNvbW1vbi5mYS5wIC1JLiAtSS4uIC1JcWFwaSAtSXRy
YWNlIC1JdWkgLUl1aS9zaGFkZXIgLUkvdXNyL2luY2x1ZGUvY2Fwc3RvbmUgLUkvdXNyL2lu
Y2x1ZGUvZ2xpYi0yLjAgLUkvdXNyL2xpYjY0L2dsaWItMi4wL2luY2x1ZGUgLUkvdXNyL2lu
Y2x1ZGUvbGlibW91bnQgLUkvdXNyL2luY2x1ZGUvYmxraWQgLUkvdXNyL2luY2x1ZGUvZ2lv
LXVuaXgtMi4wIC1JL3Vzci9pbmNsdWRlL2xpYnVzYi0xLjAgLUkvdXNyL2luY2x1ZGUvdnRl
LTIuOTEgLUkvdXNyL2luY2x1ZGUvcGFuZ28tMS4wIC1JL3Vzci9pbmNsdWRlL2hhcmZidXp6
IC1JL3Vzci9pbmNsdWRlL2ZyZWV0eXBlMiAtSS91c3IvaW5jbHVkZS9saWJwbmcxNiAtSS91
c3IvaW5jbHVkZS9mcmliaWRpIC1JL3Vzci9pbmNsdWRlL2xpYnhtbDIgLUkvdXNyL2luY2x1
ZGUvY2Fpcm8gLUkvdXNyL2luY2x1ZGUvcGl4bWFuLTEgLUkvdXNyL2luY2x1ZGUvZ3RrLTMu
MCAtSS91c3IvaW5jbHVkZS9nZGstcGl4YnVmLTIuMCAtSS91c3IvaW5jbHVkZS9hdGstMS4w
IC1JL3Vzci9pbmNsdWRlL2F0LXNwaTItYXRrLzIuMCAtSS91c3IvaW5jbHVkZS9kYnVzLTEu
MCAtSS91c3IvbGliNjQvZGJ1cy0xLjAvaW5jbHVkZSAtSS91c3IvaW5jbHVkZS9hdC1zcGkt
Mi4wIC1JL3Vzci9pbmNsdWRlL3ZpcmdsIC1JL3Vzci9pbmNsdWRlL3AxMS1raXQtMSAtSS91
c3IvaW5jbHVkZS9TREwyIC1JL3Vzci9pbmNsdWRlL2NhY2FyZCAtSS91c3IvaW5jbHVkZS9u
c3MzIC1JL3Vzci9pbmNsdWRlL25zcHI0IC1JL3Vzci9pbmNsdWRlL3NsaXJwIC1mZGlhZ25v
c3RpY3MtY29sb3I9YXV0byAtcGlwZSAtV2FsbCAtV2ludmFsaWQtcGNoIC1XZXJyb3IgLXN0
ZD1nbnU5OSAtTzIgLWcgLWlzeXN0ZW0gL2hvbWUvY2Jvcm50cmEvUkVQT1MvcWVtdS9saW51
eC1oZWFkZXJzIC1pc3lzdGVtIGxpbnV4LWhlYWRlcnMgLWlxdW90ZSAuIC1pcXVvdGUgL2hv
bWUvY2Jvcm50cmEvUkVQT1MvcWVtdSAtaXF1b3RlIA0KPj4gL2hvbWUvY2Jvcm50cmEvUkVQ
T1MvcWVtdS9pbmNsdWRlIC1pcXVvdGUgL2hvbWUvY2Jvcm50cmEvUkVQT1MvcWVtdS9kaXNh
cy9saWJ2aXhsIC1pcXVvdGUgL2hvbWUvY2Jvcm50cmEvUkVQT1MvcWVtdS90Y2cvczM5MCAt
aXF1b3RlIC9ob21lL2Nib3JudHJhL1JFUE9TL3FlbXUvYWNjZWwvdGNnIC1wdGhyZWFkIC1V
X0ZPUlRJRllfU09VUkNFIC1EX0ZPUlRJRllfU09VUkNFPTIgLW02NCAtRF9HTlVfU09VUkNF
IC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLURfTEFSR0VGSUxFX1NPVVJDRSAtV3N0cmljdC1w
cm90b3R5cGVzIC1XcmVkdW5kYW50LWRlY2xzIC1XdW5kZWYgLVd3cml0ZS1zdHJpbmdzIC1X
bWlzc2luZy1wcm90b3R5cGVzIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1mbm8tY29tbW9uIC1m
d3JhcHYgLVdvbGQtc3R5bGUtZGVjbGFyYXRpb24gLVdvbGQtc3R5bGUtZGVmaW5pdGlvbiAt
V3R5cGUtbGltaXRzIC1XZm9ybWF0LXNlY3VyaXR5IC1XZm9ybWF0LXkyayAtV2luaXQtc2Vs
ZiAtV2lnbm9yZWQtcXVhbGlmaWVycyAtV2VtcHR5LWJvZHkgLVduZXN0ZWQtZXh0ZXJucyAt
V2VuZGlmLWxhYmVscyAtV2V4cGFuc2lvbi10by1kZWZpbmVkIC1XaW1wbGljaXQtZmFsbHRo
cm91Z2g9MiAtV25vLW1pc3NpbmctaW5jbHVkZS1kaXJzIC1Xbm8tc2hpZnQtbmVnYXRpdmUt
dmFsdWUgLVduby1wc2FiaSAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgLWZQSUMgLURTVFJV
Q1RfSU9WRUNfREVGSU5FRCAtRF9SRUVOVFJBTlQgLVduby11bmRlZiAtRF9ERUZBVUxUX1NP
VVJDRSAtRF9YT1BFTl9TT1VSQ0U9NjAwIC1ETkNVUlNFU19XSURFQ0hBUiAtTUQgLU1RIGxp
YmNvbW1vbi5mYS5wL2h3X2ludGNfaTgyNTkuYy5vIC1NRiBsaWJjb21tb24uZmEucC9od19p
bnRjX2k4MjU5LmMuby5kIC1vIGxpYmNvbW1vbi5mYS5wL2h3X2ludGNfaTgyNTkuYy5vIC1j
IC4uL2h3L2ludGMvaTgyNTkuYw0KPj4gLi4vaHcvaW50Yy9pODI1OS5jOiBJbiBmdW5jdGlv
biDigJhwaWNfcmVhZF9pcnHigJk6DQo+PiAuLi9ody9pbnRjL2k4MjU5LmM6MjAzOjEzOiBl
cnJvcjog4oCYaXJxMuKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVu
Y3Rpb24gWy1XZXJyb3I9bWF5YmUtdW5pbml0aWFsaXplZF0NCj4+IMKgwqAgMjAzIHzCoMKg
wqDCoMKgwqDCoMKgIGlycSA9IGlycTIgKyA4Ow0KPj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDC
oMKgwqDCoMKgIH5+fn5efn5+fn5+fn5+DQo+PiBjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0
cmVhdGVkIGFzIGVycm9ycw0KPj4NCj4+IER1ZSB0byBvdGhlciBjb21waWxlIHdhcm5pbmdz
IEkgZmluZCB0aGlzIGhhcmQgdG8gYmlzZWN0LiBIYXMgYW55b25lIHNlZW4gdGhpcyBhcyB3
ZWxsPw0KPiANCj4gSSd2ZSBuZXZlciBzZWVuIHRoaXMgd2FybmluZ3Mgc28gZmFyLi4uIHdo
aWNoIGNvbXBpbGVyIHZlcnNpb24gaXMgdGhpcz8gTG9va2luZyBhdCB0aGUgY29kZSwgaXQg
c2VlbXMgdG8gYmUgYSBmYWxzZSBwb3NpdGl2ZSB0byBtZS4NCg0KSXRzIHRoZSBmZWRvcmEz
MyBnY2MuDQo=

