Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F6F655A67
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 16:03:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p962D-0000kQ-Or; Sat, 24 Dec 2022 10:02:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9625-0000jt-RV
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 10:01:59 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9621-0001od-BP
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 10:01:52 -0500
Received: by mail-pj1-x1029.google.com with SMTP id v23so7324981pju.3
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 07:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zjI3oMgF56jERWQgkJfdPzOV4yk438YaviMLyf+4xJA=;
 b=yK59vFsgxUjT63ll3YgDE+11LG+4wKfW99fhMZYDysSGaWa4Oern6VX8SfwnvsLE7z
 sOYbUGLF2qVKsP+VRCOuGsWbCiQrMfs/83TIszujSS9aV20DnG3DdaW26kK+p0zPNbSv
 Eqee5hqjY9gcwre0vil9Iog6G7XQeA5aK0lNdHbogpIFT/E1n27P24Mpbs+H//1vG3Mh
 audaww96/Gh2R+FKYIW+cIlX1upRFSDtC3ZX6oA6IytO/6DXeqZMvSY4KyFh2uyOMRX+
 pG28zkad/8uczoeKZHAM5naWac7m31DVZQc3NsQ8IEwQ30zu1TlrLYdzxKzMimgz8pp7
 P72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zjI3oMgF56jERWQgkJfdPzOV4yk438YaviMLyf+4xJA=;
 b=M9Oe+YDb+CUVVR+raSyny2jhTBfLLqPMTOm2Cf7q0tgH3xMcI0WQ/OtuZninwJA2EF
 2Gx8dXJYgUQe0KP2+ADSBvq1dwci76Xqoj2qzEpZ3JVw5EcjCbpVVPP2Y9jjG6g+rvuD
 3HFR+RyyCmTZp9pgfzBLJhihSqsc16zXc4MznVYLfxlX/1XatdSwmgY+Zt/nuBs/GWbv
 yzDg0eC5EM/Z27wms+mRcd70KmYVoDOyus99DoZPGtI6Jbpm8qHRM9vZ7WfABN6t5W6y
 z9kQbuGPmaNiApJ9a0xrylh0YgBavqfIiE/S6kPXf5dDbzQfj3TQhP5HtRIQ2HAvRZFV
 SAwg==
X-Gm-Message-State: AFqh2krpX5ksluk4haeb6hr5qEQ7/4exgOHnIt7eJmWtO0lXCUOZCHMS
 xzfzZZLFAdHvC3yI5JSun2nmyg==
X-Google-Smtp-Source: AMrXdXsTMmAbR10kAsxCr2blG8g+PHXK2vjFFqfx4ycDC2AM7mYDb6FJQN+dAibvZ6xe48ToHZWVPQ==
X-Received: by 2002:a17:902:d887:b0:185:441e:2dda with SMTP id
 b7-20020a170902d88700b00185441e2ddamr29064881plz.44.1671894107766; 
 Sat, 24 Dec 2022 07:01:47 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a170902aa9600b00189c93ce5easm4175299plr.166.2022.12.24.07.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 07:01:47 -0800 (PST)
Message-ID: <4eec4a70-e450-4b46-9588-54a884c71b9d@linaro.org>
Date: Sat, 24 Dec 2022 07:01:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] tests/tcg/multiarch: add vma-pthread.c
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-devel@nongnu.org
References: <20221223115348.tgfwdlektsulebxk@heavy>
 <20221223120252.513319-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221223120252.513319-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 12/23/22 04:02, Ilya Leoshkevich wrote:
> +static void *thread_write(void *arg)
> +{
> +    struct context *ctx = arg;
> +    struct timespec *ts;
> +    size_t i, j;
> +    int ret;
> +
> +    for (i = 0; ctx->mutator_count; i++) {
> +        j = (i & PAGE_IDX_MASK) | PAGE_IDX_W_MASK;
> +        /* Write directly. */
> +        memcpy(&ctx->ptr[j * ctx->pagesize], nop_func, sizeof(nop_func));
> +        /* Write using a syscall. */
> +        ts = (struct timespec *)(&ctx->ptr[(j + 1) * ctx->pagesize] -
> +                                 sizeof(struct timespec));
> +        ret = clock_gettime(CLOCK_REALTIME, ts);
> +        assert(ret == 0);

With the 3 issues that you pointed out in the other email, this is the only remaining 
failure.  This happens because of two issues:

(1) When checking for writability, we actually check for both read+write:

#define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)

This is very likely a bug, but we'd need to audit all uses to find out where we might 
really want read+write.

> +static void *thread_mutate(void *arg)
> +{
> +    size_t i, start_idx, end_idx, page_idx, tmp;
> +    struct context *ctx = arg;
> +    unsigned int seed;
> +    int prot, ret;
> +
> +    seed = (unsigned int)time(NULL);
> +    for (i = 0; i < 50000; i++) {
> +        start_idx = rand_r(&seed) & PAGE_IDX_MASK;
> +        end_idx = rand_r(&seed) & PAGE_IDX_MASK;
> +        if (start_idx > end_idx) {
> +            tmp = start_idx;
> +            start_idx = end_idx;
> +            end_idx = tmp;
> +        }
> +        prot = rand_r(&seed) & (PROT_READ | PROT_WRITE | PROT_EXEC);
> +        for (page_idx = start_idx & REGION_MASK; page_idx <= end_idx;
> +             page_idx += PAGES_PER_REGION) {
> +            if (page_idx & PAGE_IDX_R_MASK) {
> +                prot |= PROT_READ;
> +            }
> +            if (page_idx & PAGE_IDX_W_MASK) {
> +                prot |= PROT_WRITE;
> +            }
> +            if (page_idx & PAGE_IDX_X_MASK) {
> +                prot |= PROT_EXEC;
> +            }

... and here we can wind up with write-only pages.

(2) Certain hardware, like x86_64, does not support write-only pages -- writable implies 
readable -- so the testcase runs on some hardware.  It is a bug that we don't model this 
as well.


r~


