Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBD95A2E14
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 20:14:14 +0200 (CEST)
Received: from localhost ([::1]:49402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRdqO-0006z7-Cg
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 14:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oRdp1-0005UY-64
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 14:12:47 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30112
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oRdoz-00026i-Gr
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 14:12:46 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27QHsLhj028019
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 18:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mr8NdsyZo8PI9GOgw2PCNP1J37OShrVn2d/ifaT3sA0=;
 b=SpYCbHqOCH2+LbZjo6gSewqPPzfdCZpCD19SElPHFkumpdvD1sy9kCT2sEwaGHj3M+Cs
 NLEJXDZCCgkh2CyjOsGH25/z+aVkrUxkQHwl57crLU9BTvzU5wb4Y65+cW+bw2toBvHY
 bW47DQZyChxiC1v8OXPbnpd39xFfHEge8vRl8EVh4TH5wr5XT/hp8ivdAGjYj3UwwOA1
 Qds/4uhnvJ50dAxhVQRIWtwqcNGWbDBEztkHY0pGerDKBovRSQDZK8L8sUfKijxfZC/W
 /tNPBIkv5a+eyaYVO8FA/Sc4JXVs34nBLO+/RV9z/HH23uSkIIx2fX5de5eN1kEf/2ob Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j7301grau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 18:12:44 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27QI68sT017914
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 18:12:43 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j7301gra9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Aug 2022 18:12:43 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27QI5lLO004270;
 Fri, 26 Aug 2022 18:12:43 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 3j2q8afn8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Aug 2022 18:12:43 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27QICg9963898022
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Aug 2022 18:12:42 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCD2C2805A;
 Fri, 26 Aug 2022 18:12:42 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAB4428059;
 Fri, 26 Aug 2022 18:12:42 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 26 Aug 2022 18:12:42 +0000 (GMT)
Message-ID: <341630be-a5be-79cd-f958-0d1910a164bc@linux.ibm.com>
Date: Fri, 26 Aug 2022 14:12:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] tpm_emulator: Have swtpm relock storage upon
 migration fall-back
Content-Language: en-US
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
References: <20220826154602.362516-1-stefanb@linux.ibm.com>
 <20220826154602.362516-3-stefanb@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220826154602.362516-3-stefanb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4_rL39GV_FGrp6nDqgEtzZQS68riUjeR
X-Proofpoint-ORIG-GUID: EhLBQ-5tQPusD9jNxwsMhCnZSLDnILqB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-26_10,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208260072
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
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



On 8/26/22 11:46, Stefan Berger wrote:
> Swtpm may release the lock once the last one of its state blobs has been
> migrated out. In case of VM migration failure QEMU now needs to notify
> swtpm that it should again take the lock, which it can otherwise only do
> once it has received the first TPM command from the VM.
> 
> Only try to send the lock command if swtpm supports it. It will not have
> released the lock (and support shared storage setups) if it doesn't
> support the locking command since the functionality of releasing the lock
> upon state blob reception and the lock command were added to swtpm
> 'together'.
> 
> If QEMU sends the lock command and the storage has already been locked
> no error is reported.
> 
> If swtpm does not receive the lock command (from older version of QEMU),
> it will lock the storage once the first TPM command has been received. So
> sending the lock command is an optimization.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>   backends/tpm/tpm_emulator.c | 59 ++++++++++++++++++++++++++++++++++++-
>   backends/tpm/trace-events   |  2 ++
>   2 files changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
> index 87d061e9bb..debbdebd4c 100644
> --- a/backends/tpm/tpm_emulator.c
> +++ b/backends/tpm/tpm_emulator.c
> @@ -34,6 +34,7 @@
>   #include "io/channel-socket.h"
>   #include "sysemu/tpm_backend.h"
>   #include "sysemu/tpm_util.h"
> +#include "sysemu/runstate.h"
>   #include "tpm_int.h"
>   #include "tpm_ioctl.h"
>   #include "migration/blocker.h"
> @@ -81,6 +82,9 @@ struct TPMEmulator {
>       unsigned int established_flag_cached:1;
>   
>       TPMBlobBuffers state_blobs;
> +
> +    bool relock_swtpm;
> +    VMChangeStateEntry *vmstate;
>   };
>   
>   struct tpm_error {
> @@ -302,6 +306,35 @@ static int tpm_emulator_stop_tpm(TPMBackend *tb)
>       return 0;
>   }
>   
> +static int tpm_emulator_lock_storage(TPMEmulator *tpm_emu)
> +{
> +    ptm_lockstorage pls;
> +
> +    if (!TPM_EMULATOR_IMPLEMENTS_ALL_CAPS(tpm_emu, PTM_CAP_LOCK_STORAGE)) {
> +        trace_tpm_emulator_lock_storage_cmd_not_supt();
> +        return 0;
> +    }
> +
> +    /* give failing side 100 * 10ms time to release lock */

FYI: By inducing a migration failure in the post_load function of this 
module on the migration destination side, the fallback required 
worst-case 16 loops (160ms; ~20 attempts to migrate) for swtpm on the 
source side to again be able to grab the lock. I am using NFS for shared 
storage.


