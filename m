Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBA76FB279
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 16:21:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw1k1-0008AH-Qg; Mon, 08 May 2023 10:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw1jv-00089s-BG
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:21:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw1jt-0002jO-VY
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:21:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683555681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TxkBYB/PGP0t0JgasgobMapi7wzdhOqTqO8FNDDosbQ=;
 b=FJGxJFf2q2Ehc7z21HgcR7GpqJnxrSFSjZs5J7S/ssR/sTjKpQYHlysy/k3vI3i6Szaf4v
 BuJpGJGJjlBtUaa6j/9/3usOS2OuhErOlms2jFrNHr9YGX2TEoLMmQ1FukBkGyNtlY+7vn
 B59bx8ICldwC4onh8fbezqS3KYq/H1I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-2fh5fiD6MQO3m2AmDEUU2A-1; Mon, 08 May 2023 10:21:14 -0400
X-MC-Unique: 2fh5fiD6MQO3m2AmDEUU2A-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30793c16c78so831991f8f.3
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 07:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683555672; x=1686147672;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TxkBYB/PGP0t0JgasgobMapi7wzdhOqTqO8FNDDosbQ=;
 b=Dx2U1gwzBpdhFpWKg7ZPbXHcnCPkg8MnmEySAfGuz8EudB24FIe3PvreWzxtLjyUoZ
 bQu8igeD4irxIhCIc6If6qxCtQnw00udxP94Mxz7KzWTFdqBwu6fJcgNEXGuHBpDMZUT
 T6sb7llNSNHqRjyn/eOCkNCUJccjx66FMClohZ0HMcCHQxrlsi1G/VsnIPFEDoJbbwmH
 OrB1D/XsRo2Mpgay71q+A8KxUT9v3vL8wo9qUDVblOu2W9PKK5YlPPAtUWx++8SJbTP/
 4KW4wQq15gEuO9og4IQ7b1AUVMIeyIH8RYsjQI3KVJR1MRRsYNM01trTwfKvpm8IHgup
 gh0w==
X-Gm-Message-State: AC+VfDwHwVJ2K1cdb7tjz8/ra8BrFFmE7Oh37JwBh9oGxTqEIS/Oo7M0
 TErVohSOw5/m4bM/Nm9yxxaII2+z+MuvMicQGdMxxL83102BUIsyjlkdmSW5tdmMZ3aYcMnivEw
 flwEkZvY6tEihztXD28gj13g=
X-Received: by 2002:a5d:4dce:0:b0:2f4:2ad5:15ef with SMTP id
 f14-20020a5d4dce000000b002f42ad515efmr6646049wru.16.1683555672359; 
 Mon, 08 May 2023 07:21:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7rDCQYYKzYXVfp9fOUBkqUwjuReDCVpKlbmw667b464y2GdFWcgpuZP86Kv1CBIYkaXP772g==
X-Received: by 2002:a5d:4dce:0:b0:2f4:2ad5:15ef with SMTP id
 f14-20020a5d4dce000000b002f42ad515efmr6646036wru.16.1683555672111; 
 Mon, 08 May 2023 07:21:12 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-212.web.vodafone.de.
 [109.43.179.212]) by smtp.gmail.com with ESMTPSA id
 k9-20020adfe8c9000000b0030642f5da27sm11460804wrn.37.2023.05.08.07.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 07:21:10 -0700 (PDT)
Message-ID: <0a0da639-387b-fb6f-086d-040c9af33b9c@redhat.com>
Date: Mon, 8 May 2023 16:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 81/84] tcg: Split out exec/user/guest-base.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-82-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503072331.1747057-82-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 03/05/2023 09.23, Richard Henderson wrote:
> TCG will need this declaration, without all of the other
> bits that come with cpu-all.h.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu-all.h         |  5 +----
>   include/exec/user/guest-base.h | 12 ++++++++++++
>   tcg/tcg.c                      |  3 +++
>   3 files changed, 16 insertions(+), 4 deletions(-)
>   create mode 100644 include/exec/user/guest-base.h

Reviewed-by: Thomas Huth <thuth@redhat.com>


