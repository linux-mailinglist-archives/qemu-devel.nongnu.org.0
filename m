Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625296C369E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 17:11:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peeZi-0004a4-Jj; Tue, 21 Mar 2023 12:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peeZg-0004YI-Mg
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 12:11:00 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peeZe-0003Y6-It
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 12:11:00 -0400
Received: by mail-pl1-x630.google.com with SMTP id w4so8472545plg.9
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 09:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679415057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IQdlLZtavIs61irfi0ZZ/29qnT8dfTZ8UWRT5s2iUpA=;
 b=NoUOpHGDaBl+mYAQkxKUD07D3egsxMuoYNouxVUUxGNWJ+cWoMVl6trPLk6MYIp2mA
 jNiI9zI1Z0zKDbMIQPaZ3mwLvdZA95wmNHZD+evQVisOhU/osOXQolOGbA7gvxvRUOfb
 ofRvf02aTlnu7Lme/yfg07rfWDpkmVJyt0E3+bKZmq19/H+Fv/31aJf7QgkEYnY06THC
 vmsee9EAAxujvKtY0g8/ksmMGNulKQ2SFNjEYQ8bjwYlyhWMGU9NBxKyS/DuQzV61DAY
 2ucTy1kfX8xmoMPPdmqKteTwXHne/vbGMPeXayaoajT7Lby1XuaS7HLPddoW8kTWF87s
 YAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679415057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IQdlLZtavIs61irfi0ZZ/29qnT8dfTZ8UWRT5s2iUpA=;
 b=FETZkFfobVomvvlYDjE/Z7YEZRyEKUkXrG3T4X+MONzTYxWmEQGoO/wtDq3nv/I+FJ
 g4LD2ojT8a+ohIIlFPVLLVKu9lNHsPuJw7pbfmTj/6egrRtBUEod3zXmT4Rh7cBpfFEo
 LiZtRl6I/CWnvhlapSnFYrSAd+YtqfunVgQY7VcnG87Px28kV/aA8dEWOov2+MKxhyC6
 31ON3KVQ/7vM5eAPrC506jM8d1oNrNIPlsiTiQvHd8tslKakV0TdKKVOR8MOQdglFejG
 C2aMu101V/L1wa8zsxR9KOFgrfBtVdUT60esryLoVkbwjq2xJLVOrCDIt3SPpfJnJ6iD
 rypA==
X-Gm-Message-State: AO0yUKVwbwLrLQtxkZ8bw6LyDYI9g52husf3FFP5RdoKz0nDyYQFEKbK
 cOGNidqcXoMFU5Dd3s+Zi1E5eg==
X-Google-Smtp-Source: AK7set9v2jwXfdT/WTpvjGlVnv2ix8N+qx2nyTflNwTnrmaPFsmEsHe3KQCDH2h2SKKAGvTers/YMQ==
X-Received: by 2002:a17:902:dcd4:b0:19d:1a8e:836f with SMTP id
 t20-20020a170902dcd400b0019d1a8e836fmr2281810pll.27.1679415056874; 
 Tue, 21 Mar 2023 09:10:56 -0700 (PDT)
Received: from [192.168.149.130] (097-090-106-114.biz.spectrum.com.
 [97.90.106.114]) by smtp.gmail.com with ESMTPSA id
 21-20020a170902c15500b00198ef76ce8dsm9013638plj.72.2023.03.21.09.10.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 09:10:56 -0700 (PDT)
Message-ID: <609e4659-532f-0fe2-447a-f7deaa0824e5@linaro.org>
Date: Tue, 21 Mar 2023 09:10:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] target/riscv: reduce overhead of MSTATUS_SUM change
Content-Language: en-US
To: fei2.wu@intel.com
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20230321063746.151107-1-fei2.wu@intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230321063746.151107-1-fei2.wu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

On 3/20/23 23:37, fei2.wu@intel.com wrote:
> From: Fei Wu <fei2.wu@intel.com>
> 
> Kernel needs to access user mode memory e.g. during syscalls, the window
> is usually opened up for a very limited time through MSTATUS.SUM, the
> overhead is too much if tlb_flush() gets called for every SUM change.
> This patch saves addresses accessed when SUM=1, and flushs only these
> pages when SUM changes to 0. If the buffer is not large enough to save
> all the pages during SUM=1, it will fall back to tlb_flush when
> necessary.
> 
> The buffer size is set to 4 since in this MSTATUS.SUM open-up window,
> most of the time kernel accesses 1 or 2 pages, it's very rare to see
> more than 4 pages accessed.
> 
> It's not necessary to save/restore these new added status, as
> tlb_flush() is always called after restore.
> 
> Result of 'pipe 10' from unixbench boosts from 223656 to 1327407. Many
> other syscalls benefit a lot from this one too.

This is not the correct approach.

You should be making use of different softmmu indexes, similar to how ARM uses a separate 
index for PAN (privileged access never) mode.  If I read the manual properly, PAN == !SUM.

When you do this, you need no additional flushing.


r~

