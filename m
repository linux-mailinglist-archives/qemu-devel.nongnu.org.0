Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BB26FB26D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 16:18:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw1fZ-0005tr-KS; Mon, 08 May 2023 10:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw1fV-0005tY-Ff
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:16:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw1fT-0001qi-DX
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683555386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QCbTbSIT5LAgdi3jPp2uP2NWo7W1hht/qUiJH1/BtuE=;
 b=Q/4fO/CHTrp0YyJCXguQwfLW2uILX6D9pztgYj+snj0TwBoF/jRWlIOSQhNR7tbMQvuS8U
 c5xijY3+iCGuSBrRb+SevefO3wRnGVRSiit7hDuki5ssDjlO8J9SbzZWU5zVVws/IDSrZ+
 EuECQDsvPc7QnsEnf67oA8Qx0mAlx0U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-cQ6RWz2UOYWY6CwQa6jl4g-1; Mon, 08 May 2023 10:16:25 -0400
X-MC-Unique: cQ6RWz2UOYWY6CwQa6jl4g-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3063287f1c9so1642511f8f.2
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 07:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683555384; x=1686147384;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QCbTbSIT5LAgdi3jPp2uP2NWo7W1hht/qUiJH1/BtuE=;
 b=EzTdbgKyZ9RRARcSCDSdh02ztdN9zRSpb/soKFDnJe9B9abIvwGmhdLXa/Tut0nu3+
 vdwS3FGjCQIEvlvT0f3L0uTLyqm3lPQz6PRSl+AkkhENtYjEdt3omCxlJMdLJun604rw
 ySlYkIQ5S/LdHfjWktcfn32ofC/qTNmoVnSNbzE4H7znRyn1l/r8YLb2nJZujU/mMEqf
 zN0JL6blA4tDEA8TOkUAACsJGkMztdJjiUl7FAgqhpfHlx+tmhPgrXPqO3dB/woH+YG2
 Tb1p8kQ4k/VtY+udERQbBwzZnFIk0YN1sTyuyLn8mD7YnmhjtkdmfTGP1hyw+GebTMRh
 URUg==
X-Gm-Message-State: AC+VfDz9e4nQ8Dcb26M6UxX9d96Gh7DEyqaxr0t6CYpBc8+sVTt9cN7K
 mIaORnYpMXLZeFCbF0xiTZ76DCPc65JSdDafsI3kK1NNdKv5eLM5aZvnfo2wxZB/UwBhlt6CV8P
 UGU9hUhlnzB++WP4=
X-Received: by 2002:a5d:58d9:0:b0:2f9:1224:2474 with SMTP id
 o25-20020a5d58d9000000b002f912242474mr7355319wrf.23.1683555384257; 
 Mon, 08 May 2023 07:16:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Ntw4IZ0Ph7gdBTUqHGIqmFCOPEWHDAAC314wGKs8g/a12OoaRApTaUJQbjUiytVpopeMwZA==
X-Received: by 2002:a5d:58d9:0:b0:2f9:1224:2474 with SMTP id
 o25-20020a5d58d9000000b002f912242474mr7355307wrf.23.1683555384020; 
 Mon, 08 May 2023 07:16:24 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-212.web.vodafone.de.
 [109.43.179.212]) by smtp.gmail.com with ESMTPSA id
 v23-20020a5d5917000000b0030632833e74sm11568183wrd.11.2023.05.08.07.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 07:16:23 -0700 (PDT)
Message-ID: <2e8cb700-ba62-a121-3bac-ed662b82c03e@redhat.com>
Date: Mon, 8 May 2023 16:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 79/84] disas: Move disas.c to disas/
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-80-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503072331.1747057-80-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03/05/2023 09.23, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   disas.c => disas/disas.c | 0
>   disas/meson.build        | 4 +++-
>   meson.build              | 3 ---
>   3 files changed, 3 insertions(+), 4 deletions(-)
>   rename disas.c => disas/disas.c (100%)

Good idea, I always wondered why this file was still in the top directory!

Reviewed-by: Thomas Huth <thuth@redhat.com>


