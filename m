Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE95A37D42C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 22:21:04 +0200 (CEST)
Received: from localhost ([::1]:60020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgvLr-0003aJ-TS
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 16:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lgvKH-0001N9-4o; Wed, 12 May 2021 16:19:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39476
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lgvKE-0000Ff-JE; Wed, 12 May 2021 16:19:24 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14CK44YJ126545; Wed, 12 May 2021 16:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=w1Z069c7VFjdfmE2aOViI0fp5iUp/znDHSlRZatJxpQ=;
 b=OxbrxLuVpwpzDAcCIiY2JbcXsF3tPXT7UNtmck4v2ZYpZN+1+O2QmKOqEnlf4B6Fbjjz
 BcKYgHnKQ9DsTeF8mmSx6t8fspS3V7PZyWHsechk3WnWoNTYeFXf26FCQLTkYCsV7pLb
 40CMuhq003LWoOBvPcAOHIGQvbzHmRVXICvvev5OBQDnqMSueFWYZAo8XzEiMMw9FTc1
 yBqakg0NwsUfBG72k/Zv6S+1PI8XgqR0H26DGO9BJvBPL1/No9UCxxds5k2qArNTSXuA
 dSPStEGeM5dgcyK/8LzXBKYC3CjwVWxBCBOHa7hiRQ//f0WWvRrDZP/hgSAlOChLGD3c ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38gman2esr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 May 2021 16:19:19 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14CK45w5126609;
 Wed, 12 May 2021 16:19:18 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38gman2esh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 May 2021 16:19:18 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14CKI3VV023206;
 Wed, 12 May 2021 20:19:18 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 38dj9980dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 May 2021 20:19:18 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14CKJGge24838636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 May 2021 20:19:16 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCB067805E;
 Wed, 12 May 2021 20:19:16 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 289A97805C;
 Wed, 12 May 2021 20:19:16 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.160.49.189])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 12 May 2021 20:19:15 +0000 (GMT)
Message-ID: <12fd64d4d368230b69f47a6ed67049b67553717b.camel@linux.ibm.com>
Subject: Re: [PATCH RFC] vfio-ccw: forward halt/clear errors
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Date: Wed, 12 May 2021 16:19:15 -0400
In-Reply-To: <20210511151129.77051-1-cohuck@redhat.com>
References: <20210511151129.77051-1-cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: i8ddk1tyfq7Ypc44-tQRPS42cIKECcpV
X-Proofpoint-GUID: LvAXbmEpFNrd6v491Ui6Vz0jEUHmVA9v
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-12_11:2021-05-12,
 2021-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105120130
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-05-11 at 17:11 +0200, Cornelia Huck wrote:
> hsch and csch basically have two parts: execute the command,
> and perform the halt/clear function. For fully emulated
> subchannels, it is pretty clear how it will work: check the
> subchannel state, and actually 'perform the halt/clear function'
> and set cc 0 if everything looks good.
> 
> For passthrough subchannels, some of the checking is done
> within QEMU, but some has to be done within the kernel. QEMU's
> subchannel state may be such that we can perform the async
> function, but the kernel may still get a cc != 0 when it is
> actually executing the instruction. In that case, we need to
> set the condition actually encountered by the kernel; if we
> set cc 0 on error, we would actually need to inject an interrupt
> as well.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> Stumbled over this during the vfio-ccw kernel locking discussions.
> 
> This is probably a corner case, and I'm not sure how I can actually
> get this path excercised, but it passes my smoke tests.

I'll see if I can hammer my way into some of this.

> 
> Not sure whether this is the way to go. 

I think it seems reasonable.

> The unit exceptions in the
> halt/clear error paths also seem slightly fishy.

It is peculiar. Looking at the old POPS references, the unit exception
states that the --device-- detected something unusual, not really the
subchannel (which is how vfio-ccw is behaving). But, providing some
indication that something went seriously wrong is good. Which I guess
was the point of the UE code, even though it's obviously set up to be
generated after a failure on the START.

I guess at the least, we need to clean up the FCTL based on the
function that failed, rather than only cleaning up the START function.
The UE itself may just be an extra "hey this is busted" indicator.

> 
> ---
>  hw/s390x/css.c | 34 ++++++++++++++++++++++++++++++----
>  hw/vfio/ccw.c  |  4 ++--
>  2 files changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> index bed46f5ec3a2..ce2e903ca25a 100644
> --- a/hw/s390x/css.c
> +++ b/hw/s390x/css.c
> @@ -1206,23 +1206,49 @@ static void
> sch_handle_start_func_virtual(SubchDev *sch)
>  
>  }
>  
> -static void sch_handle_halt_func_passthrough(SubchDev *sch)
> +static IOInstEnding sch_handle_halt_func_passthrough(SubchDev *sch)
>  {
>      int ret;
>  
>      ret = s390_ccw_halt(sch);
>      if (ret == -ENOSYS) {
>          sch_handle_halt_func(sch);
> +        return IOINST_CC_EXPECTED;

This is the fallback, so makes sense. You could fold it into the switch
table, but since that's for "stuff from the kernel" versus -ENOSYS says
"there's no way to call the kernel" I guess this is fine too.

> +    }
> +    /*
> +     * Some conditions may have been detected prior to starting the
> halt
> +     * function; map them to the correct cc.
> +     */
> +    switch (ret) {
> +    case -EBUSY:
> +        return IOINST_CC_BUSY;
> +    case -ENODEV:
> +    case -EACCES:
> +        return IOINST_CC_NOT_OPERATIONAL;
> +    default:
> +        return IOINST_CC_EXPECTED;
>      }
>  }
>  
> -static void sch_handle_clear_func_passthrough(SubchDev *sch)
> +static IOInstEnding sch_handle_clear_func_passthrough(SubchDev *sch)
>  {
>      int ret;
>  
>      ret = s390_ccw_clear(sch);
>      if (ret == -ENOSYS) {
>          sch_handle_clear_func(sch);
> +        return IOINST_CC_EXPECTED;
> +    }
> +    /*
> +     * Some conditions may have been detected prior to starting the
> clear
> +     * function; map them to the correct cc.
> +     */
> +    switch (ret) {
> +    case -ENODEV:
> +    case -EACCES:
> +        return IOINST_CC_NOT_OPERATIONAL;
> +    default:
> +        return IOINST_CC_EXPECTED;
>      }
>  }
>  
> @@ -1265,9 +1291,9 @@ IOInstEnding
> do_subchannel_work_passthrough(SubchDev *sch)
>      SCHIB *schib = &sch->curr_status;
>  
>      if (schib->scsw.ctrl & SCSW_FCTL_CLEAR_FUNC) {
> -        sch_handle_clear_func_passthrough(sch);
> +        return sch_handle_clear_func_passthrough(sch);
>      } else if (schib->scsw.ctrl & SCSW_FCTL_HALT_FUNC) {
> -        sch_handle_halt_func_passthrough(sch);
> +        return sch_handle_halt_func_passthrough(sch);
>      } else if (schib->scsw.ctrl & SCSW_FCTL_START_FUNC) {
>          return sch_handle_start_func_passthrough(sch);
>      }
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index e752c845e9e4..39275a917bd2 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -199,7 +199,7 @@ again:

// This is for CLEAR

>      case 0:
>      case -ENODEV:
>      case -EACCES:
> -        return 0;
> +        return ret;
>      case -EFAULT:
>      default:
>          sch_gen_unit_exception(sch);
> @@ -240,7 +240,7 @@ again:

// This is for HALT

>      case -EBUSY:
>      case -ENODEV:
>      case -EACCES:
> -        return 0;
> +        return ret;

Aside: How could we get EACCES for either HALT or CLEAR? I only see
that set in the normal request path, if we got a CC3 on the SSCH.

Can we scrub them, or do we need to update kernel
Documentation/s390/vfio-ccw.rst ? :)

Eric

>      case -EFAULT:
>      default:
>          sch_gen_unit_exception(sch);


