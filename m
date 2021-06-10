Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FCF3A34CD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 22:26:46 +0200 (CEST)
Received: from localhost ([::1]:39828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrRGH-0004Yo-8i
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 16:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1lrRF0-0003pH-Ce; Thu, 10 Jun 2021 16:25:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57338
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1lrREx-00058G-Oh; Thu, 10 Jun 2021 16:25:26 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15AK3wbZ024372; Thu, 10 Jun 2021 16:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=PdXJ+emYGrK4AP5pRK6Rqru0EpvVbvYX1LKGINOWDC0=;
 b=QciCuEcWdFNO5BD8zEHCUw0EIMkGhpQ9XBWXjhOk5xJLxedI3ySpTD1BKXDSFxLLdgdW
 2efTHO8DXtQ63wefsznimi+2a+ii0++R9IL/DIG3a9mHOpOgG48MHshNSNtLRZLm64k+
 n3YiZOUYYZm8NQGSZ+E0MKAjv6H4D/8Do+b8MuTOjb8FSFH7LNwOCvhR+YRBFfdenixp
 lC8QEGYYyUO/TXc1lJh5s5nCPTnw5lK+J8Zd8QOLCEND/Ed+fw/pNu4YcTTK5JAQdVxC
 QztPabr4t8RWlGcH3L6M6SPbAzUhB4AEtorrsy6en+byZsUMr4FoXCXVL5LcCBudTr4Z +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 393sb9rqmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 16:25:20 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15AKMujC109166;
 Thu, 10 Jun 2021 16:25:19 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 393sb9rqmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 16:25:19 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15AKDOs9004764;
 Thu, 10 Jun 2021 20:25:18 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 3900wa5jb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 20:25:18 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15AKPHZT19857818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 20:25:17 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00B2378085;
 Thu, 10 Jun 2021 20:25:17 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C3B878084;
 Thu, 10 Jun 2021 20:25:15 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.23.197])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 10 Jun 2021 20:25:15 +0000 (GMT)
Subject: Re: [PATCH 0/1] vfio-ccw: Fix garbage sense data on I/O error
To: Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org
References: <20210610202011.391029-1-farman@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <ce108c12-94eb-22ed-38ea-5356ee4666b9@linux.ibm.com>
Date: Thu, 10 Jun 2021 16:25:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210610202011.391029-1-farman@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MNY06fBbuZEzoF5SDo5NCGuYu9ZaaDVh
X-Proofpoint-ORIG-GUID: EA3DW3vlHGCUOstHYBG7FSsKzt0mJ4XZ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_13:2021-06-10,
 2021-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1011 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100129
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 4:20 PM, Eric Farman wrote:
> Hi Conny,
> 
> Per our offline discussion, here's a fix for the error when a guest
> issues "dasdfmt -M quick". It basically reverts commit 334e76850bbb
> ("vfio/ccw: update sense data if a unit check is pending")
> and modifies the check that builds sense data in the TSCH handler.

Should it includes a Fixes: tag then?

> 
> I opted to NOT disable PMCW.CSENSE, because doing so prevents
> vfio-ccw devices from coming online at all (didn't pursue deep
> enough to explain why). Turning it off in reaction to a unit
> check (in this now-reverted codepath) works, but only because of
> the corresponding PMCW.CSENSE check in the TSCH code.
> 
> I don't know if anything is needed for the (unaltered) ECW data
> that commit b498484ed49a ("s390x/css: sense data endianness")
> addressed for the copied sense_data bytes, but figure we can
> use this as a starting point. Thoughts?
> 
> Eric Farman (1):
>    vfio-ccw: Keep passthrough sense data intact
> 
>   hw/s390x/css.c | 3 ++-
>   hw/vfio/ccw.c  | 6 ------
>   2 files changed, 2 insertions(+), 7 deletions(-)
> 


