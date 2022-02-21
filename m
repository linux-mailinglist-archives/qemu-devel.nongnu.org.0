Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCA74BD97F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 12:46:54 +0100 (CET)
Received: from localhost ([::1]:42696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM79Z-0007Uf-Bg
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 06:46:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nM75N-0003UN-09
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 06:42:33 -0500
Received: from [2a00:1450:4864:20::52e] (port=36626
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nM75L-0005m6-5x
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 06:42:32 -0500
Received: by mail-ed1-x52e.google.com with SMTP id cm8so19141385edb.3
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 03:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=smEB8jJ/p8YGSlB5L0KXYHfzciKvvxl9S9yRNIVtzoc=;
 b=EBJZiocDgHowLZ3EIM6+V3dV6zJA1eoUsg5kpKU2qVK5ENzlIPS2QyJ/qLXMjypZwK
 qlwCr3zsfcXC4o2qkZwoAwiOdgbYz0vXTThNXevTLEFD/q7FWLSEnxj3GL8Lm+hoSMEH
 8hUj4FbyeOEsPHshUlqqwjBcjfcoV04SHmQl8Zp45w5crvI8+f3xfkXkBiCXTf7ptqxN
 ZZ7eE364dgEg7FYCuaEVaCvjodyXItzY/TNZhbTzYv6Kac4qosbQpeFUAocf822cpwz1
 lr/glJaEQZMskqcNcWFvH2BkOLn6NonuokvFQ9nRExpjF31lAQGrRxD0+kRvSU4y2jEw
 6TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=smEB8jJ/p8YGSlB5L0KXYHfzciKvvxl9S9yRNIVtzoc=;
 b=ndV74xyr7NJEdSBLVX0E1KPT87t16T+aKyIc1an6S6uNIQM4GXrdBF5iv+E9HLvHDg
 oBg5DAHU7Zy2Xa8IZLwBJyz3Bbdeqgn47jJXjQNbxOpBgqO3lL2f7+o+LJb8tTyvmgPI
 wP1TWAXRC6G86bntAvlX+g3RDpk73CXN51KBKiMt8DTKb1hIc+9oZQkqXVdOmH2sNgOe
 /VISIvaFa+qbw63Sa9jho2wWsib7BuesEwgYbkTZ4DJ9OFBVQx1CiVuoP1N7oprL1hDW
 KJpG8AnUqk8dU8FJH2VxpecIP6PMFeibXCjCUQ0BW+q4t4DXtSaGGvy4Eac8YrvXVnSz
 NWjw==
X-Gm-Message-State: AOAM530zFgMZNmU2n8D8prG/LejKc0EyOb0fhxxyH35PoRpuvDJGjR6/
 cBzgXpwp9RhaHXD4IwUNzZM=
X-Google-Smtp-Source: ABdhPJyYyiig5WAgqxNUqBkzCmo+P5VEbSIfdFaDOCJBe1CaCRNlS9eRtFHae+nONaubdxXK0qCFYg==
X-Received: by 2002:a05:6402:3489:b0:412:897b:9bb2 with SMTP id
 v9-20020a056402348900b00412897b9bb2mr20436707edc.73.1645443748885; 
 Mon, 21 Feb 2022 03:42:28 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id f22sm5164796ejl.46.2022.02.21.03.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 03:42:28 -0800 (PST)
Message-ID: <5e92a220-eb61-c510-0cdc-bf418b9025bc@redhat.com>
Date: Mon, 21 Feb 2022 12:42:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC 2/2] sem-posix: use monotonic clock instead
Content-Language: en-US
To: "Longpeng(Mike)" <longpeng2@huawei.com>, berrange@redhat.com,
 mst@redhat.com
References: <20220221095617.1974-1-longpeng2@huawei.com>
 <20220221095617.1974-3-longpeng2@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220221095617.1974-3-longpeng2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: arei.gonglei@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/22 10:56, Longpeng(Mike) via wrote:
> +    long now_nsec;
> +#ifdef CONFIG_PTHREAD_CONDATTR_SETCLOCK
> +    struct timespec now;
> +    clock_gettime(CLOCK_MONOTONIC, &now);
> +    now_sec = now.tv_sec;
> +    now_nsec = now.tv_nsec;
> +#else
>       struct timeval tv;
>       gettimeofday(&tv, NULL);
> -    ts->tv_nsec = tv.tv_usec * 1000 + (ms % 1000) * 1000000;
> -    ts->tv_sec = tv.tv_sec + ms / 1000;
> +    now_sec = tv.tv_sec;
> +    now_nsec = tv.tv_usec * 1000;
> +#endif
> +

Perhaps this might minimize the amount of conditional code, too:

diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index 903fa33965..4743d7b714 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -40,10 +40,14 @@ static void error_exit(int err, const char *msg)
  
  static void compute_abs_deadline(struct timespec *ts, int ms)
  {
-    struct timeval tv;
-    gettimeofday(&tv, NULL);
-    ts->tv_nsec = tv.tv_usec * 1000 + (ms % 1000) * 1000000;
-    ts->tv_sec = tv.tv_sec + ms / 1000;
+#ifdef CONFIG_PTHREAD_CONDATTR_SETCLOCK
+    clock_gettime(CLOCK_MONOTONIC, ts);
+#else
+    clock_gettime(CLOCK_REALTIME, ts);
+#endif
+
+    ts->tv_nsec += (ms % 1000) * 1000000;
+    ts->tv_sec += ms / 1000;
      if (ts->tv_nsec >= 1000000000) {
          ts->tv_sec++;
          ts->tv_nsec -= 1000000000;


Finally, the conditional variables initialization qemu_cond_init must
also use pthread_condattr_setclock.

Paolo

