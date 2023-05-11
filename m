Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3A06FED56
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 09:59:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Bj-0003es-Rh; Thu, 11 May 2023 03:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Bh-0003eT-UM
 for qemu-devel@nongnu.org; Thu, 11 May 2023 03:58:10 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Bd-0008AK-R7
 for qemu-devel@nongnu.org; Thu, 11 May 2023 03:58:08 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50bc3a2d333so12503636a12.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 00:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683791884; x=1686383884;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BM2GxTzbZL4qJdxREaki/VEz1+4KHCQRW6W2cyVMwnE=;
 b=gm/WPrg+Oi0ofwsYcO09ZDE2Udnt4q2NWVa5sVwD4Ih50AErlTVBksUtbNTjc1q407
 9eZTi63LK3c5CI/in514o5fUam9Mmd9GiBadDWHNk5YmpAuSvHRoaVmrUHa1qIrruLSg
 VskWBXSASbliTvLVSPrD1V4BZ0rTPNWVcze+G8nqlhJ70jrRgBCLAcQFaZxGoWOFknHO
 5RWarSdL2iYeVBBsg/U0gjGikv6jgIVYMcmzbV68PdusmkaXfpVcUqGnDYQ6kNEJSQX8
 z0emodw8/Q3gG7d6TfbcjtN08GDQySWRPW1RB8mdpt99eRKIoME8HWPgfvyzMDFbEsbQ
 E7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683791884; x=1686383884;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BM2GxTzbZL4qJdxREaki/VEz1+4KHCQRW6W2cyVMwnE=;
 b=QRNniPbF8Cik+Y1QyNQScHf/Qip+kfoNoW3a3TOcue/o8scQY68TStRQzlVGGfFtzP
 aovpVyTR5QYupAUG98XbZJXSaas+zdweiNYtIXdfaZB3fKk0j5/bU0lQj86PbfBVxq59
 C80mlyb6vN+Y4iH5ibq1CV5563D6WQqkAbEqeQS6UOSXfLcb5CkZYjeCLhKPyzk6K9Av
 iJ/OZGP2QturW//8pHIAdx/aXd91uC3eH7KZ4M3jelQJKX3nUMYxmi3eRquru+T6KO+W
 rhOG1kyFUf0YD/cZNf32ZnyiOr7CMWnH99XhvdJi8cS75vo1mjS3mqdIl/AWIz6X5OlG
 +gxg==
X-Gm-Message-State: AC+VfDysQD/P94Rqt4erX+6FF3m6lsgk+sZv66YGKDM8cuhnHKs8+CAb
 YbK0rIpw4OqwnajhXuwdVQSnWQ==
X-Google-Smtp-Source: ACHHUZ7+Wi5HMM5xj8N6qw+1b3R8bcKt8YhTULclUawFSv7cmRbaRL+Xc/mEUyVBbUEX3TyU9DADTA==
X-Received: by 2002:aa7:d705:0:b0:50d:8c5b:86b with SMTP id
 t5-20020aa7d705000000b0050d8c5b086bmr15335225edq.21.1683791884156; 
 Thu, 11 May 2023 00:58:04 -0700 (PDT)
Received: from [192.168.4.243] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a056402344100b0050504648fc4sm2683164edc.80.2023.05.11.00.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 00:58:03 -0700 (PDT)
Message-ID: <ec8c209a-1233-4abe-3008-53a16df96ea3@linaro.org>
Date: Thu, 11 May 2023 08:58:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/10] Migration 20230509 patches
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Markus Armbruster <armbru@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 qemu-block@nongnu.org, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230510180938.6338-1-quintela@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230510180938.6338-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/10/23 19:09, Juan Quintela wrote:
> The following changes since commit caa9cbd566877b34e9abcc04d936116fc5e0ab28:
> 
>    Merge tag 'for-upstream' of https://repo.or.cz/qemu/kevin into staging (2023-05-10 14:52:03 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/juan.quintela/qemu.git tags/migration-20230509-pull-request
> 
> for you to fetch changes up to 121ccedc2bf0c124e93991275336415d12d2e3df:
> 
>    migration: block incoming colo when capability is disabled (2023-05-10 18:48:12 +0200)
> 
> ----------------------------------------------------------------
> Migration Pull request (20230509 vintage) take 2
> 
> Hi
> 
> In this take 2:
> - Change uint -> uint32_t to fix mingw32 compilation.
> 
> Please apply.
> [take 1]
> In this PULL request:
> - 1st part of colo support for multifd (lukas)
> - 1st part of disabling colo option (vladimir)
> 
> Please, apply.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


