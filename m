Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE87437A57
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 17:52:47 +0200 (CEST)
Received: from localhost ([::1]:36684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdwqa-0007LK-EG
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 11:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdwoU-0005vw-UF
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 11:50:34 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdwoO-0005L2-2p
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 11:50:34 -0400
Received: by mail-pl1-x62e.google.com with SMTP id e10so2977002plh.8
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 08:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/k78r9TOpzMGeCSgwphBAV2290c1xHlDk+JIv6/QwiU=;
 b=ESuRvEIXvYAPhgm71Zf+r1TjHdLS3HT7M/patiaOhbXXRslG3RIXuX/HHNSIeSgjex
 Eqb55uYlVc/6q2M9r8RjKp7zh8ye81O5OnvjDy6N8174yBhaoe7wykFT42abEG9kpfAI
 IOpisH/0v8DUj/0MMTtYLfPvcejL8zahTGZM2ArJlN5wuI+GTZcbYPAuRO5ERL64wSG7
 uDs4ETKsfylpAL3893BQtw/8gqXjH0GbGLtN8hYi0liIqAJMwSRueKT23VKHa1HEHUU/
 MA6qU3bm++h3NQTJbd/G4GoLagxGXbyvraTAt4nwCJJl+EEiYmXs63q7EQdKl6sr4IhW
 jvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/k78r9TOpzMGeCSgwphBAV2290c1xHlDk+JIv6/QwiU=;
 b=XtfsQCLC7QVt+LeNVq5eq+/fjGMTbtXavh/r6WduSuRdRe/qxPddt6ZvyiuMqOWFOA
 9u7OvS3tSGlmfSRySu7/GUgns68eQRBDV2Lr93vJ45pO8+qgKNxnt6TdArqMvvvmqR6U
 1AhiOrSr1puB3v9Cm7KBEOi4V9IqAeGUwh7lzqjkD/CcJfs8wENVW2wqsiHfYsdiq8Lq
 eWTmN+MkdE9ec7RdF6jcK4zc664ajpqzWpC9+sv3R7sQTUEco6dWZueuyTkulPrWD+OC
 FGDlZOjJPkplRWnq+9n/KMSgtPndogCLR47ufuD3eJg8tTPXYzCv4a8oT2hSzYgT4Mwt
 zyQg==
X-Gm-Message-State: AOAM5302MuScKvF0tPWiSAcAmle1WMn/mKER8jeeEPLk2YEg7r+mQgMe
 647qKrGDqQPKrkB0tqYV7Udtkw==
X-Google-Smtp-Source: ABdhPJzSDZm2LSjqC8CYiosyajBOKDx8LS9j+0gezERsNd+UvbpTTcL0ZCabo0h+OQPdjtpwY+ZbWQ==
X-Received: by 2002:a17:902:930c:b0:13e:42b4:9149 with SMTP id
 bc12-20020a170902930c00b0013e42b49149mr537588plb.86.1634917826396; 
 Fri, 22 Oct 2021 08:50:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q13sm11981024pfj.26.2021.10.22.08.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 08:50:25 -0700 (PDT)
Subject: Re: [PATCH v6 00/15] target/riscv: Rationalize XLEN and operand length
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20211020031709.359469-1-richard.henderson@linaro.org>
 <17397bbe-7dfe-ac2e-6033-4ab4840a11bd@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <663d5df5-c107-c4ce-99e0-2a5d336a69ca@linaro.org>
Date: Fri, 22 Oct 2021 08:50:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <17397bbe-7dfe-ac2e-6033-4ab4840a11bd@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/21 1:26 AM, LIU Zhiwei wrote:
> As the specification said, "PC bits above XLEN are ignored, and when
> the PC is written, it is sign-extended to fill the widest supported XLEN."
> We still need special process of PC for exceptions or jump instructions.
> 
> I have two methods to implement  PC register access,
> but not sure which is the right way.
> 
> First, normally process the PC register as the specification points.
> That means expanding  the PC when setting the global TCGv variable
> cpu_pc, and truncating the pc_first and  pc_next fields in
> DisasContextBase before decoding instructions.    I am not sure
> whether the sign-extended pc is compatible with QEMU common code.

I think extending on write is the correct thing.  Jumps, exception entry and return, gdb 
write.

Note that the read from PC for translation is in cpu_get_tb_cpu_state, before translation. 
  You should not need to change anything wrt pc_first/pc_next/etc, because it will already 
have been done.

> Second,  ignore ignore the PC special process for jump instructions.
> Just expand or truncate the PC register when exception processing,
> gdb read, or cpu dump registers. It is not a stright way,  but I think it is still right.

I think you could make it work that way, but I don't know that it's less difficult, or 
that you'd have fewer changes.


r~

