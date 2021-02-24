Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1716B32472E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 23:55:55 +0100 (CET)
Received: from localhost ([::1]:42104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF34T-0003Am-Qh
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 17:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lF32R-0002Hc-Hd
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:53:48 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lF32P-0000UU-MI
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:53:47 -0500
Received: by mail-wr1-x432.google.com with SMTP id v1so3413209wrd.6
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 14:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=OyNFwRqHRBVpAGK1YTrrlzvhueUuW3vMZT2fUmQYp8o=;
 b=ys8x6I0roemPQ12tTqD1I7nV15qA2uOsDQuyUXKLpJA8x92S22BcZdgovKC6auqE6k
 I0s3/OB0nmR16zxvQ7LKkhlSrHINZYsvtQxhM5BSVg4uK0wqnH/pUPOeXBovERSzdF1w
 xx4iLwjlQqNf3MWcvN6jlpojsayQAjAu3l2KIp9TxqRHYNM5CCvlgBLpV8ImOwJ0jdds
 gS1/Y6yA/z0rKSTA9ICyG084KGillt3j0MTdASASBZRdjeoavU5+/v/rJo8Xd6lYFWvZ
 k+b93mR7fb/dPhru3itIxYai9Ba8MQs/jwkP9NaygfKIh5gW/aXTFTA/E+cPN6uH8lXe
 8ptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=OyNFwRqHRBVpAGK1YTrrlzvhueUuW3vMZT2fUmQYp8o=;
 b=FzXEijnmAsrW4jOyxXD6v66eXglP3Q0O7ZbVnZwMB1uDoRaWLCCfHR5DB12TXGEx/y
 99VUC83kC6BsrzjiJAA4WXyIFKX72V9km5xVlOjCiqiVH5ewaHyHGTzbyyOcCwoY0W3j
 jBt1RC1QbJDN4AzOzM3QxhiOxx0i7Yg6bi+KYnFwjDzOsW7omF6C7lFtlU6xTyW21aIT
 USVIjyv/kqc/UwpRJlld2+KDQypp8wvWPzQT3BRrphY7smcZeQa6SmdbUKeqU6RwIT0K
 UxXW3Rek/gwR5JjNR1SZCo07FGpV56MFCgtQBolndT4blIGruJiqU74Ei9PjituzxsnE
 RYdw==
X-Gm-Message-State: AOAM531SVOSs6fsMDSVSxv+xfz6XH2sOZtuP+EyBQWkR9VWFkZVY1bOD
 M0getblxgB0qkL1plIZV00GYwg==
X-Google-Smtp-Source: ABdhPJwUzGEKGlnJgXzYfhgRZlHSrPgN8nox3ZBTUW/ggC9YkjZ//K4W/Fr3bPsIYgZWXwO3rX85fg==
X-Received: by 2002:a05:6000:188c:: with SMTP id
 a12mr286383wri.105.1614207222854; 
 Wed, 24 Feb 2021 14:53:42 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id q20sm4746444wmc.14.2021.02.24.14.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 14:53:42 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id d32daa1c;
 Wed, 24 Feb 2021 22:53:41 +0000 (UTC)
To: Kunkun Jiang <jiangkunkun@huawei.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/3] migration/ram: Modify the code comment of
 ram_save_host_page()
In-Reply-To: <20210223021646.500-2-jiangkunkun@huawei.com>
References: <20210223021646.500-1-jiangkunkun@huawei.com>
 <20210223021646.500-2-jiangkunkun@huawei.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Wed, 24 Feb 2021 22:53:41 +0000
Message-ID: <cunim6haxhm.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::432;
 envelope-from=dme@dme.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-02-23 at 10:16:43 +08, Kunkun Jiang wrote:

> The ram_save_host_page() has been modified several times
> since its birth. But the comment hasn't been modified as it should
> be. It'd better to modify the comment to explain ram_save_host_page()
> more clearly.
>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  migration/ram.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/migration/ram.c b/migration/ram.c
> index 72143da0ac..fc49c3f898 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1970,15 +1970,16 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
>  }
>  
>  /**
> - * ram_save_host_page: save a whole host page
> + * ram_save_host_page: save a whole host page or the rest of a block
>   *
> - * Starting at *offset send pages up to the end of the current host
> - * page. It's valid for the initial offset to point into the middle of
> - * a host page in which case the remainder of the hostpage is sent.
> - * Only dirty target pages are sent. Note that the host page size may
> - * be a huge page for this block.
> - * The saving stops at the boundary of the used_length of the block
> - * if the RAMBlock isn't a multiple of the host page size.
> + * Starting at pss->page send pages up to the end of the current host
> + * page or the boundary of used_length of the block (if the RAMBlock
> + * isn't a multiple of the host page size). The min one is selected.
> + * Only dirty target pages are sent.
> + *
> + * Note that the host page size may be a huge page for this block, it's
> + * valid for the initial offset to point into the middle of a host page
> + * in which case the remainder of the hostpage is sent.

How about:

* Send dirty pages between pss->page and either the end of that page or
* the used_length of the RAMBlock, whichever is smaller.
*
* Note that if the host page is a huge page, pss->page may be in the
* middle of that page.

>   *
>   * Returns the number of pages written or negative on error
>   *
> -- 
> 2.23.0

dme.
-- 
I'm in with the in crowd, I know every latest dance.

