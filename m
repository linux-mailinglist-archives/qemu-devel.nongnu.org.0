Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ABB4DA93B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 05:16:20 +0100 (CET)
Received: from localhost ([::1]:35782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUL59-000407-Dx
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 00:16:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nUL3i-0003GB-0V
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 00:14:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nUL3e-0008Pu-LN
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 00:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647404085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pRfu7YRWK/ygvHPZuAYlpbw71KkKmLoWB3tcV8ztDgg=;
 b=UgWet7Z0kZGww+cTuHSu1PjRz0dn5lU/kqXOC4OJ012C6UOVhit6Aqu+J8IkybSuTfytB1
 68tcIgYwDxgfkDlDrxl8rs6y5uMYWQtjqcpqxJA/b+OS7xFFbm51l6ZZrmBDUxxyTUF5yn
 70vKAzJm0fRblitVi/H0Kakvokt1OhU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-MvTWmDjBMzSz7SG0kFb1gg-1; Wed, 16 Mar 2022 00:14:43 -0400
X-MC-Unique: MvTWmDjBMzSz7SG0kFb1gg-1
Received: by mail-pl1-f199.google.com with SMTP id
 n11-20020a170902d2cb00b0015331a5d02fso625378plc.12
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 21:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pRfu7YRWK/ygvHPZuAYlpbw71KkKmLoWB3tcV8ztDgg=;
 b=ZQ6YfHCAfwmr97lHlRTMpWVtE6AUfht52yGaOIIdXZP8x0z/mPFZ74LS62suxafLyC
 gfV9pM9zDofMQiy+UCkqIpnjSEhPTxMriyaRn9vk60TGoTS2NP5wM1htphzATiuqmLkX
 XZBgbjPKOH4GmWFNNm493hl08+CkqViM24clgRJ/stolKSm3ijNKWl01vnu+iAQ2qOaR
 baeZn6/7iON4Vcp8xAu3pvN10MFGfhyYKOehZIvEg1nOzcH4yvsGAgePhS0a7Wm9OuTg
 urZ/IWWtz+0FkMZ2UUDt3BBFl1lW6aYayF3M5yKoIAyjxAf5/UTni/7qG0X04CQRLMvX
 kD3Q==
X-Gm-Message-State: AOAM530JW01W4gFLPN05klwKdL1ViKKWfX61CuyvoK5U8QZ+mKtrH2wJ
 SjEM1dqKXZ2vPCdZgAP3zF1cSpEMPzRv5dxUIsCyRbzg+13Kydtlpy5oTHy3hQwBZYzSMCLvmku
 9ImzsHgGj/VF2yNo=
X-Received: by 2002:a63:fc0e:0:b0:365:39dd:2cd0 with SMTP id
 j14-20020a63fc0e000000b0036539dd2cd0mr27225651pgi.173.1647404082736; 
 Tue, 15 Mar 2022 21:14:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw1XUvrO2aCl2R+1LjU7vCf+Ssh+2KGZR6P30Ffa06ncbleTlayqLuw/VWH1Q0+yAMIxUz0Q==
X-Received: by 2002:a63:fc0e:0:b0:365:39dd:2cd0 with SMTP id
 j14-20020a63fc0e000000b0036539dd2cd0mr27225632pgi.173.1647404082479; 
 Tue, 15 Mar 2022 21:14:42 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.129])
 by smtp.gmail.com with ESMTPSA id
 lb4-20020a17090b4a4400b001b9b20eabc4sm800404pjb.5.2022.03.15.21.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 21:14:42 -0700 (PDT)
Date: Wed, 16 Mar 2022 12:14:37 +0800
From: Peter Xu <peterx@redhat.com>
To: Andrew Deason <adeason@sinenomine.net>
Subject: Re: [PATCH] softmmu/physmem: Use qemu_madvise
Message-ID: <YjFkLfnP/TPEe5sC@xz-m1.local>
References: <20220316040405.4131-1-adeason@sinenomine.net>
MIME-Version: 1.0
In-Reply-To: <20220316040405.4131-1-adeason@sinenomine.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 11:04:05PM -0500, Andrew Deason wrote:
> We have a thin wrapper around madvise, called qemu_madvise, which
> provides consistent behavior for the !CONFIG_MADVISE case, and works
> around some platform-specific quirks (some platforms only provide
> posix_madvise, and some don't offer all 'advise' types). This specific
> caller of madvise has never used it, tracing back to its original
> introduction in commit e0b266f01dd2 ("migration_completion: Take
> current state").
> 
> Call qemu_madvise here, to follow the same logic as all of our other
> madvise callers. This slightly changes the behavior for
> !CONFIG_MADVISE (EINVAL instead of ENOSYS, and a slightly different
> error message), but this is now more consistent with other callers
> that use qemu_madvise.
> 
> Signed-off-by: Andrew Deason <adeason@sinenomine.net>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


