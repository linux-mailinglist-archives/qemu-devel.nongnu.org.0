Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DCD48AA44
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 10:14:41 +0100 (CET)
Received: from localhost ([::1]:41200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7DEm-0003eV-8z
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 04:14:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n7DCY-00027X-Qt
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:12:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n7DCW-0000Vs-2a
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641892334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iCkocHUD83AR5f25dhsh3y6fszmX4YGSGfqIppXzh54=;
 b=MTf+F48v6zql916+qLfNvHHCy2C1eJj8eBF3Xdu0ZNbtc4ySpxw1M2c+4KTqixj2JCMuZ3
 9qg9sy+v/kqZoTRKnDTsqlZgGd3MLnrtAab/LST2HPJoND0n8SN2YWOnVvBiTiq2y80uwW
 dma/Cz0M5135Dr4Mo0joCSIwGwJpWp4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-wUI6LnZCOkmTENdBSqCdHA-1; Tue, 11 Jan 2022 04:12:11 -0500
X-MC-Unique: wUI6LnZCOkmTENdBSqCdHA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c188-20020a1c35c5000000b00346a2160ea8so2890001wma.9
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 01:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iCkocHUD83AR5f25dhsh3y6fszmX4YGSGfqIppXzh54=;
 b=TM6rSjZnAAVrrGSSpui6nJh0SA6qSzDzbKJxt8P+7nOF81kDWJkLs6PE0hdcWaiMez
 Rplj73CRRpqooZgB5vef63SixWXqfPxuUfdzm2Asy9l9ciotc5SJf5ucoe0j5CkhwrfQ
 U8j2WphO5E0IafXoYOgv9VDipZD8YvJZ0G+A35LgyDt1kI/FtUNFCHjJyoG7tdG+JH8X
 4/1bBY/Gx0eYpU9myCF+aE/UBPwUaYT09HS6rivJRtGGkbdIMUcfiMVh6DxWzuSdkIEK
 iTeZxf8jWNWO09dgHpKeSWIHmhzAE7c7yID1h/gj/7kbK+PtqQZWKBmPobaG7mRvnvq4
 SIqA==
X-Gm-Message-State: AOAM531UwwqJqTlwkTOf7rD9l0eaZgGCGS3sTS3KUQTXaBMfxomZOsyJ
 wWQpXRBxukmcQSPQQV/zybNu8PIhS87Jjpap5EjMGgD+yfbPDx/DAdWSrIFCxm4ft02owQeBoNe
 64qmYqvdrXmr7bOg=
X-Received: by 2002:adf:f74e:: with SMTP id z14mr2884449wrp.713.1641892330328; 
 Tue, 11 Jan 2022 01:12:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysBaekcSRVTtT0yHSCcpBowt7l752M3ryUDuikOoMP57abCfeN80x811RTqbbCFzToz7RO5g==
X-Received: by 2002:adf:f74e:: with SMTP id z14mr2884425wrp.713.1641892330106; 
 Tue, 11 Jan 2022 01:12:10 -0800 (PST)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id j11sm8759485wrt.5.2022.01.11.01.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 01:12:09 -0800 (PST)
Date: Tue, 11 Jan 2022 10:12:08 +0100
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH] softmmu/device_tree: Remove redundant pointer assignment
Message-ID: <20220111091208.tyawoc3yrhxvm7lm@gator>
References: <20220111032758.27804-1-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220111032758.27804-1-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 11, 2022 at 11:27:58AM +0800, Yanan Wang wrote:
> The pointer assignment "const char *p = path;" in function
> qemu_fdt_add_path is unnecessary. Let's remove it and just
> use the "path" passed in. No functional change.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
> Based on: softmmu/device_tree: Silence compiler warning with --enable-sanitizers
> https://patchew.org/QEMU/20220107133844.145039-1-thuth@redhat.com/
> ---
>  softmmu/device_tree.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 9e96f5ecd5..8897c79ea4 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -556,7 +556,6 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>  int qemu_fdt_add_path(void *fdt, const char *path)
>  {
>      const char *name;
> -    const char *p = path;
>      int namelen, retval;
>      int parent = 0;
>  
> @@ -565,9 +564,9 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>      }
>  
>      do {
> -        name = p + 1;
> -        p = strchr(name, '/');
> -        namelen = p != NULL ? p - name : strlen(name);
> +        name = path + 1;
> +        path = strchr(name, '/');
> +        namelen = path != NULL ? path - name : strlen(name);
>  
>          retval = fdt_subnode_offset_namelen(fdt, parent, name, namelen);
>          if (retval < 0 && retval != -FDT_ERR_NOTFOUND) {
> @@ -584,7 +583,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>          }
>  
>          parent = retval;
> -    } while (p);
> +    } while (path);
>  
>      return retval;
>  }
> -- 
> 2.27.0
>

 
Reviewed-by: Andrew Jones <drjones@redhat.com>


