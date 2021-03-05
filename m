Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71DE32F06C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:55:03 +0100 (CET)
Received: from localhost ([::1]:38912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDjC-000636-Qe
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lIDhG-0004rd-1k
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:53:02 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lIDhD-0005v8-Jb
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:53:01 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125GXw0h136585
 for <qemu-devel@nongnu.org>; Fri, 5 Mar 2021 11:52:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FEqm4WMr+cCTzzAyiAQ071ILvYGps+f4aKOrxH4Z6is=;
 b=r674dBdW4Laqrvbf/pOUykO7KZGFfDbfF58PmCnBnQGpsNCOheRKP53KoZC08cLASuCO
 VfMHNcCwuUzpzlqPccptzZnIMRV487kOpXmkMP4LTql4gVliuodZyqkICbI0SoEjCZjw
 cLJmFe3Vu/IdNPBYLniOaiYPvXv+pXaGoG4Med3Sk5z/FsEFqoYu5GBBEQA6ASb6bemE
 LK7BIfch6oLDjwbbfWav41MSDNSbfOdsGUBV7PXRKgnEJrB0JwnUj8OwlPYn40mjNSyT
 b7OlmPWyiM4GovfgDulWX7KpOijrrikIAdEI0SYuLqg4MgFGHXxozw7sfM+putQ7IoMU fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 373nykmsuu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 11:52:57 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 125GYL05138825
 for <qemu-devel@nongnu.org>; Fri, 5 Mar 2021 11:52:56 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 373nykmsum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 11:52:56 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 125GqNPg027774;
 Fri, 5 Mar 2021 16:52:56 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 3720r12m51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 16:52:56 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 125Gqs3G27001286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Mar 2021 16:52:55 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E01146A04F;
 Fri,  5 Mar 2021 16:52:54 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A9CD6A057;
 Fri,  5 Mar 2021 16:52:54 +0000 (GMT)
Received: from [9.211.86.147] (unknown [9.211.86.147])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  5 Mar 2021 16:52:54 +0000 (GMT)
Subject: Re: [PATCH] meson: Stop if cfi is enabled with system slirp
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210304025939.9164-1-dbuono@linux.vnet.ibm.com>
 <YEC4Rk/eAStVIFU7@redhat.com>
 <5829357a-6759-8314-140c-214016862446@redhat.com>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <19c10e57-b515-ae96-1924-54103d575a58@linux.vnet.ibm.com>
Date: Fri, 5 Mar 2021 11:52:52 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5829357a-6759-8314-140c-214016862446@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-05_10:2021-03-03,
 2021-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0
 clxscore=1015 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103050083
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/2021 5:56 AM, Paolo Bonzini wrote:
> On 04/03/21 11:37, Daniel P. Berrangé wrote:
>> On Wed, Mar 03, 2021 at 09:59:38PM -0500, Daniele Buono wrote:
>>> For CFI, we need to compile slirp as a static library together with 
>>> qemu.
>>> This is because we register slirp functions as callbacks for QEMU 
>>> Timers.
>>> When using a system-wide shared libslirp, the type information for the
>>> callback is missing and the timer call produces a false positive with 
>>> CFI.
>>
>> Is there work being done, or at least an active plan, for fixing this ?
> 
> Daniele, would this work (uncompiled even)?

Basically, yes it would work, but I'd be worried of the effectiveness of 
CFI. Timers in QEMU are one of the easiest ways to change control flow 
when you get arbitrary write permissions, and were used in at least a 
couple of VM escape demos last year. CFI as before would stop that 
attack vector. With this patch, we would leave the attack vector 
essentially open. More comments (and a couple of suggestions to make it 
harder) later.

> 
> diff --git a/net/slirp.c b/net/slirp.c
> index be914c0be0..82e05d2c01 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -174,23 +174,42 @@ static int64_t net_slirp_clock_get_ns(void *opaque)
>       return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>   }
> 
> +typedef struct SlirpTimer {
> +    QEMUTimer t;
> +    SlirpTimerCb cb;
> +    void *cb_opaque;
> +} SlirpTimer;
> +
> +static void slirp_timer_cb(void *opaque)
> +{
> +    SlirpTimer *st = opaque;
> +    st->cb(st->cb_opaque);
> +}

This call is still violating CFI (st->cb is a pointer in libslirp), but
now that we have a specific callback for slirp, we can easily add a
"QEMU_DISABLE_CFI" decorator to disable CFI only on `slirp_timer_cb`.

The problem is that an attack on the timer is as easy now as it was
without CFI. You just have to change the timer entry to call
slirp_timer_cb, and the opaque pointer to a SlirpTimer struct you
created, anywhere in memory, with a pointer to your own function and
your own parameters. The call to slirp_timer_cb is valid for CFI, while
the call to st->cb is not checked anymore.

I believe we can "fix" this by manually (i.e. in the code) making sure
that st->cb is a valid callback. I think there's a limited number of
(possibly only one right now) callbacks that slirp will use on a timer.
We could create a R/O array that contains the pointers to the allowed
functions, and here check that st->cb is a pointer to one of those.

A more generic alternative could be to try to use dladdr, to resolve the
pointer to a symbol, and make sure that st->cb points to a symbol in 
libslirp. Not sure it will work (we are not opening libslirp with
dlopen), and definitely heavy from a performance point of view, but
would be probably a solution generic enough for all possible future
cases.

I can try to provide RFC patches for both cases, if you guys are 
interested, to see how the code would look like.

> +
>   static void *net_slirp_timer_new(SlirpTimerCb cb,
>                                    void *cb_opaque, void *opaque)
>   {
> -    return timer_new_full(NULL, QEMU_CLOCK_VIRTUAL,
> -                          SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
> -                          cb, cb_opaque);
> +    SlirpTimer *st = g_new(SlirpTimer, 1);
> +    st->cb = cb;
> +    st->cb_opaque = cb_opaque;
> +    timer_init_full(&st->t, NULL, QEMU_CLOCK_VIRTUAL,
> +                    SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
> +                    slirp_timer_cb, st);
> +    return st;
>   }
> 
>   static void net_slirp_timer_free(void *timer, void *opaque)
>   {
> -    timer_free(timer);
> +    SlirpTimer *st = timer;
> +    timer_del(&st->t);
> +    g_free(st);
>   }
> 
>   static void net_slirp_timer_mod(void *timer, int64_t expire_timer,
>                                   void *opaque)
>   {
> -    timer_mod(timer, expire_timer);
> +    SlirpTimer *st = timer;
> +    timer_mod(&st->t, expire_timer);
>   }
> 
>   static void net_slirp_register_poll_fd(int fd, void *opaque)
> 

