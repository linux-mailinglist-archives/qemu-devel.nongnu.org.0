Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6035451A5EB
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 18:48:22 +0200 (CEST)
Received: from localhost ([::1]:42498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIAn-00018m-GV
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 12:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmI6E-00027L-L8
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:43:38 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:39722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmI6B-000849-Ov
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:43:38 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-deb9295679so1734937fac.6
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VN94dn5l0ymg0lVHTql7vhI49nG1jWoSUAXH4MQcfPw=;
 b=oA0mNEFXxDPYiynNQOTf9Bpp5uGdyBNcxr1wSN7wZ+LBlikRCCaMhxM+Ijcu4c/OwE
 QujZpVxNBDn1J10t4O+yFxA2iWrnjHaRFLpKTZTYyE1tSoI+M8bwTxOo1R6xPkUxyejx
 6e4kB+baZCtJwbb4e25T7hVruJIza5YSKZHQH8QleS//+1Qq8HqJFCo0QWF7ouDhkBGS
 6ldkR1Zg/7GKhQi2WTus13EM2OUogkYfkrg/mQC31msrChCilRXUaP1sbzI5pDr3wMq2
 l51QB7zMsx+48w707osrp0F7Ep5TTtwkIla02mjP+bXmIksvA0pDHx8NbtTiMWHG/UNS
 oaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VN94dn5l0ymg0lVHTql7vhI49nG1jWoSUAXH4MQcfPw=;
 b=doFpBxHTgfwhXK/kWQEYZcDdIycgJTtfvevrdRhSrtbjrhMr05dt5O9gBh2j9YfqZe
 C4LabQwq8zJi9xl4U6CopMg5KIjR+vEtA/LXY3reHL8WdjqOwvjPhwW0PYh4kpJj7mf8
 Ww4Y4nN7Umz75bpU1TgvWvvfs/zlZ3hGxwpTQv5+H2JR8cCJO/0qRd8T3iD8BtW76VQ0
 IVaWLOggcoV6f24M1LJoYgknyMKNbN5WGVOeW3u1LKq+6UTiQYkWOmwzqvjkJr7rjDG3
 tMqhTv54xe9gX04ulLDv0iqK2OzV/o0qDdNwVJAQuXYuAc6k9AZlTfSGJG+QylHqVXwN
 5Rxg==
X-Gm-Message-State: AOAM530c04e3m1A/CS1eCDvud4ZYwqwXK3RGEOFCO+OQXrn0L+PF4woA
 347bprmoJO+Ok3ZGuHvlsCypXQ==
X-Google-Smtp-Source: ABdhPJzT0CiE2DltslvvN5WHCHg0jnoTd7rnZjb3phXDZ7090CVogXPACIk2qKfPkV+vCy3u4vSFfw==
X-Received: by 2002:a05:6870:c14b:b0:e9:7ac2:230a with SMTP id
 g11-20020a056870c14b00b000e97ac2230amr166138oad.264.1651682614210; 
 Wed, 04 May 2022 09:43:34 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1?
 ([2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a54478b000000b00325cda1ff93sm4580236oic.18.2022.05.04.09.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:43:33 -0700 (PDT)
Message-ID: <cbdbd90f-de6a-fc7f-0245-f3aac936a9b2@linaro.org>
Date: Wed, 4 May 2022 10:38:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 2/9] replay: notify vCPU when BH is scheduled
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, crosa@redhat.com,
 f4bug@amsat.org
References: <165165712922.1062896.3966737516733314504.stgit@pasha-ThinkPad-X280>
 <165165714007.1062896.13693480594668205608.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165165714007.1062896.13693480594668205608.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
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

On 5/4/22 02:39, Pavel Dovgalyuk wrote:
> vCPU execution should be suspended when new BH is scheduled.
> This is needed to avoid guest timeouts caused by the long cycles
> of the execution. In replay mode execution may hang when
> vCPU sleeps and block event comes to the queue.
> This patch adds notification which wakes up vCPU or interrupts
> execution of guest code.
> 
> Signed-off-by: Pavel Dovgalyuk<Pavel.Dovgalyuk@ispras.ru>
> 
> --
> 
> v2: changed first_cpu to current_cpu (suggested by Richard Henderson)
> ---
>   include/sysemu/cpu-timers.h |    1 +
>   softmmu/icount.c            |    8 ++++++++
>   stubs/icount.c              |    4 ++++
>   util/async.c                |    8 ++++++++
>   4 files changed, 21 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

