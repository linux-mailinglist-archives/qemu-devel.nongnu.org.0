Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F294A4BC9
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:21:53 +0100 (CET)
Received: from localhost ([::1]:50494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZRA-0004sm-Ai
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:21:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nEZ5p-0004kV-7b
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:59:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nEZ5k-0004Cz-RS
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643644783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sYAAG9sJWNXlGL03Gi0NkUm02lL4CA3To8NqIppTjPQ=;
 b=WL3+UMkDVy2UjM5uLdUAZpt7Bqt9M2txdMGzGlD8URQpaZ3YLtl6vKE/qJWBmfUkxCLdD4
 nDObf6TeJ95ShG06aTsiZX3fiTAAa3r+FOrQin1siZfJCgv9pcrlqJ1J6VAR6nXngDsTJO
 r0B6kbsbnl+Y06wRZHq/2BXFC6SFWOA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-NaeZ3tiKOJeeegIbk2n4-A-1; Mon, 31 Jan 2022 10:59:40 -0500
X-MC-Unique: NaeZ3tiKOJeeegIbk2n4-A-1
Received: by mail-ed1-f71.google.com with SMTP id
 o5-20020a50c905000000b00403bbdcef64so6703631edh.14
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 07:59:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sYAAG9sJWNXlGL03Gi0NkUm02lL4CA3To8NqIppTjPQ=;
 b=TRwmbXpLIoFhb0Ra1x/5QV9hw14wiQH1sr8DWrNcT7pzg0OnmrZU5OmoKf3oPSE8wp
 rcUsUMfWgiJJsA/pX3mYEigQHHsAyFwHnYVlmF7wXNNFfmU0KIObspuhcpGnbjhiIQkl
 /eyQxWaySi/rOEFnLjB0UzbuD1GwDwGb+dI+oN4icCmexLKWdWSiHkpeouR6rp4WKlGZ
 1/S6rZsr2r7BE3yMKfj3V377DdJTjSc5xc1XX+YepJCHf2olgR30C1aIhJoxadCG51GM
 ZL5sJMHB9F0N4nRSONksm9S2OruXf4OpuFkJBtMlGnhVk2nkh8ClDkYO0KFE43/gk2IW
 a1Jg==
X-Gm-Message-State: AOAM530F5TIEgr2fozirUc0Cv4SemyaRzIDs/YAo9h7L8E6zBwLS5FYb
 LKk9YbgguzVSN1VEPEdw3VuXq/r3xZo7FLt8FWQMGVknbuwFSbGJlb/9MOuSJx0nOD8Vm7jQH89
 b6RdE0ygq3C+lxdY=
X-Received: by 2002:a17:907:1690:: with SMTP id
 hc16mr18471033ejc.333.1643644779404; 
 Mon, 31 Jan 2022 07:59:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsAR8yrKkhtImb74DqxGlQCILrswSh9/6K7rt1Jkls4gsN0VF6KJ/9So33zhyyDPMiRlvslA==
X-Received: by 2002:a17:907:1690:: with SMTP id
 hc16mr18471006ejc.333.1643644779110; 
 Mon, 31 Jan 2022 07:59:39 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id gg14sm13585780ejb.63.2022.01.31.07.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 07:59:38 -0800 (PST)
Date: Mon, 31 Jan 2022 16:59:36 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 2/2] tests/qtest: Special case sbsa-ref and
 xlnx-versal-virt if !CONFIG_ARM_GIC_TCG
Message-ID: <20220131155936.lm7jn32ihb2ndsf7@gator>
References: <20220131154531.429533-1-eric.auger@redhat.com>
 <20220131154531.429533-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220131154531.429533-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 04:45:31PM +0100, Eric Auger wrote:
> qom-test and test-hmp shall not run tests on sbsa-ref and
> xlnx-versal-virt if CONFIG_ARM_GIC_TCG is unset as those machines
> always instantiate GICv3.
> 
> Otherwise the tests fail with
> ERROR:../qom/object.c:715:object_new_with_type: assertion failed: (type != NULL)
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Fixes: a8a5546798c3 ("hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector")
> ---
>  tests/qtest/libqtest.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 41f4da4e54..f53983a28e 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -1394,6 +1394,12 @@ void qtest_cb_for_every_machine(void (*cb)(const char *machine),
>              g_str_equal("xenpv", machines[i].name)) {
>              continue;
>          }
> +#ifndef CONFIG_ARM_GIC_TCG
> +        if (!strncmp("sbsa-ref", machines[i].name, 8) ||
> +            !strncmp("xlnx-versal-virt", machines[i].name, 16)) {
> +            continue;
> +        }
> +#endif

Hmm, if these machine types completely depend on userspace gicv3
emulation, i.e. no way to use in-kernel gic or another tcg gic
model, then I guess they shouldn't be built at all when ARM_GIC_TCG
isn't configured. I.e.

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2e0049196d6c..d7cc028b049d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -209,6 +209,7 @@ config REALVIEW
 
 config SBSA_REF
     bool
+    depends on ARM_GIC_TCG
     imply PCI_DEVICES
     select AHCI
     select ARM_SMMUV3
@@ -378,6 +379,7 @@ config XLNX_ZYNQMP_ARM
 
 config XLNX_VERSAL
     bool
+    depends on ARM_GIC_TCG
     select ARM_GIC
     select PL011
     select CADENCE


Thanks,
drew

>          if (!skip_old_versioned ||
>              !qtest_is_old_versioned_machine(machines[i].name)) {
>              cb(machines[i].name);
> -- 
> 2.26.3
> 


