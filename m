Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C47FD6F7E94
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 10:20:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puqeT-0007Gw-8s; Fri, 05 May 2023 04:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puqeR-0007Gl-1Z
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:18:51 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puqeP-0007sq-8d
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:18:50 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bcc565280so2198360a12.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 01:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683274727; x=1685866727;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CeatHWLZ/5FdfvOrx3GG2uSD8l2Mzrf8fLrIArXhG58=;
 b=Oqwbdv8nQ4TmjHao/6vhkJXPRL8ZyV0KTM9aReLEgl3FVn4r+J5UVI95BTX00qwVKx
 8RSEHB6UK2uoti4JFmk3wXcru4lMKHnGZlBISRqsA/Bl4IkhukN1GIpu0JL03Uo4yHij
 7D+nrnNqE0m21B2mDeC25TST6dmkjlVi293sog2bL4bU78qPWoHGOYr6547NthPSBeZ6
 ZgUDgEHQn+4nxYC25OL54Z5l8tsvrmOCGDVEdwu4VMx/2W1dPdlSffC33O6ZHO/pniJl
 uQsLvNxEM/kWEPVVc/B1oINQErgEEaQs5F81S1G9lCMYfFPMjhHUjXU+6eMCAo5OroYH
 wnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683274727; x=1685866727;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CeatHWLZ/5FdfvOrx3GG2uSD8l2Mzrf8fLrIArXhG58=;
 b=ZqyXGngSeDITIJi28/22uTXUSoyMmywQg73+KlR0jgQZFgbByaRpRZamuTYPWk0iVp
 3SWM07AIgVYnQM+9U5rbQrsGzjcLaXiYpco2IWfCJfQGcbtGbx5hi+1nQYMvHgD98BCS
 k/nmeGestYF3CBSJ9ytMM0xgANZXDvcWz11g//x0NDEByjHyCGfxTA/YcwCvs0rivEdv
 Qo6BSVd/4y7QraJAF35O1n+LSGI2Phi846NNgQcIf2qKtO80ietK67hsMrMyrNc1K+Je
 YRzYPKLqDa/7Ro+bv/PY5/3OIWvZe9miWbZXNOFenjWGZDrJfDzuSXAOmH9YT7NNsTvg
 BbNA==
X-Gm-Message-State: AC+VfDy/04VaCuNySpayWPeI3kqVdECJS+99skkEpZbBf9/VaYwtsMAg
 EVtSJ+bAjaMQCsSZ29Jrl92u4g==
X-Google-Smtp-Source: ACHHUZ7rUI1VDrPbTznhwZNgRl3KYcGUwSj8FclX4CirXW1G+YhDE+4wzSZRx88OBuRYXhgwrdp7fA==
X-Received: by 2002:a17:907:3207:b0:957:48c8:b081 with SMTP id
 xg7-20020a170907320700b0095748c8b081mr345824ejb.24.1683274727241; 
 Fri, 05 May 2023 01:18:47 -0700 (PDT)
Received: from [192.168.0.81] ([82.152.154.96])
 by smtp.gmail.com with ESMTPSA id
 bk4-20020a170906b0c400b009659ad1072fsm635429ejb.113.2023.05.05.01.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 01:18:46 -0700 (PDT)
Message-ID: <58a1c4af-7966-3980-afda-5868d9aef30d@linaro.org>
Date: Thu, 4 May 2023 15:41:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 0/6] Misc QGA patches
Content-Language: en-US
To: Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230504095657.239048-1-kkostiuk@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230504095657.239048-1-kkostiuk@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 5/4/23 10:56, Konstantin Kostiuk wrote:
> From: Kostiantyn Kostiuk <kostyanf14@live.com>
> 
> 
> The following changes since commit 044f8cf70a2fdf3b9e4c4d849c66e7855d2c446a:
> 
>    Merge tag 'migration-20230428-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-05-03 10:29:30 +0100)
> 
> are available in the Git repository at:
> 
>    git@github.com:kostyanf14/qemu.git tags/qga-pull-2023-05-04
> 
> for you to fetch changes up to 86dcb6ab9b603450eb6d896cdc95286de2c7d561:
> 
>    qga: Fix suspend on Linux guests without systemd (2023-05-04 09:30:01 +0000)
> 
> ----------------------------------------------------------------
> qga-pull-2023-05-04

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~



