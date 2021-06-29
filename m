Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4799A3B6DAC
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 06:36:53 +0200 (CEST)
Received: from localhost ([::1]:37758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly5US-0001OH-6z
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 00:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly5Td-0000iS-2F
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 00:36:01 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly5Tb-0001yR-9Y
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 00:36:00 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 m41-20020a05600c3b29b02901dcd3733f24so873971wms.1
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 21:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u0ku6AlJq+6DRT0cZy16aS8p3vbywV39CstbsY19HUo=;
 b=KzJRGVF5EYZdSgKcP3Ht3DJCPmpKgW+AluSkA0pL1QiCowZlMxKFSsz6A5O9Ov/+wG
 AbKXmAzTiLTWWqMy8aY8SlYEqtIkSQvELxFPgGGW66+4bNvbzWuO0S8we73Y/sNqeRse
 mX2S5GdWvrF+CkUjfCH7M2WMwt0MAA5fciGFkveX8f9WewWlFiB6M7FhChrZv1ERmBhh
 MuGqHU4JHiTrLDVp0UjMmiNAVItUmhI7LRsyCqSvz6eTJxMSuUT33i4N7r24M2MGaUwI
 TKHNT1URfQedICxvU2JJYrMgJFk+2O+vgGahoJtSNAR9BwPQg2VM0pGu1oC1QJV8mcik
 MoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u0ku6AlJq+6DRT0cZy16aS8p3vbywV39CstbsY19HUo=;
 b=lMgvq9g0M95GFFIBbIVD7ai4rZITUvBmqiEQCuxLGfUnjY+g7T2OjWhaBsoCinx/Qs
 4QIswz0Za4pPMtzMVVWH8V/ZEJqKkWuO6QAdK9l2uthKH6mNGZof4SQKVhxk1oLh3DhT
 1V5ZOT7AC+3VcLqRwETbfkq467LOjTK8r7aOQh2h4H/gJIK5GFOEcGAkPvmTZ2I7bXOW
 bXEki/OHkWN7vUt4+fGwCWY+sV2X7FQ4F5KhQvGCmf20BXgFuEoNx9dk6SfM/9NWgZgY
 1WFXgPRyKJ6dkqsIKIWBovcmx6SXNAbpslZJmCMh9KjyM2RcZS3kvEmPpudt4RpjBIAa
 kc3g==
X-Gm-Message-State: AOAM532wjIcWvHbQqYmkxydkf9obLyKtJ3RWqJj9nZK8uI2eWMvOK9g8
 0ccJ/LqgpVsSUKqovLC+ZMM=
X-Google-Smtp-Source: ABdhPJziCz9aQKPKo//wDO0NsXwsqenuG7nvndVv3USM7aMz+HmqL+sCekF+BvtT+yB+Kd1OaO07bQ==
X-Received: by 2002:a7b:c092:: with SMTP id r18mr7419323wmh.181.1624941356746; 
 Mon, 28 Jun 2021 21:35:56 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s5sm17029771wrn.38.2021.06.28.21.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 21:35:56 -0700 (PDT)
Subject: Re: [PATCH 0/4] target/mips: Extract microMIPS ISA and Code
 Compaction ASE apart
To: qemu-devel@nongnu.org
References: <20210617174907.2904067-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <81e2dfee-7f78-1eee-ea10-f9695b22ba71@amsat.org>
Date: Tue, 29 Jun 2021 06:35:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617174907.2904067-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 7:49 PM, Philippe Mathieu-Daudé wrote:
> Extract the microMIPS ISA and Code Compaction ASE translation
> routines to different source files. Patches rebased and already
> reviewed, except patch #1.
> 
> Philippe Mathieu-Daudé (4):
>   target/mips: Add declarations for generic TCG helpers
>   target/mips: Extract Code Compaction ASE translation routines
>   target/mips: Extract the microMIPS ISA translation routines
>   target/mips: Add declarations for generic DSP TCG helpers

Patches 1-3 queued to mips-next.

