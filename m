Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F99337689C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:24:04 +0200 (CEST)
Received: from localhost ([::1]:33212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3Gl-0003p6-42
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3F6-0002mb-Gy
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:22:20 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:47090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3F3-0003lj-CF
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:22:20 -0400
Received: by mail-pf1-x435.google.com with SMTP id q2so7911924pfh.13
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 09:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kkisy79WWAOMmo3NEh9EjXouIIruBK+hH12R8/Pebkc=;
 b=esniLWg4RGlodLsWlZmZn/euSEOb+v/PGZ20krBTXDmS4C1+Dcn0JuQOwu4VXbCQVi
 ZtoWYhFfTm53nlXRRkFU5SYmZ8aynnoKZHTjUUGn2eNqlw5iP5ynKgrYuoN5l3qlhVEX
 iuErZYWpBLvHF70V80ZYi/rU4p9WrXbdoO/iXMDToPTyktRs2YK+1djtzmlV/ZyS4eeb
 FKrxS+pBg28Zbofjwe5jiT4yw8BClcw6VXjRQx/ibdhUXmrEGG/9I871hNRH+6ulQqJA
 Byyg4A8QsO/n/z6LGbXgPusiitHHk8oJUKB18cQS6IfCjacq5EA7T0GI2Bpb/pNvGORN
 xVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kkisy79WWAOMmo3NEh9EjXouIIruBK+hH12R8/Pebkc=;
 b=dFUJn81h1+K8olYAat5NzU2CgvohfayKkwzFTt2PKTAnB1H9VZKzpsL/ifFXI0JUbv
 Mqa9mCeA9fKQS/Fb5k+1d4zxVOExby3FNKOOshb6R96Je8eOFEIzH8k1jLv8zze0xOmo
 N4GNpLqy/FHaaiF4Jr6kABTKfAOsSihfkRcwxOi9EQeq/tRxCP0nNk5dLAKIMWl6Q8FL
 yiZZ+OEn9qBzDvIrJwrQLx5G2JqAESMPRyRjpDb2bfWTZ2dBZL91JbTdjqmZsaWQNSoB
 lm/kNCvOv4Ij72wVLyN9JRd+vfhegMPLQzyUglYkv/xA5kQ9u/IX62+PE5sAFYtZshzq
 S1sw==
X-Gm-Message-State: AOAM532rZWMyTu4iI16lGqxoPbk48DXG6+v3um8nQMDp8UobqHHXmkfZ
 ypc8yYPZz5cFRDe2TaRo3v+TQA==
X-Google-Smtp-Source: ABdhPJwjBnyi2YybOpertfvlRxvdTze+d8Jxm+F2+lxfU9maQm8378j0F16oR/d3+Imu2lvS0CiSpQ==
X-Received: by 2002:a63:4d24:: with SMTP id a36mr10914621pgb.64.1620404535699; 
 Fri, 07 May 2021 09:22:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id c23sm5285799pgj.50.2021.05.07.09.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 09:22:15 -0700 (PDT)
Subject: Re: [PATCH 07/23] hw/block/nvme: Use definition to avoid dynamic
 stack allocation
To: Keith Busch <kbusch@kernel.org>, Eric Blake <eblake@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-8-philmd@redhat.com>
 <20210505212238.GA1186879@dhcp-10-100-145-180.wdc.com>
 <285e17d3-93fb-7317-8aba-689fda772f84@redhat.com>
 <c72ab9cd-e958-ee21-ef18-bd84c9dfd39c@redhat.com>
 <20210506021556.GA1187168@dhcp-10-100-145-180.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <35256418-b002-e6e4-3cff-dcb7d6718d1b@linaro.org>
Date: Fri, 7 May 2021 09:22:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210506021556.GA1187168@dhcp-10-100-145-180.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 7:15 PM, Keith Busch wrote:
> Thank you, that makes sense. In this case, we are talking about an
> integer constant expression for the value of a 'const' symbol. That
> seems like perfect fodder for a compiler to optimize. I understand it's
> not obligated to do that, but I assumed it would.

It probably did compile the code such that there is no variable-sized 
allocation from the stack.  That optimization does not change the *semantics* 
of the code as written -- the only reason this compiles is via use of a 
variable length array.


r~


