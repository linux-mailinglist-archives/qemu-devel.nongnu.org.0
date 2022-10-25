Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E25560D820
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 01:45:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onTag-0003kI-7K; Tue, 25 Oct 2022 19:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onTad-0003bf-5w
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 19:44:11 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onTab-0002HI-IX
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 19:44:10 -0400
Received: by mail-pj1-x102b.google.com with SMTP id m2so8413857pjr.3
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 16:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kU7xD04zmHGX7p6Ig+muh4GM3+upguz6BvS64NFLNek=;
 b=yf1eogMqJVnejTPU6QG5O1zCMf4UvvldrjRmtmI1xm6NNzPi5f3T/6oV3a/8hB/Fs4
 bGs6iY9lEBEZfhpzeBemV/McQkj4uzWL/kr6+WVsgH/L8vMIgXJxz4gC8sLiGL7af35C
 Y7aIUBBlmBXA74GN9a03VQ9cdBf/yvQoV6bkgO5SvfVb/+csFJUZ1W6IMdUNb9T5pwcK
 UqpElPluRkU9BJjs4ps4foNAqf+iyt1DsS8jgW3zwdSZMo5mHf2Z6KrkxzkOr+DH9SfS
 5irdwYXuO1MtXyCmvnF/M9dlnHE74NeqK4Pf1gGlVDokPT4BH6HX5TUEuqqnezXnhYEl
 vWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kU7xD04zmHGX7p6Ig+muh4GM3+upguz6BvS64NFLNek=;
 b=p1X8A5/dPR4ViqIMtalExL1qDrhBSsmMsw4+JsDpS9uRwxo17DDx/72N2f5C7uCZOs
 suzUlxeyz1oP2tC8vg/jiXRN7K9lFrCJC7YbxuWnmqNR34oP3vslSLaeN4GJ1gx/zhxS
 ICrLmEs4wTPh8u6X02r7P2vF2rTc72wZJ5Jqo6lkfEpLOLIlYevruJun7jh5scGAY70r
 YxtZ3OruapBRaYOThJ+d1AHj4i4lHTIDwgj55JgqSZcax0KNIwGDewAUOJ9hFIoQMB9R
 n0gIUdd1ihTGOT6+WV1U0wNMDIRH8j4sLQQfTfJsfUxrIXG3c4pMDsfuIuRKAmHhTmpe
 iPsQ==
X-Gm-Message-State: ACrzQf1UmpRXMw80JOU51fuXcy9nIVEaU0D3qoz49LkeI8p4LGYLJPWU
 yt0C21LWZ5eVywZXfzQ0YTShog==
X-Google-Smtp-Source: AMsMyM4gS6jIoncYiz5+6B/9JRFYQ5rxkrxGYbMNO0PaakYUrre+MJcC9hELPN3TLmS/vGw5MpoPYg==
X-Received: by 2002:a17:903:240d:b0:183:9bab:9c3 with SMTP id
 e13-20020a170903240d00b001839bab09c3mr41273749plo.48.1666741447291; 
 Tue, 25 Oct 2022 16:44:07 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a056a00224b00b0056be2a3c87csm1911278pfu.154.2022.10.25.16.44.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 16:44:06 -0700 (PDT)
Message-ID: <19172ac9-519c-2a32-9336-7d92aaea05f8@linaro.org>
Date: Wed, 26 Oct 2022 09:44:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v5 04/18] tests/qtest: migration-test: Avoid using
 hardcoded /tmp
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-5-bmeng.cn@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221006151927.2079583-5-bmeng.cn@gmail.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/7/22 01:19, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_dir_make_tmp() for a portable implementation.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
> 
> Changes in v5:
> - Use g_autoptr(GError)
> 
> Changes in v4:
> - Update the error reporting by using the GError "error" argument
>    of g_dir_make_tmp()
> - Remove the const from tmpfs declaration
> 
> Changes in v3:
> - Split to a separate patch

This patch breaks with gcc 12:


> @@ -2479,9 +2479,10 @@ int main(int argc, char **argv)
>           return g_test_run();
>       }
>   
> -    tmpfs = g_mkdtemp(template);
> +    tmpfs = g_dir_make_tmp("migration-test-XXXXXX", &err);
>       if (!tmpfs) {
> -        g_test_message("g_mkdtemp on path (%s): %s", template, strerror(errno));
> +        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
> +                       err->message);
>       }
>       g_assert(tmpfs);
>   

../src/tests/qtest/migration-test.c: In function ‘main’:
../src/tests/qtest/migration-test.c:2484:49: error: ‘%s’ directive argument is null 
[-Werror=format-overflow=]
  2484 |         g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
       |                                                 ^~

The compiler correctly notices that tmpfs was tested and found to be null, but tried to 
print it anyway.


r~

