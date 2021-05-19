Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D51A389700
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:49:26 +0200 (CEST)
Received: from localhost ([::1]:44398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljSC5-0005fc-Ba
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljRkS-00070T-4k
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:20:52 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:33705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljRkN-0007Q0-UU
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:20:50 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so12789700oto.0
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 12:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tYTEaXQW/iHt+ROKJNXSIENc1t2UJbtSVTK39o/TkDk=;
 b=LAMjyTwM2kNVcQwNNOHq3oGWHNQED4hunm07JQqUiGe6jQSqASEAQF/l+rqZ0najJq
 XgAfJJea/bbwUCBZRh73ZjGpqp7hijbaHuhqvteKVLtQ2zaTWwCq7mDDfpjodcFluP+r
 OfwzlXKBzLSciBl0yoxxnoSucfeBEDOyEwYQHif5Zu1E7xbjq5O+2DjP00NAsQvPIetZ
 UIb+MX00WrYODJv+3ZEv8EVfomtXHQmgfPXp9vm9+HicfTUot0yLr3HJHZTGpFiah58e
 J4UVXe5bC/1/K6KO6U8ybZ0kCCCAGwdCNKynh2GgcwgCE4xYvDd/e91lgIW8xHrsBxH+
 kskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tYTEaXQW/iHt+ROKJNXSIENc1t2UJbtSVTK39o/TkDk=;
 b=TS/SeIjJr4ytTb24+ysikl5n/1YosEeQGoXXbkKgWsgNvnv/7ey9mwJHrIYpj6KOG+
 VVVapCzdImNhzEDwLYoAn2rba08fSRjCGFFRDBKll7zXGRRrIvj/zbDrDGTvIvE327/o
 jZt1PYa9s67lUwYA7W0xXDONlDod2jGKotiH9IrBBruls8W49Lre9fDuoET/4G/tJLL5
 nNUUSaBt00sN18+x9M3E1DRs6cx/wyhPofUyuf/bM2SUWl+uzUH3yfAl8E6f31mXASEQ
 ft5n3Y/zk7peusIjkFuDvXG+ZMqVBKjNuE9Nc5+uflvx6BEhijGS8j15566myhuZlT3i
 lnxA==
X-Gm-Message-State: AOAM5335FsxBDHXFfvtbCOUnUPspcaSA/vzOo48UdmG93qo9Th5Y6S9y
 BaCOlvuWg9ud05PFDNYRZKoPiA==
X-Google-Smtp-Source: ABdhPJzKwsgL9qgmuVs7lwGA7xrFV391j8joCC9wi9EZG9u6snE0bRzJSPw3xqErN9SOSGRVReiiWg==
X-Received: by 2002:a05:6830:1d64:: with SMTP id
 l4mr815946oti.95.1621452046733; 
 Wed, 19 May 2021 12:20:46 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id x8sm57714oov.29.2021.05.19.12.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 12:20:46 -0700 (PDT)
Subject: Re: [RFC PATCH 00/25] exec: Add load/store API for aligned pointers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210518183655.1711377-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c4f5ae75-b0a6-7d70-b563-c30ad2415ae4@linaro.org>
Date: Wed, 19 May 2021 14:20:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518183655.1711377-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 1:36 PM, Philippe Mathieu-Daudé wrote:
> The series is decomposed as:
> - cleanups (1-6)
> - clean ldst API using macros (7-13)
> - add aligned ldst methods (14)
> - add aligned memory methods (15-16)
> - similar changes in virtio (17-24)
> - use the new methods on vring aligned values (25)
> 
> There are some checkpatch errors related to the macro used.

I think we should emphasize the atomicness of the access as opposed to the 
alignedness.  That's the only thing that's important to virtio.

Thus s/aligned/atomic/g and use qatomic_read/qatomic_set.


r~

