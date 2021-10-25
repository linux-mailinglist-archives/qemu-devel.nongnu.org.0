Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C66E439470
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 13:04:59 +0200 (CEST)
Received: from localhost ([::1]:43258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexmk-0008L2-Kb
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 07:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mexjc-0006LD-SO
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:01:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mexja-00089H-Er
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635159701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bjd+5a6UoXb6Kp74Em0L4Nb+mlPY7BkjgZQ2qrMHhGs=;
 b=IPZyWoQYtTdJJFnbZH0uouLIs8eUam8d0rIFw5T4bgZTn4Yh7ruYK5FGJSGpMIrOREjNK/
 NmRSuwGYw4qy7wwU8qbHDNoi/Y/uIs1m4u+scF/37VUJ7y/NIJJVPvh/ItFdtCfmnC8A6e
 sLH5BAQr6NQB4p4Vpke3L9OgRxxE2PY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-2zqN50wxMzCBeJvnkrLeGw-1; Mon, 25 Oct 2021 07:01:39 -0400
X-MC-Unique: 2zqN50wxMzCBeJvnkrLeGw-1
Received: by mail-wm1-f71.google.com with SMTP id
 b197-20020a1c1bce000000b0032ca040eb40so3035355wmb.7
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 04:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bjd+5a6UoXb6Kp74Em0L4Nb+mlPY7BkjgZQ2qrMHhGs=;
 b=sN1+J5QHKHBAuw9irg6DRiMjEFd5n/KcH1HP6nABELluv14s+3Pn2p1qTyU+6C1c7U
 S0vSR/bVu04c0W9avvhf0/L7vbAATwYRngHmcTsZykVTeiWmRS3pqDE9OtszwPaA387r
 RQ1gdWoJQX3xXCHXkyiMHB9eRjhyvsPggwaLyE6lgM0kZq0/KYhgYOJLht0jGFJsJemy
 9im6L/e0uxJeXGJdztzrwAXitTb+fmaHq76qoee87GOGH3QlVwG7XdHbK4u3X7sr0mCn
 O8Ftu/BIvmMm9Hz3Bi44Ly0k++7zp0w+ITFALMDMFL0zFm2G1Yok4V/r1yk5qgr/W/ae
 rJiw==
X-Gm-Message-State: AOAM530e9ci22D2hXxrASMmgDj/oi8PdrD7jIaFkkQ8oBalEt1j2pRi7
 Wh2L00Yw+4i83GmJwKtX4r2iKObZTuGSCu5bshSwANJwLbhhgGGFcm0UDWVvCQiRX8fJpmdvuvp
 Qx+aNiyFARt/7jmg=
X-Received: by 2002:a05:6000:8a:: with SMTP id
 m10mr22279028wrx.115.1635159697917; 
 Mon, 25 Oct 2021 04:01:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjD0sr3B0oXQYUtLmh617vyHPEmWt/27RnuqXmuWgwT2P8gu+z1v5utRs+985lec/HSI5Czg==
X-Received: by 2002:a05:6000:8a:: with SMTP id
 m10mr22278991wrx.115.1635159697621; 
 Mon, 25 Oct 2021 04:01:37 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o11sm22950237wry.0.2021.10.25.04.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 04:01:37 -0700 (PDT)
Message-ID: <3ff66c29-7377-3fb5-a317-50e5a12eeea6@redhat.com>
Date: Mon, 25 Oct 2021 13:01:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] block/export/fuse.c: fix musl build
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, qemu-devel@nongnu.org
References: <20211022095209.1319671-1-fontaine.fabrice@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211022095209.1319671-1-fontaine.fabrice@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/21 11:52, Fabrice Fontaine wrote:
> Include linux/falloc.h if CONFIG_FALLOCATE_ZERO_RANGE is defined to fix
> https://gitlab.com/qemu-project/qemu/-/commit/50482fda98bd62e072c30b7ea73c985c4e9d9bbb
> and avoid the following build failure on musl:
> 
> ../block/export/fuse.c: In function 'fuse_fallocate':
> ../block/export/fuse.c:643:21: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
>   643 |     else if (mode & FALLOC_FL_ZERO_RANGE) {
>       |                     ^~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/be24433a429fda681fb66698160132c1c99bc53b

The 2 previous lines aren't really helpful, however this is:

Fixes: 50482fda98b ("block/export/fuse.c: fix musl build")

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  block/export/fuse.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/block/export/fuse.c b/block/export/fuse.c
> index 2e3bf8270b..823c126d23 100644
> --- a/block/export/fuse.c
> +++ b/block/export/fuse.c
> @@ -31,6 +31,10 @@
>  #include <fuse.h>
>  #include <fuse_lowlevel.h>
>  
> +#if defined(CONFIG_FALLOCATE_ZERO_RANGE)
> +#include <linux/falloc.h>
> +#endif
> +
>  #ifdef __linux__
>  #include <linux/fs.h>
>  #endif
> 

With 'Fixes:' tag:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


