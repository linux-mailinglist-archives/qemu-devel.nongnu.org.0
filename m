Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D1E681FCA
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:43:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdnx-0001Ua-J5; Mon, 30 Jan 2023 18:43:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdnq-0001UG-Kn
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:43:10 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdnp-0002XN-2N
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:43:10 -0500
Received: by mail-wm1-x32e.google.com with SMTP id q8so9175698wmo.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u8jXcmMPE21Gupb3OaxVr1MpRCW8ZPR6SN+QQB9sLw8=;
 b=tPY6fkMZfWZqNu8jb6ZgjWVDxEuStUNbeBWD65VVXswsZZvcOc0PI5yz0cyLKPG7PE
 xMQ50lwa1lTKXYGvQGwn5tKNoyZtK9Dr/VNCJZA3efELcIPRzBiFMJHm7bh0/PgYYfhM
 8KBVlpqT6KTCVWDLMgmxMDqrcIVaT/i60Weg4IBDbCok38eLnSdQMwayDkBKfRHsRphp
 +RU8XgFORmdJ10DqlD6d4qbuf/6hbYtTkiIdN3Qz6Yh4eKIthQlTN5FhemnDUp2YqIkW
 dcBHyeNJ0FtJ5S7BhwcJZp0O/gi6FFzB2bXzEQPszdEiIJZMg/I8TaP2oiRyCujPLCcA
 ltKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u8jXcmMPE21Gupb3OaxVr1MpRCW8ZPR6SN+QQB9sLw8=;
 b=ApeomAk1diMIbZHrEvtmtWs1pPSS5J6iKY/DD81PpP6M1qCIed9cNpx5JVPjOAXkwQ
 Icx8ik5653HZcqtf2UNAzESMBhZ1PI8SrOJXxR5zew0Y2k/SaiuvZoO7S0bihkU6OeQE
 T5EDmYb48dYxnvhPocITNDvRPgY48Wrn9oqrYm6HqsGzcMYAf8WrX0RdZLFZ03rcM9Yt
 s6y6hF1hD0evLhmQFGX46QF0kHwbUaP+QauEo7BUhHxf12zLPsx4f/OnhFgYLbYj/eEc
 UH0teEfV0CrRBxZbKHYlk8q4RVEOqrw9N2M8wM3HTlTqx/Msfx8JFuyV4rvkJhWdcso6
 U7qA==
X-Gm-Message-State: AFqh2kpHyf5BVDyaC2RYcu88+K+NmZ1yKrcsQdK4lFetBVCAUH4tlkwh
 cv+/HIG2D2DeyDRqwLzvgk5BDw==
X-Google-Smtp-Source: AMrXdXuQQOL3n6EG4+SFqR7K6r7FEyCpKvl/BwCsruYPLKQ+kzxtPx/aObU0GCohSskZbeQpjroU7w==
X-Received: by 2002:a05:600c:3d16:b0:3cf:8b22:76b3 with SMTP id
 bh22-20020a05600c3d1600b003cf8b2276b3mr48910658wmb.0.1675122187029; 
 Mon, 30 Jan 2023 15:43:07 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a05600c314d00b003db2b81660esm3954242wmo.21.2023.01.30.15.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:43:06 -0800 (PST)
Message-ID: <b137b515-abcd-90c9-9d4c-8ae7f7307447@linaro.org>
Date: Tue, 31 Jan 2023 00:43:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 23/27] target/ppc: Don't use tcg_temp_local_new
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-25-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 21:59, Richard Henderson wrote:
> Since tcg_temp_new is now identical, use that.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/translate.c              | 6 +++---
>   target/ppc/translate/spe-impl.c.inc | 8 ++++----
>   target/ppc/translate/vmx-impl.c.inc | 4 ++--
>   3 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


