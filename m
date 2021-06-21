Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1233AF49C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 20:13:34 +0200 (CEST)
Received: from localhost ([::1]:54328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvOQP-0002Q0-BN
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 14:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvOPS-0001iq-Hg
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:12:34 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvOPQ-0004Q9-Rs
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:12:34 -0400
Received: by mail-pg1-x529.google.com with SMTP id m2so14812375pgk.7
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 11:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kciJreeDe8p/Q9wFP4boSEzW8WYowCm3wrrCn6PGi78=;
 b=qj/Z7qHI6knIQS61hk9/1Te1JfLAgKJU8j89eecOB1vbsjdFhJpnXO/okfHLXf5DtU
 VfJ6G2ULzUXSdOUUFeRR/8c1reLwOgqOqXirgI4FPWLVJhTV5JaMsYO4JGAjEeDfuQvS
 vEJreIADMBooN5szPVmdsIIIBHJylupjbiQb9lbeYXIP8s7KYtfQ6NDKb5UF2lEnltLg
 JBWv8PZ7ytRwuKxQqMN48eNsUyubLfkB8zWF7yK7SV9nqTQl7mEQqDU3R8GWi4XwnkTj
 4fHH734ZpGT/m6XOgkZ6ghu7fzNkCQnQc0GjeKLa66qzRPbeK2wezB/Cg01+yNAhxPC5
 /whQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kciJreeDe8p/Q9wFP4boSEzW8WYowCm3wrrCn6PGi78=;
 b=jHQE2zQe+hMBA0KvIcYOeWVOorbr2C2hVFkej47QyIBUBAfLQ9RRmNZFheyoIM32i1
 Gki0kgK+MOFOUjTjBOzKjlPh70m8upyedoQRTX9SNpXkH7BrKNF+8rsT5gda/4OT4UX4
 1N3WqdYToQioAyWAwxAf39hdl2E9w/cwHqWrG0uAfURTzDQCS3HniDiF9Lsz5BUry1aV
 YeCZC7T4qcSDW/Np8rCJwVlVE8jm0tinryUU0SWcvfEqikuoinreRecEEw6PHNxAQYcB
 P03RrGfWTxe8rA4vF2Yw/X4noRsEo27maCCqPZFPsUT9q8k8OltZfemV6k/DaXJhj37m
 JWEA==
X-Gm-Message-State: AOAM530bszWnzWWV5Pa5r/3eFrAcBLXnuonmuUO1Z+biwTsQ29ZWSuuv
 +BbHgd75boHJiTL6ZL0JTMClKz9AfjzmXw==
X-Google-Smtp-Source: ABdhPJze0j9Z3yNyOcHSOqKRCk2B+xQsxukyRDNuQ5Wym7+nD3tAr+I9IMFql2yPEpPn6Hut0wEz0A==
X-Received: by 2002:a63:1b0c:: with SMTP id b12mr25164551pgb.334.1624299151343; 
 Mon, 21 Jun 2021 11:12:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l7sm17338218pgb.19.2021.06.21.11.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 11:12:30 -0700 (PDT)
Subject: Re: [PATCH 03/28] tcg/aarch64: Support bswap flags
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-4-richard.henderson@linaro.org>
 <CAFEAcA-VMwff+-qzzwR_VLpZCSxJqga9ssHSDiLq9LyHKhPPSw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5a03a209-567a-df86-1b47-9cc39d82eb7b@linaro.org>
Date: Mon, 21 Jun 2021 11:12:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-VMwff+-qzzwR_VLpZCSxJqga9ssHSDiLq9LyHKhPPSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 7:01 AM, Peter Maydell wrote:
> Side note: it's rather confusing that tcg_out_rev32() doesn't
> emit a REV32 insn (it emits REV with sf==0).

Which is REV with SF=0 also has OPC=10, which is REV32.

So I think it's a simple case of the assembly mnemonics not matching up with the machine 
instructions as nicely as all that.


r~

