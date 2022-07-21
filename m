Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C13457CE54
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 16:57:25 +0200 (CEST)
Received: from localhost ([::1]:37246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXcC-0005Dm-4K
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 10:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oEXXg-0005Po-MC
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:52:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oEXXd-0004iz-Hu
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658415160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x4WGPAsznF9T1M2Q2ybcg0GuFrRLnwBKDWDvlZJkaGY=;
 b=Kaz8TA3Vcubh6gJNVhjL6vlCFyQzzG2NcO0wJd0q32X/B1bw3ObUgp9FFjb7trEHWQmCX/
 D8TKgiduNU2lp9nYfXfM8ssleuXjs02phisaCb31xDlUAt53eZSntM2/mxEtw/XUISJbsq
 odmmDhfrcGzY0l9Vj2MHMfvct6NpJZY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-4H9tlB10PGaXjm0eMJWdWg-1; Thu, 21 Jul 2022 10:52:38 -0400
X-MC-Unique: 4H9tlB10PGaXjm0eMJWdWg-1
Received: by mail-wr1-f69.google.com with SMTP id
 l17-20020adfc791000000b0021dc7dc268dso412968wrg.0
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 07:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x4WGPAsznF9T1M2Q2ybcg0GuFrRLnwBKDWDvlZJkaGY=;
 b=pc/myqXBYiAsMhBuoEDyARy+9uDNOS89S0RfMEvsOkfIjFx5QIHoKTRrtjpxKFwSSt
 0SQet+04xGHTp4Rbzo2XnAzeWPU4tovbjoczZ+XcPS42DUwxqLWH2TlPl1PzVqUY485q
 FeiVLZ5/qKzbIWgndS4W0e4fA9yL6leIsDq3u9fCYcIM7163oyJS27onqflJJ97YerGF
 eYUaDjNYN3IKNS3eNa5BQU+xx2ok4f56weIvhjElZ3DJon+ccYna+PS5CVB+3scOZBBw
 bBn1jY2RXtU6WjfDFn2liKSrE5Q5gJNR3st7haSHLL7dQ/XLOt37pFzGy4iYkfKL3krO
 0q7g==
X-Gm-Message-State: AJIora/Lo1gYFvxK+ryQAGEA6Q0NrBL08Pgn52fAvUieIn88KQ+q/pq+
 0HUhXSIMIIIgmjURlch1Fu6c0Ail1vLRea7cjKB3bHX8rcWzHOcNxzRsig9Mj/unF1J0imLMbN6
 qvFldNMijU4Llbn8=
X-Received: by 2002:a05:6000:156f:b0:21d:887f:8ddf with SMTP id
 15-20020a056000156f00b0021d887f8ddfmr34794659wrz.534.1658415157659; 
 Thu, 21 Jul 2022 07:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1saLjT9mijMy4hOfPuput9ufaJrIeiTOLfyEgcWwXBb6p04xPYOM3Vw4bxJsEKCoTWKKG0gIg==
X-Received: by 2002:a05:6000:156f:b0:21d:887f:8ddf with SMTP id
 15-20020a056000156f00b0021d887f8ddfmr34794639wrz.534.1658415157146; 
 Thu, 21 Jul 2022 07:52:37 -0700 (PDT)
Received: from redhat.com ([2.55.46.162]) by smtp.gmail.com with ESMTPSA id
 c23-20020a05600c4a1700b003a3170a7af9sm1978726wmp.4.2022.07.21.07.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 07:52:36 -0700 (PDT)
Date: Thu, 21 Jul 2022 10:52:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 0/4] Refactor x86_load_linux and pass RNG seed via
 setup_data entry
Message-ID: <20220721105005-mutt-send-email-mst@kernel.org>
References: <20220721122937.729959-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721122937.729959-1-pbonzini@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 21, 2022 at 02:29:33PM +0200, Paolo Bonzini wrote:
> As mentioned in the reviews of Jason's patches, the fw_cfg data, or at
> least its structure including the size, is part of the guest ABI and
> must match across two sides of migration.
> 
> It would be possible to handle this with some duplicated code between
> the rng seed and DTB handling, but the conditionals to handle the linked
> list would be ugly.  Unfortunately the code of x86_load_linux has no
> data structures available, it's all of a jumble of local variables.
> Hence the first two and largest patches in this series, which remove all
> non-Linux code from the function and move the local variables to a struct
> as necessary.  The function was long overdue for some cleanup anyway.
> 
> With this in place, adding the seed setup_data entry is just a
> couple lines of code, plus the scaffolding for a new machine property
> "linuxboot-seed".  The property supports on/off/auto values, where "auto"
> disables/enables depending on the kernel support for setup data (which was
> added in 2.6.26); "on" currently fails when starting with an old kernel,
> and probably it should also fail when starting a PVH or multiboot kernel.
> 
> Paolo

I like the refactoring

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

To avoid creating extra work for Jason and confusing
attribution, maybe apply Jason's patch then your refactoring
on top?

> Jason A. Donenfeld (1):
>   hw/i386: pass RNG seed via setup_data entry
> 
> Paolo Bonzini (3):
>   hw/i386: extract PVH load to a separate function
>   hw/i386: define a struct for Linux boot protocol data
>   hw/i386: extract handling of setup data linked list
> 
>  hw/i386/pc.c                                 |   1 +
>  hw/i386/x86.c                                | 303 +++++++++++--------
>  include/hw/i386/x86.h                        |   2 +
>  include/standard-headers/asm-x86/bootparam.h |   1 +
>  4 files changed, 185 insertions(+), 122 deletions(-)
> 
> -- 
> 2.36.1


