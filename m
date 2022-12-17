Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F2B64F612
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:23:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Kz8-0006pF-AS; Fri, 16 Dec 2022 19:23:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Kyz-0006ot-0y
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:23:18 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Kyx-0001z4-Ht
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:23:16 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso9494234pjb.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hTrlSIKMyWw0KQ02zCtzhBJniMiiTJL1R3HSZCG4zgs=;
 b=bJiRAeI+OCrpa8Pd/Wy4l1zk83ttz4moS8hZSb7xiGYBWYE1RjB3wo1KDLenf+GvrY
 AYV8YywUWF8L1RFmSRQaPhNx1A2TXu82q9rvQVRB1JtDxgzHKq56Ge5N381rlC81kPQK
 wMtUzmy0jyxmIdJKAzk9O4mt9eoJK+9lBQf0BzDfV00N+gErfxKZycu2u75CqaySqqZ9
 geKNT6HpgYF2HqWHFnbeOIbxZ4OXXWPaaIxCWu7ncHW1jJYUVjcPQRWM8J/o6K8sYxtK
 7aK4a8hZj7zAlPzl8Lbs46T/Kuf6t0MrLz6TjYGkWbuSLDipYNkCOjUmCv+OnS/cM+zK
 E+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hTrlSIKMyWw0KQ02zCtzhBJniMiiTJL1R3HSZCG4zgs=;
 b=8O4qdgZEbqCneDSf70xEBPyIdgCG5tQ5jbVwdedHp/JgdGPcbRYLrf0xMjREhe1FnJ
 RXAoS9bQJ+gER6/ymF9DEOoka7Wy7/wHF9i+bu9a9hrd0zWQAQzxqurLYB2rENgahm3p
 SiXlSwdTNVNiUgIrl9Kb3C+X4QdYALY9Mhit1ZU4OEeLM+1zZw47AsojYx/1oMqKCPVz
 rUgLpgG+6ZooIGw5aoJnHcBBCPUI8xIVLnu6bx3s8ZdABBTcG4llwS7hkiE2wM1MFvlE
 nQ3o/aHIB+TO+K0puOjNp8R8M/0Q/ADnlo7k46JmLbDNPB4NCRSi0dMM1ZD8+UPyLXNK
 XrsQ==
X-Gm-Message-State: ANoB5png9m4Zv8trUHShjqHOt9ZJE/jdFA/BYcUsQk+y46iuHu8RSp02
 sAX09WZaC6sPh88S44Osb/3JYg==
X-Google-Smtp-Source: AA0mqf7bloUwoXd5T2WRQQ1x4aYIFOZ5RonYyPPoBr71+iCpZW+cecbYLuhfkE1vioAvJ61O/b3TeQ==
X-Received: by 2002:a17:902:f10d:b0:18f:a447:2254 with SMTP id
 e13-20020a170902f10d00b0018fa4472254mr20671441plb.64.1671236594057; 
 Fri, 16 Dec 2022 16:23:14 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a170903234900b001885041d7b8sm2153698plh.293.2022.12.16.16.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:23:13 -0800 (PST)
Message-ID: <72a72b3f-569f-0de5-daf5-0ea674a326fd@linaro.org>
Date: Fri, 16 Dec 2022 16:23:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/5] target/i386/ops_sse: Include missing "cpu.h" header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cameron Esfahani <dirty@apple.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>
References: <20221216220158.6317-1-philmd@linaro.org>
 <20221216220158.6317-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220158.6317-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/16/22 14:01, Philippe Mathieu-Daudé wrote:
> 'Reg' is defined as 'MMXReg', itself declared in "cpu.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/ops_sse.h        | 1 +
>   target/i386/ops_sse_header.h | 3 +++
>   2 files changed, 4 insertions(+)

No, both of these are multiply included.
If you like, rename them "*.inc.h".


r~

