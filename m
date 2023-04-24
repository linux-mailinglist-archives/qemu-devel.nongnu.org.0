Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76186ED298
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 18:36:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqzAl-0001pH-Gz; Mon, 24 Apr 2023 12:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqzAS-0001YV-VL
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:36:03 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqzAR-00072b-7E
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:35:56 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f19ab994ccso24664635e9.2
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682354154; x=1684946154;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B9JU86cwotz75o8zF4Hf7xvRe/MqLjBnctHENlhKvlU=;
 b=j07PHXgBdVryR3TsIQMjJOrwbeKDMbNF2DX2pL8JPOrsZSVLkGEpt27DtboV+5W8N0
 ZvhO4hOcGli3tug5H+VcbrtYC8F8ERxA+YiX0Yowue0ipPBLg0e/Azgxy7PD0VNfXZhG
 gJagJGu+teWezkOwY+LsqvWuot7vrPvoEI2o1freMHvyJghq9XDYZwNRs26de3WF5Hrm
 WDhg6eEsVqKSDj6qi4Mz6a+M+DH2UgjH/Jh9v8n3Rl7vsaq5wRhIjymVGPt+4nRd7Tq6
 OTP1oqhlz4VfJC3bWL26xCdGTR5TOkRGPD59BY4O6F5AE6eV0/jcW9GJDu/mSUnnPXAW
 n3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682354154; x=1684946154;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B9JU86cwotz75o8zF4Hf7xvRe/MqLjBnctHENlhKvlU=;
 b=ewSvGnsM08DXBZxm3lhj0nFQ0XKIXP6+RXOR4HbO0HEJWC6RtQ1mAGFuEhbQQTsPEY
 QLXFbsM5a7oNXkC/j50og2B7ANbWP7p2CdcOFu6OxlRirws7AnGRDbUDSxbNIS+R4qFm
 jSqyDg5TQL0EhKO4wi7gzkL/xbBS1jEf66bbCNX70qHWl3kFcXdAIwPZyvKMYuBGXz8c
 w1OXrM/908/CHzVZUgZz5WHuQtsk7Y5hCRNfAqs/nnAVZ4Pr7eQRwa4Dl3D4w+gQ1g9N
 iizTDO0iftFL99Njj/nUpUyTENoIuPwigFJNgYeqjD9WKYP3juagLDdQJcdj3TBZ3DtW
 V1MA==
X-Gm-Message-State: AAQBX9evOkauB4hlQgpQrroo9NLJgLAUVex2+AMrXMjSnL0XIawMiEKL
 h7BaxthUUGkJp/Emd6D/i8S6ZA==
X-Google-Smtp-Source: AKy350ZTtDqWTHnzHnwZH5QsLV1c2pXzVDKb4GSYjTNjMV1Dkq1p+ifuTkAtKQAPcXL/6kPQpWX4SQ==
X-Received: by 2002:a1c:7c13:0:b0:3dc:4fd7:31e9 with SMTP id
 x19-20020a1c7c13000000b003dc4fd731e9mr8375894wmc.7.1682354153762; 
 Mon, 24 Apr 2023 09:35:53 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 e26-20020a05600c219a00b003f180d5b145sm12575047wme.40.2023.04.24.09.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 09:35:53 -0700 (PDT)
Message-ID: <670e28e4-246c-ec2b-7924-f73fdb6ff176@linaro.org>
Date: Mon, 24 Apr 2023 17:35:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/30] Migration 20230424 patches
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20230424132730.70752-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230424132730.70752-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 4/24/23 14:27, Juan Quintela wrote:
> The following changes since commit 81072abf1575b11226b3779af76dc71dfa85ee5d:
> 
>    Merge tag 'migration-20230420-pull-request' ofhttps://gitlab.com/juan.quintela/qemu  into staging (2023-04-24 12:06:17 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/juan.quintela/qemu.git  tags/migration-20230424-pull-request
> 
> for you to fetch changes up to 9c894df3a37d675652390f7dbbe2f65b7bad7efa:
> 
>    migration: Create migrate_max_bandwidth() function (2023-04-24 15:01:47 +0200)
> 
> ----------------------------------------------------------------
> Migration Pull request
> 
> Everything that was reviewed since last PULL request:
> - fix to control flow (eric)
> - rearrange of hmp commands (juan)
> - Make capabilities more consistent and coherent (juan)
>    Not all of them reviewed yet, so only the ones reviewed.
> 
> Later, Juan.
> 
> PD.  I am waiting to finish review of the compression fixes to send
> them.
> 
> ----------------------------------------------------------------

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


