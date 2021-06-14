Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FB33A6EA2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:13:29 +0200 (CEST)
Received: from localhost ([::1]:60926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lss1Y-0002sV-Iy
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lss0S-0002Cq-JQ
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:12:20 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56740
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lss0N-0000W5-EL
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:12:20 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15EJ9v1O166706
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/fz/ebhjyGUB7o3tXDJia9ASQkoEAvs/muleSS2KcTA=;
 b=DtWnZ478X6gVBMtO+Cz0tA3MK4Is9upg7FSLK5P00SfxTujkfqqYZWCEBFmjwhwNvY8X
 ts1Qhyic+M6D5tWIu4NJZBT7M4vsemvk00e74BDjUJ3d3u0AwQtOAqwvXfOIYoTN0C1E
 yYQvB0GSBEQ9sQZUF/J7GJEIPmzDhMfTTOMVHJRIancjf4qER0Ap+fwy5nHtwjxMDsw2
 HkO+fVabHxgtHDvs50AHU29Ptqx8irKZ1OfPzcG6J/yVMbLGA29Ffqr1vMStPtHQ4euD
 hzswmUfeTu1QL0mp5OHoL9SSFn4BhDScT5g/e+K8fi689k2fCPG22uPgE3eF0L5tMZV/ Vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 396awekhua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:12:14 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15EJADDD168228
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:12:13 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 396awekhu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 15:12:13 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15EJ7Kio018050;
 Mon, 14 Jun 2021 19:12:13 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 394mj920e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 19:12:13 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15EJCCma26476900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 19:12:12 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 661B96A04D;
 Mon, 14 Jun 2021 19:12:12 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FD086A051;
 Mon, 14 Jun 2021 19:12:12 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 14 Jun 2021 19:12:12 +0000 (GMT)
Subject: Re: [RFC PATCH V1 0/3] tpm: Eliminate TPM related code if CONFIG_TPM
 is not set
To: Markus Armbruster <armbru@redhat.com>
References: <20210612012102.1820063-1-stefanb@linux.ibm.com>
 <87y2bc4zga.fsf@dusky.pond.sub.org>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <8a0afe3a-ab28-b91c-7993-b07e5f861274@linux.ibm.com>
Date: Mon, 14 Jun 2021 15:12:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87y2bc4zga.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BqSbdivs7VhUjakVuy-jbiDNPQoVmBDp
X-Proofpoint-ORIG-GUID: Uo1cBZ1Lb3C3pSeg8WBZdtuP16G073W9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_13:2021-06-14,
 2021-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106140121
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/14/21 4:34 AM, Markus Armbruster wrote:
> Stefan Berger <stefanb@linux.ibm.com> writes:
>
>> The following patches entirely elimiante TPM related code if CONFIG_TPM
>> is not set.
>>
>>    Stefan
> I believe this is on top of Philippe's "[PATCH v2 2/2] tpm: Return QMP
> error when TPM is disabled in build"

No, my series is stand-alone.


    Stefan



