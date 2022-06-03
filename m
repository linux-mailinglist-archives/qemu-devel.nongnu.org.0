Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9706553C890
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 12:21:56 +0200 (CEST)
Received: from localhost ([::1]:45594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx4RG-0005Mw-RS
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 06:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nx4Nu-0003n6-Jr
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 06:18:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nx4No-00079T-Se
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 06:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654251491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHYAzxbVGjp5JbyYdqvf++lelD1fygiYeGEgSc9ft0w=;
 b=Sdym5Wb7RmtvPf4UEvPbRwuYe60IhgIQntBjec15kJsMcLuga2z+Z4XMrNaTptmUgk7pAg
 gMNg5qHI14uqmDUlfeyRKvnTpK8t+1xe7cO2leti0162Sd/cY5m4rfaygczgfRmKSplnjW
 OVdsQoxpDk8HTi4VAH/4MyMc6bvNtxc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-PQWPrK6WPsmapUszKN5-tg-1; Fri, 03 Jun 2022 06:18:10 -0400
X-MC-Unique: PQWPrK6WPsmapUszKN5-tg-1
Received: by mail-ed1-f70.google.com with SMTP id
 t5-20020a056402524500b0042deddb84c2so5233376edd.5
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 03:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uHYAzxbVGjp5JbyYdqvf++lelD1fygiYeGEgSc9ft0w=;
 b=OtCwhcivyhPHjGxeyfw6TL5EvivS/vBKiPT5HGzahMmsRb+C6aGJHwybpcCTPeAkIJ
 w9bUWEeLAh7ndurtcdieGep2HdFJaeBuq1zmoBgBn/+7d2yqwpn1B9xa0y+pyCk3T3ET
 BWgb6bgY8k4lC0Ks84lSf9FoJHjwUM7eqfEWFtZ6FMZUgXLLmO9v9FkSPrApUTx3GG2p
 xD0+WfqII2k+rLu/aDFHx7fdmF1kg1xXQvhF4BIaAovA1bfnws1x73iOaV/XfZQIc2fF
 ITEeEQ5Gs0/KCY4r/3vxTXy3YGG7Vo+UDLXa00knPRpl/PPTGOiIe23dN9SvqyGQICLS
 cN6w==
X-Gm-Message-State: AOAM530NI1GjKAMMp+B0dWg2Y/SL6mTWeld/kaBhwoSaGDXxQ+QKFdj7
 pLFVInlpUC515UbaLmEoMHqzF8XVzChKmVD0oKOfd8XG909DXNPTCH2GxEc+ZPEHMH7jMy4y53f
 JwIp1xFS+i2NLEVw=
X-Received: by 2002:a17:906:a219:b0:6e4:86a3:44ea with SMTP id
 r25-20020a170906a21900b006e486a344eamr8065101ejy.385.1654251484404; 
 Fri, 03 Jun 2022 03:18:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCBLEQWpfuMJjzC/bQ42Lxfbv/VfeTnyHB3t0ZbFU9EJT/suzqePu43L2L3ZAyYJBHt0PMSQ==
X-Received: by 2002:a17:906:a219:b0:6e4:86a3:44ea with SMTP id
 r25-20020a170906a21900b006e486a344eamr8065080ejy.385.1654251484208; 
 Fri, 03 Jun 2022 03:18:04 -0700 (PDT)
Received: from gator (cst2-175-76.cust.vodafone.cz. [31.30.175.76])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a17090636c600b006feb6dee4absm2686274ejc.137.2022.06.03.03.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 03:18:03 -0700 (PDT)
Date: Fri, 3 Jun 2022 12:18:01 +0200
From: Andrew Jones <drjones@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, f4bug@amsat.org,
 alex.bennee@linaro.org
Subject: Re: [PATCH] tests/avocado: Prefer max cpu type when using AArch64
 virt machine
Message-ID: <20220603101801.rgb2igghtcgljdw6@gator>
References: <20220603092505.1450350-1-drjones@redhat.com>
 <871qw69i26.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871qw69i26.fsf@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Jun 03, 2022 at 12:07:13PM +0200, Cornelia Huck wrote:
> On Fri, Jun 03 2022, Andrew Jones <drjones@redhat.com> wrote:
> 
> > The max cpu type is the best default cpu type for tests to use
> > when specifying the cpu type for AArch64 mach-virt. Switch all
> > tests to it.
> >
> > Cc: Alex Bennée <alex.bennee@linaro.org>
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  tests/avocado/replay_kernel.py     | 2 +-
> >  tests/avocado/reverse_debugging.py | 2 +-
> >  tests/avocado/tcg_plugins.py       | 6 +++---
> >  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> Is there anything in the boot_xen tests that requires cortex-a57, or
> should they be switched to max as well?
>

You're right. I was ignoring xen tests for no good reason. They're
simply using TCG mach-virt with a "default" cpu type too.

I'll spin a v2 that changes everything in tests/ which uses mach-
virt and appears to be want a default cpu type.

Thanks,
drew


