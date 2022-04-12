Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFD54FE517
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 17:48:34 +0200 (CEST)
Received: from localhost ([::1]:48802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neIkr-0006aW-6M
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 11:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1neIjR-0005hf-PI; Tue, 12 Apr 2022 11:47:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38720
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1neIjQ-0007Kz-1u; Tue, 12 Apr 2022 11:47:05 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23CEn54D001448; 
 Tue, 12 Apr 2022 15:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=T2Ws5PgZX5raorDXeaLiKfdhmY1u998lmdiJog88/6Q=;
 b=YquQJXbTJHbYZIwDuyUhFQjy7dmWcicbG+qLlmhM07E3br4WItKTvWIoWmhcQiFlA0Dk
 UqNiQc8sQjYsh85BCoDFE4WDL563eI+HLplKmJna0hrAAZQBwBNE4kW5eQyKI01FoJHa
 s2UPFyx/4EPkEdFHz2KXnqdPkVkbJW/a8Bp23TATih9q20rTCjWGm+XEzyeWPeWr9+9u
 kOjzUGeQRrviAaCPuWVbHGggLNO7bUKw9slaW+TSAoRr3yg7yWwYGP9cGuPbnt8NjxV4
 ytBAu+KkGhYzn5k0XXQNaSUoBu/7SPAWBjbSvUsceVhYUS55kgBqJNUv+XcrswNRCR60 rA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fd7k97hyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 15:46:59 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23CFUqIU025491;
 Tue, 12 Apr 2022 15:46:58 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fd7k97hy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 15:46:58 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23CFi4bH002894;
 Tue, 12 Apr 2022 15:46:56 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3fb1s8w54c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 15:46:56 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23CFl2nq47448390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Apr 2022 15:47:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC0A15204E;
 Tue, 12 Apr 2022 15:46:53 +0000 (GMT)
Received: from [9.171.62.13] (unknown [9.171.62.13])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1414352052;
 Tue, 12 Apr 2022 15:46:52 +0000 (GMT)
Message-ID: <ed4889b8-28c4-a3ed-b5ef-add3999023d4@linux.ibm.com>
Date: Tue, 12 Apr 2022 17:50:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 2/9] vfio: tolerate migration protocol v1 uapi renames
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20220404181726.60291-1-mjrosato@linux.ibm.com>
 <20220404181726.60291-3-mjrosato@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <20220404181726.60291-3-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: an2STujO20sEgvAoL-qKlYDlZW5AA2wo
X-Proofpoint-GUID: _zAKbGeyMxCKOV6gh1HTa635ekT8Lx3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_06,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204120074
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, schnelle@linux.ibm.com,
 cohuck@redhat.com, richard.henderson@linaro.org, thuth@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, david@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/4/22 20:17, Matthew Rosato wrote:
> The v1 uapi is deprecated and will be replaced by v2 at some point;
> this patch just tolerates the renaming of uapi fields to reflect
> v1 / deprecated status.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/vfio/common.c    |  2 +-
>   hw/vfio/migration.c | 19 +++++++++++--------
>   2 files changed, 12 insertions(+), 9 deletions(-)


I do not understand why you need this patch in this series.
Shouldn't it be separate?

> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 080046e3f5..7b1e12fb69 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -380,7 +380,7 @@ static bool vfio_devices_all_running_and_saving(VFIOContainer *container)
>                   return false;
>               }
>   
> -            if ((migration->device_state & VFIO_DEVICE_STATE_SAVING) &&
> +            if ((migration->device_state & VFIO_DEVICE_STATE_V1_SAVING) &&
>                   (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
>                   continue;
>               } else {
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index ff6b45de6b..e109cee551 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -432,7 +432,7 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
>       }
>   
>       ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
> -                                   VFIO_DEVICE_STATE_SAVING);
> +                                   VFIO_DEVICE_STATE_V1_SAVING);
>       if (ret) {
>           error_report("%s: Failed to set state SAVING", vbasedev->name);
>           return ret;
> @@ -532,7 +532,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>       int ret;
>   
>       ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_RUNNING,
> -                                   VFIO_DEVICE_STATE_SAVING);
> +                                   VFIO_DEVICE_STATE_V1_SAVING);
>       if (ret) {
>           error_report("%s: Failed to set state STOP and SAVING",
>                        vbasedev->name);
> @@ -569,7 +569,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>           return ret;
>       }
>   
> -    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_SAVING, 0);
> +    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING, 0);
>       if (ret) {
>           error_report("%s: Failed to set state STOPPED", vbasedev->name);
>           return ret;
> @@ -730,7 +730,7 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>            * start saving data.
>            */
>           if (state == RUN_STATE_SAVE_VM) {
> -            value = VFIO_DEVICE_STATE_SAVING;
> +            value = VFIO_DEVICE_STATE_V1_SAVING;
>           } else {
>               value = 0;
>           }
> @@ -768,8 +768,9 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>       case MIGRATION_STATUS_FAILED:
>           bytes_transferred = 0;
>           ret = vfio_migration_set_state(vbasedev,
> -                      ~(VFIO_DEVICE_STATE_SAVING | VFIO_DEVICE_STATE_RESUMING),
> -                      VFIO_DEVICE_STATE_RUNNING);
> +                                       ~(VFIO_DEVICE_STATE_V1_SAVING |
> +                                         VFIO_DEVICE_STATE_RESUMING),
> +                                       VFIO_DEVICE_STATE_RUNNING);
>           if (ret) {
>               error_report("%s: Failed to set state RUNNING", vbasedev->name);
>           }
> @@ -864,8 +865,10 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>           goto add_blocker;
>       }
>   
> -    ret = vfio_get_dev_region_info(vbasedev, VFIO_REGION_TYPE_MIGRATION,
> -                                   VFIO_REGION_SUBTYPE_MIGRATION, &info);
> +    ret = vfio_get_dev_region_info(vbasedev,
> +                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> +                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> +                                   &info);
>       if (ret) {
>           goto add_blocker;
>       }
> 

-- 
Pierre Morel
IBM Lab Boeblingen

