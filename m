Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D019D6FB277
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 16:20:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw1id-0006pr-RF; Mon, 08 May 2023 10:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw1ia-0006pI-8Q
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:20:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw1iV-0002HV-K6
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683555593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4tTEDD1Ov2ttnbMg6QgdR7hAMAm/5EvngN01VNFgm/U=;
 b=ZuXqSjEOrxUgXW5bzUZ6EZ9s4xnrtkFI0dczoLwkF27Wd+AR0Xb83MZ2pp0DrtejzRwhIW
 BZpVSPiy181FoSKinXdAVLJocIEkE03/xqsIZ2BQUYFgDSlaQebRQekYitkZtMof0SDCX+
 ECpPTUya9OYyXOjxxbAIs7YqcmqPaHU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-Sq6hHqJxP26y3Grp41U2_g-1; Mon, 08 May 2023 10:19:52 -0400
X-MC-Unique: Sq6hHqJxP26y3Grp41U2_g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f1749c63c9so16148795e9.3
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 07:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683555591; x=1686147591;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4tTEDD1Ov2ttnbMg6QgdR7hAMAm/5EvngN01VNFgm/U=;
 b=c+0t01zzBUl4oiocBi+ZDub8OHTBRpUGx+sTGkH77shdjr7BpFXqLloCoOF51mX5jm
 +wzxhEWSz3a2rqJvqYXQ2nU3cH5maZ0NoDaZWDbF/M51ROFIkqQ7OaCcaIByy3xJXP7B
 ktW38bfmEcGrLczW3+ssjIj3QmHD9E9eCkFncALlvb29TqHN6crCLpuz23Viw5q0erKO
 Mr5J7i8FjiJ4+3CO+zDk/kNZ8lDYgJAHlZchPlh8/iHsUgT4utufV2QUBgrezlFCfwBg
 ygpC82zctYQEyfGXGHzPrUT6W4/GuJEOioe2Qregqfgg9cpdlCyQspVFJE17HQD2y82f
 oXJA==
X-Gm-Message-State: AC+VfDwK92quZM1mz3I5eIO8+TAWcE1B3MBX+5K/lARWQr8MKnTuG6s5
 84wkx5kj38NVX5zyASJNfRdOvwNc2Oxtq2WaCdFE3SDx0eUf6YRNh+aBMxcBg52DDRxJ4auUsx5
 WC+cSWSY8ocgYZ76/lIQVB1A=
X-Received: by 2002:a5d:6ad2:0:b0:306:3b39:9a3d with SMTP id
 u18-20020a5d6ad2000000b003063b399a3dmr7715641wrw.15.1683555591383; 
 Mon, 08 May 2023 07:19:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ42+24hZk4tVchyRGOyP/wSG0JBcBAbCvHI4WX1CYtTX6LagfBgdPflz+RkEdPgn/yIEwrJeA==
X-Received: by 2002:a5d:6ad2:0:b0:306:3b39:9a3d with SMTP id
 u18-20020a5d6ad2000000b003063b399a3dmr7715624wrw.15.1683555591123; 
 Mon, 08 May 2023 07:19:51 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-212.web.vodafone.de.
 [109.43.179.212]) by smtp.gmail.com with ESMTPSA id
 n17-20020a5d4211000000b002f9e04459desm11438747wrq.109.2023.05.08.07.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 07:19:50 -0700 (PDT)
Message-ID: <c2a44892-e0f1-7c68-d860-ed1c612d72b7@redhat.com>
Date: Mon, 8 May 2023 16:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 80/84] disas: Remove target_ulong from the interface
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-81-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503072331.1747057-81-richard.henderson@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> Use uint64_t for the pc, and size_t for the size.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/disas/disas.h | 17 ++++++-----------
>   disas/disas.c         | 19 +++++++++----------
>   linux-user/elfload.c  |  5 +++--
>   3 files changed, 18 insertions(+), 23 deletions(-)

You also have to update lookup_symbolxx in bsd-user/elfload.c, I think.

  Thomas



