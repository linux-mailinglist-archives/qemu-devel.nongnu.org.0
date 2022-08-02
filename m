Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17735587D44
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:39:22 +0200 (CEST)
Received: from localhost ([::1]:45674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIs7D-0005WN-2x
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIs4x-0002PY-8H
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:36:59 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:40802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIs4v-0002Jv-KN
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:36:58 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 s5-20020a17090a13c500b001f4da9ffe5fso8390064pjf.5
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 06:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=T+SgRLR64nrrzWs4cccgOigl9vI/WlfWCx/WIOeGqc4=;
 b=VPpB9TlfcjAE5sQC3Kds2d0sZd3Da6iB640tiPfZaCZhqMWZGk6zBF5dh85FBSHUJl
 +bGbdzbyJ4EozD0Wq8cJIQK2zn7AHnpprfcyYdvqwZk/uSvimzAm+fgszuyKFxBml4qZ
 c9HlsriSLtoYpYiORvBP6HBdtuh7LDVmKs5lfVlUv8ISqmMl66OUIQwrLVMxQdEEAMMo
 1EE/wJgG6ni20L8Rego9ogDZJncRJVlDjlx/xd5gALU7QmVwJlMnTLNK6Z2Az7qzin8Y
 /6KB97hSCiDcTrznvwgRhCwvZXh2/g1PdQq4Nyfx7PBVb7rkyAQDgtIi11p95gE5J7S3
 gi6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T+SgRLR64nrrzWs4cccgOigl9vI/WlfWCx/WIOeGqc4=;
 b=og0jObAhLeV6L8EWdlIYynk9YewEQBoUNN0ZT6IyxD/M/8L1KsM0Rnbqf92ePREl1I
 AHAoVuuZx3ofwPWiUkiyLdFWnJfIxYEt1QVOR5LY3yu4H5qUgUbKpiPpCHEzBmiapjQO
 lAtVMpBqSqyxEACl+yUlQMJ/E6uDDOI6dRptPOpez309n7Ob8URTbCp4JTeK8ouSnYYQ
 5yXN/hmKU50DHhlqjmnb5m9s2npEv0Dr+25vqgd2GvRCYNr5kb+V3uS3b3bnNcaGIb1G
 Z4CZa63LtXZcwe2akZtZBflnzPtKKU5+RYEzE9RfdHFges+s7O+QL7SckzEe8bZDsIqE
 iIDQ==
X-Gm-Message-State: ACgBeo0WHnXxs+ciDK3Kzcs0qZ4DxWWi3cX7O/B4/Fkc03Hz8OvylJrr
 QYpWJ+YQwWcx2+grlE7v+xybAw==
X-Google-Smtp-Source: AA6agR4id6uygxFMsEv6e+Bj/fo/3ApsgfKvLQ4/mAmw4qKSmJfUBQWi2VrLEeJQKB+tlsSZmlF1uw==
X-Received: by 2002:a17:90b:4653:b0:1f3:1ce3:2cb with SMTP id
 jw19-20020a17090b465300b001f31ce302cbmr24739247pjb.176.1659447415930; 
 Tue, 02 Aug 2022 06:36:55 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:9b48:8d61:390d:9808?
 ([2602:ae:1549:801:9b48:8d61:390d:9808])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a17090a708100b001f4e8dbed8csm5924901pjk.7.2022.08.02.06.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 06:36:53 -0700 (PDT)
Message-ID: <7f02cecb-1b94-04a9-ef86-66d183377f95@linaro.org>
Date: Tue, 2 Aug 2022 06:36:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/1] riscv-to-apply queue
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
References: <20220801230212.3406689-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220801230212.3406689-1-alistair.francis@opensource.wdc.com>
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

On 8/1/22 16:02, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The following changes since commit 0e0c2cf6de0bc6538840837c63b25817cd417347:
> 
>    Merge tag 'pull-target-arm-20220801' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-08-01 12:00:08 -0700)
> 
> are available in the Git repository at:
> 
>    git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220802
> 
> for you to fetch changes up to 1eaa63429a9944265c92efdb94c02fabb231f564:
> 
>    linux-user/riscv: Align signal frame to 16 bytes (2022-08-02 08:56:49 +1000)
> 
> ----------------------------------------------------------------
> Seventh RISC-V PR for QEMU 7.1
> 
> This is a second PR to go in for RC1. It fixes a bug we have had
> for awhile, but it's a simple fix so let's pull it in for RC1.
> 
> * linux-user/riscv: Align signal frame to 16 bytes

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Richard Henderson (1):
>        linux-user/riscv: Align signal frame to 16 bytes
> 
>   linux-user/riscv/signal.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 


