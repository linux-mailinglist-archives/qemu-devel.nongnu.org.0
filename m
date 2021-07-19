Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBCD3CD672
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 16:18:49 +0200 (CEST)
Received: from localhost ([::1]:52264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5U6a-0000rQ-7T
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 10:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1m5U4u-00086d-6V; Mon, 19 Jul 2021 10:17:04 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1m5U4s-0001LF-AR; Mon, 19 Jul 2021 10:17:03 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JE4Rx4019531; Mon, 19 Jul 2021 10:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2ylFIzc8b+7/qtgisjW05gdQugMt1EE9hA7moAoMP+w=;
 b=LI9R1dWDh9tub1v8v8JgRf0rxaqRNqZ/b3N4LWJhuRfF6Pn3L0SjsQaDRopcAYCVoVnr
 q8ZC8iLl9R4uCrkkE7VL51c9l/UD8eQckhn6TbXMDrLjfum3qrtAstYrHODWg8HxO7r8
 zSMHZ4ctXLV5aqrgjNTC+PR8oxkyNBT/h0rDy1VHgkChckfcPJ2AaTew3WR45wiuY+Kj
 741UbuBBGUD3Gp11GMPgzg9GnthxqGn4Ygrf7ORnFXNXo43gjGYjBLJhiGG7F2TVd2MD
 P1DYu7a/7aOYzinmEW/CS08w+8jAn1t0jFUXQ1MCoEObP8hAytrgGpP89pEt4zFElBxi KA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wadbhtxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 10:16:58 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16JE4XTF020314;
 Mon, 19 Jul 2021 10:16:57 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wadbhtwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 10:16:57 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16JE4fjU013632;
 Mon, 19 Jul 2021 14:16:56 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 39upua91am-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 14:16:56 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16JEGtLb37814728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 14:16:55 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF23E7805C;
 Mon, 19 Jul 2021 14:16:54 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 518FB7805E;
 Mon, 19 Jul 2021 14:16:54 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.15.25])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 19 Jul 2021 14:16:54 +0000 (GMT)
Subject: Re: [PATCH v2 0/2] s390x: improve subchannel error handling (vfio)
To: Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>
References: <20210705163952.736020-1-cohuck@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <e2032c05-ec0b-d653-959f-dcc045da2036@linux.ibm.com>
Date: Mon, 19 Jul 2021 10:16:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705163952.736020-1-cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: R92CrzcowBg44o5-gUGWUwdGV6Dda99k
X-Proofpoint-ORIG-GUID: -2UXgqEt2t8qk87WENEaANCDYaLjnKGL
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_05:2021-07-19,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190082
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, mkawano@linux.ibm.com,
 Jared Rossi <jrossi@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 12:39 PM, Cornelia Huck wrote:
> This is a followup on the first version (which I had sent out in May,
> and which kind of fell through the cracks.) While the first patch
> is mostly unchanged, I added a second patch to address some possible
> problems with the generated unit exceptions; non-vfio subchannels
> are not affected by this.
> 
> As before, this works on the good path, and I have not managed to
> actually get my system to exercise the error path :(

Sorry for the silence, was out of office for a bit and Eric is 
unavailable -- Anyway the code LGTM and matches what I see in the POPs, 
I'd be willing to ACK but I'd feel better if we could exercise the error 
paths before merging.

@Jared/@Mike, you've both had eyes on this area of code recently, would 
one of you be willing to take a crack at a tested-by (non-zero CCs on 
HSCH/CSCH + also drive the sch_gen_unit_exception path)?

> 
> v1->v2:
> - add comments regarding -ENODEV/-EACCES handling
> - add second patch
> 
> Cornelia Huck (2):
>    vfio-ccw: forward halt/clear errors
>    css: fix actl handling for unit exceptions
> 
>   hw/s390x/css.c         | 38 ++++++++++++++++++++++++++++++++++----
>   hw/vfio/ccw.c          |  4 ++--
>   include/hw/s390x/css.h |  3 ++-
>   3 files changed, 38 insertions(+), 7 deletions(-)
> 


