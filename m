Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E6B673673
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 12:13:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pISr8-0003aM-CV; Thu, 19 Jan 2023 06:13:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pISr4-0003a4-V5
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:13:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pISr3-00015z-KJ
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:13:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674126793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3TjRLsmgBPdDuG0cIgu1MZ+P5YyZBG5cdukKbkExQI=;
 b=bW0YknUf2tqDVrYU4VMpwll+zRZp0MdzYWl+pXTDSXtPDip5gJsmu9rQwGTR9ojXqM3NSi
 zSmvpfj9x/w+F3rsb41uyZ97m0TwmNVMVWHlDEyd4F701lD5QtRyWM1T9lnlabWVCAS+pw
 VnAIbzO6uI7JwOdodeQtyXhwIvj41IA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-322-c-8wqCvAMDmcdMeUbqfuRw-1; Thu, 19 Jan 2023 06:13:11 -0500
X-MC-Unique: c-8wqCvAMDmcdMeUbqfuRw-1
Received: by mail-wr1-f71.google.com with SMTP id
 o11-20020adf8b8b000000b002be143c4827so292954wra.19
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 03:13:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L3TjRLsmgBPdDuG0cIgu1MZ+P5YyZBG5cdukKbkExQI=;
 b=sFodIoaLy5lfgt+13Tc0ITuX7WmkFPkKme1MOpJG+TrjAR63XEWFJqsrFexywPrp6v
 MK9zCk3vEcgZWHOm06S5Flxh1Syf1CWvvsGAz637/0TOtUnJpe7PiDhMCxl/O+1G6vU/
 OuIC6wzt/12ylmq/Yg+Cmx5l7a4CwsOuH9iBDTiFywRy2/swCTXH0RlrVzPUzRMcRV/q
 pIWEBOlNKtsoSOwmz7vlRJL2lNhU3wNf9/dE98ilRKym0bAqUR/duexq/bav2CREseZl
 W4kHdVDgrwCpdCHGWxRynT5bVvhD2WVkli0AjL1kMlHDYZdCtEJC4GaHzqrEuiXtuSjA
 mzEw==
X-Gm-Message-State: AFqh2koqaqdxJ90r5GzD+UdrR+dK6r3rWYnM4hBdVUSwB5MSUavjUdYd
 4RVLtYTR7PF0owiRUAP3rjfkuVA7rCPxwGhyJfU5epbLBZsNYGLgioCCEJh6K2p+dQ9WHhD4Pkz
 Cr2YJyv6GTo4hCcc=
X-Received: by 2002:a05:600c:6001:b0:3da:f80a:5e85 with SMTP id
 az1-20020a05600c600100b003daf80a5e85mr9737376wmb.26.1674126790691; 
 Thu, 19 Jan 2023 03:13:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvHBby2whC6noUXCCt60y+zO/dff+8RIed7Pdjwu/NH6iCcpb4PA6U3ZeECqutpIugwRm/omw==
X-Received: by 2002:a05:600c:6001:b0:3da:f80a:5e85 with SMTP id
 az1-20020a05600c600100b003daf80a5e85mr9737353wmb.26.1674126790404; 
 Thu, 19 Jan 2023 03:13:10 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a1cf207000000b003db11dfc687sm4448660wmc.36.2023.01.19.03.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 03:13:10 -0800 (PST)
Date: Thu, 19 Jan 2023 11:13:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 8/8] tests/qtest/migration-test: Allow running with HVF
Message-ID: <Y8klwyh3fgmns+Wg@work-vm>
References: <20230119100537.5114-1-philmd@linaro.org>
 <20230119100537.5114-9-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230119100537.5114-9-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Philippe Mathieu-Daudé (philmd@linaro.org) wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Does it support migration? I don't remember anyone ever mentioning it.

Dave

> ---
>  tests/qtest/migration-test.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 1e7f1ea162..7a0fcfb81d 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -47,6 +47,7 @@ unsigned start_address;
>  unsigned end_address;
>  static bool has_tcg;
>  static bool has_kvm;
> +static bool has_hvf;
>  static bool uffd_feature_thread_id;
>  
>  /*
> @@ -614,6 +615,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>                                 args->use_dirty_ring
>                                 ? ",dirty-ring-size=4096" : "");
>      }
> +    if (has_hvf) {
> +        g_string_append(cmd_common, "-accel hvf ");
> +    }
>  
>      bootpath = g_strdup_printf("%s/bootsect", tmpfs);
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> @@ -2472,6 +2476,7 @@ int main(int argc, char **argv)
>  
>      has_tcg = qtest_has_accel("tcg");
>      has_kvm = qtest_has_accel("kvm");
> +    has_hvf = qtest_has_accel("hvf");
>  
>      g_test_init(&argc, &argv, NULL);
>  
> -- 
> 2.38.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


