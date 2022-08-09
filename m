Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B8F58DC5A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 18:46:12 +0200 (CEST)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLSMt-0002bU-DX
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 12:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLSKH-0007YA-3R
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 12:43:29 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLSKF-0006bQ-BY
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 12:43:28 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 q9-20020a17090a2dc900b001f58bcaca95so11411446pjm.3
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 09:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=iSjotF1RWy4C7SAQ7UaXDOf0VH82cd+zVbAvHS02gTo=;
 b=KyzqFIqr+tuKAmmq6/0iw5OYnz4dmaDsgkPHvm5goNlrLQn8NlliljthCeYr1GA5Te
 wMqJNXSD566MqyH92nGqTVwLT/mV4QgGWI8LR4IQR3XlJbL3HRGo71aHj0S5vgJWpZJ4
 oTi154c635cSmAYZwEqqWl+9xXhEleDEFHRSkZdfXG5BvITjTYvaPaZPYUaqC0w8aJI9
 e+nZAiMpi70xuv8aihU+hVLEQlr2EF4P+yMJGjdies21WeGKbkrry93ksymqVSSMAIEe
 mDTkWnlPC93RjkkwuGziM6Uj9ch0PAxL7vI9zGayJEGqG3rE3VCFrqdFuBXyFhiOWdwd
 KGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iSjotF1RWy4C7SAQ7UaXDOf0VH82cd+zVbAvHS02gTo=;
 b=FQym5AhrGGbdNIHQaU/QzHei0aK1TJ/tFgXTtR7C5uKNwLL0lXDf9Fc8QswoRcMrKB
 e5eaqC+zxW73CgthnzVXtwhzfjpXXHkTt+UKc0+bZapX0BPgCXQ8DvfAktDy/V1YsOzZ
 DhhHzHnO/GKdfayIUrY9SQw5q3O3Wull1HMPllAd/YPCv4rR6CrRCxJklEeaEN3x9AYm
 S1ADtJNBLeG8wW/xPHD+fJAMCzcMAsyKhoPIxD9fTWvd7sTHpsYTwKl0bjK0OpQYwZLG
 ODAhrSwHiNCZlizKSLdXWokfRUZ/7lKr+mPFzi+qpxUZy9w2/V/CucWQYotTP6g7IVFM
 AtVQ==
X-Gm-Message-State: ACgBeo220aOrUaUKS+tDkEC7Yl37mdwZYMdjtr8dYykLluI4MN64a6+a
 /nCvSUEbMaEpzV9ioG5nn3f9iHg1J55D2Q==
X-Google-Smtp-Source: AA6agR5ghRDtC2Ihv5Oma4LMTK8lg/MPPtDmuCPyjUficNDOdjXoDKpRiJ+7+wlAhbwo+Sv3m95mvQ==
X-Received: by 2002:a17:902:7d97:b0:171:2c03:6cca with SMTP id
 a23-20020a1709027d9700b001712c036ccamr1751875plm.48.1660063406540; 
 Tue, 09 Aug 2022 09:43:26 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:495:73dd:dc6e:5d95?
 ([2602:ae:154e:e201:495:73dd:dc6e:5d95])
 by smtp.gmail.com with ESMTPSA id
 q13-20020aa7960d000000b0052dce4edceesm103737pfg.169.2022.08.09.09.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 09:43:26 -0700 (PDT)
Message-ID: <ea864510-20d8-f7cb-f17e-0a0e61e247a7@linaro.org>
Date: Tue, 9 Aug 2022 09:43:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL] Net patches
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, peter.maydell@linaro.org,
 qemu-devel@nongnu.org
References: <20220809090859.28338-1-jasowang@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220809090859.28338-1-jasowang@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/22 02:08, Jason Wang wrote:
> The following changes since commit ca5f3d4df1b47d7f66a109cdb504e83dfd7ec433:
> 
>    Merge tag 'pull-la-20220808' of https://gitlab.com/rth7680/qemu into staging (2022-08-08 19:51:12 -0700)
> 
> are available in the git repository at:
> 
>    https://github.com/jasowang/qemu.git tags/net-pull-request
> 
> for you to fetch changes up to 7cf745dd9c25f0740dc1009598b58dd8dd989876:
> 
>    hw/net/rocker: Avoid undefined shifts with more than 31 ports (2022-08-09 17:02:18 +0800)
> 
> ----------------------------------------------------------------
> 
> ----------------------------------------------------------------
> Peter Maydell (1):
>        hw/net/rocker: Avoid undefined shifts with more than 31 ports

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
>   hw/net/rocker/rocker.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> 
> 


