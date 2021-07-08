Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8CA3C1700
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:22:33 +0200 (CEST)
Received: from localhost ([::1]:49492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WnI-00075l-Vf
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1WAY-0003C8-CR
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:42:31 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1WAW-00076l-Dj
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:42:30 -0400
Received: by mail-pf1-x429.google.com with SMTP id 17so5825248pfz.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TSXAliHKi3FtMsCdCPtWSZKGzeZY+j4E4lCyiSlMhRM=;
 b=LvlInocY9LWGw5tzsr5Kul9rCkp04Mg2X5j7tzHyV88kFRYS1XJlAzVSBkdxVaS2CG
 ibFojTtJDti2z1PWxerjtRj7e1ZEQgGcaao50XHtGqnnSS5brUAtq44uyScOgnhtAnNF
 PvNOB/+6MdIZv4yQ3WcBwCSFydZHkKWI8PoPDdJUre7zo13nDkPACkFfbyzFz27o4ooF
 naz4GhXhHcWWwM8vlN52FV6RZo5s58dKZga88IMZrkOpExk7k/GQRI4WGFcM6qae9LYq
 41+k7B7NpJRqA7iGiX1VJT0XFA2rG6yTL0d8JiKP08lzoSOzrqqkIEDplI7z7ghVoEQb
 AaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TSXAliHKi3FtMsCdCPtWSZKGzeZY+j4E4lCyiSlMhRM=;
 b=O7bMenNVorTKe8rRujih89HdfWHCGNdS3nVxvqt5PmqB2nMgNCRfwFpdqHiYQ6vk7m
 4Tai9vwkei6Ojpuear81q7zW9nnRuXkX8U6xzwSo2koQ1RF+YGIHffRMilqRdiFdPm1m
 PLc87PZZbjjV4up3XXykoyKHSWZqU6j1amhz0qg41QieTPivixaFnMF/uRkD4KOMOpnB
 mIsVe8OUj6B3Nm1ZQur8e/okM3Sdnr+vQr4dHyOo0KV+0G6ExV4IOjJXcfMEiybZ1+wn
 l7Vh9SqG5fzbijSNgzp582mnD61OM+qw/Be/7mVyStPIs5tJ0Y6++ky+0BZvOZt6KJ0V
 fU6Q==
X-Gm-Message-State: AOAM530PhR71gYTlYgAWGUKgxPlwtDi0viOjYoCOcc/LmlFAv6qjPkLP
 xljyrecjiSYJIoOuLWUy45csEQ==
X-Google-Smtp-Source: ABdhPJy2yI+pquOkHhqLXw3oUhlPALOSavIC5GMJgrd39aNDaQ8upN0kJFDl1nw6sPy+qvsZ+dmREg==
X-Received: by 2002:a63:5144:: with SMTP id r4mr32889159pgl.223.1625758946740; 
 Thu, 08 Jul 2021 08:42:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g204sm3180966pfb.206.2021.07.08.08.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 08:42:26 -0700 (PDT)
Subject: Re: [PATCH v2 7/8] linux-user/syscall: Introduce errno_exists()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708141121.1731691-1-f4bug@amsat.org>
 <20210708141121.1731691-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <83deaf8b-efa9-f66c-c930-34a8793bc2eb@linaro.org>
Date: Thu, 8 Jul 2021 08:42:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708141121.1731691-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 7:11 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   linux-user/syscall.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 4842a1987b7..56682b06cbd 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -509,6 +509,11 @@ static inline int next_free_host_timer(void)
>   
>   #define ERRNO_TABLE_SIZE 1200
>   
> +static inline bool errno_exists(int err)
> +{
> +    return err >= 0 && err < ERRNO_TABLE_SIZE;
> +}
> +
>   /* target_to_host_errno_table[] is initialized from
>    * host_to_target_errno_table[] in syscall_init(). */
>   static uint16_t target_to_host_errno_table[ERRNO_TABLE_SIZE] = {
> @@ -672,7 +677,7 @@ const char *target_strerror(int err)
>           return "Successful exit from sigreturn";
>       }
>   
> -    if ((err >= ERRNO_TABLE_SIZE) || (err < 0)) {
> +    if (!errno_exists(err)) {
>           return NULL;
>       }
>       return strerror(target_to_host_errno(err));

After patch 8, you can simply remove this test entirely, as well as the otherwise unused 
and totally arbitrary ERRNO_TABLE_SIZE.


r~

