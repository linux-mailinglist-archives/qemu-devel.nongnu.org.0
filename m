Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BD03F81D1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 06:56:05 +0200 (CEST)
Received: from localhost ([::1]:37276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ7Qq-0008NL-H8
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 00:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <srikar@linux.vnet.ibm.com>)
 id 1mJ6Ii-0002FN-0O
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 23:43:36 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12628
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <srikar@linux.vnet.ibm.com>)
 id 1mJ6Id-00017E-Ug
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 23:43:35 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17Q3WVqZ192308; Wed, 25 Aug 2021 23:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : mime-version; s=pp1; bh=2nBCMPuJAlL2L6PEL2YFH2SLNFBS5AtwSlsOxsLEO9I=;
 b=olDgokC30oaqA0mzrieciMR3H0ZmDdZ5CQfd1EU0w3xXBLnx1x/ygTNZ1Pud1iu/G7qK
 /eIVJtNbTIti74+KOnC/qJFd6gHjRDxHIz4G2O6LjZmKpTuG/bBfSy6LsbtUPUR3ChYw
 QM7TKkTKwNxazcJd4taBu8r/Z4CVDGi+m/pYD+sLCX+57390FvbRS1JgwuEfsj5PFjOH
 kQ2j7DLjSJpFKMQ+nlG8JP2nGGj0L2T/BvgcsQq9F25+sXKj/bmf1sCLZ2qlpF+5BjIZ
 TFxNmV3dOC1XmYg5BcQxue/yyHr1CkMpCjF9jVoB3FVGm7e3uZAAiCH36bdfZT0mvDV8 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ap1v1hr7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 23:43:19 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17Q3ZSUf003643;
 Wed, 25 Aug 2021 23:43:19 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ap1v1hr7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 23:43:19 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17Q3gjxT011345;
 Thu, 26 Aug 2021 03:43:17 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3ajs48f22y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 03:43:17 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17Q3hEuT33948082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Aug 2021 03:43:14 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A147F5204E;
 Thu, 26 Aug 2021 03:43:14 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 2719152054;
 Thu, 26 Aug 2021 03:43:11 +0000 (GMT)
Date: Thu, 26 Aug 2021 09:13:10 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [FSL P50x0] lscpu reports wrong values since the RC1 of kernel
 5.13
Message-ID: <20210826034310.GA296102@linux.vnet.ibm.com>
References: <a7098505-2162-d3cc-b8f9-ef8c8a7d441f@xenosoft.de>
 <c16c3747-8c6c-fb27-4e07-a893b83a5580@xenosoft.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <c16c3747-8c6c-fb27-4e07-a893b83a5580@xenosoft.de>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nafgPOqAcOu8xe9FCZ1j6pFOCGZqeyOH
X-Proofpoint-ORIG-GUID: PWW2l1UiDbkrTcxGO5hKlM3x_FikwQ-x
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-25_09:2021-08-25,
 2021-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108260018
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=srikar@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 26 Aug 2021 00:54:17 -0400
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 qemu-devel@nongnu.org, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Christian Zigotzky <chzigotzky@xenosoft.de> [2021-08-16 14:29:21]:


Hi Christian,

> I tested the RC6 of kernel 5.14 today and unfortunately the issue still
> exists. We have figured out that only P5040 SoCs are affected. [1]
> P5020 SoCs display the correct values.
> Please check the CPU changes in the PowerPC updates 5.13-1 and 5.13-2.
>

Thanks for reporting the issue.
Would it be possible to try
https://lore.kernel.org/linuxppc-dev/20210821092419.167454-3-srikar@linux.vnet.ibm.com/t/#u

If the above patch is not helping, then can you please collect the output of

cat /sys/devices/system/cpu/cpu*/topology/core_siblings

Were all the CPUs online at the time of boot?
Did we do any CPU online/offline operations post boot?

If we did CPU online/offline, can you capture the output just after the
boot along with lscpu output..

Since this is being seen on few SOCs, can you summarize the difference
between P5040 and P5020.
> 
> [1] https://forum.hyperion-entertainment.com/viewtopic.php?p=53775#p53775
> 
> 
> On 09 August 2021 um 02:37 pm, Christian Zigotzky wrote:
> > Hi All,
> > 
> > Lscpu reports wrong values [1] since the RC1 of kernel 5.13 on my FSL
> > P5040 Cyrus+ board (A-EON AmigaOne X5000). [2]
> > The differences are:
> > 
> > Since the RC1 of kernel 5.13 (wrong values):
> > 
> > Core(s) per socket: 1
> > Socket(s): 3
> > 

I know that the socket count was off by 1, but I cant explain how its off by
2 here.

> > Before (correct values):
> > 
> > Core(s) per socket: 4
> > Socket(s): 1
> > 

-- 
Thanks and Regards
Srikar Dronamraju

