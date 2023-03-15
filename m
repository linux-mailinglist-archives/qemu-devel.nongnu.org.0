Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4640C6BB6E5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 16:04:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcSea-0000DW-CU; Wed, 15 Mar 2023 11:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcSeY-0000Cm-8t
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:02:58 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcSeV-00053i-U1
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:02:57 -0400
Received: by mail-pj1-x102b.google.com with SMTP id d13so9082171pjh.0
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 08:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678892574;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Buvrq5kCXfBjxcabVP7UoYBXbhpDMQt+726CZBfOyYk=;
 b=frsJZZTF2XkIlBJ23xGO8nS+oUKZ7WylcYUVXEKlEb2KTWrXFcluYUi1tdLJWIVOC3
 QTKmz9DYSaohPR3Au53OzhL7IjDbElVOMbHq6YKKjFAy7InyYs8cSn+BfZBKb+PKGVYi
 0QvKiqO1VKq9w1ZE9KDXAoToi8KXNatE9CTPSixvoemcpBbF1AAN0ckizKSCxkBWvrOa
 xUMP1a2hyqGlXLzb05GZiB5uU8OSkU/Is/2erMmDGwGWRWj0vfhqKbgLnQpYeTTqqcp/
 0zspjC0vEVnfmXQDIsw7xz7P52EUiG6K7Rd0aETfk/A3VvFviCQl/37iufYNQEh9rlh5
 sCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678892574;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Buvrq5kCXfBjxcabVP7UoYBXbhpDMQt+726CZBfOyYk=;
 b=WGjr91pslanGgSdxrT6wNPPhRK28IEs1E8XhWF3EBjv53ecoy399P/HtqNS3paF3MZ
 MYD7sTIbo/9iKIfStCYBxQWXjzDIZwArXRzfnsbNPMiW/JNLHqCYrUz6j7xHCYaF3rgK
 S83BLvg7W0Dnj8/4jctsSEl6JIpzXubwKMJGozg8WOT9qdUk0wbHhO9EOc6IgNm4ki/t
 FYSdN7/AS9iaW/gz4KdRqH4u7EPJPU4I+HtMla8O6D4KhVBEzXAG854fXDQp1qJsycYO
 SHfsSA6lDRm2xjNYLnnEnFh6MgqYXvxrNR3GicyRR+F4k3n7oJPXeZBJZVOoGPd6XYCG
 tBew==
X-Gm-Message-State: AO0yUKXKw0F0ARHVhUKWohDbEJ5P+Sm0ycLf37EytoZDO9V62GTTyKBN
 zGKSptGWgcIjp8qyEbbjv8AlLA==
X-Google-Smtp-Source: AK7set/Ndf1ejq6iGNbbqalAzZQu4kRVSgR2SJw5Is7ErQVsYmrGyD2VoxFuH44Xb6alK7hez4MTiQ==
X-Received: by 2002:a05:6a20:9386:b0:cd:74aa:df76 with SMTP id
 x6-20020a056a20938600b000cd74aadf76mr59137pzh.50.1678892574085; 
 Wed, 15 Mar 2023 08:02:54 -0700 (PDT)
Received: from [172.20.4.181] ([50.232.40.61])
 by smtp.gmail.com with ESMTPSA id
 m2-20020aa79002000000b00625c6ca32b0sm1153561pfo.213.2023.03.15.08.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 08:02:53 -0700 (PDT)
Message-ID: <f50d6673-d0bd-2f61-d5e9-b5f5cc9a6502@linaro.org>
Date: Wed, 15 Mar 2023 08:02:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/3] qapi: Do not generate empty enum
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20230315112811.22355-1-philmd@linaro.org>
 <20230315112811.22355-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230315112811.22355-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 3/15/23 04:28, Philippe Mathieu-Daudé wrote:
> Per the C++ standard, empty enum are ill-formed. Do not generate
> them in order to avoid:
> 
>    In file included from qga/qga-qapi-emit-events.c:14:
>    qga/qga-qapi-emit-events.h:20:1: error: empty enum is invalid
>       20 | } qga_QAPIEvent;
>          | ^
> 
> Reported-by: Markus Armbruster<armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   docs/devel/qapi-code-gen.rst | 6 +++---
>   scripts/qapi/events.py       | 2 ++
>   scripts/qapi/schema.py       | 5 ++++-
>   scripts/qapi/types.py        | 2 ++
>   4 files changed, 11 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

