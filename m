Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7900F67E6BF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 14:30:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLOo0-0007Le-Lk; Fri, 27 Jan 2023 08:30:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pLOnq-0007JW-GD
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:30:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pLOno-0005yz-Kb
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674826198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nxnIr9w0Sckh8no5uWFx9HTAhfS5bmlrrA8xWs28YTA=;
 b=MZ0P1c4YhSNaCsz504vd3QJITQUHp8kURPCsJweAw7h0aHsfUFKNFmfB5VdmVzLqijwF8D
 +E+sj+MAXdfao+WKQZ5k7HhgQ23S3j8CtW7L1QuFTVN1h/h2/LPBeZ5aiA+iFD05jct8WF
 ayuJrInDSgsqT5Dr5zG6WobKogIXfe8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-610-7pX-UB1HN8SU8wK8Ko6RwA-1; Fri, 27 Jan 2023 08:29:57 -0500
X-MC-Unique: 7pX-UB1HN8SU8wK8Ko6RwA-1
Received: by mail-ej1-f70.google.com with SMTP id
 d10-20020a170906640a00b008787d18c373so2332967ejm.17
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 05:29:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nxnIr9w0Sckh8no5uWFx9HTAhfS5bmlrrA8xWs28YTA=;
 b=0NrjskSfqnmCtEuTX/4bNXVDpj8egE6xAjbvmS74wK0Byx1k9PMqLED9VhQeE/lLSe
 zAfX7BXOh114RN1TPvNqv7sE2XToJfCRp8CGngZJ+FsFRFtMCiP7aTyNBE2SOPnmZXEg
 BvgydySldXrAbEPolbK4i83IkAZarAD++3b8rYSwWTaqwmPCyS+Y8HEwYZav3bVTKMTF
 RyBuEFTu/VsX0MB9EbNGzIo/VWbNbEqoAjPzoJPaJ17P4EmLj56XtZu3H5abZivvFpaZ
 HvMR5umvws3JENzA9r0KstbibLl39eCdXvfIRcy9EH4RaX4NxCQ1DsuNUHgP852wu+oP
 IX/g==
X-Gm-Message-State: AFqh2kp50S8/dELzK1yxnzsPsJsYJC29psNMmqlwYajs3jGOFO0kx7nT
 zLtFOIE+eVUMgfrGGX++M5aCKULzZyV83K5eltUIiG+ksrw93jtCRP7Pw10exIZhGRTddQBNsh7
 5/bRudnMNJz8+pU4=
X-Received: by 2002:a05:6402:4ce:b0:47f:bc9b:46ec with SMTP id
 n14-20020a05640204ce00b0047fbc9b46ecmr40059373edw.7.1674826196223; 
 Fri, 27 Jan 2023 05:29:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuGxS7NpVGUVz0BLaUbz74QnluGcChRnIg/i/kMe1nHyJaY+1TWpZodxVXnFRrR44ExkTw/Jg==
X-Received: by 2002:a05:6402:4ce:b0:47f:bc9b:46ec with SMTP id
 n14-20020a05640204ce00b0047fbc9b46ecmr40059348edw.7.1674826195953; 
 Fri, 27 Jan 2023 05:29:55 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 w25-20020aa7d299000000b0048789661fa2sm2287797edq.66.2023.01.27.05.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:29:54 -0800 (PST)
Date: Fri, 27 Jan 2023 14:29:53 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Lei Wang <lei4.wang@intel.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 berrange@redhat.com, xiaoyao.li@intel.com, yang.zhong@linux.intel.com
Subject: Re: [PATCH v3 2/6] i386: Remove unused parameter "uint32_t bit" in
 feature_word_description()
Message-ID: <20230127142953.2b9ac4aa@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230106083826.5384-3-lei4.wang@intel.com>
References: <20230106083826.5384-1-lei4.wang@intel.com>
 <20230106083826.5384-3-lei4.wang@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri,  6 Jan 2023 00:38:22 -0800
Lei Wang <lei4.wang@intel.com> wrote:

> Parameter "uint32_t bit" is not used in function feature_word_description(),
> so remove it.
> 
> Signed-off-by: Lei Wang <lei4.wang@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  target/i386/cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index b6d1247e5e..883098bc5a 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4290,7 +4290,7 @@ static const TypeInfo max_x86_cpu_type_info = {
>      .class_init = max_x86_cpu_class_init,
>  };
>  
> -static char *feature_word_description(FeatureWordInfo *f, uint32_t bit)
> +static char *feature_word_description(FeatureWordInfo *f)
>  {
>      assert(f->type == CPUID_FEATURE_WORD || f->type == MSR_FEATURE_WORD);
>  
> @@ -4329,6 +4329,7 @@ static void mark_unavailable_features(X86CPU *cpu, FeatureWord w, uint64_t mask,
>      CPUX86State *env = &cpu->env;
>      FeatureWordInfo *f = &feature_word_info[w];
>      int i;
> +    g_autofree char *feat_word_str = feature_word_description(f);
>  
>      if (!cpu->force_features) {
>          env->features[w] &= ~mask;
> @@ -4341,7 +4342,6 @@ static void mark_unavailable_features(X86CPU *cpu, FeatureWord w, uint64_t mask,
>  
>      for (i = 0; i < 64; ++i) {
>          if ((1ULL << i) & mask) {
> -            g_autofree char *feat_word_str = feature_word_description(f, i);
>              warn_report("%s: %s%s%s [bit %d]",
>                          verbose_prefix,
>                          feat_word_str,


