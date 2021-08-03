Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D0D3DE836
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:21:11 +0200 (CEST)
Received: from localhost ([::1]:38520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mApfi-0006Zo-7W
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mApes-0005RL-6G
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:20:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mApeq-0007ls-Ia
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:20:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627978815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uz0o0gl9nQUMTVdMgy3f28k9BuodRy3kVfN+rmMIlKY=;
 b=Tyba9enWHVu8hzRL7bCYDllRw4CY5qtFK5X4Ht7nTFsTjb0k0vzIitjROSuTNHWc1Cz6l2
 Bn4LdP//0jOl+b8Rnxg1e1qNdvv8eyeoh6ZIvxks6L7zwgHFGvYlekOO1WxaNVZnWFu/Mx
 yhT5D7nz1PXWy0E9Wtio0rd39j4wFWI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-E_alv30oOouSPyJGyKdq4g-1; Tue, 03 Aug 2021 04:20:12 -0400
X-MC-Unique: E_alv30oOouSPyJGyKdq4g-1
Received: by mail-ed1-f69.google.com with SMTP id
 c1-20020aa7df010000b02903bb5c6f746eso10025380edy.10
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 01:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uz0o0gl9nQUMTVdMgy3f28k9BuodRy3kVfN+rmMIlKY=;
 b=d+ch3/O7NHLnpdZbll5+dP5XXWBngkcTaH4Re995S/ec4yzrqcgyNg3ihO8i1AgPTJ
 dDM2q9032nS4oeZy1lKpdmi1O2HWFj4ZgN13mZq5KvNLHt3h1dp/G/+MLl/vN0OCsD5/
 D6QiQssYjjL0jkRhw1Nx00ZN1hxbSRo2hAtWGIM1cHP+fECKozNXspw/jGna1MT6DdOk
 8vvBMreqSLF0kITJmHf/V+alwbAHi8ZvyNfEwMD07UXwNVstJREJlu33KI1vaPmPhleP
 Q5VvF1il7UyTsHEnbcWmZ897+b3lgR+VQkD+TeeJVku74hkKqoaycofr3pH6pyhEy3Kf
 saZQ==
X-Gm-Message-State: AOAM532Kow9jUdMg2IXji9C6v9CWapmq1XiS9tlZ+Z55asMWCrDkQefp
 w0TDluStQDkAy3iQWQqH0VF3isO0IYmGzV11rcBd8D5/VSTeAItPBLihjdQVIn/nrwRJQjm80dF
 2wlL/gmepqYpmtMw=
X-Received: by 2002:a17:906:b794:: with SMTP id
 dt20mr18857138ejb.363.1627978811147; 
 Tue, 03 Aug 2021 01:20:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpVIDkxWACPtdW7AQm4MK8p/k1ERiZf/eAr/L/Cd/5U6rGZJMkrWuQNzN/twpZQc0SzbaxIw==
X-Received: by 2002:a17:906:b794:: with SMTP id
 dt20mr18857111ejb.363.1627978810984; 
 Tue, 03 Aug 2021 01:20:10 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id b5sm5860631ejq.56.2021.08.03.01.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 01:20:10 -0700 (PDT)
Date: Tue, 3 Aug 2021 10:20:08 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v4 01/14] machine: Minor refactor/cleanup for the
 smp parsers
Message-ID: <20210803082008.o2trfetf4pcrrzso@gator.home>
References: <20210803080527.156556-1-wangyanan55@huawei.com>
 <20210803080527.156556-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210803080527.156556-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.701, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 03, 2021 at 04:05:14PM +0800, Yanan Wang wrote:
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

Reviewed-by: Andrew Jones <drjones@redhat.com>


