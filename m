Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AD431AD1C
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 17:27:43 +0100 (CET)
Received: from localhost ([::1]:33592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAxlm-0000Zk-Ty
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 11:27:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAxkQ-0007fc-Ng
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:26:18 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:32913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAxkN-0004md-2u
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:26:18 -0500
Received: by mail-pg1-x529.google.com with SMTP id z68so1691892pgz.0
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 08:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nv7ksf2rwFMof4xjpL9xdJ1NbST6O41uN2ocM0FwVCc=;
 b=PIZA8NyCJF5jvg3+sWqqeXXs/flMRg657knf7/siEdjfZ2ZfIgzfrbjZsbZ7rN/qZ+
 okXvP5lXau4ogyXpyvQzW01qFHNSRrUrkHobfQNr0CLsWgEEWH5ZSHSwZkva+Z3y+R5i
 a2h4VfpRVLooMbgRQZI2VwD2sc7oEuJopgAB7qRPwpD518Hnv2E91vwKNqRNoIm0qsuM
 BMazhBr0aBmy1qiaUDYSdUxcc1qbdLobCrA/1sa1IF+cqk6en7wWMQWLg8WACmK59h03
 G8tWHmV9oDSwFdKSMqNotddhpvVLZMky/Ltkq5oY/rad6jX4LX1LJ9jmdLWkz1ncpzo/
 lhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nv7ksf2rwFMof4xjpL9xdJ1NbST6O41uN2ocM0FwVCc=;
 b=Duz7RAZ/+Cac+sALjAaKBDkaaHnk+UNGZRcuZef8XGq2IkONzgOAzB8rurZ6j+wf+z
 zKV0rMgRQZ6wpUENoiEEcEXMNk4aZinShMJpZVvy9kqYrYdqgoNgY3P8Qse+XSpxVvEV
 Zf64gyNOqKD8cDGx7obB/01Lpvg3DUiMC65V2+xXUF6Eiu0f5DS3gulHfN/GaXTXbGB0
 cEKywoYgHBqu+Hd+vw0jAkIuWvQZMdlLYopwQQJQ5om2kJfokvha4Vnac20Ava+ZH6hp
 MztzOiEbgZ+Ueful2AQjWsH2BPOaC6fVDtR0lECFDhKD6drZJTeEI5K34H8whfMh8QXN
 0Adw==
X-Gm-Message-State: AOAM531XQUmzQ6zuzrLDmvoQnkf7Ag85I4+wRKDPVy96w+QjULMAicWr
 tuXIfiU/Zn86QHrHcJg3EjigoQ==
X-Google-Smtp-Source: ABdhPJzBn5JHcPm0mJ9XG5O3P6peVaUq7ZKVGecc85AsxPH7T4KK9xGcIakfMisPJTe9vBzFYY/MYw==
X-Received: by 2002:a63:ed58:: with SMTP id m24mr8066323pgk.45.1613233573410; 
 Sat, 13 Feb 2021 08:26:13 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 h1sm13151149pgj.59.2021.02.13.08.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Feb 2021 08:26:12 -0800 (PST)
Subject: Re: [PATCH v3 14/23] tests/plugin: expand insn test to detect
 duplicate instructions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210213130325.14781-1-alex.bennee@linaro.org>
 <20210213130325.14781-15-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0ad4b482-476a-f51f-455f-3044904c3bec@linaro.org>
Date: Sat, 13 Feb 2021 08:26:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210213130325.14781-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/13/21 5:03 AM, Alex Bennée wrote:
> A duplicate insn is one that is appears to be executed twice in a row.
> This is currently possible due to -icount and cpu_io_recompile()
> causing a re-translation of a block. On it's own this won't trigger
> any tests though.
> 
> The heuristics that the plugin use can't deal with the x86 rep
> instruction which (validly) will look like executing the same
> instruction several times. To avoid problems later we tweak the rules
> for x86 to run the "inline" version of the plugin. This also has the
> advantage of increasing coverage of the plugin code (see bugfix in
> previous commit).
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210209182749.31323-6-alex.bennee@linaro.org>
> Message-Id: <20210210221053.18050-15-alex.bennee@linaro.org>
> ---
>  tests/plugin/insn.c                      | 12 +++++++++++-
>  tests/tcg/i386/Makefile.softmmu-target   | 10 ++++++++++
>  tests/tcg/i386/Makefile.target           |  7 +++++++
>  tests/tcg/x86_64/Makefile.softmmu-target | 10 ++++++++++
>  4 files changed, 38 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

