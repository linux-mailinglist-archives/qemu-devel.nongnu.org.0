Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5B134480F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:51:45 +0100 (CET)
Received: from localhost ([::1]:45992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLuC-0002QH-Lp
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lOLEl-0003rx-Nx
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:08:55 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50496
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lOLEe-0000Hs-Q7
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:08:55 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12ME5HUT014969; Mon, 22 Mar 2021 10:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xTlyB7ABFSM/IXV7NnKL8TQYMq5m5UB2HRRlXzVbgCA=;
 b=HIKXIotrsvDM4uXd2UtUJi6Cx1dU2cxBth+pulgx3oky6SGW+5J/PXF99v2NMOL/fRMB
 5okZoihtRVjznWBUjEwULbTxmJgTWd36ja6BSxejAZ66yU4JeFhTgEPwN4hGHw8NGyAM
 /4Eq9D4oAmGhsoFE2Wivt8+Z/mQm8SH0tcUga6fdDKbNZL/YoY/jiLCzmccl93i4S4I5
 EDIQssLc9e/FKgGcyyR8tsQmgp5gB2k8uBMG/+MzgrMzeZaCQT4AcEFBI4vcj0svQxaB
 5mOKbE+6gD3xUuu6ojdlvWDN/278k4l3FMWiZxX9ac4yi5f9VZH3rmRP48zSFj19DpYk oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37e023grut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 10:08:37 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12ME5Ivu014991;
 Mon, 22 Mar 2021 10:08:36 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37e023gru8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 10:08:36 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12ME7B24010632;
 Mon, 22 Mar 2021 14:08:35 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 37equd2am7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 14:08:35 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12ME8YPl14811458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Mar 2021 14:08:34 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A1546A058;
 Mon, 22 Mar 2021 14:08:34 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D05556A051;
 Mon, 22 Mar 2021 14:08:33 +0000 (GMT)
Received: from [9.211.124.231] (unknown [9.211.124.231])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 22 Mar 2021 14:08:33 +0000 (GMT)
Subject: Re: [PULL v2 04/15] gitlab-ci.yml: Add jobs to test CFI flags
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20210310160002.11659-1-alex.bennee@linaro.org>
 <20210310160002.11659-5-alex.bennee@linaro.org>
 <a374fee5-7771-c9c2-489f-d496d3042196@amsat.org>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <de549089-8b8b-19b5-d360-ce3afa096747@linux.vnet.ibm.com>
Date: Mon, 22 Mar 2021 10:08:30 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a374fee5-7771-c9c2-489f-d496d3042196@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_07:2021-03-22,
 2021-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103220103
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

I'm looking at the public QEMU pipelines and it seems that that job
usually takes between 50 and 55 minutes, but there are higher spikes at
56, 57 and one where it failed at 1h.

We could perhaps set the timeout a bit higher, like 1h 10m, to not
terminate the outliers immediately?
The job you linked was almost over, there were just about 20-ish tests
to be linked, so it was probably next to completion.

On 3/22/2021 9:39 AM, Philippe Mathieu-Daudé wrote:
>> +build-cfi-x86_64:
>> +  <<: *native_build_job_definition
>> +  needs:
>> +  - job: amd64-fedora-container
>> +  variables:
>> +    LD_JOBS: 1
>> +    AR: llvm-ar
>> +    IMAGE: fedora
>> +    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
>> +      --enable-safe-stack --enable-slirp=git
>> +    TARGETS: x86_64-softmmu
>> +    MAKE_CHECK_ARGS: check-build
>> +  artifacts:
>> +    expire_in: 2 days
>> +    paths:
>> +      - build
> FYI this job is timeouting:
> 
> ERROR: Job failed: execution took longer than 1h0m0s seconds
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/1112829128
> 

