Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6E142F127
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 14:41:14 +0200 (CEST)
Received: from localhost ([::1]:42510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbMWP-00016T-Nc
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 08:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mbMTu-00085I-7D
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 08:38:38 -0400
Received: from usb-smtp-delivery-124.mimecast.com ([170.10.151.124]:22007
 helo=us-smtp-delivery-124.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mbMTq-0006OS-HZ
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 08:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634301512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bnE9GS5JhLq1cAS2EbGm058tDL8mVeYPhb0W6R5kDj8=;
 b=YxgKSLGh6WLl/6+7JUUG+S4GM7lWGsBnJlMlr+aUWkc32x9C73pvWCs/Ax/ESOAGn6jnao
 TVSIDd+szQ4eiKGkLrxhMOBTyyQIDcBH3p1DANrmyKhTTnOMLPIjSbqYc9XRrypNWs8Er5
 TMx5g55Fi6XjK8fSmm2q3nWaPMU+xo8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-N9EgJ5j5OIqs52ZHlRLjqg-1; Fri, 15 Oct 2021 08:38:31 -0400
X-MC-Unique: N9EgJ5j5OIqs52ZHlRLjqg-1
Received: by mail-wr1-f71.google.com with SMTP id
 s18-20020adfbc12000000b00160b2d4d5ebso5925661wrg.7
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 05:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bnE9GS5JhLq1cAS2EbGm058tDL8mVeYPhb0W6R5kDj8=;
 b=VkQzvwcCac0Dc34e1MZk6VQoIcfG4hfyBlTaLg4GYhQJpSvdhPVJr41JgMBLGa6i/S
 t2Bxg/sBBz8TlwRzbHezJ0CXTiNh6/SfyHsXGnylbD4jtO4wACHZREtk7u+yOSB0sbfV
 jE4h52qktLvZvwbqxYmTgWz64mDAOHuCNHeKzVfmHCvLT+48u4LHLwO2/gcU0dOwA3bf
 ff8DCcPacKvihg57pkm6hDi5NVFkm04jiTQ1alYIl/C1GBYeF7BctaVALtulr9KskJw7
 JKOc4ChDJ6ry30pCQLIS2frkHVCKSQaxyfIZtDtrkoRnuCN6rFPC46g9F6deSxQFKBmj
 cPTw==
X-Gm-Message-State: AOAM530Ov1/I1T/qy+IiHr4qrC9DpI6I/v9GXAg2ZTEjLMmd64IwO7WW
 PFOrcvrtgZ56DoHKu3Xf3D70cnrPM8YKQSHxzJk66m1lNDtr9I2+8Txk/6v7MGAAeWNl1VQgYL7
 JuF+e9DbEeEsvues=
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr12262173wmc.128.1634301510294; 
 Fri, 15 Oct 2021 05:38:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNbLBG2LObJta+hAwf+TypeFRxC58ty5LkO1Jv1fOgvifwyNwSa2qgc5tAEF+jEgEwG7ukJg==
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr12262147wmc.128.1634301510065; 
 Fri, 15 Oct 2021 05:38:30 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id f3sm4402812wml.11.2021.10.15.05.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 05:38:29 -0700 (PDT)
Message-ID: <c352ccff-68aa-51c7-9261-de2e024dd16a@redhat.com>
Date: Fri, 15 Oct 2021 14:38:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 4/4] configure: remove dead EXESUF variable
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211015100718.17828-1-pbonzini@redhat.com>
 <20211015100718.17828-5-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211015100718.17828-5-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.151.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, thuth@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, hreitz@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 12:07, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .gitlab-ci.d/crossbuild-template.yml | 2 +-
>  configure                            | 3 ---
>  2 files changed, 1 insertion(+), 4 deletions(-)

Maybe squash in patch #2 or place as #3 mentioning
"the previous commit"?


