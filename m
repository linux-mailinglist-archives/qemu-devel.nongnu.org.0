Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089313D967C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 22:18:30 +0200 (CEST)
Received: from localhost ([::1]:58346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8q0a-0000SY-KI
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 16:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m8pzC-0007zM-BH
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:17:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m8pz8-0001PX-M0
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627503417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BTIJdNQtmtzNxl7+NCPjgkFCDMvs/ellXtLCtnP9vyg=;
 b=TPo2xlZlIpRYc+fTO7by9Hj5QKAPCThxHui9hGtRXotLLJMDOPPJmdxTZwhp5n2pTggzj1
 m4Gbp5Rdp85rw3FmRjqSg3UIYinBkTJOMPMHHPWEJYmL1FhkF1zUFqOG/ZlIXKuJLt0QE1
 0Dn56oEY1ByFmeYl3NknJmQGpCIPfqM=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-TKvOScArPKegA0Ugppc7gw-1; Wed, 28 Jul 2021 16:16:53 -0400
X-MC-Unique: TKvOScArPKegA0Ugppc7gw-1
Received: by mail-io1-f69.google.com with SMTP id
 f3-20020a5ec7030000b029054f7bfa6d64so2393718iop.13
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 13:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BTIJdNQtmtzNxl7+NCPjgkFCDMvs/ellXtLCtnP9vyg=;
 b=V8UOVKsbdMIuMN+II3dlNUXrT9T8EmNKGvwwz/U4I679Y4cF6doWGuCdrz5RmTQTet
 siuNZJAnIx3D4sQ3Buf/c/JQJ/DY6nF/SI7wLBvNe1en7Xy1GUEd8lFgzOK47FuzjnXw
 nEQWkn0DX25g6+YbsMMPyU7hI1lUJNo9g9j+xU0XTItaSDZTaD6mjsWcBHFn9ouORK4X
 KFNBKIW0LQHhn9GSFbDih4OTf/Na+Z94cgBoiigW7Vsj9ohPSjAztXDEywQgYJcFKb0I
 LTTxmsFsAk82oKiPGn6H9ICUpuJffJdmcsRSKE4GtseDalJN/a5jQuBKMGlcR9LydjXs
 uVLA==
X-Gm-Message-State: AOAM532lCrRZAklA66OuP5XSTABc45ciY7I1Gh+1AqSzTpxhUwa8fv6y
 uI7r9Dv70pmYY3b1Ia+xBoiQZTB/c8FNYhzfrazFz1r+vSS82EhZn0EYPp9+/gz57pbhTTxEeQ9
 LsPdF/ifxugJw+KM=
X-Received: by 2002:a05:6602:2491:: with SMTP id
 g17mr1027785ioe.98.1627503413174; 
 Wed, 28 Jul 2021 13:16:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq5b1Olc9kMNUyMKiwmBRMY9N3hJV934Z4VPTCHWH/DrGLkJ5EogFn3YBJCE1rhBTmZ0frqA==
X-Received: by 2002:a05:6602:2491:: with SMTP id
 g17mr1027759ioe.98.1627503412978; 
 Wed, 28 Jul 2021 13:16:52 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id y7sm585480ilh.51.2021.07.28.13.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 13:16:52 -0700 (PDT)
Date: Wed, 28 Jul 2021 22:16:49 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v3 01/11] machine: Minor refactor/cleanup for the
 smp parsers
Message-ID: <20210728201649.g4gx644sciq2junf@gator>
References: <20210728034848.75228-1-wangyanan55@huawei.com>
 <20210728034848.75228-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210728034848.75228-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 28, 2021 at 11:48:38AM +0800, Yanan Wang wrote:
> To pave the way for the functional improvement in later patches,
> make some refactor/cleanup for the smp parsers, including using
> local maxcpus instead of ms->smp.max_cpus in the calculation,
> defaulting dies to 0 initially like other members, cleanup the
> sanity check for dies.
> 
> No functional change intended.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 19 +++++++++++--------
>  hw/i386/pc.c      | 23 ++++++++++++++---------
>  2 files changed, 25 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index e1533dfc47..ffc0629854 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -747,9 +747,11 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      unsigned sockets = config->has_sockets ? config->sockets : 0;
>      unsigned cores   = config->has_cores ? config->cores : 0;
>      unsigned threads = config->has_threads ? config->threads : 0;
> +    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>  
> -    if (config->has_dies && config->dies != 0 && config->dies != 1) {
> +    if (config->has_dies && config->dies > 1) {
>          error_setg(errp, "dies not supported by this machine's CPU topology");
> +        return;
>      }
>  
>      /* compute missing values, prefer sockets over cores over threads */
> @@ -760,8 +762,8 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>              sockets = sockets > 0 ? sockets : 1;
>              cpus = cores * threads * sockets;
>          } else {
> -            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
> -            sockets = ms->smp.max_cpus / (cores * threads);
> +            maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +            sockets = maxcpus / (sockets * cores);

Should be divided by (cores * threads) like before.

Thanks,
drew


