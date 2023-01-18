Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FEE67277D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 19:52:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIDXq-0003To-Lh; Wed, 18 Jan 2023 13:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pIDWp-0003MB-No
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:51:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pIDWk-0007lM-Fb
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674067873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UOT1j3LnF8cx4vrYYvfhVApZy07HtYo4YgwqruRD6uk=;
 b=Xf+6tdDoDW1wkRlNhNapPtuf8tv1S4ZujSVx5lHBEwWZ5er/7GPjImQ3VTI8o+RjmrtRdw
 0B4TdoXVhtxRAJPWE9cnZGsTlJsjQzjgkzBmspVlMn87AYUjhd1EPIrClowPlzKYIeV/Dw
 007kbWxWY+JFnHqBoV0RSzQROr4EgFI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-ySQZ2NMTOPG9Dtzc12ojIA-1; Wed, 18 Jan 2023 13:51:11 -0500
X-MC-Unique: ySQZ2NMTOPG9Dtzc12ojIA-1
Received: by mail-wr1-f70.google.com with SMTP id
 v20-20020adfc5d4000000b002bdfcdb4c51so2530381wrg.9
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 10:51:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UOT1j3LnF8cx4vrYYvfhVApZy07HtYo4YgwqruRD6uk=;
 b=nktasrPnniop7M98KCRaKTaHRcWx6qAPCA5ixcZ+4LRJtmCfrYmy++okjRMpDM9QJn
 JwVXLpa6L4S/WPgqrBSsu7UQrVPu/X150kOWLsH1Mpx8YY0C/domIZDs8l8u6o+GZK7K
 qrlfBsqMPxf+GHxF2rcIC+bPnGs/26dPGQFsxAGO7ANEq2Vk+Q6zLhPutO7N4507hP6A
 j269kOBBMJOEaChTiN24AvCV2hhTqiHDspYCirfU7r4lf2J7eFSADgx1aUIojZaEQnDv
 7O8cgacXySPo8EyBq0xxgM06cvpXFOeqcyr03rTUDD8qgZjK4uJksfxrQNOl4bGyHC3a
 pPLw==
X-Gm-Message-State: AFqh2kpfthq72CMxwhlDofP43CBc7+KshBmNgkHOQ2NPgczL5Hvbbulk
 5ccEZ4iRsU22/vwAex8CwgQWj0/kD+hLyC2uvUtxLqmZZFu3fvQhvLQMRq5LXwwNnwwv/lASnHx
 tCLQkGRXJVYK4L30=
X-Received: by 2002:adf:ef11:0:b0:2bb:dd87:3485 with SMTP id
 e17-20020adfef11000000b002bbdd873485mr7104885wro.30.1674067870117; 
 Wed, 18 Jan 2023 10:51:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtguxv3RsEfYalAL8+nf4m+YcdS9y91k0J3+BrwcO71suGfUEchePLkhaSxgwnQxlL/zjKfsA==
X-Received: by 2002:adf:ef11:0:b0:2bb:dd87:3485 with SMTP id
 e17-20020adfef11000000b002bbdd873485mr7104878wro.30.1674067869975; 
 Wed, 18 Jan 2023 10:51:09 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 a10-20020adfdd0a000000b002bb6b45ab57sm29988664wrm.85.2023.01.18.10.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 10:51:09 -0800 (PST)
Date: Wed, 18 Jan 2023 18:51:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 06/21] madvise: Add QEMU_MADV_COLLAPSE
Message-ID: <Y8g/myM8JfJHB4S7@work-vm>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-7-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117220914.2062125-7-peterx@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Peter Xu (peterx@redhat.com) wrote:
> MADV_COLLAPSE is a new madvise() on Linux.  Define it.

I'd probably have merged this with the MADV_SPLIT one since they go
together; but also, it would be good in the commit message
for Qemu to include either the definition or a pointer to the kernel
definiton of them.

Dave

> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/qemu/madvise.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/qemu/madvise.h b/include/qemu/madvise.h
> index 3dddd25065..794e5fb0a7 100644
> --- a/include/qemu/madvise.h
> +++ b/include/qemu/madvise.h
> @@ -68,6 +68,11 @@
>  #else
>  #define QEMU_MADV_SPLIT QEMU_MADV_INVALID
>  #endif
> +#ifdef MADV_COLLAPSE
> +#define QEMU_MADV_COLLAPSE MADV_COLLAPSE
> +#else
> +#define QEMU_MADV_COLLAPSE QEMU_MADV_INVALID
> +#endif
>  
>  #elif defined(CONFIG_POSIX_MADVISE)
>  
> @@ -83,6 +88,7 @@
>  #define QEMU_MADV_REMOVE QEMU_MADV_DONTNEED
>  #define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
>  #define QEMU_MADV_SPLIT QEMU_MADV_INVALID
> +#define QEMU_MADV_COLLAPSE QEMU_MADV_INVALID
>  
>  #else /* no-op */
>  
> @@ -98,6 +104,7 @@
>  #define QEMU_MADV_REMOVE QEMU_MADV_INVALID
>  #define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
>  #define QEMU_MADV_SPLIT QEMU_MADV_INVALID
> +#define QEMU_MADV_COLLAPSE QEMU_MADV_INVALID
>  
>  #endif
>  
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


