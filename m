Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854124B9B83
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:53:03 +0100 (CET)
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKcX8-0004Ya-8e
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:53:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKbmM-00022G-M2
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:04:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKbmH-0006eN-JI
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645085072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6V3iMPqtA7UUUIw8Mrp2dZYNAKHdvpQvfldz6t3SyPU=;
 b=POGV0tcsQ8d5zROZthhpUg/I9p2JuUIWBF4mbovvWZHz4MfpN9/H/EDZOkdL+3Yy6knVYs
 ZOoOvhhr0By7ORn1Cj4zxNGT5vRxIIf/9fosGg2GElR3lZHw2TLvkIPXQc2mGavuDQB7b+
 7eaUhq+VvyI8ggYVkGmdPg5uyzek1kM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-IAkXyh_qPbaFTS-W_X3PIA-1; Thu, 17 Feb 2022 03:04:31 -0500
X-MC-Unique: IAkXyh_qPbaFTS-W_X3PIA-1
Received: by mail-wm1-f70.google.com with SMTP id
 u14-20020a05600c210e00b0037bddd0562eso1334005wml.1
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 00:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6V3iMPqtA7UUUIw8Mrp2dZYNAKHdvpQvfldz6t3SyPU=;
 b=0CY1sWqN5uLVs5EpVoArkCXkus762rFFRkGpjfwSHz21IJqxkOdfoRUr8HRTm4yVT1
 E3ZNdIWyjB/4yBVT0nOVOxNt5kd4Olp+Oj3vdCokzKzSiU6Sl+2FcQpVcLseZmZ0xB11
 c6sMjrdEq4TwmgId0bdV/AjaGHxR8tI5AThwzgX0GGKVu+LxMe/uNNQEEneg4pPuwD2B
 0bDJYk83Q03/YgJPnkw5GmKPqIpsjNDpVR3alqsZYQDHZ3lovjKm/9+mYmeLeKGGq9VW
 IU2ID+M3AEgGUBO88akj55IhvwUCOHZlJiZRjwRGrwTVK0Blur117Yvcm3D5WZxaU+uu
 lfeQ==
X-Gm-Message-State: AOAM530jpkNX/HZI9By4IcyYAHh1yYqzf/b4fN/WL0jRKBzMFacvY7BO
 8qxJ6Q4kdMGu/Ukyd9GzBjCkY/79cFHY8LE/EZg4/SUGbEojZngy0eLTqcM71T0sX1hCe4KcxaZ
 MDnsKAI+byzfRA0M=
X-Received: by 2002:a5d:64ef:0:b0:1e3:1e05:d042 with SMTP id
 g15-20020a5d64ef000000b001e31e05d042mr1271511wri.679.1645085070328; 
 Thu, 17 Feb 2022 00:04:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznhPPUqRLP8kaW7VT9O6O8vaownlZgLRs6edw+3EOoPTaD3ihATdbsYGrLR29t8NVmc+HFjA==
X-Received: by 2002:a5d:64ef:0:b0:1e3:1e05:d042 with SMTP id
 g15-20020a5d64ef000000b001e31e05d042mr1271498wri.679.1645085070119; 
 Thu, 17 Feb 2022 00:04:30 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id s7sm21026198wrw.71.2022.02.17.00.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 00:04:29 -0800 (PST)
Message-ID: <be415d25-6c87-9163-718e-c4d53f71291a@redhat.com>
Date: Thu, 17 Feb 2022 09:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] tests/x86: Use 'pc' machine type for old hardware
 tests
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 mst@redhat.com, berrange@redhat.com, quintela@redhat.com
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-2-dgilbert@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220215162537.605030-2-dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 15/02/2022 17.25, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> For tests that rely on old hardware, e.g. floppies or IDE drives,
> explicitly select the 'pc' machine type.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   tests/qtest/fdc-test.c    |  2 +-
>   tests/qtest/hd-geo-test.c | 12 +++++++++---
>   tests/qtest/i440fx-test.c |  2 +-
>   tests/qtest/ide-test.c    |  3 ++-
>   4 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
> index 8f6eee84a4..b0d40012e6 100644
> --- a/tests/qtest/fdc-test.c
> +++ b/tests/qtest/fdc-test.c
> @@ -598,7 +598,7 @@ int main(int argc, char **argv)
>       /* Run the tests */
>       g_test_init(&argc, &argv, NULL);
>   
> -    qtest_start("-device floppy,id=floppy0");
> +    qtest_start("-machine pc -device floppy,id=floppy0");
>       qtest_irq_intercept_in(global_qtest, "ioapic");
>       qtest_add_func("/fdc/cmos", test_cmos);
>       qtest_add_func("/fdc/no_media_on_start", test_no_media_on_start);
> diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
> index 771eaa741b..3554b5d500 100644
> --- a/tests/qtest/hd-geo-test.c
> +++ b/tests/qtest/hd-geo-test.c
> @@ -178,9 +178,15 @@ static int append_arg(int argc, char *argv[], int argv_sz, char *arg)
>   
>   static int setup_common(char *argv[], int argv_sz)
>   {
> +    int new_argc;
>       memset(cur_ide, 0, sizeof(cur_ide));
> -    return append_arg(0, argv, argv_sz,
> -                      g_strdup("-nodefaults"));
> +    new_argc = append_arg(0, argv, argv_sz,
> +                          g_strdup("-nodefaults"));
> +    new_argc = append_arg(new_argc, argv, argv_sz,
> +                          g_strdup("-machine"));
> +    new_argc = append_arg(new_argc, argv, argv_sz,
> +                          g_strdup("pc"));
> +    return new_argc;
>   }
>   
>   static void setup_mbr(int img_idx, MBRcontents mbr)
> @@ -697,7 +703,7 @@ static void test_override(TestArgs *args, CHSResult expected[])
>   
>       joined_args = g_strjoinv(" ", args->argv);
>   
> -    qts = qtest_init(joined_args);
> +    qts = qtest_initf("-machine pc %s", joined_args);
>       fw_cfg = pc_fw_cfg_init(qts);
>   
>       read_bootdevices(fw_cfg, expected);
> diff --git a/tests/qtest/i440fx-test.c b/tests/qtest/i440fx-test.c
> index 1f57d9684b..6d7d4d8d8f 100644
> --- a/tests/qtest/i440fx-test.c
> +++ b/tests/qtest/i440fx-test.c
> @@ -35,7 +35,7 @@ static QPCIBus *test_start_get_bus(const TestData *s)
>   {
>       char *cmdline;
>   
> -    cmdline = g_strdup_printf("-smp %d", s->num_cpus);
> +    cmdline = g_strdup_printf("-machine pc -smp %d", s->num_cpus);
>       qtest_start(cmdline);
>       g_free(cmdline);
>       return qpci_new_pc(global_qtest, NULL);
> diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
> index 3f8081e77d..84935578fb 100644
> --- a/tests/qtest/ide-test.c
> +++ b/tests/qtest/ide-test.c
> @@ -128,10 +128,11 @@ static char debug_path[] = "/tmp/qtest-blkdebug.XXXXXX";
>   static QTestState *ide_test_start(const char *cmdline_fmt, ...)
>   {
>       QTestState *qts;
> +    g_autofree char *full_fmt = g_strdup_printf("-machine pc %s", cmdline_fmt);
>       va_list ap;
>   
>       va_start(ap, cmdline_fmt);
> -    qts = qtest_vinitf(cmdline_fmt, ap);
> +    qts = qtest_vinitf(full_fmt, ap);
>       va_end(ap);
>   
>       pc_alloc_init(&guest_malloc, qts, 0);

Reviewed-by: Thomas Huth <thuth@redhat.com>


