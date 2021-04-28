Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC15536D9BD
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:43:45 +0200 (CEST)
Received: from localhost ([::1]:50080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lblPj-0007SI-7B
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1lblOJ-0006zr-Mn; Wed, 28 Apr 2021 10:42:15 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1lblOH-0001Lk-OH; Wed, 28 Apr 2021 10:42:15 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SEYHNl124075; Wed, 28 Apr 2021 10:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=STzEhRdGq9MNzKPL8xZccGAQrew65aZ1cOcboDo5Vu4=;
 b=G4H56tR2/XC2veFeMlgAxAOd82Qh3db6XcQy4rZa0sK8p7mKvg8uXpSEaHmsW7G7YO2q
 yVXPyyQYFJZfLqxoKGrNsiT3TYg9a69NT4jkJRCAaokC+C8qnvnTVZpVyeAsBDVWxAIz
 cSBNUKA5yzY++nutkOE4Wwb9H6++vvoH5YFvk8XqdUGd1S9ws8sd5pJtPXK7QtkRMxPB
 RRtJ8GV2ozio8aA4ThZSbBHmFeMp2BeNLMxCZeUBTRi0HCysxuZPSSVvmS3FoMvW/EK4
 aGy+kcmJSJahdKfwoJ8SBeaRUIJrvXOrb6pzkh22xc/+gp0DL0a7379TyU3TQEkExlTd Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3876ghy4gc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 10:42:08 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13SEYhlL126523;
 Wed, 28 Apr 2021 10:42:07 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3876ghy4fx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 10:42:07 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13SEHNTB031607;
 Wed, 28 Apr 2021 14:42:07 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 384qdj8y2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 14:42:07 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13SEg6LW9438194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 14:42:06 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3ECB5124052;
 Wed, 28 Apr 2021 14:42:06 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 527B5124054;
 Wed, 28 Apr 2021 14:42:05 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.93.17])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 28 Apr 2021 14:42:05 +0000 (GMT)
Subject: Re: [PATCH v2] vfio-ccw: Attempt to clean up all IRQs on error
To: Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
References: <20210428143652.1571487-1-farman@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <40b2a485-3f77-8f94-f417-d5b6b865f9c9@linux.ibm.com>
Date: Wed, 28 Apr 2021 10:42:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210428143652.1571487-1-farman@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NZlppJkXdhLb__fwLCk7euk3KcvxZjVR
X-Proofpoint-GUID: batk8jYrCMfSXYDdmbfWyxb2XUKIUcs3
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_09:2021-04-28,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104280098
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 10:36 AM, Eric Farman wrote:
> The vfio_ccw_unrealize() routine makes an unconditional attempt to
> unregister every IRQ notifier, though they may not have been registered
> in the first place (when running on an older kernel, for example).
> 
> Let's mirror this behavior in the error cleanups in vfio_ccw_realize()
> so that if/when new IRQs are added, it is less confusing to recognize
> the necessary procedures. The worst case scenario would be some extra
> messages about an undefined IRQ, but since this is an error exit that
> won't be the only thing to worry about.
> 
> And regarding those messages, let's change it to a warning instead of
> an error, to better reflect their severity. The existing code in both
> paths handles everything anyway.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>

Based on our prior conversation re: the safety of unconditional calls to 
vfio_ccw_unregister_irq_notifier, this looks good to me.

Acked-by: Matthew Rosato <mjrosato@linux.ibm.com>

> ---
> 
> Notes:
>      v1->v2:
>       - Downgrade unregister IRQ message from error to warning [CH]
>      
>      v1: https://lore.kernel.org/qemu-devel/20210427142511.2125733-1-farman@linux.ibm.com/
> 
>   hw/vfio/ccw.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index 400bc07fe2..f64dd850db 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -470,7 +470,7 @@ static void vfio_ccw_unregister_irq_notifier(VFIOCCWDevice *vcdev,
>   
>       if (vfio_set_irq_signaling(&vcdev->vdev, irq, 0,
>                                  VFIO_IRQ_SET_ACTION_TRIGGER, -1, &err)) {
> -        error_reportf_err(err, VFIO_MSG_PREFIX, vcdev->vdev.name);
> +        warn_reportf_err(err, VFIO_MSG_PREFIX, vcdev->vdev.name);
>       }
>   
>       qemu_set_fd_handler(event_notifier_get_fd(notifier),
> @@ -690,7 +690,7 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
>       if (vcdev->crw_region) {
>           vfio_ccw_register_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX, &err);
>           if (err) {
> -            goto out_crw_notifier_err;
> +            goto out_irq_notifier_err;
>           }
>       }
>   
> @@ -705,7 +705,9 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
>   
>       return;
>   
> -out_crw_notifier_err:
> +out_irq_notifier_err:
> +    vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_REQ_IRQ_INDEX);
> +    vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX);
>       vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX);
>   out_io_notifier_err:
>       vfio_ccw_put_region(vcdev);
> 


