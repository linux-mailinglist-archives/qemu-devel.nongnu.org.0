Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50F851F4EC
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 09:14:58 +0200 (CEST)
Received: from localhost ([::1]:44756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnxbd-0000M3-GD
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 03:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nnxZi-00081P-Db
 for qemu-devel@nongnu.org; Mon, 09 May 2022 03:12:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nnxZf-0006Y3-NP
 for qemu-devel@nongnu.org; Mon, 09 May 2022 03:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652080373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IiQrUU1xzZxKy1N58bkfa31jols+iey8DEnhUE57dHc=;
 b=ET4/oZ1QVkSlJ3fZ8/v8eSeeKY09M2RqUbihE/ETp3gVcAlkDdiY9CFdfCiSNYPIyRvua8
 luAcqKULLX2Nm+BIiphx1OVuo+pp99TV4SDOt94UKKyAojAMr/DLutxQJd0OLMZsV/hSi5
 HVXsGD7gndvs+LLxNLYL0zJdJO/lxbM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-aNHCtPN5MAOnS9RwllPoRg-1; Mon, 09 May 2022 03:12:52 -0400
X-MC-Unique: aNHCtPN5MAOnS9RwllPoRg-1
Received: by mail-ed1-f71.google.com with SMTP id
 s24-20020a05640217d800b00425e19e7deaso7750561edy.3
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 00:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IiQrUU1xzZxKy1N58bkfa31jols+iey8DEnhUE57dHc=;
 b=HD25nLNAVSTv6KEstcO94iP+0vylGo22vsDNehGhVrwcylPKuX350CWEbrVvF35l5x
 dpmm74MPQrAAD7jmvyjIimgD1X6SV0S+W2JuZJfjip5uPFpgrKMU44AH8Poi2wVoqMIq
 AdR3hnTrkF9X5ZuWTsF7AOzzoNbRDGAfh/KtGJ/wvSKT35fcE16zD0/V6xEN0t9/eiyR
 kfckqN3SedMXz2RJFicQZr3HUXAfABXAXH2WngJrr0A43LWSKi8But7hMW0k10pcsHdC
 UvS5TEcfT+r471tXxbyBCNID47/t0Yeq8xrd01aG2HSNz15ljbm/6V369JE7cwYCIB/Z
 Z7vA==
X-Gm-Message-State: AOAM531vsrlPl5rIl6LvH5+fS1o4xkfOQtsPCeFVBPUrHrGhtE+U/B9r
 yDQy6UuSWxOBTVVO+F4R70B1ESLOFadZ34+fF4h1c5rIES6c8Vd1XuIKPCLLPyvYpj/4Kx99x2v
 7ansmK2+I/lVcVR4=
X-Received: by 2002:a05:6402:2714:b0:427:b9bb:a179 with SMTP id
 y20-20020a056402271400b00427b9bba179mr16092741edd.102.1652080371585; 
 Mon, 09 May 2022 00:12:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz01J35/TLH/OzcrSnIT8gx5ih7cUoeFf4QnP4jaBBdwpSJd6VCvOWIDj5Qsle8qX39/XdUcg==
X-Received: by 2002:a05:6402:2714:b0:427:b9bb:a179 with SMTP id
 y20-20020a056402271400b00427b9bba179mr16092715edd.102.1652080371283; 
 Mon, 09 May 2022 00:12:51 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 wi7-20020a170906fd4700b006f3ef214dd4sm4690788ejb.58.2022.05.09.00.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 00:12:50 -0700 (PDT)
Date: Mon, 9 May 2022 09:12:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: <qemu-devel@nongnu.org>, <marcel.apfelbaum@gmail.com>, <mst@redhat.com>,
 <pbonzini@redhat.com>, <richard.henderson@linaro.org>,
 <eduardo@habkost.net>, <jon.grimm@amd.com>
Subject: Re: [PATCH] pc: q35: Bump max_cpus to 512
Message-ID: <20220509091249.392fdab6@redhat.com>
In-Reply-To: <20220504131639.13570-1-suravee.suthikulpanit@amd.com>
References: <20220504131639.13570-1-suravee.suthikulpanit@amd.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 4 May 2022 08:16:39 -0500
Suravee Suthikulpanit <suravee.suthikulpanit@amd.com> wrote:

> This is the maximum number of vCPU supported by
> the AMD x2APIC virtualization.
> 
> Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
> ---
>  hw/i386/pc_q35.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 302288342a..e82b1c690d 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -357,7 +357,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
> -    m->max_cpus = 288;
> +    m->max_cpus = 512;

Maybe we should bump it to KVM VCPU maximum,
and make sure we error out if asked for combination of
hardware/irqchip is not usable.


>  }
>  
>  static void pc_q35_7_1_machine_options(MachineClass *m)


