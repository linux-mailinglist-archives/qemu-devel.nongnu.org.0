Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3175BA242
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 23:15:33 +0200 (CEST)
Received: from localhost ([::1]:32918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYwCq-000521-Qi
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 17:15:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oYw9z-0000u9-Qf
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 17:12:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oYw9x-0006KD-IQ
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 17:12:35 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FL0tQo031990;
 Thu, 15 Sep 2022 21:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0A4pPkUmuPaTfBjbl+2jPD0XBCQcgu1YkhCSrgTUsZI=;
 b=XNLjxISfPgTOjwjfvMT4k/bZYfl2O61SnD5ncMnPSRER2/macBcECL4pLiGPapBZq7BX
 94MZ8AxfaColLcfzHNWeQ800NfPCqka9OvngtjiBK5ARvDptnoM1Qi3WeKXjWlV7jCVO
 6TTNpm3lzF64KljL8qArGSAycADB5g8Mp1qH4GWtIUxglIhFf+ABdwTdxqurOi6Yr+Z7
 A9Ph/rv0d1v2ewP1Nxhqgc5rlO1n30FfkkF+kfDg+CzydL1YOHQmZBQPzeYykyafAS3X
 T7yXZPTbjdgiCsNBCVRL3IbQHlUPMWUMdJfSm+hI0vh+ScVui+8G3ZAQwBy2uz36IKuG Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmbkfgdka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Sep 2022 21:12:29 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28FL0u19032571;
 Thu, 15 Sep 2022 21:12:28 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmbkfgdjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Sep 2022 21:12:28 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28FL5wZj028542;
 Thu, 15 Sep 2022 21:12:27 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01dal.us.ibm.com with ESMTP id 3jm91qh2cs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Sep 2022 21:12:27 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28FLCQov37421396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Sep 2022 21:12:26 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9C0A6A051;
 Thu, 15 Sep 2022 21:12:25 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A4FA6A04D;
 Thu, 15 Sep 2022 21:12:25 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 15 Sep 2022 21:12:25 +0000 (GMT)
Message-ID: <ec7f058f-3250-7246-a19b-a593fe505b98@linux.ibm.com>
Date: Thu, 15 Sep 2022 17:12:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 23/27] qapi tpm: Elide redundant has_FOO in generated C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20220915204317.3766007-1-armbru@redhat.com>
 <20220915204317.3766007-24-armbru@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220915204317.3766007-24-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jET7dYNBaxdO9aZD_w2AJgyRAvmoPbYh
X-Proofpoint-GUID: hC094xKA5qQmusAZ_OR3c_dQ_kte_Wdi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_10,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1011 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209150131
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.816,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 9/15/22 16:43, Markus Armbruster wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/tpm.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>


Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

> ---
>   backends/tpm/tpm_passthrough.c | 2 --
>   monitor/hmp-cmds.c             | 8 ++++----
>   scripts/qapi/schema.py         | 1 -
>   3 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/backends/tpm/tpm_passthrough.c b/backends/tpm/tpm_passthrough.c
> index 5a2f74db1b..179697a3a9 100644
> --- a/backends/tpm/tpm_passthrough.c
> +++ b/backends/tpm/tpm_passthrough.c
> @@ -259,12 +259,10 @@ tpm_passthrough_handle_device_opts(TPMPassthruState *tpm_pt, QemuOpts *opts)
>       value = qemu_opt_get(opts, "cancel-path");
>       if (value) {
>           tpm_pt->options->cancel_path = g_strdup(value);
> -        tpm_pt->options->has_cancel_path = true;
>       }
> 
>       value = qemu_opt_get(opts, "path");
>       if (value) {
> -        tpm_pt->options->has_path = true;
>           tpm_pt->options->path = g_strdup(value);
>       }
> 
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 7ae986ab10..4a2485ddaa 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -883,10 +883,10 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
>           case TPM_TYPE_PASSTHROUGH:
>               tpo = ti->options->u.passthrough.data;
>               monitor_printf(mon, "%s%s%s%s",
> -                           tpo->has_path ? ",path=" : "",
> -                           tpo->has_path ? tpo->path : "",
> -                           tpo->has_cancel_path ? ",cancel-path=" : "",
> -                           tpo->has_cancel_path ? tpo->cancel_path : "");
> +                           tpo->path ? ",path=" : "",
> +                           tpo->path ?: "",
> +                           tpo->cancel_path ? ",cancel-path=" : "",
> +                           tpo->cancel_path ?: "");
>               break;
>           case TPM_TYPE_EMULATOR:
>               teo = ti->options->u.emulator.data;
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 6f35e57fe2..2bec0588c8 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -759,7 +759,6 @@ def need_has(self):
>           assert self.type
>           # Temporary hack to support dropping the has_FOO in reviewable chunks
>           opt_out = [
> -            'qapi/tpm.json',
>               'qapi/transaction.json',
>               'qapi/ui.json',
>               'qga/qapi-schema.json']

