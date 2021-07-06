Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BF23BDEBD
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 23:07:41 +0200 (CEST)
Received: from localhost ([::1]:57310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0sI8-0004Rg-8t
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 17:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m0sGt-0003RJ-Dn
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 17:06:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m0sGq-0003qn-K0
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 17:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625605580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZktQ78XRKHywIc+L5s41c1myVHNc5UOVH0rGW1BnHVc=;
 b=A+EOH5uwT7pw96LB+KODbJ3PDAbp16oWKoqG7Ipm8UabS5KC41aJNdZ00KkdI5CSEIST35
 TOHbIx3PcwzSPL/Kk9EYec0gtInDuIrLASTDcfECuFZq9FsdnQzQ0qeEXOX9KcCNjh76Ca
 LmC7XhO3Bsi4A2yJmvWevDpRmNf6gEc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-UTKSqvNGPV6N65RrpJ995w-1; Tue, 06 Jul 2021 17:06:19 -0400
X-MC-Unique: UTKSqvNGPV6N65RrpJ995w-1
Received: by mail-qk1-f197.google.com with SMTP id
 r190-20020a375dc70000b02903acea04c19fso17578856qkb.8
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 14:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZktQ78XRKHywIc+L5s41c1myVHNc5UOVH0rGW1BnHVc=;
 b=m8eWAU902xX3OSS1ZzQujhyQ9xZcFC5jrDw9DbrIBaK9Kfi51q3DLn0JLmausqAjU7
 jzT/1PGiGVteb5pg7PbbevphNYEbOPO3YwBCaTkkage05Y/lRGq/acDPCVmTozlcP7fx
 x/IOuI68seUJvZe7E8sRHXE4ctznHyW2lqqfHZpxDL7FKaNhHvlmGmpiuE3L4JYzPFBC
 SsRzIOZ1Nrbr06JDZn0y/ZTt166GZ7YWHlTm3hxqgntx9jUgW2f6yNI7RnjpahmRK4r+
 U6BJLpJbBVcW3CHBcCC2THOJrDHTxJpIezuKz0kyOjCyzoVEHOQ35FqHpIZKXDkFDd2L
 nTMg==
X-Gm-Message-State: AOAM532b6pR7BMgq9uG8fjPV6jSlqWmic9KhzMNM/Jz1fofv4B7bgt6B
 KCXoncF6JAZoWPtKGKbR5iw4fksf3aPhdB2vlhxvajeSqPSC9IWhc0DR6OIkYBUD/VP3XJkPPeS
 EF92h2HWDOTRp+9WmYAaIm/3+/TK7jUn+XYuL8rto1DyA1xphk7S+L32kvQuVgV0a
X-Received: by 2002:a37:65c5:: with SMTP id z188mr4044553qkb.427.1625605578419; 
 Tue, 06 Jul 2021 14:06:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsZG6+GVmo80Eo6ViTa8UgFkTPMVzLAk8QfLp2v8oAFgUOnQRlLNSHfdYGfFIGaUrtBTgmxg==
X-Received: by 2002:a37:65c5:: with SMTP id z188mr4044521qkb.427.1625605578128; 
 Tue, 06 Jul 2021 14:06:18 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id z7sm2417517qta.92.2021.07.06.14.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 14:06:17 -0700 (PDT)
Date: Tue, 6 Jul 2021 17:06:16 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] docs: Add '-device intel-iommu' entry
Message-ID: <YOTFyOgdG3ttCuPl@t490s>
References: <20210611185500.343525-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210611185500.343525-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jing Zhao <jinzhao@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Chao Yang <chayang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 02:55:00PM -0400, Peter Xu wrote:
> The parameters of intel-iommu device are non-trivial to understand.  Add an
> entry for it so that people can reference to it when using.
> 
> There're actually a few more options there, but I hide them explicitly because
> they shouldn't be used by normal QEMU users.
> 
> Cc: Chao Yang <chayang@redhat.com>
> Cc: Lei Yang <leiyang@redhat.com>
> Cc: Jing Zhao <jinzhao@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  qemu-options.hx | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

Ping..

-- 
Peter Xu


