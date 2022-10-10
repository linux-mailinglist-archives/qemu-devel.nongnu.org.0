Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459365F9CEE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 12:38:17 +0200 (CEST)
Received: from localhost ([::1]:51830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohqAq-0000zD-3K
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 06:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ohq7n-000616-Ly
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 06:35:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ohq7j-0006Qn-9X
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 06:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665398102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JI2wOF3PUC4CwxDHCoTr4ahYEEwSE5si9zcy8V1dt+U=;
 b=A02Y2y05XVy1mjsX+otZ1rUSFFlKkqPqRgwYxDDOgyD7k3bLNkZPsgFHadf02P9PMUZzNw
 PLFSywnvQBkzeympYd7mLpxYEDpb6uIkI26u5PN89kguOW2hPCAglPtABXcx6wXksOMwrC
 IjIXOjw1EFYqg+ed5neH+yMMML9eLkc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-365-rmd7h_9XNqCaQ_m0565dyg-1; Mon, 10 Oct 2022 06:35:00 -0400
X-MC-Unique: rmd7h_9XNqCaQ_m0565dyg-1
Received: by mail-wm1-f70.google.com with SMTP id
 h10-20020a1c210a000000b003c56437e529so204888wmh.2
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 03:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JI2wOF3PUC4CwxDHCoTr4ahYEEwSE5si9zcy8V1dt+U=;
 b=ZZ6fkMuOkaQPo4ReT9ujHVcOtthrvVvogS/hCRtmILRwRBxxZG9BPJmign2KqSique
 hFCiZ5T513WDs2GPxTuy9SGumaXZ9n6Eamy0iyPICXAjBku3xhic39l6ldRJ4D6N6vgV
 JtRBx2BRw/sCtOOzXzba0vQGjJhx9M9/Z0mQEE+GYMly/ETUDUIbOA7z+F4P6xLL+Zl/
 JI9g1aLujTACvHFrpeIAdD6oJkhxcT3i+EyWVh9v+5sbbOFn5EYcxrK+7xWkFyioi4nO
 ychsvzNrZQiJtOBB4NiHoh5RIvpD3N22mdU5uezk1Wt5dqJ+M1HUR7g3WC4dkMpHcmaS
 PeWg==
X-Gm-Message-State: ACrzQf1yVRNdzXqTblxVTX2i5o5k2oRKMsPrM9O7sMY9epv/qVFUGPq8
 ucISQMReaIH96UCBdMUotlAlCVUpFWXI73LqkYRWlDgigcqK8lGj4UC/5Pk4iM2kl0Kw0+b58zX
 RGBGKuRoaffUjJAo=
X-Received: by 2002:a05:600c:35c5:b0:3b4:bf50:f84a with SMTP id
 r5-20020a05600c35c500b003b4bf50f84amr11792149wmq.22.1665398099768; 
 Mon, 10 Oct 2022 03:34:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6UQ//cxSZv2SquSaFJ+6DDhDPqLDKujMS+M0MuCT8EXx8Tq0AQE+rfkw+zUzIedkui0aoAzw==
X-Received: by 2002:a05:600c:35c5:b0:3b4:bf50:f84a with SMTP id
 r5-20020a05600c35c500b003b4bf50f84amr11792133wmq.22.1665398099544; 
 Mon, 10 Oct 2022 03:34:59 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b003c1a7ea3736sm11618115wmq.11.2022.10.10.03.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 03:34:58 -0700 (PDT)
Date: Mon, 10 Oct 2022 11:34:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Subject: Re: [PATCH] migration: Fix the minus value for compressed_size
Message-ID: <Y0P1UV3UxZGvBADu@work-vm>
References: <20221010093415.2779165-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010093415.2779165-1-zhenzhong.duan@intel.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Zhenzhong Duan (zhenzhong.duan@intel.com) wrote:
> When update_compress_thread_counts() is called first time, there is
> no data stream yet. We see compression_counters.compressed_size
> becomes minus value shortly.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  migration/ram.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index dc1de9ddbc68..510db95cdc36 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1443,6 +1443,10 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
>  static void
>  update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
>  {
> +    if (bytes_xmit <= 0) {
> +        return;
> +    }

What's the call path where that happens? The only place I see
bytes_xmit being less than 0 is in compress_page_with_multi_thread where
it's initialised to -1 - but it's always updated before the call
to update_compress_thread_counts.

I wonder if the real problem is:

    compression_counters.compressed_size += bytes_xmit - 8;

Is bytes_xmit being less than 8 for some reason?

Dave

>      ram_transferred_add(bytes_xmit);
>  
>      if (param->zero_page) {
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


