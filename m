Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF44B33C33B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:03:41 +0100 (CET)
Received: from localhost ([::1]:59112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqd3-0007vI-0G
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lLqZB-0006H3-ES
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:59:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5604
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lLqZ5-0008N5-1H
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:59:41 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FGXmQ9187374; Mon, 15 Mar 2021 12:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ETJ1ExwzAAoNUvPGblx56Hqz8sPN9a704b1wNhuEMu4=;
 b=UKWvvTEWAYzPXdHOSKhrJCf5rd5sf6H39ADhvBjTC59UdUNyFmz6WzdrjvJ5PEQGa0ZJ
 uM4j03cnThingUwyGMz5qYCUOWs63LCATYT4rJtt5nKhM8BHrWVlJb6dxDqo9uf9ZTDL
 z1+PVgG+UnsVzGmdAjG2cZ4FDbit31Opuv2lvujjhgvb9qYNPjjf0y5a1+Mp5Ib810LF
 yz8/QHMeE4ZHiEUmH5kCZdT11NHVY+L27fxIMPDDS+Cgdnfh6eWXLs5BC6sMfe0cYlEz
 hAkIjs0s2LZ0Dra65ux0rq2tdq83SCtqcHvVpw/PomGH1aEl6t7jr3YrwXVUgC7oIo61 JA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37aa1xbnxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:59:32 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12FGXrjk187995;
 Mon, 15 Mar 2021 12:59:32 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37aa1xbnx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:59:32 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FGmOoh013919;
 Mon, 15 Mar 2021 16:59:30 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 378n18j239-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 16:59:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12FGxAWD37290272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 16:59:10 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FA0D4203F;
 Mon, 15 Mar 2021 16:59:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8B4342045;
 Mon, 15 Mar 2021 16:59:26 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.7.179])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 16:59:26 +0000 (GMT)
Subject: Re: [PULL 13/18] hw/core: implement a guest-loader to support static
 hypervisor guests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20210308135104.24903-1-alex.bennee@linaro.org>
 <20210308135104.24903-14-alex.bennee@linaro.org>
 <2bcd9ae8-b304-a9a1-9f14-d238a9b2f6a2@de.ibm.com>
 <e690a377-2f3e-0774-03f8-813f2631e4f0@redhat.com>
 <0edd9206-a77b-7bdf-6c9a-f3f395f58cf3@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <1b9d8751-7e04-15a9-ad4f-6f8c34a6f915@de.ibm.com>
Date: Mon, 15 Mar 2021 17:59:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <0edd9206-a77b-7bdf-6c9a-f3f395f58cf3@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_08:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150113
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
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 15.03.21 17:51, Philippe Mathieu-Daudé wrote:

> diff --git a/hw/core/Kconfig b/hw/core/Kconfig
> index fdf03514d7d..9397503656d 100644
> --- a/hw/core/Kconfig
> +++ b/hw/core/Kconfig
> @@ -11,6 +11,11 @@ config GENERIC_LOADER
>       bool
>       default y
> 
> +config GUEST_LOADER
> +    bool
> +    default y
> +    depends on TCG
> +
>   config OR_IRQ
>       bool
> 
> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index 9cd72edf513..59f1605bb07 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -16,6 +16,7 @@
>   common_ss.add(files('cpu.c'))
>   common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
>   common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true:
> files('generic-loader.c'))
> +common_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true:
> files('guest-loader.c'))
>   common_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
>   common_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true:
> files('platform-bus.c'))
>   common_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
> @@ -37,8 +38,6 @@
>     'clock-vmstate.c',
>   ))
> 
> -softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('guest-loader.c'))
> -
>   specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
>     'machine-qmp-cmds.c',
>     'numa.c',


Also
Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>

