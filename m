Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07B04C4A52
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:16:03 +0100 (CET)
Received: from localhost ([::1]:33058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNdGE-0000wx-Vh
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:16:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nNdBi-00052C-Qy; Fri, 25 Feb 2022 11:11:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nNdBg-0005WC-FM; Fri, 25 Feb 2022 11:11:22 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21PG4kW6002136; 
 Fri, 25 Feb 2022 16:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=zI3iG2Hz+dnDGY57G3ONYBgzH/zgYRYmOOpni995/6g=;
 b=tSUDr31yGhAFLyz8iG+6OcvGaEflAqolXgVcwsipgXgEHssGsVarCVptWjMLnhfVq4EB
 +s28M9GuW6+OosVw//QG16bSkVE+IsHkJy3nu1GWHPrz5JQoioNle/Tgqm1mJr1FS3cI
 HmSZ3HWMx4pdmKOrCF+/9VmW4LWDoGaWkVY8bb9nLKQ8S4I4DS2wQsCPrQ+B3QEDRLlh
 V0WiY5NKZFY7CZqGupT7k242qiKA2DwevRWGdOmtXvLas26ytBLuP+3MJLz+D95MEBu0
 pofEWma2QkdBDwEdYijMo9fYLsbNwWjfVTxmXFVGOw4ubqvtJ/oRkjy8q621ECuUOMwa aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ef2ap85v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 16:11:08 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21PG6x1I010050;
 Fri, 25 Feb 2022 16:11:08 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ef2ap85uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 16:11:08 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21PG8hdr004666;
 Fri, 25 Feb 2022 16:11:07 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 3ear6cg054-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 16:11:07 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21PGB5Xe31392108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 16:11:05 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 733F778067;
 Fri, 25 Feb 2022 16:11:05 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C27C678060;
 Fri, 25 Feb 2022 16:11:04 +0000 (GMT)
Received: from localhost (unknown [9.211.119.70])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 25 Feb 2022 16:11:04 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 0/4] ppc: nested TCG migration (KVM-on-TCG)
In-Reply-To: <7a64b078-a11e-0e5a-e7ae-104052442d88@ilande.co.uk>
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
 <7a64b078-a11e-0e5a-e7ae-104052442d88@ilande.co.uk>
Date: Fri, 25 Feb 2022 13:11:02 -0300
Message-ID: <87wnhj2ag9.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8mUZ3JWjVjDoNfmtCqYNU7hviRQxaafE
X-Proofpoint-GUID: pRpXgbK8V-tcwrml7GghOfrEciT23JcU
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_09,2022-02-25_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxlogscore=962 impostorscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202250095
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org, npiggin@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 24/02/2022 18:58, Fabiano Rosas wrote:
>
>> This series implements the migration for a TCG pseries guest running a
>> nested KVM guest. This is just like migrating a pseries TCG guest, but
>> with some extra state to allow a nested guest to continue to run on
>> the destination.
>> 
>> Unfortunately the regular TCG migration scenario (not nested) is not
>> fully working so I cannot be entirely sure the nested migration is
>> correct. I have included a couple of patches for the general migration
>> case that (I think?) improve the situation a bit, but I'm still seeing
>> hard lockups and other issues with more than 1 vcpu.
>> 
>> This is more of an early RFC to see if anyone spots something right
>> away. I haven't made much progress in debugging the general TCG
>> migration case so if anyone has any input there as well I'd appreciate
>> it.
>> 
>> Thanks
>> 
>> Fabiano Rosas (4):
>>    target/ppc: TCG: Migrate tb_offset and decr
>>    spapr: TCG: Migrate spapr_cpu->prod
>>    hw/ppc: Take nested guest into account when saving timebase
>>    spapr: Add KVM-on-TCG migration support
>> 
>>   hw/ppc/ppc.c                    | 17 +++++++-
>>   hw/ppc/spapr.c                  | 19 ++++++++
>>   hw/ppc/spapr_cpu_core.c         | 77 +++++++++++++++++++++++++++++++++
>>   include/hw/ppc/spapr_cpu_core.h |  2 +-
>>   target/ppc/machine.c            | 61 ++++++++++++++++++++++++++
>>   5 files changed, 174 insertions(+), 2 deletions(-)
>
> FWIW I noticed there were some issues with migrating the decrementer on Mac machines 
> a while ago which causes a hang on the destination with TCG (for MacOS on a x86 host 
> in my case). Have a look at the following threads for reference:
>
> https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg00546.html
> https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg04622.html

Thanks, Mark! There's a lot of helpful information in these threads.

> IIRC there is code that assumes any migration in PPC is being done
>live, and so adjusts the timebase on the destination to reflect wall
>clock time by recalculating tb_offset. I haven't looked at the code for
>a while but I think the outcome was that there needs to be 2 phases in
>migration: the first is to migrate the timebase as-is for guests that
>are paused during migration, whilst the second is to notify
>hypervisor-aware guest OSs such as Linux to make the timebase
>adjustment if required if the guest is running.


>
>
> ATB,
>
> Mark.

