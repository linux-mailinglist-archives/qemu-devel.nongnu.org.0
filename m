Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01942583232
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 20:41:23 +0200 (CEST)
Received: from localhost ([::1]:46120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGlyB-0004cw-Pf
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 14:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oGlj3-000361-Vh; Wed, 27 Jul 2022 14:25:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oGlj1-00077c-26; Wed, 27 Jul 2022 14:25:40 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RHf4Zi015121;
 Wed, 27 Jul 2022 18:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=O2ONh7O7xb2Tis2KL5c0Hirj2/DrpVdWqh/kCWY400I=;
 b=oyEqpZRiQoR6bbO1S2i+ObxY+aNGs4wyBiQiM5d6QzZd9vHlXcsWyr83LeJr/2AiUIsx
 bOFtlKq+fl1KfDjTSufKkYvcHR7u/1mNfCooNljTuVg/g2avVTvpxA6NIPR8JLuu8sLP
 HYRZyYikbBmPFoaIKxAnaVlnR7XonALKYItPVmsWD9msQQSNdlBC5kjzzFuwD8obbH2Y
 fsV+JtD8ySHI/5tks7zJh/pq7QcMRrqwff7r/I7xKmyxC48HhTv+dYhhwaHouZJYyzpj
 wFFFBKWTYIZucxFAoru+eN/tHPwhTWLR73+3EVw/yhScCBfFqDd6A20LXssSd6y9mkx8 Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk9j22erm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 18:25:36 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26RHlMTh009314;
 Wed, 27 Jul 2022 18:25:36 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk9j22eq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 18:25:36 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RILVQQ002067;
 Wed, 27 Jul 2022 18:25:33 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3hh6eum2qp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 18:25:33 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26RIPUwm22610326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 18:25:30 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5558611C052;
 Wed, 27 Jul 2022 18:25:30 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D55EE11C050;
 Wed, 27 Jul 2022 18:25:29 +0000 (GMT)
Received: from [9.171.26.130] (unknown [9.171.26.130])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jul 2022 18:25:29 +0000 (GMT)
Message-ID: <912037f5-6b1b-2778-c368-97b0abca2e13@linux.ibm.com>
Date: Wed, 27 Jul 2022 20:25:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 01/17] dump: Rename write_elf_loads to
 write_elf_phdr_loads
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-2-frankja@linux.ibm.com>
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
In-Reply-To: <20220726092248.128336-2-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ghSbyQ64kFO1K2-RPcn4Hr5kXBQsixBh
X-Proofpoint-GUID: byATpTJoTKrrFVyl6S5hZGtAvM8CDax3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_07,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270077
Received-SPF: pass client-ip=148.163.156.1; envelope-from=scgl@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/22 11:22, Janosch Frank wrote:
> Let's make it a bit clearer that we write the program headers of the
> PT_LOAD type.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>

> ---
>  dump/dump.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 4d9658ffa2..0ed7cf9c7b 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -490,7 +490,7 @@ static void get_offset_range(hwaddr phys_addr,
>      }
>  }
>  
> -static void write_elf_loads(DumpState *s, Error **errp)
> +static void write_elf_phdr_loads(DumpState *s, Error **errp)
>  {
>      ERRP_GUARD();
>      hwaddr offset, filesz;
> @@ -573,8 +573,8 @@ static void dump_begin(DumpState *s, Error **errp)
>          return;
>      }
>  
> -    /* write all PT_LOAD to vmcore */
> -    write_elf_loads(s, errp);
> +    /* write all PT_LOADs to vmcore */
> +    write_elf_phdr_loads(s, errp);
>      if (*errp) {
>          return;
>      }


