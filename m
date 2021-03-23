Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FF43455D8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 04:00:37 +0100 (CET)
Received: from localhost ([::1]:33394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOXHX-0007Ok-NR
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 23:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lOXFM-0005re-Us
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 22:58:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lOXFI-00033G-MG
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 22:58:20 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12N2WaFs096896
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 22:58:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YeA5i1PT5FQAX723NWaj78b5FhgiiWK6G1fW2Bbj4LM=;
 b=OnuUWGimbiA6HPT/1/CnRL5rqUGHkBo/FcEqIXJlBXSX2KXp7/Kex33xoiQNlmVOiUCD
 vqTTG4fg15aHUhQezuc2lV9/C4kAxycty20O3UFdPa6NP20pHIAcka/08G9Z5YbIHN3i
 vYgmkWgiVafyP14Pn6CioYlgfVzzui+p8mUdh6NYTu2Wm8fpIUYBRIomvTy7kDRFo4w2
 jEts6+/VR6OLjKL9rzPvPyT0rtOOIeeYXDvbwqLMaMoFGHBtvAfcnPk2NQQpT83OAGk6
 61iV213WkbD38ROwLD0UZlz5poZAqO9vScaewXB7LJ2MfSXEGFjY7sQcpqwrKGF8JoWQ 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37dx4akwt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 22:58:11 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12N2Xn8k099762
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 22:58:10 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37dx4akwsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 22:58:10 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12N2rRl2014558;
 Tue, 23 Mar 2021 02:58:09 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 37d99r2x9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 02:58:09 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12N2w9KC34865644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 02:58:09 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09AC2112065;
 Tue, 23 Mar 2021 02:58:09 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 058BE112064;
 Tue, 23 Mar 2021 02:58:08 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 23 Mar 2021 02:58:08 +0000 (GMT)
Subject: Re: [PATCH 1/9] tpm: Changed a qemu_mutex_lock to QEMU_LOCK_GUARD
To: Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-devel@nongnu.org
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
 <20210311031538.5325-2-ma.mandourr@gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <98e413a9-2aa4-dc12-c5ec-5b13f4dc2de7@linux.ibm.com>
Date: Mon, 22 Mar 2021 22:58:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311031538.5325-2-ma.mandourr@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_12:2021-03-22,
 2021-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230015
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/10/21 10:15 PM, Mahmoud Mandour wrote:
> Removed a qemu_mutex_lock() and its respective qemu_mutex_unlock()
> and used QEMU_LOCK_GUARD instead. This simplifies the code by
> eliminiating gotos and removing the qemu_mutex_unlock() calls.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>   backends/tpm/tpm_emulator.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
> index a012adc193..a3c041e402 100644
> --- a/backends/tpm/tpm_emulator.c
> +++ b/backends/tpm/tpm_emulator.c
> @@ -126,7 +126,7 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
>       uint8_t *buf = NULL;
>       int ret = -1;


ret is not needed anymore


>
> -    qemu_mutex_lock(&tpm->mutex);
> +    QEMU_LOCK_GUARD(&tpm->mutex);
>
>       buf = g_alloca(n);
>       memcpy(buf, &cmd_no, sizeof(cmd_no));
> @@ -134,20 +134,18 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
>
>       n = qemu_chr_fe_write_all(dev, buf, n);
>       if (n <= 0) {
> -        goto end;
> +        return ret;
>       }
>
>       if (msg_len_out != 0) {
>           n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
>           if (n <= 0) {
> -            goto end;
> +            return ret;
>           }
>       }
>
>       ret = 0;
>
> -end:
> -    qemu_mutex_unlock(&tpm->mutex);
>       return ret;


return 0;



>   }
>

