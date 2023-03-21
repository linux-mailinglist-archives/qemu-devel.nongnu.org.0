Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADAC6C36DD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 17:25:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peemD-0002WI-Da; Tue, 21 Mar 2023 12:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peemC-0002WA-CK
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 12:23:56 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peemA-0004tL-Ml
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 12:23:56 -0400
Received: by mail-ed1-x52c.google.com with SMTP id cy23so61819530edb.12
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 09:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679415832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T+Dmcj+7rHdAMCHU1YC9vjKer/o8XLj0Vn0DZkVWA4A=;
 b=E9LkeT8hAfHFxVfAjLf4dPdyPJS0cXuTIWzyLhnUpVsL4GK5Y7xEIva8yrWOYUGlgr
 OCKhqTTsOwd2Eb7B6N8fjFZ3C16jVhWZhHGGnapEUAym6tpfcakFulquK5SRnKozmpSJ
 36Tchs1QkTLUtDefHuOBjuTLjvoIXy55vswksiXPv+sFqmgdaev8s1G03FUvXOXNjdRY
 qAKtySgmjlaxY2KIzQbxLv6V+RZQMnCBoxFoGxHDbgWAZ41c3QQm2k+4wpaHgl5Bcfn5
 LI3n8g1Zdh/G1g+UTmlNiheF5Daskq/C3yMylwhG4p/0rzB+Cc6S87cT/kjgYNAIhL0s
 U5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679415832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T+Dmcj+7rHdAMCHU1YC9vjKer/o8XLj0Vn0DZkVWA4A=;
 b=5EB967pfiC561LoJVV6uoSVbuu3cVdBw65iAaLXmNxQHlf2lS+hVU6+yx3SWk6DZeu
 xip7NzLSlvdxC7qDNZFTbQMSIIElCKmB3N1w2uvGDsexJGMHPsi8Ot/BOjZoT1NyiCmQ
 Eoj2AkzD5uHcBk9YlLwCUaI6G0Sq8ILmlf5YmMZLhm5KvxKiGWYz1D0B55evNwkcGrez
 CI5PRzaYRxwy7TRmIwQcK2GdOw1yGnyIRzngo54cS27Z0S2NL0qXP4JRBhmUrJjfyWEB
 xqycHiKGe69YNpA+BcMAYkrrHo/TICUSrbQ+VyQkmL4iio1uRPKKgh6ffKmgBW6Sf03/
 EuTQ==
X-Gm-Message-State: AO0yUKXX3QDbuT60qQp0zwjiPV7980yc70BIv7XUB61BVCnYlOl+0vak
 WMt6or7JKuIqlw8MLeZk2waBuQ==
X-Google-Smtp-Source: AK7set8xyFRPmUJPvMrHj1nsYqJ0UCTZ2C1KBWIRy0jb6ZQWwfbihM8AdSHY/uzCo0aazU9YowJMpg==
X-Received: by 2002:a17:906:8448:b0:931:ed29:4db5 with SMTP id
 e8-20020a170906844800b00931ed294db5mr3117249ejy.73.1679415832478; 
 Tue, 21 Mar 2023 09:23:52 -0700 (PDT)
Received: from [192.168.69.115] (did75-h03-176-184-22-219.dsl.sta.abo.bbox.fr.
 [176.184.22.219]) by smtp.gmail.com with ESMTPSA id
 s26-20020a170906169a00b009200601ea12sm5913220ejd.208.2023.03.21.09.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 09:23:51 -0700 (PDT)
Message-ID: <c645fdd3-7696-63ab-863d-ab1446757343@linaro.org>
Date: Tue, 21 Mar 2023 17:23:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/2] tcg: use QTree instead of GTree
Content-Language: en-US
To: Emilio Cota <cota@braap.org>, qemu-devel@nongnu.org,
 Valentin David <me@valentindavid.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230205163758.416992-1-cota@braap.org>
 <20230205163758.416992-3-cota@braap.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230205163758.416992-3-cota@braap.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
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

On 5/2/23 17:37, Emilio Cota wrote:
> qemu-user can hang in a multi-threaded fork. One common
> reason is that when creating a TB, between fork and exec
> we manipulate a GTree whose memory allocator (GSlice) is
> not fork-safe.
> 
> Although POSIX does not mandate it, the system's allocator
> (e.g. tcmalloc, libc malloc) is probably fork-safe.
> 
> Fix some of these hangs by using QTree, which uses the system's
> allocator regardless of the Glib version that we used at
> configuration time.
> 
> Tested with the test program in the original bug report, i.e.:
> ```
> 
> void garble() {
>    int pid = fork();
>    if (pid == 0) {
>      exit(0);
>    } else {
>      int wstatus;
>      waitpid(pid, &wstatus, 0);
>    }
> }
> 
> void supragarble(unsigned depth) {
>    if (depth == 0)
>      return ;
> 
>    std::thread a(supragarble, depth-1);
>    std::thread b(supragarble, depth-1);
>    garble();
>    a.join();
>    b.join();
> }
> 
> int main() {
>    supragarble(10);
> }
> ```
> 
> Fixes: #285

Please use: 'Fixes: https://gitlab.com/qemu-project/qemu/-/issues/285'

Also,

Reported-by: Valentin David <me@valentindavid.com>

> 
> Signed-off-by: Emilio Cota <cota@braap.org>
> ---
>   accel/tcg/tb-maint.c | 17 +++++++++--------
>   tcg/region.c         | 19 ++++++++++---------
>   2 files changed, 19 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


