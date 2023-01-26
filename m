Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6F067CB3B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 13:47:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL1f9-000891-TY; Thu, 26 Jan 2023 07:47:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pL1f3-00088m-SS
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 07:47:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pL1f2-0007kc-5y
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 07:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674737243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ac1IOoHoLyxocg87L8DHv9J+MYXlDBOgf3q5S8JIRmI=;
 b=DeUCQlgzqBRlu5xqqjW8SRn5doPpRUSZzLV9r4euVEJuLnFbS72aKlB8PuPjn3bjqajPIZ
 aXMfjcz8BfCWjIkfzxVlmCqMKKIkwp5g9hC8Q957nXyUC6Nj+3r/6ymvcNDgfmsxJ5BDgZ
 9sO3qQDzf3JJtpmGA9pYlwgHJAJWU5A=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-576-vaddL0XSNOK_beTxhr5iAQ-1; Thu, 26 Jan 2023 07:47:22 -0500
X-MC-Unique: vaddL0XSNOK_beTxhr5iAQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 z25-20020ac84559000000b003b69eb9e75bso670481qtn.17
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 04:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ac1IOoHoLyxocg87L8DHv9J+MYXlDBOgf3q5S8JIRmI=;
 b=17zhMjbQy927VavRKSe6LS69qWO0z8Sznawl/oXuN1B6FEg4G6xVbDuwGKpDZu3Jo+
 XDsCpZf1xA9tSX44fLltQGc/mb/kWJL4WQ3j5wQbn2Ly5M2txSfNsLhSHGrbH15hZM+9
 YHpoIasSysDtctD+qHlMnKpLUwxNLuKzbpcQpFAiZpcNLzLoH1NBKBP9TbPs3YGe/mN1
 tZTDA3mEahcOKbIHvCylKNN3XxNosf4COPMbyrIA7LK9FVPwiaMs/IjB4ofsCnySjExI
 oG017mjSkXjmn4Gv0tIMJ3J49eZPHN347J1R5e5/EDbk0U7WRmaoIg8f+alrF+AmO54M
 KRTw==
X-Gm-Message-State: AFqh2koUUvhTBTG3lLOMkZAedwFdDhBOeeoLOTv6l9C4jzZQ2lUmA3ES
 XFZNemv4RVr6qGoY3hnL9ilVv4J5LTMO6qMykyGRzRO0SKQQUZ4eUEdrL62Jfi4HPleO6FGt94a
 WWthPNYuhvq8dAnE=
X-Received: by 2002:a05:622a:4ccb:b0:3b5:b2d9:2b4b with SMTP id
 fa11-20020a05622a4ccb00b003b5b2d92b4bmr62697779qtb.17.1674737242034; 
 Thu, 26 Jan 2023 04:47:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsBlWvPhlF2aloCk77SalO3AsBDPskwNggSAnENu9VwhIyvns9vpFDzm9RBbh4FYfS39/3n0g==
X-Received: by 2002:a05:622a:4ccb:b0:3b5:b2d9:2b4b with SMTP id
 fa11-20020a05622a4ccb00b003b5b2d92b4bmr62697757qtb.17.1674737241822; 
 Thu, 26 Jan 2023 04:47:21 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-174.web.vodafone.de.
 [109.43.177.174]) by smtp.gmail.com with ESMTPSA id
 a2-20020aed2782000000b003b7ea583c7csm651328qtd.58.2023.01.26.04.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 04:47:21 -0800 (PST)
Message-ID: <9c8e270e-e158-c0c5-4402-6761b16b5db9@redhat.com>
Date: Thu, 26 Jan 2023 13:47:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 0/6] qemu/bswap: Use compiler __builtin_bswap()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Ira Weiny <ira.weiny@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20230111163147.71761-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230111163147.71761-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.15, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/01/2023 17.31, Philippe Mathieu-Daudé wrote:
> Implement Richard's suggestion to use __builtin_bswap().
> 
> Convert to __builtin_bswap() one patch per OS to simplify
> maintainers review.
> 
> Since v2:
> - Rebased adapting ./configure changes to meson
> 
> Since v1:
> - Remove the Haiku/BSD ifdef'ry (Peter)
> - Include the Haiku VM image from Alexander
> 
> Philippe Mathieu-Daudé (6):
>    qemu/bswap: Replace bswapXX() by compiler __builtin_bswap()
>    qemu/bswap: Replace bswapXXs() by compiler __builtin_bswap()
>    qemu/bswap: Remove <byteswap.h> dependency
>    qemu/bswap: Use compiler __builtin_bswap() on Haiku
>    qemu/bswap: Use compiler __builtin_bswap() on FreeBSD
>    qemu/bswap: Use compiler __builtin_bswap() on NetBSD
> 
>   include/qemu/bswap.h | 83 ++++++++------------------------------------
>   meson.build          |  6 ----
>   2 files changed, 15 insertions(+), 74 deletions(-)

Since nobody else picked this up yet, I'll take it for my next pull request. 
Queued to my staging branch now:

  https://gitlab.com/thuth/qemu/-/commits/staging

   Thomas


