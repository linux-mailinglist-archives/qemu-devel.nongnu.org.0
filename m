Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002F15EACA0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 18:34:13 +0200 (CEST)
Received: from localhost ([::1]:34198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocr3d-0007tE-1c
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 12:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocqBl-0003w0-NI
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:38:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocqBh-0006v0-Lr
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:38:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664206708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d2lWr7fEt+0f0VMlH+BoasfY/eri8mN5KyeIVQS8SpA=;
 b=V3YEAt1n4YR0hiRiWkV4rqtPH2IJqr2k6Qg7xTmzboqGT3YQYg1nuo6DIVw8zbLEqmuC6t
 eOPJ7/Qz+m8+5Mm8kss7xGWP8wT5XJPZB/iCaNUlcTE7sCmARPrtLAspjMtbFVozS6RGjJ
 fDOz8yXHhDhedeY8scbUUaNHB3S1c6Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-262-QeoZ11WcOIOysHSGTF-vSQ-1; Mon, 26 Sep 2022 11:38:24 -0400
X-MC-Unique: QeoZ11WcOIOysHSGTF-vSQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 i27-20020adfaadb000000b0022a48b6436dso1311574wrc.23
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 08:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=d2lWr7fEt+0f0VMlH+BoasfY/eri8mN5KyeIVQS8SpA=;
 b=q+exBilEKIMeJkh1ih9EgpueiUdYBgCWfbsOOFq3NrpXT6VTg+7G7oq2Lvw83ZsNdu
 dIqb18zOWWwmzeZ40smDkKssy4De3MenlF5vS5CFXcFO/M3z898bALevEUPL8MhE9dWF
 wR/plA5IlL9ZZ76d0dCbUWdKjTG0KnqidCIGycqvADxQS8g9XvWfMHyPhNGW8Sw8G+6/
 v3z6Djp1/I0dN/SffWTiC0tgFgfDc/qa4j33t0xG5ieZmGO2R3mk77nAJ9wfzlg1sY7V
 4Hsq0xybtyAaSuffQ14WPN5LxQJHxaNq/sFIuNtdmgF/AejeAxVMFKGDqKn9Jy30tZXS
 BSYw==
X-Gm-Message-State: ACrzQf1F6ZQpj4qTsyd+w8hYBdCO+RpoVj+b+nzL++NIjXfcC+pjNKLB
 kUzh5c7e7d/Q+ox8klQnxc8Uq3VvRg3PD1KUtkO8Co+d4B0jQKxAIw/mjOcphKon+E8yD6Qpz/t
 FpOsFkvahlur2oEs=
X-Received: by 2002:adf:f706:0:b0:22b:1942:4be6 with SMTP id
 r6-20020adff706000000b0022b19424be6mr13727697wrp.640.1664206703181; 
 Mon, 26 Sep 2022 08:38:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7yDR5TUVxrCG3UaeqwpCSKklFx5WoDuENGiuVPWSQKXdBP6/AmUko0tXeomL2wvzztLpHU3g==
X-Received: by 2002:adf:f706:0:b0:22b:1942:4be6 with SMTP id
 r6-20020adff706000000b0022b19424be6mr13727681wrp.640.1664206702934; 
 Mon, 26 Sep 2022 08:38:22 -0700 (PDT)
Received: from [192.168.8.103] (tmo-064-141.customers.d1-online.com.
 [80.187.64.141]) by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b003a5f4fccd4asm12116200wmb.35.2022.09.26.08.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 08:38:22 -0700 (PDT)
Message-ID: <48c4ee16-5559-cb9d-0b0c-e11bb6f95241@redhat.com>
Date: Mon, 26 Sep 2022 17:38:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-13-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 12/54] tests/qtest: hd-geo-test: Avoid using hardcoded
 /tmp
In-Reply-To: <20220925113032.1949844-13-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/09/2022 13.29, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_file_open_tmp() for a portable implementation.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> Changes in v3:
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
> - Use g_steal_pointer() in create_test_img()
> 
>   tests/qtest/hd-geo-test.c | 25 +++++++++++--------------
>   1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
> index 413cf964c0..455bc5db5c 100644
> --- a/tests/qtest/hd-geo-test.c
> +++ b/tests/qtest/hd-geo-test.c
> @@ -27,20 +27,19 @@
>   
>   static char *create_test_img(int secs)
>   {
> -    char *template = strdup("/tmp/qtest.XXXXXX");
> +    g_autofree char *template = NULL;
>       int fd, ret;
>   
> -    fd = mkstemp(template);
> +    fd = g_file_open_tmp("qtest.XXXXXX", &template, NULL);
>       g_assert(fd >= 0);
>       ret = ftruncate(fd, (off_t)secs * 512);
>       close(fd);
>   
>       if (ret) {
> -        free(template);
>           template = NULL;
>       }
>   
> -    return template;
> +    return g_steal_pointer(&template);

Just a matter of taste, but in this case, I'd rather prefer to not use 
g_autofree + g_steal_pointer and simply replace the "free" with a "g_free" 
instead.

  Thomas


