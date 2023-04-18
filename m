Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D04A6E5B9C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 10:07:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pogMS-0002cg-I2; Tue, 18 Apr 2023 04:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogMQ-0002cK-R9
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:06:46 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogMO-0002ws-0k
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:06:45 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-54c12009c30so554408027b3.9
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 01:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681805202; x=1684397202;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T206S/j2mJ6iFJ9ddZvDIQ94QkdXmRAObXTcMPLF5Xs=;
 b=Y/2sfocYkqZXyjCXedsqShr0DvpjzhSVuSo2Q2jumtkwVnHH/fyZDIBGVc8bnHvCuw
 wMK+wCHpBcDS9bgtGox1EtFRouby21ktRbczXPXuf3U5oJ/8qdN+gwVKqK9Dkzo8xpqy
 4BFcOPZGmvfE1rdSsyKLQziV3IuSpq5xOS3Ai7yI+897FTnQet+z6HNRI1Z1vQV1LEtN
 npq/lbhGQFvh4n5iwgz0ekqds2f6N8KktLARowVDmqVaQyiUJ6Iv03XD/7UENCDn9aeZ
 hZdV3p2z5dQKkGc226mewublZLOh/vivbY5lhcB/Kqxc63xPlUi9wy/4R6Om4zMrVXe8
 YqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681805202; x=1684397202;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T206S/j2mJ6iFJ9ddZvDIQ94QkdXmRAObXTcMPLF5Xs=;
 b=Yzy9GZUmIc4Y4r6Nq7nDM+57X155Puc2SOSnDGjBhGvkRnhRKIYFh3ojH+J7aikzis
 k3S9gEJOd2TYlfiL7XGZMKu4NPeWWvvbBJ9orlkVWq3WPAyHvra0YEfXeveF4S137YBi
 KbhczJyBLtcRbMNEtnK0WVko+Xg9Yg5ib1nNqMi6AqfyMwcZJSwNNvisAII3dCU6vfBS
 wUKzS0p/LMEvCP//90PlcplOpg6VfyPGJQx3p06AXNpILN2Wq/E+wmIKoPRr4DJLzhgk
 mmrGpO2H611wDxUE3pAPeISDHaKW3d1EHiD/BKJTcCn/SCW/uDp3p4XmwEo6QYfsmTzX
 mLlQ==
X-Gm-Message-State: AAQBX9eMFoBk54sIKS1Zaq/YeHgXdCP9ZdhwOcJi8ZVF7E5gZoATj1zC
 lFNMXT+UoKrEvqKqKHZWhavYqQ==
X-Google-Smtp-Source: AKy350YnaengKP5ZaysPQfgJLFMDJA6L2QDnZPYmBLDdJDiHBsb4nsEvtkf03szS2+ifk/oTI/4ngg==
X-Received: by 2002:a81:6fc3:0:b0:54f:244:807d with SMTP id
 k186-20020a816fc3000000b0054f0244807dmr17343190ywc.11.1681805202267; 
 Tue, 18 Apr 2023 01:06:42 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa?
 ([2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa])
 by smtp.gmail.com with ESMTPSA id
 135-20020a81148d000000b0054fadeb9899sm3686043ywu.35.2023.04.18.01.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 01:06:41 -0700 (PDT)
Message-ID: <bcd87bea-110a-81aa-70a8-b65fc19b3aab@linaro.org>
Date: Tue, 18 Apr 2023 10:06:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 07/10] accel/tcg: Report one-insn-per-tb in 'info jit', 
 not 'info status'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230417164041.684562-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
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

On 4/17/23 18:40, Peter Maydell wrote:
> Currently we report whether the TCG accelerator is in
> 'one-insn-per-tb' mode in the 'info status' output.  This is a pretty
> minor piece of TCG specific information, and we want to deprecate the
> 'singlestep' field of the associated QMP command.  Move the
> 'one-insn-per-tb' reporting to 'info jit'.
> 
> We don't need a deprecate-and-drop period for this because the
> HMP interface has no stability guarantees.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> The new 'accelerator settings' subsection of the output
> currently only has one item, but it would be a place to put
> other stuff, eg if we wanted to mention whether split-wx is
> enabled.
> ---
>   accel/tcg/monitor.c         | 14 ++++++++++++++
>   softmmu/runstate-hmp-cmds.c |  5 ++---
>   2 files changed, 16 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

