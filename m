Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B893A71A7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 23:58:34 +0200 (CEST)
Received: from localhost ([::1]:51596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsubJ-00070Q-G1
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 17:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lsuaP-0006LQ-8i; Mon, 14 Jun 2021 17:57:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lsuaN-0004zz-4l; Mon, 14 Jun 2021 17:57:36 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15ELYH5D167859; Mon, 14 Jun 2021 17:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ggDnk822qu3xKQ4aN/yCbaS+OLwEnI8ld2sCOHwaOEY=;
 b=jh4FQ7OsaYOXdfwLV5A0i/nfi95U+sHqo0NvbMC504uwDBcW/XACAHNkKNVXsKHVzraA
 EI0+aOXT2b/fDApxfpWCs3BaQ1PhiwCkA7o1rs1Ge2ZyNLfaGY1JoUDpX7RW987SBF4p
 n05FUyCPozYoV4XTZGLLnQHMPsPCKHj1XaWhHyw4Mmm1NymMkO55gCXkRjh5MPpeFNwa
 wEmwCltptNrxl97WgwpoNT+l8a/1nAfj8o8eBxRD2g3Th9AC2ZGEvK+WwaPysrg377uJ
 ID0DqJjdZXNw6UmimNfTDTju67pxBpD8GmIQaVaHUGbzEEqOAhEr5l2YdvfbEwXF/Mlb tA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396cqn461b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 17:57:32 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15ELZDtt174031;
 Mon, 14 Jun 2021 17:57:32 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396cqn4617-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 17:57:32 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15ELpul5016219;
 Mon, 14 Jun 2021 21:57:31 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 394mj9aurv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 21:57:31 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15ELvUOD29295030
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 21:57:30 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBB2F6E052;
 Mon, 14 Jun 2021 21:57:30 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 404046E04C;
 Mon, 14 Jun 2021 21:57:30 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 14 Jun 2021 21:57:30 +0000 (GMT)
Subject: Re: [PATCH v3 5/5] tpm: Return QMP error when TPM is disabled in build
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210614200940.2056770-1-philmd@redhat.com>
 <20210614200940.2056770-6-philmd@redhat.com>
 <270e0d89-f074-0713-6871-6e4a21791494@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <2745685d-c988-4838-24c3-829295aec2fb@linux.ibm.com>
Date: Mon, 14 Jun 2021 17:57:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <270e0d89-f074-0713-6871-6e4a21791494@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -M1akwiE0kp713yoxM5KSV65vxlTMAox
X-Proofpoint-ORIG-GUID: YWxkHvyNXCeP5ahQo6CNS2k7_C0_arBM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_13:2021-06-14,
 2021-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 mlxscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106140135
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/14/21 4:12 PM, Philippe Mathieu-Daudé wrote:
>
> Grrrr I forgot to commit:
>
> -- >8 --
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7d9cd290426..636bf2f5365 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2707,7 +2707,6 @@ TPM
>   M: Stefan Berger <stefanb@linux.ibm.com>
>   S: Maintained
>   F: tpm.c
> -F: stubs/tpm.c
>   F: hw/tpm/*
>   F: include/hw/acpi/tpm.h
>   F: include/sysemu/tpm*
> ---
>
Who is going to upstream the series? I could add this part ...



