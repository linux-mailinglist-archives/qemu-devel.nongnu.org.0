Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57B53B8206
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 14:22:21 +0200 (CEST)
Received: from localhost ([::1]:39378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyZES-0005dN-7c
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 08:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lyZDP-0004tW-7v
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 08:21:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lyZDN-0005SB-1q
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 08:21:14 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UC2mCs182677
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 08:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jddkJKuRDkT9rdQV3JPXC87zoCWR6hbhmvs82cS5yh4=;
 b=EQXqVjbozeUssMKlqeCJjAvwh4LOsOJsjIPF0xGopDxyizel0iCTQyv+c/zbyXJBRTsp
 Hll/JD8K2xm1YmDNQquJbT8seqsd7o4Cjykd/zWWbnsSzS2T564fTZdIpnSI91pceKYj
 4W4pFzf1MiELYadqG5+S1MmiLh3300EXrq2wmUwKsy9SWKPrhdM3lflTPFgy0CnmUaOe
 VUVJ6t1K19XJUOINRK6SAkYnfGvpSLzgDdtuXac7D2e8hXmXVSDKNmZzM1jTQZgPlxD6
 NYPBHnV5rTqImp9w7mCq9BA1vbmM2Bf8lkEZIUtTt9vNEL8WB3eLMPUulUAL7+zr8hmJ Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gr0312ga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 08:21:10 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15UC2qhZ183111
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 08:21:10 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gr0312fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 08:21:10 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15UCAi1x017897;
 Wed, 30 Jun 2021 12:21:09 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 39duvdecg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 12:21:09 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15UCL9LU36307312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 12:21:09 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC5CA112022;
 Wed, 30 Jun 2021 12:21:08 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7AC011201F;
 Wed, 30 Jun 2021 12:21:06 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 30 Jun 2021 12:21:06 +0000 (GMT)
Subject: Re: [PATCH v2 33/53] acpi: build_tpm_tcpa: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210625091818.1047980-35-imammedo@redhat.com>
 <20210630072548.1294165-1-imammedo@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <5d36eef8-4e52-1a73-1b67-a4266f080f90@linux.ibm.com>
Date: Wed, 30 Jun 2021 08:21:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210630072548.1294165-1-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ICm-62Co5PnyRzzOesecWJcs1taX5ZeJ
X-Proofpoint-GUID: uZttgkCpgiGsHeQdcJIjn8WZKi1J9c3J
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_05:2021-06-29,
 2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300076
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: stefanb@linux.vnet.ibm.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/30/21 3:25 AM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
>
> While at it switch to build_append_int_noprefix() to build
> table entries (which also removes some manual offset
> calculations).
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Tested-by: Stefan Berger <stefanb@linux.ibm.com>



