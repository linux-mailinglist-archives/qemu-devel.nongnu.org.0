Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D3E3E43EF
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:28:46 +0200 (CEST)
Received: from localhost ([::1]:49434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD2WT-0001SX-7i
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD2Vc-0000ec-5Q
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:27:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD2VZ-00053O-6B
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:27:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628504867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GbUf33Fr4burprdMzIEnpgvBePBbkS8xXldrpZwkgj8=;
 b=NGfA/lpCxKDx/gVeAwQVF4t8x9T5q4YMxsy0cAFfqHQ3LHn7cZrk0SUbxU82FRW6cMxb08
 uEoQFf6koide9PieNNTnFMB8R/S0v82KqsTec9nMttYuJMvo8oLBqu8mYbRq44cizxTiNd
 6gtMhPJsuDcecRvjfiZ5c2Buc90QvGQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-8E1ZkveVMUqQEft12uTgvw-1; Mon, 09 Aug 2021 06:27:46 -0400
X-MC-Unique: 8E1ZkveVMUqQEft12uTgvw-1
Received: by mail-wm1-f70.google.com with SMTP id
 y6-20020a1c7d060000b02902e6946a8d1fso631730wmc.9
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 03:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GbUf33Fr4burprdMzIEnpgvBePBbkS8xXldrpZwkgj8=;
 b=pUoZgFk0MH1OKyKa5DyG1fPgV/WA7CdhE7DAfgU9Ye+6SYqCmCtJYiRq234/GTTlyE
 SmUu/QI4uvCTdOVVKpiWEtU7cJVGveS9Q+9vJGKuumjmwkaPcn3BORolwOAxCR2WpfY3
 6Xsdq7L+ZXwsIkO8JOGzk7D88EAVUiM7jM8mOhpewMD/C7PHUm+DsmsZSqRbQl2vaspv
 JQyxCfSso5gHUqw3sALg9mrz6y4Cz8+5QBa9mB7za8RmZHSZ2hAFF6zBJ+bCsc3EYlyN
 eOX8hS7aW9D0zaXYor+96ZR/Cy8yrT2nW47VqvFesFU6SRQvTLH2B+M4b/lW58qhdUau
 o0dg==
X-Gm-Message-State: AOAM532oR8KZNyumfOyCBzoMUicjExYjt7+kH/bbVWi8irEdCb36Rk5J
 qHwUzK153trVYBzbxIN3Re1GCME7dQ58h1X0UGILutOED/B6NLHQJyUxXN/TjT+MR4MknmERnXH
 IYh12QePuzN+XJcA=
X-Received: by 2002:adf:f4d2:: with SMTP id h18mr11686407wrp.37.1628504864927; 
 Mon, 09 Aug 2021 03:27:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGfDaWU3YqRtVyyRV2qZPWXdTWVGESsM0i561CYXODYfOhhc4adRH8tRxDurjXVqwavNc9Hg==
X-Received: by 2002:adf:f4d2:: with SMTP id h18mr11686390wrp.37.1628504864709; 
 Mon, 09 Aug 2021 03:27:44 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id h16sm19323224wre.52.2021.08.09.03.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 03:27:44 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 v2] block/export/fuse.c: fix musl build
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, qemu-devel@nongnu.org
References: <20210809095101.1101336-1-fontaine.fabrice@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <89081202-f46d-7345-1ddd-0c2f9418483d@redhat.com>
Date: Mon, 9 Aug 2021 12:27:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809095101.1101336-1-fontaine.fabrice@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Denis V. Lunev" <den@openvz.org>, Qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 11:51 AM, Fabrice Fontaine wrote:
> Fix the following build failure on musl raised since version 6.0.0 and
> https://gitlab.com/qemu-project/qemu/-/commit/4ca37a96a75aafe7a37ba51ab1912b09b7190a6b
> because musl does not define FALLOC_FL_ZERO_RANGE:
> 
> ../block/export/fuse.c: In function 'fuse_fallocate':
> ../block/export/fuse.c:563:23: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
>   563 |     } else if (mode & FALLOC_FL_ZERO_RANGE) {
>       |                       ^~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b96e3d364fd1f8bbfb18904a742e73327d308f64
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Philippe Mathieu-Daudé):
>  - Use CONFIG_FALLOCATE_ZERO_RANGE and make safer #ifdef'ry
> 
>  block/export/fuse.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/block/export/fuse.c b/block/export/fuse.c
> index ada9e263eb..fc7b07d2b5 100644
> --- a/block/export/fuse.c
> +++ b/block/export/fuse.c
> @@ -635,7 +635,9 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
>              offset += size;
>              length -= size;
>          } while (ret == 0 && length > 0);
> -    } else if (mode & FALLOC_FL_ZERO_RANGE) {
> +    }
> +#ifdef CONFIG_FALLOCATE_ZERO_RANGE
> +    else if (mode & FALLOC_FL_ZERO_RANGE) {
>          if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
>              /* No need for zeroes, we are going to write them ourselves */
>              ret = fuse_do_truncate(exp, offset + length, false,
> @@ -654,7 +656,9 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
>              offset += size;
>              length -= size;
>          } while (ret == 0 && length > 0);
> -    } else if (!mode) {
> +    }
> +#endif /* CONFIG_FALLOCATE_ZERO_RANGE */
> +    else if (!mode) {
>          /* We can only fallocate at the EOF with a truncate */
>          if (offset < blk_len) {
>              fuse_reply_err(req, EOPNOTSUPP);
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


