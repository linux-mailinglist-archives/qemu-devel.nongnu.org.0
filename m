Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236FE323175
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 20:35:26 +0100 (CET)
Received: from localhost ([::1]:32926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEdSu-000792-N6
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 14:35:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lEdRt-0006gQ-9W
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 14:34:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lEdRr-0003tn-CX
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 14:34:21 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11NJY75Q031514; Tue, 23 Feb 2021 14:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DfsMN6JrAFhYZIE7ydKA0PR8VSZuwXO1vQOPWd+VDM0=;
 b=S87fI3aLJz3cf3B37k8UaxE881pbyANAG32mrLAZxMBVPb9myQ4j+lEWatUKgD6iH/aE
 bIVCeTELBmdWNn6flaGoSQSXlu5y4t0hIgHBIW29+1mwg+O1/rapK81TCVbklU/Iv0PS
 AH0k2RSCB3Fc7j8qFTfjKucu90ebc/UEPKV5qBBTbUQOvRnbXpPATr50sXOHguvzczzw
 VWoHSGAN9PhHHOLzW8IyNRrbxDQN1+XVqq+JItNfuawDa+jOGvWohXD0geI1V5gqO7uo
 AbiPsFn/MPuEmU39C3GJJvCfufGCsok9Vbi/0L/I6odnreISdmCo8bZi0W7lRx4o5wYg iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vkfukx2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 14:34:16 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11NJYG5p031940;
 Tue, 23 Feb 2021 14:34:16 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vkfukx25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 14:34:15 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11NJXIFp007410;
 Tue, 23 Feb 2021 19:34:14 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 36tt2912a7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 19:34:14 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11NJYDqB45482386
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Feb 2021 19:34:13 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9101D6A051;
 Tue, 23 Feb 2021 19:34:13 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B90E6A04D;
 Tue, 23 Feb 2021 19:34:13 +0000 (GMT)
Received: from [9.163.12.145] (unknown [9.163.12.145])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 23 Feb 2021 19:34:12 +0000 (GMT)
Subject: Re: [PATCH 1/2] gitlab-ci.yml: Allow custom make parallelism
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210222230106.7030-1-dbuono@linux.vnet.ibm.com>
 <20210222230106.7030-2-dbuono@linux.vnet.ibm.com>
 <20057039-92b4-5b0f-436d-7310e9e59dfe@redhat.com>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <2209b899-4de1-5b8d-99de-0b993575c0a3@linux.vnet.ibm.com>
Date: Tue, 23 Feb 2021 14:34:11 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20057039-92b4-5b0f-436d-7310e9e59dfe@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-23_08:2021-02-23,
 2021-02-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230163
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This works, but setting this value to 1 for everybody seems a bit too
restrictive. While the gitlab ci runners don't have enough memory for
this, that's not necessarily true for every build platform, and linking
multiple targets in parallel with LTO can result in a big save in time,
so I'd prefer a customizable way.

How about adding a flag `--max-ld-procs` to configure to manually set
backend_max_links?

This would also allow setting it up to any specific number above 1,
which looking at the Makefile seems to not be possible now: because of
how the -j flag is passed from make to ninja, a compilation is either
sequential or parallel based on #cpus

On 2/23/2021 3:12 AM, Paolo Bonzini wrote:
> On 23/02/21 00:01, Daniele Buono wrote:
>> Currently, make parallelism at build time is defined as #cpus+1. Some 
>> build jobs may need (or benefit from) a different number. An example 
>> is builds with LTO where, because of the huge demand of memory at link 
>> time, gitlab runners fails if two linkers are run concurrently This 
>> patch retains the default value of #cpus+1 but allows setting the 
>> "JOBS" variable to a different number when applying the template
> 
> As I just found out, you can add -Dbackend_max_links=1 to the meson 
> command line instead if LTO is enabled.
> 
> Paolo
> 

