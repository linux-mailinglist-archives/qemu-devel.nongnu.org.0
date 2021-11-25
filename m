Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2D645DC08
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 15:09:53 +0100 (CET)
Received: from localhost ([::1]:41376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqFRg-0003ef-DE
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 09:09:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mqFMc-0003zK-Uy
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 09:04:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mqFMV-00027f-1O
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 09:04:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637849069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vTSMbbzRWzP6aBRL6yW6cZh21SmMXZ0BtqacAGfmlGc=;
 b=aXpMOmrjzi0Uqiu+Iczz7My/IqVRADEiqPRYXD6S2E1isPAzrOwHakY6IPUBwBzRW5MPN3
 VuHCIzmoUJOkFsGa6EA0cb2yqGzwBTrzNTeZC1gEozErU09jXRiwKOYJWg5iyvr5Dh2Yh2
 /kyuK+6BCoT+wplZyYUxzn7a2v0jFeM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-KBc2tmNIMY2dgTPGrAR5RA-1; Thu, 25 Nov 2021 09:04:28 -0500
X-MC-Unique: KBc2tmNIMY2dgTPGrAR5RA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso3587087wms.5
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 06:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vTSMbbzRWzP6aBRL6yW6cZh21SmMXZ0BtqacAGfmlGc=;
 b=CQkbl7Llj4ps6AaszQ4j9H/sg0eFnf0GutUPw8DDaQP72tBwKJZ5KQhJaH86kp1XCF
 DMtV5O9I8y6fn9qPJm8nU4cI7s9VUozR2xgxiDx2nFnE5hp3/8m8cV9RQm3SWRgA2snL
 Lc1Ypic8PfTqJ44n9RyeXKfaWRC9ktpatDb2KfyYiz2Iu2yylr6mZAMuorZ7ZSoVVeHj
 BR6hVlYcUSlefaGU24UNEDtxIK9eF0Q/ohz2Y0yyNkypB6mG1zl1V3BYyX2bn3EAmAhn
 80CHEBNZbR4Erjhi6znBl2hbm6LwowLaAmSazAU7mF+pxlMGc1W+07Us+veaIie9ra4F
 oQvA==
X-Gm-Message-State: AOAM533dVFRkYm6pgeO510RYfMXntZYPvAx6FwCRiQSQnj0dnycnIxVR
 6gbACxoY+Z6uESaCtPW/mgNVyPU2jiHfwHMAiziWLF8gYe4aep9zK/DCRlHkyaL1Cslhtg3Inss
 pDnO+PL+Cey9NOQ4=
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr7130115wrt.103.1637849067160; 
 Thu, 25 Nov 2021 06:04:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWzUnSwO3KrrCXFElWpcY1PC8zpCXx2xhjH84iLfc0tQ7xA3YeKWhCZMegsKQ0Ji2yVXH5zw==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr7129914wrt.103.1637849065940; 
 Thu, 25 Nov 2021 06:04:25 -0800 (PST)
Received: from [10.201.33.14] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id l3sm3676819wmq.46.2021.11.25.06.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 06:04:25 -0800 (PST)
Message-ID: <c211e4ed-e953-03ea-4b17-f1743928c3f3@redhat.com>
Date: Thu, 25 Nov 2021 15:04:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] block-backend: Retain permissions after migration
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211125135317.186576-1-hreitz@redhat.com>
 <20211125135317.186576-2-hreitz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211125135317.186576-2-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peng Liang <liangpeng10@huawei.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/21 14:53, Hanna Reitz wrote:
> After migration, the permissions the guest device wants to impose on its
> BlockBackend are stored in blk->perm and blk->shared_perm.  In
> blk_root_activate(), we take our permissions, but keep all shared
> permissions open by calling `blk_set_perm(blk->perm, BLK_PERM_ALL)`.
> 
> Only afterwards (immediately or later, depending on the runstate) do we
> restrict the shared permissions by calling
> `blk_set_perm(blk->perm, blk->shared_perm)`.  Unfortunately, our first
> call with shared_perm=BLK_PERM_ALL has overwritten blk->shared_perm to
> be BLK_PERM_ALL, so this is a no-op and the set of shared permissions is
> not restricted.
> 
> Fix this bug by saving the set of shared permissions before invoking
> blk_set_perm() with BLK_PERM_ALL and restoring it afterwards.
> 
> Fixes: 5f7772c4d0cf32f4e779fcd5a69ae4dae24aeebf
>        ("block-backend: Defer shared_perm tightening migration
>        completion")
> Reported-by: Peng Liang <liangpeng10@huawei.com>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  block/block-backend.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


