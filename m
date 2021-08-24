Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820003F583C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 08:30:15 +0200 (CEST)
Received: from localhost ([::1]:38230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIPwn-0007GD-03
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 02:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mIPvi-0005xt-91
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 02:29:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mIPvg-0003Zo-T6
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 02:29:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629786540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PDGGa2E9qL8F8BChqIqrkqWEUjcngYibhPqK56EvGcU=;
 b=IYASDZxD66JowQEhySaDcnEiVDw4S3chA5FMmYQLYH8x6/qTfEZGJsrD65dOYOjx8unKgK
 naisaT5+0dhMvZe4uAM5oNz3gm03N3Kk45I8Iux9YjHkXkCqRmwnUo1yjaEXYWMCON8vr5
 KsvcfoUaWcqOuAYUqS5+JbdKn/64ws4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-0zojscWqMiaKSjG9mJWJZQ-1; Tue, 24 Aug 2021 02:28:58 -0400
X-MC-Unique: 0zojscWqMiaKSjG9mJWJZQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 s25-20020a50d499000000b003c1a8573042so4295480edi.11
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 23:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PDGGa2E9qL8F8BChqIqrkqWEUjcngYibhPqK56EvGcU=;
 b=nY5Vr9KW48qixWm7PsU9rEOHurcH5G1KzS8LU9z2nApFdELUi2N1uOm9tzj7fLMLjc
 UuHTNxr7eYSyG4VG9evLgk2cge61ZfekTMKI3TkOr5A5lfI0pOHnn6OfjEc6GbjM1eky
 cGXu27UCyF/UgfHL+2KR4upxbA7T+qKJOGKJbXSlbcnp/cendCVhkTZwyV5peccjsRpZ
 CqZvwFd4dyHNQt8bHoYl1z4Xmfo2udnTnBpXVg/unst/8LyRUDZ9u3dwS8zxgdu/Emge
 sVEYh4bqa/tV5oRJCNKaSd6oFWOzGYvMtjUIOWKz1fchohxYCVeJa7QgOH3H9+N63bRg
 2O/A==
X-Gm-Message-State: AOAM533VWlRIC5sBkSpx9mnOYHSHhGpUKACFBtaS/Kx+KwjqMf3BSFJb
 lkdJybCsWLwR4bfW9bXj2noHNvcziAN3zCrh6wq1aLSWxr6RdoQ/zNHvrNR6cBaiEMb0KvDZ640
 pf3zxuhxbqGHCvHE=
X-Received: by 2002:a17:906:f11:: with SMTP id
 z17mr40642932eji.385.1629786537648; 
 Mon, 23 Aug 2021 23:28:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq1mtHWhGJg7rg6SqD758WQdocCBexq0LDm1nsz+WgdcxdtsOKrTOvqmh3UN3mDWWQOhrNvA==
X-Received: by 2002:a17:906:f11:: with SMTP id
 z17mr40642919eji.385.1629786537463; 
 Mon, 23 Aug 2021 23:28:57 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id gw24sm8559507ejb.66.2021.08.23.23.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 23:28:57 -0700 (PDT)
Date: Tue, 24 Aug 2021 08:28:55 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 3/4] target/arm/cpu64: Replace kvm_supported with
 sve_vq_supported
Message-ID: <20210824062855.3xmc3xk5ijfrptwt@gator.home>
References: <20210823160647.34028-1-drjones@redhat.com>
 <20210823160647.34028-4-drjones@redhat.com>
 <b06b7b44-1021-d2f6-5d22-767fc8422507@linaro.org>
MIME-Version: 1.0
In-Reply-To: <b06b7b44-1021-d2f6-5d22-767fc8422507@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 10:53:48AM -0700, Richard Henderson wrote:
> On 8/23/21 9:06 AM, Andrew Jones wrote:
> > Now that we have an ARMCPU member sve_vq_supported we no longer
> > need the local kvm_supported bitmap for KVM's supported vector
> > lengths.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > ---
> >   target/arm/cpu64.c | 19 +++++++++++--------
> >   1 file changed, 11 insertions(+), 8 deletions(-)
> > 
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index eb9318c83b74..557fd4757740 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -265,14 +265,17 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
> >        * any of the above.  Finally, if SVE is not disabled, then at least one
> >        * vector length must be enabled.
> >        */
> > -    DECLARE_BITMAP(kvm_supported, ARM_MAX_VQ);
> >       DECLARE_BITMAP(tmp, ARM_MAX_VQ);
> >       uint32_t vq, max_vq = 0;
> > -    /* Collect the set of vector lengths supported by KVM. */
> > -    bitmap_zero(kvm_supported, ARM_MAX_VQ);
> > +    /*
> > +     * CPU models specify a set of supported vector lengths which are
> > +     * enabled by default.  Attempting to enable any vector length not set
> > +     * in the supported bitmap results in an error.  When KVM is enabled we
> > +     * fetch the supported bitmap from the host.
> > +     */
> >       if (kvm_enabled() && kvm_arm_sve_supported()) {
> > -        kvm_arm_sve_get_vls(CPU(cpu), kvm_supported);
> > +        kvm_arm_sve_get_vls(CPU(cpu), cpu->sve_vq_supported);
> >       } else if (kvm_enabled()) {
> >           assert(!cpu_isar_feature(aa64_sve, cpu));
> >       }
> 
> I think this whole stanza should now be moved into
> kvm_arm_get_host_cpu_features, where we detect sve and fetch
> ID_AA64ZFR0_EL1.
> 
> As a separate patch, since this one is simply the variable rename.

Good idea. I'll do that for v3.

> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

Thanks,
drew 


