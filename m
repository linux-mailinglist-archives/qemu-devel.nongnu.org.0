Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0811057CA4A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 14:09:58 +0200 (CEST)
Received: from localhost ([::1]:59434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEV08-0005rf-G6
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 08:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oEUxl-0000yo-Gn
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:07:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oEUxi-0000tx-RV
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:07:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658405246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3oVBfFYspm/zZbUizCV67vvrykCPPOqKB5Gts3hwFOw=;
 b=g8WM0en/CaGaC/TWgisBCtwdJwsdZcD0Mjq49XOIRPOvUCAfS0qQ9oHcIIVcYuRCVWW0Yq
 K23+cWzekERjV5FL9FaQ7HB25ajO4KrP+HsLlw9ND9RjS3a5YH/i4J6cDPA6Ri6U6h5ASI
 +ZWNDvQT2TSwx2BBeNtLeXamCIlX/jc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-nZvCkdENN7emFLw6HIXx2A-1; Thu, 21 Jul 2022 08:07:25 -0400
X-MC-Unique: nZvCkdENN7emFLw6HIXx2A-1
Received: by mail-wm1-f71.google.com with SMTP id
 189-20020a1c02c6000000b003a2d01897e4so921881wmc.9
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 05:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3oVBfFYspm/zZbUizCV67vvrykCPPOqKB5Gts3hwFOw=;
 b=gm2HaZlAgrq+VgtviOm7zSo+2f9n58dj6a5GqVEy44LJ2nwmijbMNKSRGwDD+19SxK
 3BWWNlTOByEFEZ5qc0wIYcIYX2GII5Pb4DNDX0q2HTjS6OVMAKJtXRqK0HmCg9A+EbRi
 PmKDJL8j6iDReBahkrinhC7sYXheInFNkphKT73C3cnD8NQGqjBkp/KS6UObcUHJ5L18
 z/3CY2sdKLtJDL8A9U1tItOsoBApEiZByRUbthQhQ/mX/3lCaVR2IrpevK5ZJXfsnR8f
 4vKoYTtX0ChygxxoVyEBFzbnMGb2k3TxvRQKLKLF9K8RGUenxbLj/1Ttop6YfGHntd2u
 y0zQ==
X-Gm-Message-State: AJIora/oCEtgKM9RxHaWPgcGNszCGmu4DZFjWOzLMsmwgdOMz15XGTpj
 niDHeYtuUBjqvZbet8JmWC1KRg2YeVRJKGuHU+yZfPCUyHyKVWkodrPaevxvI236odM6nMFl/YF
 KexpJtBE/dcRHrYc=
X-Received: by 2002:a5d:4911:0:b0:21d:6c60:978e with SMTP id
 x17-20020a5d4911000000b0021d6c60978emr35777625wrq.615.1658405243576; 
 Thu, 21 Jul 2022 05:07:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uGKlDLZlADhC6xuS7q0mFMwJaOjQ/sDhYv54iT3Us/Y9fxvhHoWTmjl3EkIceVX9KguFUDxw==
X-Received: by 2002:a5d:4911:0:b0:21d:6c60:978e with SMTP id
 x17-20020a5d4911000000b0021d6c60978emr35777590wrq.615.1658405242999; 
 Thu, 21 Jul 2022 05:07:22 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c4fd400b003a305c0ab06sm6190634wmq.31.2022.07.21.05.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 05:07:22 -0700 (PDT)
Date: Thu, 21 Jul 2022 13:07:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 2/2] migration: Define BLK_MIG_BLOCK_SIZE as unsigned
 long long
Message-ID: <YtlBeDapF2xxtqbJ@work-vm>
References: <20220721115207.729615-1-peter.maydell@linaro.org>
 <20220721115207.729615-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721115207.729615-3-peter.maydell@linaro.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

* Peter Maydell (peter.maydell@linaro.org) wrote:
> When we use BLK_MIG_BLOCK_SIZE in expressions like
> block_mig_state.submitted * BLK_MIG_BLOCK_SIZE, this multiplication
> is done as 32 bits, because both operands are 32 bits.  Coverity
> complains about possible overflows because we then accumulate that
> into a 64 bit variable.
> 
> Define BLK_MIG_BLOCK_SIZE as unsigned long long using the ULL suffix.
> The only two current uses of it with this problem are both in
> block_save_pending(), so we could just cast to uint64_t there, but
> using the ULL suffix is simpler and ensures that we don't
> accidentally introduce new variants of the same issue in future.
> 
> Resolves: Coverity CID 1487136, 1487175
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I haven't tried to analyse the code to see if the multiplications
> could ever actually end up overflowing, but I would assume
> probably not.
> 
>  migration/block.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/block.c b/migration/block.c
> index 9e5aae58982..3577c815a94 100644
> --- a/migration/block.c
> +++ b/migration/block.c
> @@ -28,7 +28,7 @@
>  #include "sysemu/block-backend.h"
>  #include "trace.h"
>  
> -#define BLK_MIG_BLOCK_SIZE           (1 << 20)
> +#define BLK_MIG_BLOCK_SIZE           (1ULL << 20)

Is it a problem that this is passed to bdrv_create_dirty_bitmap that
takes a uint32_t ?

Dave

>  #define BDRV_SECTORS_PER_DIRTY_CHUNK (BLK_MIG_BLOCK_SIZE >> BDRV_SECTOR_BITS)
>  
>  #define BLK_MIG_FLAG_DEVICE_BLOCK       0x01
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


