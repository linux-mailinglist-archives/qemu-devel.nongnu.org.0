Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C063B73F0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:09:23 +0200 (CEST)
Received: from localhost ([::1]:43280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEQU-00072w-6O
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyENe-0005Eu-UU
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:06:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyENd-0003S3-3D
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:06:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624975583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i1DFH7Y2svzilZwb1pI9bn1C1/jva+3YNncDpk+N3ig=;
 b=Fjsib0FGxjr2n28bSupGta0f3c2IyfAXUiCZCxorX9fthxOv8VII6VdNCMCzW3dn4QLW/0
 A3kwAzQJamC3GDKdgwM9A01uYgQj0nP7R9WDp6JC1WXLdmnlr/BRzc+oT01v2ch/YJPWom
 YtasaPxEvCzkkRfz8Gm8oa3dO0CzJFs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-H27w3g8XOnu7-93yTjRL5A-1; Tue, 29 Jun 2021 10:06:22 -0400
X-MC-Unique: H27w3g8XOnu7-93yTjRL5A-1
Received: by mail-wm1-f70.google.com with SMTP id
 j18-20020a05600c1c12b02901dce930b374so1654161wms.2
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 07:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i1DFH7Y2svzilZwb1pI9bn1C1/jva+3YNncDpk+N3ig=;
 b=F3IPu1oIve8c27nDzYd7z9NaJtsApmn1jKEVlX7Ev2+vMszSGdnc8Y8iRQUonOMjDJ
 ZkBsIVxd4LstHsCr2+PDjDjgXiVOfIvRAe4z4jkJMeH4KYV8OOiuaZEm9tRSE++DUvIu
 FuZbrZeKDXb1krG90KXpHmmqfxpx6SbK+2qzKd6DK5RfmGRtluap8YOcjMfmvAPZm4+x
 BJNrzLI8hwZ9wInGpT1TFyiQ9lXYvJXk2cGaNwz+0nJvRQozA0SM8mkg/FU3kktFHizr
 uUskOAMWFSp+J/FzG3quUy7oWSohoY1UP/sDuTdu9OBDRf3dUsrmeOKzUpUDg7aWaTZ5
 VRqg==
X-Gm-Message-State: AOAM530/bEH68GbzPSdlQXwpZlKLEoKPgbKQxDO1SPaZXH9SCCfRzXrg
 vbxC5Hxh+cm5/MFO6SsxQlE+V7y177Yer+z2EhUvpB19mZeHy9Ilai+sWMGKsurmjHNgp+v2lq8
 yaL4Xb2dAWtJWaeI=
X-Received: by 2002:a5d:504e:: with SMTP id h14mr33173976wrt.273.1624975568104; 
 Tue, 29 Jun 2021 07:06:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzniz3mCDum12PazUa3k7O1/NSHrVrGawGwIA+c4YsqGxvtYe3Yqq8YTzuyDSDKyI3VgHCz9Q==
X-Received: by 2002:a5d:504e:: with SMTP id h14mr33173625wrt.273.1624975565560; 
 Tue, 29 Jun 2021 07:06:05 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id c8sm17755226wri.91.2021.06.29.07.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 07:06:04 -0700 (PDT)
Date: Tue, 29 Jun 2021 15:06:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>, babu.moger@amd.com,
 wei.huang2@amd.com
Subject: Re: [PATCH] target/i386: Fix cpuid level for AMD
Message-ID: <YNsoyqFvzXL0FXC8@work-vm>
References: <20210628132018.394994-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210628132018.394994-1-pizhenwei@bytedance.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: ehabkost@redhat.com, like.xu@linux.intel.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, armbru@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* zhenwei pi (pizhenwei@bytedance.com) wrote:
> A AMD server typically has cpuid level 0x10(test on Rome/Milan), it
> should not be changed to 0x1f in multi-dies case.
> 
> Fixes: a94e1428991 (target/i386: Add CPUID.1F generation support
> for multi-dies PCMachine)
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>

(Copying in Babu)

Hmm I think you're right.  I've cc'd in Babu and Wei.

Eduardo: What do we need to do about compatibility, do we need to wire
this to machine type or CPU version?

Dave

> ---
>  target/i386/cpu.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index a9fe1662d3..3934c559e4 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5961,8 +5961,12 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
>              }
>          }
>  
> -        /* CPU topology with multi-dies support requires CPUID[0x1F] */
> -        if (env->nr_dies > 1) {
> +        /*
> +         * Intel CPU topology with multi-dies support requires CPUID[0x1F].
> +         * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should detect
> +         * extended toplogy by leaf 0xB. Only adjust it for Intel CPU.
> +         */
> +        if ((env->nr_dies > 1) && IS_INTEL_CPU(env)) {
>              x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
>          }
>  
> -- 
> 2.25.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


