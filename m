Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0727D51604E
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 22:19:12 +0200 (CEST)
Received: from localhost ([::1]:38406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nktYc-0002Lg-Tm
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 16:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nktWd-0001Ro-GR
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 16:17:09 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:46784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nktWW-00018F-RE
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 16:17:02 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso4539910pjb.5
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 13:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DBfsXkA5zh6pKbinf9hJeY+aF29mNj6juzE7VF/k17M=;
 b=x42izZYG7e4nPe29IYAC5cCcu1ON0pzW68PEZdllKeqBfW3s1aAA4+4VYz7uUzyE1H
 L0bkubT3TgKS0mAQx4fmRkdWlXl7ugvEmDChg6yqNYfOLaYlmJVfRLS24VLPhNW26JRY
 NWgajhLdq5/TbHbMpqon66QkRy26THkimWyji/KdVIbQ6RwOpNovXxxOSpHVD0XWXaI+
 m4PG8mg80kk92DelAXeOLAVAMu8/PmuA7w3a1v0XrZzeNlUb6GjvZMcpeAB7xJ6J9Amb
 FXFkU+orCdmrC+SbXUErbqgSwowOKXMIS5EyZqgtTvmiGtI1eNvtibrf1t/QRe7NqjMI
 Qf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DBfsXkA5zh6pKbinf9hJeY+aF29mNj6juzE7VF/k17M=;
 b=s6JmcT71jTRZDr52YRmIrFPvl3xoTizkTNR1MltWAa51QRK3FWOcGP+06LdTt9X+wM
 B9e7jRkYsfR4FvbuBtF2mNeNf6RbBcFqbq4aaiQEj0EUBrx2MHC42oYtABHrw+PC15wX
 m0v6VZ1SijcFf+eZocr+Ml+oP2cpnk+iDYnL5N7hdAf8OwW2J8OEn2G693zSKbhy6Slm
 yQSHUEVonbv1EOwGVC6v7nbPP5aiuCjsl9DV3LWCd58Q4SHEhdANDsisyfV8gyCfroRH
 di1VJ6jmni6CTpkf6w6wrA+fGBp7Kao4rWQrl1Mk5vtRIxIwTC7NQfcAMWQ2nlJZJni9
 Jmig==
X-Gm-Message-State: AOAM53061fLgwjJFiwxboCWkIwYXeQHaBEqfZYmYeiIcQECvJcX0pPpA
 QCe4ZdLiY8dA0UjctwMAPJG9HQ==
X-Google-Smtp-Source: ABdhPJwRsRHhsP8DI2O5uUUXtSK+VWzKuu89dTSDyL8usLNEzTHzjC3aiYFi+K2eXMgCEo3pxgFHEQ==
X-Received: by 2002:a17:90a:e7c7:b0:1d9:6a37:9f5e with SMTP id
 kb7-20020a17090ae7c700b001d96a379f5emr5450497pjb.156.1651349818827; 
 Sat, 30 Apr 2022 13:16:58 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a170902ba9700b0015e8d4eb1fesm1859607pls.72.2022.04.30.13.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 13:16:58 -0700 (PDT)
Message-ID: <1d8dfad2-c183-8113-f09c-bd5d9c33722e@linaro.org>
Date: Sat, 30 Apr 2022 13:16:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/7] 9p queue 2022-04-30
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1651319081.git.qemu_oss@crudebyte.com>
 <d218e8b7-2d0c-a24c-7fff-c33d175549c8@linaro.org> <3704033.BMyLRrx2Jx@silver>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <3704033.BMyLRrx2Jx@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/22 12:29, Christian Schoenebeck wrote:
> I suggest I just s/AT_SYMLINK_NOFOLLOW_ANY/AT_SYMLINK_NOFOLLOW/ on my end and
> post v2 PR, for consistency and as it does not really make a huge difference
> IMO which one of the two is used in create_socket_file_at_cwd().
> 
> Any objections?

Sounds good.

r~

