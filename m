Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EC249D3E0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 21:54:01 +0100 (CET)
Received: from localhost ([::1]:34156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCpIm-0007qv-NO
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 15:54:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpGo-0006Ls-Mj
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 15:51:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpGm-00033f-Q6
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 15:51:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643230311;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UqsWUBpPsHJmsQ5hlugcfzbxFBX8+YCngaCfz2MYzJY=;
 b=LtVj3OnP5E0Bo7dTpiuWQavIesz34LHLDbepGlDRvtrkOvToOjL34kCKX5J54rlkdE/9oP
 MmvltJI9wmg3KzooOo1bLiSx3RMYkxEUz4khSiehTUrd2KndgIPKmFbwmg3aPYagXrkEOX
 XxYzqq3moL20Bh3NVyRWbUlJTC/eUkg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-l8WNHmbvOyW51Xn_-g4CZQ-1; Wed, 26 Jan 2022 15:51:50 -0500
X-MC-Unique: l8WNHmbvOyW51Xn_-g4CZQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso450474wme.5
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 12:51:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=UqsWUBpPsHJmsQ5hlugcfzbxFBX8+YCngaCfz2MYzJY=;
 b=i9vPWNH9hamM5Us/pFsXIbu6WvxXZ0/EAB4M5JO9bEqOyiyeqsmrxaS7n0Z/qg9SRZ
 REHybscdfs09M/sJustEKHvW1bu8DYXEWtTOveROtZEpr5nx1jIvZx61NA/w72OytQEO
 rxuMEorHxoIAuIu/sWgJhHwYvKCGu5xf9LTh+1W9NqbbPIANfYOTOGDwkHvf1H29Hoor
 HGb0A/N0JZS5AdAheQUCLk20ucO8o0cRU5TzpjKUa6jdLFG3yelTIbyaDONh7L7yf4s+
 Tko4/NVtQekJb48guxM5/xCiYEluY7nL1eBeHLRSWUtN0z0kM22ESnklydLROpV8YtLT
 YP7Q==
X-Gm-Message-State: AOAM531Z8QFKfAW7uyxwoEJYUsPHGA5Ada3CgT+2eIvKpYaVih0/minN
 udzlOvLuu9OXFURdTtO9nO44ZXLPtmXOOBhwB60fbELe/VtGaC/1w9/vmCxgMBwSR56qmnidb6G
 27mQs1Ibq+MD1qno=
X-Received: by 2002:a5d:518c:: with SMTP id k12mr263655wrv.169.1643230308969; 
 Wed, 26 Jan 2022 12:51:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3L+7oDe5QQ+cErmsab9B4VcGJLx65ceM+JNpBs51vvE/Rm0cjRIJlQbxgsC+nO5SFCgqFdA==
X-Received: by 2002:a5d:518c:: with SMTP id k12mr263640wrv.169.1643230308783; 
 Wed, 26 Jan 2022 12:51:48 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id bg23sm353299wmb.5.2022.01.26.12.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 12:51:48 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 1/3] ppc: Fix vmstate_pbr403 subsection name
In-Reply-To: <20220113194452.254011-2-dgilbert@redhat.com> (David Alan
 Gilbert's message of "Thu, 13 Jan 2022 19:44:50 +0000")
References: <20220113194452.254011-1-dgilbert@redhat.com>
 <20220113194452.254011-2-dgilbert@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 26 Jan 2022 21:51:47 +0100
Message-ID: <87mtjinrto.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
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
Reply-To: quintela@redhat.com
Cc: peter.maydell@linaro.org, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 peterx@redhat.com, lsoaresp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The pbr403 subsection is part of the tlb6xx state, so I believe it's
> name needs to be:
>
>     .name = "cpu/tlb6xx/pbr403",
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Dropped as code don't exist anymore.


> ---
>  target/ppc/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 756d8de5d8..e535edb7c4 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -718,7 +718,7 @@ static bool pbr403_needed(void *opaque)
>  }
>  
>  static const VMStateDescription vmstate_pbr403 = {
> -    .name = "cpu/pbr403",
> +    .name = "cpu/tlb6xx/pbr403",
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .needed = pbr403_needed,


