Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34204D2956
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 08:17:49 +0100 (CET)
Received: from localhost ([::1]:41184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRqZw-0001Yx-Qw
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 02:17:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nRqWX-0008FZ-8Q
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 02:14:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nRqWS-00075j-PE
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 02:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646810051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5JgZcxSv3la9rP68BHTPhrJuqsMM8rMeiXHb00jlMdY=;
 b=IGG4hvQBddKCeuwoN5HPCdt3DfEE3AymwB80J0D8d1hOTREKqyUOs+QEVUf6LJD8poZ1xe
 9p6Lx86LY1xfUkqjBi5QwYW4WXnrOlHreeUMY3Auh+4/mKDPpwsFD2GO8iWlfmHnvnei47
 DQmSgaGlI1aBl/iXIML0POSCG4TS+Fc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-ovWlUuoaNty9jpQC-Uz8Zw-1; Wed, 09 Mar 2022 02:14:09 -0500
X-MC-Unique: ovWlUuoaNty9jpQC-Uz8Zw-1
Received: by mail-ed1-f72.google.com with SMTP id
 bd4-20020a056402206400b004162b6d8618so757551edb.19
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 23:14:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5JgZcxSv3la9rP68BHTPhrJuqsMM8rMeiXHb00jlMdY=;
 b=hi4kCPffrGntD4Jt7+N5E1r1dScIS+Sk506HmmqxoCHUGtWiJb/6076RBLZnTQbHpc
 /TmIOmhIJFr31y0oFVWVrKHJ6Ef/1vwr4b/PncmCR78Fugr1LA4K+YoOCY9qM7h+c9Hw
 NXsXf4JEkFa6+6oZvXAM1rITpmbmQTgsUyqTITuSQXZaqKrjK7CAnndTE/2JY5wjIvHl
 obmEnKRrIaLL9lpM6VvZVHu9VOhJv1SRZ91HiCrM6zoWSqWyWyzPA9ZSWzTgs/pjWjI9
 w8kXfu3cxtXrtdNxeit2sL8kqOVdomAn3kbjTLsSoWp/lLWfwMlvJwz0heTnB+MKJ4SU
 x2kw==
X-Gm-Message-State: AOAM530mBNehV4KVrXCJGknTHq8SCY+WVMuV0ZIS8PCSB4dy+U1V5kAC
 ICItlHHs6SaFGvbUpH2/EX7Sny/jYovmSTY6JRHD6uyQfV8MJ9KcCftqByqjiv5TSD3NE42ctxv
 UExCJVfWyrOlpFA0=
X-Received: by 2002:a05:6402:1435:b0:410:d2e1:e6dc with SMTP id
 c21-20020a056402143500b00410d2e1e6dcmr19282163edx.138.1646810048732; 
 Tue, 08 Mar 2022 23:14:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzecoJvLsq74dvyjtuXJ6aBBxcySste1foHlB9+r3+VsCZzZqaQ1aTB+feqkmD/kbwweYiJfA==
X-Received: by 2002:a05:6402:1435:b0:410:d2e1:e6dc with SMTP id
 c21-20020a056402143500b00410d2e1e6dcmr19282142edx.138.1646810048385; 
 Tue, 08 Mar 2022 23:14:08 -0800 (PST)
Received: from gator (cst-prg-8-40.cust.vodafone.cz. [46.135.8.40])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a170906c20b00b006d584a09b9fsm366774ejz.98.2022.03.08.23.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 23:14:07 -0800 (PST)
Date: Wed, 9 Mar 2022 08:14:05 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 2/2] hw/arm/virt: Fix gic-version=max when
 CONFIG_ARM_GICV3_TCG is unset
Message-ID: <20220309071405.z2j2hcpzkbvwl3zh@gator>
References: <20220308182452.223473-1-eric.auger@redhat.com>
 <20220308182452.223473-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220308182452.223473-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 f4bug@amsat.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 08, 2022 at 07:24:52PM +0100, Eric Auger wrote:
> In TCG mode, if gic-version=max we always select GICv3 even if
> CONFIG_ARM_GICV3_TCG is unset. We shall rather select GICv2.
> This also brings the benefit of fixing qos tests errors for tests
> using gic-version=max with CONFIG_ARM_GICV3_TCG unset.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v2 -> v3:
> - Use module_object_class_by_name() and refer to the renamed
>   CONFIG_ARM_GICV3_TCG config
> ---
>  hw/arm/virt.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 46bf7ceddf..39790d29d2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1852,7 +1852,12 @@ static void finalize_gic_version(VirtMachineState *vms)
>          vms->gic_version = VIRT_GIC_VERSION_2;
>          break;
>      case VIRT_GIC_VERSION_MAX:
> -        vms->gic_version = VIRT_GIC_VERSION_3;
> +        if (module_object_class_by_name("arm-gicv3")) {
> +            /* CONFIG_ARM_GICV3_TCG was set */
> +            vms->gic_version = VIRT_GIC_VERSION_3;
> +        } else {
> +            vms->gic_version = VIRT_GIC_VERSION_2;
> +        }
>          break;
>      case VIRT_GIC_VERSION_HOST:
>          error_report("gic-version=host requires KVM");
> -- 
> 2.26.3
>

 
Reviewed-by: Andrew Jones <drjones@redhat.com>


