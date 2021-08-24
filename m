Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79413F5878
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 08:49:36 +0200 (CEST)
Received: from localhost ([::1]:55524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIQFb-0002m5-KZ
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 02:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mIQDw-0001Br-H9
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 02:47:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mIQDr-0002WZ-9M
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 02:47:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629787666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Et3R98mtZeS6mSvAta+hCk0i3R8NtrI18u50oFIQmq0=;
 b=dSbV/lTW5+LkmJ+S5GnR9Rnug1DXLhO1Xe2wJG4MyjMY/RtqeSRtwjSr4cUyQZf7U1dYPx
 XVK8jdC7LMKZE9m1QkJvsN6iz+29qqZLnL/ZJZKeLGyXi2b2sFWOkt4/nCNkzfGX67SQyt
 BlcONJiGd7YD1niXqaq6pQDI9GNneo0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-aXfNREm5PmKKyd3HNC8ayg-1; Tue, 24 Aug 2021 02:47:42 -0400
X-MC-Unique: aXfNREm5PmKKyd3HNC8ayg-1
Received: by mail-ed1-f72.google.com with SMTP id
 x4-20020a50d9c4000000b003bed5199871so9997739edj.14
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 23:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Et3R98mtZeS6mSvAta+hCk0i3R8NtrI18u50oFIQmq0=;
 b=VYBhhSDDxowgxzDBAbGa24nVQg4iqDGpq7wUMnqrnUZrL6byWcSYltlxTFW3UW36ZS
 JtAlDVDFcToJTjCBnteCxRAXNkACXuFmxmeQBAsi61JZFN2cDe+2eNsk0ouf7ZrQCRs1
 EybQInxoo/JEZ6u5moALzGqgzBbc5I0LfBpnEb9Zz8WUnGEnB2Wx6JSv/WGZcRf++LNh
 CPAObROGkE8SgaxTksmwYFUH8n+h09ckkwRJV4w1/ln2PEkFkkR29knIy9JmJ/dpkbe1
 Xbb3sLwvjdX+mmHIbfOgcDg+1Ve3j2sNPLDMOqvLpFX4+PkTT0Yb9ZwHOLghe6v7hNQY
 wKlw==
X-Gm-Message-State: AOAM531PObmIDnsePVDQ2fYAPRWKVNixN4OANsdrj26qSIhwQDVzQHxp
 A+WJ20GBzXfLzBBvKDdCT1jAfGCYsvUR68mAYnnDYqul0fzHyVRhzq8WPPeUFLMiMhFRj0lX98q
 LlFCXV1/xbqQ7UEU=
X-Received: by 2002:a50:e0c3:: with SMTP id j3mr42789480edl.307.1629787661844; 
 Mon, 23 Aug 2021 23:47:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMBguJdpkrIf+CDyf9r87+GkEDwS9ZiW2VyxfdObqrmpt3x7oYY5hSbHV4hd+CAsnikMD03A==
X-Received: by 2002:a50:e0c3:: with SMTP id j3mr42789457edl.307.1629787661575; 
 Mon, 23 Aug 2021 23:47:41 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id j11sm8579891ejy.112.2021.08.23.23.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 23:47:41 -0700 (PDT)
Date: Tue, 24 Aug 2021 08:47:39 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 3/4] target/arm/cpu64: Replace kvm_supported with
 sve_vq_supported
Message-ID: <20210824064739.otu7wn6jn4tfbk4g@gator.home>
References: <20210823160647.34028-1-drjones@redhat.com>
 <20210823160647.34028-4-drjones@redhat.com>
 <b06b7b44-1021-d2f6-5d22-767fc8422507@linaro.org>
 <20210824062855.3xmc3xk5ijfrptwt@gator.home>
MIME-Version: 1.0
In-Reply-To: <20210824062855.3xmc3xk5ijfrptwt@gator.home>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Aug 24, 2021 at 08:28:55AM +0200, Andrew Jones wrote:
> On Mon, Aug 23, 2021 at 10:53:48AM -0700, Richard Henderson wrote:
> > On 8/23/21 9:06 AM, Andrew Jones wrote:
> > > Now that we have an ARMCPU member sve_vq_supported we no longer
> > > need the local kvm_supported bitmap for KVM's supported vector
> > > lengths.
> > > 
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > > ---
> > >   target/arm/cpu64.c | 19 +++++++++++--------
> > >   1 file changed, 11 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > > index eb9318c83b74..557fd4757740 100644
> > > --- a/target/arm/cpu64.c
> > > +++ b/target/arm/cpu64.c
> > > @@ -265,14 +265,17 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
> > >        * any of the above.  Finally, if SVE is not disabled, then at least one
> > >        * vector length must be enabled.
> > >        */
> > > -    DECLARE_BITMAP(kvm_supported, ARM_MAX_VQ);
> > >       DECLARE_BITMAP(tmp, ARM_MAX_VQ);
> > >       uint32_t vq, max_vq = 0;
> > > -    /* Collect the set of vector lengths supported by KVM. */
> > > -    bitmap_zero(kvm_supported, ARM_MAX_VQ);
> > > +    /*
> > > +     * CPU models specify a set of supported vector lengths which are
> > > +     * enabled by default.  Attempting to enable any vector length not set
> > > +     * in the supported bitmap results in an error.  When KVM is enabled we
> > > +     * fetch the supported bitmap from the host.
> > > +     */
> > >       if (kvm_enabled() && kvm_arm_sve_supported()) {
> > > -        kvm_arm_sve_get_vls(CPU(cpu), kvm_supported);
> > > +        kvm_arm_sve_get_vls(CPU(cpu), cpu->sve_vq_supported);
> > >       } else if (kvm_enabled()) {
> > >           assert(!cpu_isar_feature(aa64_sve, cpu));
> > >       }
> > 
> > I think this whole stanza should now be moved into
> > kvm_arm_get_host_cpu_features, where we detect sve and fetch
> > ID_AA64ZFR0_EL1.
> > 
> > As a separate patch, since this one is simply the variable rename.
> 
> Good idea. I'll do that for v3.

Actually, I'll post an independent series for this idea rather than
a v3 with another patch. With enough changes we can avoid several
scratch vcpus, but that's getting too far outside the scope of this
series.

Thanks,
drew


