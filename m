Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6C46743F5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:08:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIc9F-0004Cn-Q5; Thu, 19 Jan 2023 16:08:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc9B-0004CX-7q
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:08:33 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc96-0004xK-Qq
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:08:32 -0500
Received: by mail-pg1-x529.google.com with SMTP id 78so2584603pgb.8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 13:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eIgXH0spC70Hi9zgTKqd7JuXULzQuHOHo/pG+EDKQ0A=;
 b=qpE5OWIMIow7mZitPBB0VGGP54ZrfL3B+8zP/s3tjE6O8c7tNOpdnrGmsSmNLDoK2b
 /BsbiwXLzMm5aWSwse4DTvo+tLCaZkgcJYlw+Jgct4fGY1XLjyQ8zsPiec+4rlm13lXZ
 9f2wIWL6PvUF7kp+6sLx/meVjeL/zSre+AY7Hcs3ZZ45wafLzfDYBSpE6L9VSSdlcqAM
 ofwAqCbembmuzWJ0l1EwelF6g98FQlHO3zIJHdPW60jDUQ8PU2UlKePbwmlsxd4p90vr
 zO2iNrU+PzogU3pUy78fUslojB9s6sOeX8o4SNXzrSNImhEbTOdXGlOBlfJ2bt/Rl1Fz
 CdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eIgXH0spC70Hi9zgTKqd7JuXULzQuHOHo/pG+EDKQ0A=;
 b=6CyPPA8+RHTc4sxeckaukeVa3eF5u5fs4FQDCxx3mYyxPghLP0l5DXZaLLRZ3uVHpv
 hLe+4SRiZLseGCdkuuHTTzAWwHfj6tstn49Kj3QLuZOZWaPHcbmleZlwzGkdmBMBzhYv
 p3a+Q2YcUgCAaGX1LgAxje2a8NhjPalNkMZuhH5xiHao3DqX6+iYc5bP/QzzCa07VUc8
 Grt4VY/wZf+s9zKTmhFNFtU6D1L4liHNHKrZ+5afLDoi5iJGznrr90z7MFpFJhAS53hV
 g5KmWQyX4kuJhjSZkuly9/5zqD3No8Km6pFyv+MRb0nCSloHfYFodOrECMRbgl2r8Seo
 YhqA==
X-Gm-Message-State: AFqh2kqsICuZZ5AU+lEnADqjHJbtGtEgJS+AB6hJJ+9REilebe9h24fy
 vbd/dzI3H/yHd+B9r6ui9K4/yoFeR5+7zxUE
X-Google-Smtp-Source: AMrXdXvcq9oFGYYafbWEhlJQkgLjl2K7Eq9Q9g/BwrC+rruF+XlZ/yVrcSYho1uxxCNtb6M9MrbP7w==
X-Received: by 2002:a62:a507:0:b0:58d:e780:33cd with SMTP id
 v7-20020a62a507000000b0058de78033cdmr7169646pfm.21.1674162507098; 
 Thu, 19 Jan 2023 13:08:27 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 k197-20020a6284ce000000b00574b86040a4sm24563028pfd.3.2023.01.19.13.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:08:26 -0800 (PST)
Message-ID: <f8b054dd-41b3-1f58-4f67-a8093fad785a@linaro.org>
Date: Thu, 19 Jan 2023 11:08:23 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 06/11] tests/qtest/migration-test: Reduce 'cmd_source'
 string scope
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/migration-test.c | 29 +++++++++++++++--------------
>   1 file changed, 15 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

