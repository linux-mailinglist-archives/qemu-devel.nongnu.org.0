Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3BF6A8406
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 15:18:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXjjd-0003LI-Oc; Thu, 02 Mar 2023 09:16:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXjjZ-0003In-Vd
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:16:38 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXjjY-0001Uk-AV
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:16:37 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so1857040wms.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 06:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677766594;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E+iR1eYGvHiALKO69FnAhJ1vz/OLFMeMwS1/3IeB9cg=;
 b=wjtx3sNUXcU7jDlZm5diBzLK68NcGCcwJc/f9b0gpkDUR2uFWlsjLLOXOZi7iN9+sb
 nyw7/3Ty+8ugOqK/pYWaKU5qzhsbKgcGRxOmezoKrF5tXML66QjOrJTq+yoUtGEJvmU1
 DHAodZCOHs20FM4xDPd6m7Kq1zVhNNy6KgwWXgEz2pyENmMcRD3OWhTvoE6QDuNU9a92
 Ke1BK1jJOYqb5OXWDkuYwRzdkYvOrnVQQEC8W03V7UYOEn81fj/D8h9BomjtrwxMP0DU
 R4DadP7ZakCU5SSSSjG/YtoxROnC9iMoaMVvlvAE43oIjMpYPpAVO2Hxats1t6QfHPMt
 ENtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677766594;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E+iR1eYGvHiALKO69FnAhJ1vz/OLFMeMwS1/3IeB9cg=;
 b=oBW3GJsV/ozGNm6AdNDAIkc4i8snrE0AaQjF5mxvnU0BTzIhTJLwjxsZcQnZdHWSEj
 95S6i9aWqxmVjSsHCbNWRq4M4f2WipOOIfAsYSDYh2lT+yoJcLep4Hao+NyRSg3g5+Hg
 7ngaT9xYotUsW32CoaV457ZJ9QWGTpAIg5xEccyeemz9/usUtugQzJJJMzOBTpe0JjhW
 RvFONspsBKIXSe21v/DsHSDLddYMjacSrpvf+Y7jV0MbCmFyrmh6oU6pALbjQEPU8XnT
 n6mpTEktB3QpU+5lv0FlsLlusigHsAIJQwxoD/+yZfpsNDKE/15NH/0As5yYTkJFbKDJ
 gIFw==
X-Gm-Message-State: AO0yUKVkps4Kkv1i2iD1N7rtkFcOirmNmSBsZjpC5bSsUkrJ4mAncm+B
 GML0qd4XBug3W6TTqFIyejSbXA==
X-Google-Smtp-Source: AK7set/w6kMMomP08blPlIw6NmiHygPK5vJ8cnSYbeuTz2uUu4PayhfPfwRn6J4Y+2itsxjPF9Hz/w==
X-Received: by 2002:a05:600c:5125:b0:3df:de28:f819 with SMTP id
 o37-20020a05600c512500b003dfde28f819mr7622341wms.15.1677766594599; 
 Thu, 02 Mar 2023 06:16:34 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 hn4-20020a05600ca38400b003dc5b59ed7asm3147324wmb.11.2023.03.02.06.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 06:16:34 -0800 (PST)
Message-ID: <2421dc87-026e-154c-02df-7ffd778da7be@linaro.org>
Date: Thu, 2 Mar 2023 15:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/6] block: convert blk_exp_close_all_type() to
 AIO_WAIT_WHILE_UNLOCKED()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org, 
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-3-stefanha@redhat.com>
 <7c440fc8-d37b-b933-ed5f-02baf7136bca@linaro.org>
 <20230302130810.GA2485531@fedora>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230302130810.GA2485531@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 2/3/23 14:08, Stefan Hajnoczi wrote:
> On Thu, Mar 02, 2023 at 11:36:03AM +0100, Philippe Mathieu-Daudé wrote:
>> On 1/3/23 21:57, Stefan Hajnoczi wrote:
>>> There is no change in behavior. Switch to AIO_WAIT_WHILE_UNLOCKED()
>>> instead of AIO_WAIT_WHILE() to document that this code has already been
>>> audited and converted. The AioContext argument is already NULL so
>>> aio_context_release() is never called anyway.
>>
>> Shouldn't we assert(ctx && unlock) in AIO_WAIT_WHILE_INTERNAL() then?
> 
> Can you show where you'd add that assertion? It's not clear to me what
> the purpose is.

Without your series applied, using:

-- >8 --
diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
index dd9a7f6461..dc372e4c16 100644
--- a/include/block/aio-wait.h
+++ b/include/block/aio-wait.h
@@ -82,6 +82,8 @@ extern AioWait global_aio_wait;
      bool waited_ = false;                                          \
      AioWait *wait_ = &global_aio_wait;                             \
      AioContext *ctx_ = (ctx);                                      \
+    assert("Use AIO_WAIT_WHILE_UNLOCKED()" && !unlock              \
+           || (ctx && strcmp(#ctx, "qemu_get_aio_context()")));    \
      /* Increment wait_->num_waiters before evaluating cond. */     \
      qatomic_inc(&wait_->num_waiters);                              \
      /* Paired with smp_mb in aio_wait_kick(). */                   \
---

I get:

Assertion failed: ("Use AIO_WAIT_WHILE_UNLOCKED()" && !1 || (((void*)0) 
&& strcmp("((void*)0)", "qemu_get_aio_context()"))), function 
blk_exp_close_all_type, file export.c, line 309.

-> [PATCH 2/6] block: convert blk_exp_close_all_type() to 
AIO_WAIT_WHILE_UNLOCKED()

Assertion failed: ("Use AIO_WAIT_WHILE_UNLOCKED()" && !1 || 
(qemu_get_aio_context() && strcmp("qemu_get_aio_context()", 
"qemu_get_aio_context()"))), function bdrv_graph_wrlock, file 
graph-lock.c, line 130.

-> [PATCH 3/6] block: convert bdrv_graph_wrlock() to 
AIO_WAIT_WHILE_UNLOCKED()

Assertion failed: ("Use AIO_WAIT_WHILE_UNLOCKED()" && !1 || (((void*)0) 
&& strcmp("((void*)0)", "qemu_get_aio_context()"))), function 
bdrv_drain_all_begin, file io.c, line 523.

-> [PATCH 4/6] block: convert bdrv_drain_all_begin() to 
AIO_WAIT_WHILE_UNLOCKED()

