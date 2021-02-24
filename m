Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67388324378
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 19:03:58 +0100 (CET)
Received: from localhost ([::1]:59154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEyVx-0004Jk-8U
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 13:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lEyUX-0003aG-OT
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:02:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15910
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lEyUV-0002zW-RH
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:02:29 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OHZmgI192350; Wed, 24 Feb 2021 13:02:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=9QW6K19ubqLcMCluVG+7tkRubF3URUz32FYMexnXWdQ=;
 b=qJxoI44EGbgvbLd35XUiki2+w054nnDd7/GW2wy0EQgKSdR/Ow322Wf9yX0TfJJM5hg6
 M1DOe0Vq5ywo+epTvq5iEXED+NJBVPrfN6tLDuuyYWrQjKwR/K/ZoSrtU8B1BfTJOfGx
 v8D922178pFGlu4rYL3LBlpULHv9JroPup4uhij+TVIdZUsqAiepnZaJbZkyU+aYU2Wo
 /L7PKOvPEqjk52IJ7Rovbcd9ku2xxblk9sj+cNIrFontEPqszbkJ01lbCMZi1vBl0yqP
 /CokmefPrDzC/tpRQo5tTwHR5TL7qi9pqh6Zx8Qq5imzJ4y4zh99zUDa1hQCRDpSrduE TA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36wm7hj16j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 13:02:25 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11OHiuHW042726;
 Wed, 24 Feb 2021 13:02:25 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36wm7hj165-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 13:02:25 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11OHusuA000811;
 Wed, 24 Feb 2021 18:02:24 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 36tt2a8nqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 18:02:24 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11OI2Nij31654172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Feb 2021 18:02:23 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B7566A04F;
 Wed, 24 Feb 2021 18:02:23 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A65836A04D;
 Wed, 24 Feb 2021 18:02:22 +0000 (GMT)
Received: from [9.163.12.145] (unknown [9.163.12.145])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 24 Feb 2021 18:02:22 +0000 (GMT)
Subject: Re: [PATCH 1/2] gitlab-ci.yml: Allow custom make parallelism
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210222230106.7030-1-dbuono@linux.vnet.ibm.com>
 <20210222230106.7030-2-dbuono@linux.vnet.ibm.com>
 <20057039-92b4-5b0f-436d-7310e9e59dfe@redhat.com>
 <2209b899-4de1-5b8d-99de-0b993575c0a3@linux.vnet.ibm.com>
 <0bed82c8-f40d-8a22-74e5-7eede5ef80c5@redhat.com>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <bd71d643-68f0-1bfb-088c-f7c4b9cb153a@linux.vnet.ibm.com>
Date: Wed, 24 Feb 2021 13:02:21 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <0bed82c8-f40d-8a22-74e5-7eede5ef80c5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_08:2021-02-24,
 2021-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240137
Received-SPF: none client-ip=148.163.158.5;
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



On 2/24/2021 2:44 AM, Paolo Bonzini wrote:
> On 23/02/21 20:34, Daniele Buono wrote:
>> This works, but setting this value to 1 for everybody seems a bit too
>> restrictive. While the gitlab ci runners don't have enough memory for
>> this, that's not necessarily true for every build platform, and linking
>> multiple targets in parallel with LTO can result in a big save in time,
>> so I'd prefer a customizable way.
>>
>> How about adding a flag `--max-ld-procs` to configure to manually set
>> backend_max_links?
> 
> Another possibility is to invoke "meson configure build 
> -Dbackend_max_links=1" after configure.

I like this, I'll send a v2 soon where I replace this patch with one
just for linking.

Daniele

