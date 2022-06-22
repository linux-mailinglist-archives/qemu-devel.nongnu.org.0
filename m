Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C268556DB4
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 23:07:50 +0200 (CEST)
Received: from localhost ([::1]:58334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o47Zl-0006yl-Cj
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 17:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47XB-0004uw-1i
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 17:05:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47X8-0006sK-Rl
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 17:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655931906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qscJvtSZRMxHSucHbL93M3Z9P/mSWHnvfp6jXmZwEsk=;
 b=XmJW37TvAkHKypOFpFr0LUqnDoJ/xGgTtiZhEwXPyO6/heovvhbpmuBPOgUAIixZ0RWnP5
 ZSRcEAdeApYUW/Pg4uCPHtxUgTRlVdOMNRnFCPxhLTi0GgT1PE5CigCGZyo571UtCtjQkM
 /eWfWFLkZcALNqPyKmvBOd9mOc/ZC0w=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-HiG67qSGOxKMC3S_8o4dtw-1; Wed, 22 Jun 2022 17:05:04 -0400
X-MC-Unique: HiG67qSGOxKMC3S_8o4dtw-1
Received: by mail-il1-f198.google.com with SMTP id
 f18-20020a056e020c7200b002d949d97ed9so1082890ilj.7
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 14:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qscJvtSZRMxHSucHbL93M3Z9P/mSWHnvfp6jXmZwEsk=;
 b=2n0kXsfc2sz1CegxC8/1TG8bvh0cVCjKqG1GZ86Fi/3oXX7ed6abEBuhAt12hYb3/w
 pMEMrJOf53pJY6BHuuSqWIn8VCjaNVFOXo3nh+6Ktx4ym3526IU12HImMtnIQrWzhq3K
 i4sDykVO32AuYlIvI/zV1szvFwkm0hO/c8hcrCENNOF5j2qFkkergvzOIXs2XUYIgW2I
 vWWCM8nWDN288+Zo6PIx3uN1cJVY+PgawpAPvVoLYisWeTCR9QpVdYO+EVH4EfRTW3SY
 2V9uVcN7ai9El5NmRi/74zAfqucUiEZjgeTGePLDQTDm8jDtOw0IUNZGk3aPcPvrjCrA
 u7qQ==
X-Gm-Message-State: AJIora+xIODecSTbdzaKFWGzv1B+R/a5/LHitnshzD1yoP7DAlXsShaL
 oPJu/B9SqwZ3rGFHh6BSSORkoLpSH3vIkqBKorPD7+Jfnj6bviTctBm0v57Lba5kMiCxCtXCjRC
 Tshuf6ncWRWbVzyo=
X-Received: by 2002:a05:6e02:1909:b0:2d9:461f:3339 with SMTP id
 w9-20020a056e02190900b002d9461f3339mr2247456ilu.128.1655931903816; 
 Wed, 22 Jun 2022 14:05:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u2v9v9Y0Suzs/BxBdYv5KntELhNpWZCUSwODBSJVJir/i+esGQHenRI8WffAsr5bqIsf70Cw==
X-Received: by 2002:a05:6e02:1909:b0:2d9:461f:3339 with SMTP id
 w9-20020a056e02190900b002d9461f3339mr2247448ilu.128.1655931903560; 
 Wed, 22 Jun 2022 14:05:03 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 x66-20020a0294c8000000b00339dd803fddsm1094758jah.174.2022.06.22.14.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 14:05:02 -0700 (PDT)
Date: Wed, 22 Jun 2022 17:05:00 -0400
From: Peter Xu <peterx@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, david@redhat.com,
 f4bug@amsat.org
Subject: Re: [PATCH] memory: Fix wrong end address dump
Message-ID: <YrOD/HIj7+mDlMeg@xz-m1.local>
References: <20220622095912.3430583-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220622095912.3430583-1-zhenzhong.duan@intel.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jun 22, 2022 at 05:59:12PM +0800, Zhenzhong Duan wrote:
> The end address of memory region section isn't correctly calculated
> which leads to overflowed mtree dump:
> 
>   Dispatch
>     Physical sections
>       ......
>       #70 @0000000000002000..0000000000011fff io [ROOT]
>       #71 @0000000000005000..0000000000005fff (noname)
>       #72 @0000000000005000..0000000000014fff io [ROOT]
>       #73 @0000000000005658..0000000000005658 vmport
>       #74 @0000000000005659..0000000000015658 io [ROOT]
>       #75 @0000000000006000..0000000000015fff io [ROOT]
> 
> After fix:
>       #70 @0000000000002000..0000000000004fff io [ROOT]
>       #71 @0000000000005000..0000000000005fff (noname)
>       #72 @0000000000005000..0000000000005657 io [ROOT]
>       #73 @0000000000005658..0000000000005658 vmport
>       #74 @0000000000005659..0000000000005fff io [ROOT]
>       #75 @0000000000006000..000000000000ffff io [ROOT]
> 
> Fixes: 5e8fd947e2670 ("memory: Rework "info mtree" to print flat views and dispatch trees")
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


