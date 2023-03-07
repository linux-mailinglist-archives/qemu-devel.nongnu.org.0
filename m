Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B826C6AE3BA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:03:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYqL-0004uH-LA; Tue, 07 Mar 2023 10:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZYqJ-0004qH-0O
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:03:07 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZYqH-0005xh-EO
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:03:06 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so10603916wms.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 07:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678201383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HFfba+K4r7ferdfMYP6XjD63fq5PDf401VC8iHOuze0=;
 b=b0YQeGCUdvnKlpfykroqtYtHmJyDOLeFvXBv6dXmXgL5aormy+eXRviJYYbsZz+wI2
 ndJmLoqIVyowC9IKHjLJG0EHIKhUaRyFI8CQWXv++ynMaoe+ID+m5+AAHP8NhtuR8jaJ
 4fUZ1WhYb2Rd2GkNnoVlj731CtMJYztM6FSqkxmXE2FyfatoZ5Yafhr3jvRQOc0Ecmur
 3FhbWEZcmTqdwYJqSyvkvIqMma04fAKa/U6t1Kwr+g4qVxL0FpOlqOpI+DsGluA+ZDkG
 pQ4TQ7QLWuieIWJGiowdIGNtp0gPSa9ligbcHaM/sc18y6IP/0xo6dRgAER0+T3QRb2v
 vmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678201383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HFfba+K4r7ferdfMYP6XjD63fq5PDf401VC8iHOuze0=;
 b=O4Hnm+77ChdFUbtQhn2RBqqtgeSkMV2ljqNaEFDNlWCYkmIaYE2hmwHnyXP4KIzj1C
 OhQ3sNWhGYEidCveStUq3+aY17EVfL4AbpyJCsy0JpjQOfzhJJWldFiaR8VbdCvBWyrX
 +/LkKYffGObvPiKPiA9WNDzYB56L28IYd2jZarwP/eBLnrpRJv6L6qGC83JFiQ9E5WZm
 WcMX18pABLXb81xXLxVnx/Tyd/G7g7GHgaGlcxcKOtOhb5f4EK4gFnwSrk6BdtPBW17d
 piw0L/ZXfhFwN/nnXDC863ncEbQzOQ6aNFWWimOWZ1PMNgtJO0zwRvwe50gHei7J0ia2
 1hIw==
X-Gm-Message-State: AO0yUKV6zBzsD5QMtQ7IDL20bLHXAb+ptFAv8QfZn58WUOKRG2xIEQe1
 8KS0F3HEU0oLQ4gHfuyg+FsZOo8R7LBN58ctCTs=
X-Google-Smtp-Source: AK7set9HaK9qp3jb4rpYqy8vNYNuJZcvBX0hZ5IaTsrt9gL0b3iugcy2TvXgystA8yQf6fopcx00CQ==
X-Received: by 2002:a05:600c:524d:b0:3eb:38a2:2bbc with SMTP id
 fc13-20020a05600c524d00b003eb38a22bbcmr12377282wmb.7.1678201383413; 
 Tue, 07 Mar 2023 07:03:03 -0800 (PST)
Received: from [192.168.248.175] (131.red-95-127-34.staticip.rima-tde.net.
 [95.127.34.131]) by smtp.gmail.com with ESMTPSA id
 n18-20020adfe352000000b002c567881dbcsm12755381wrj.48.2023.03.07.07.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 07:03:02 -0800 (PST)
Message-ID: <c6a149f7-6137-5a17-7ccb-2951dfc3a49d@linaro.org>
Date: Tue, 7 Mar 2023 16:03:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/5] tests/avocado: update AArch64 tests to Alpine 3.17.2
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 "open list:Virt" <qemu-arm@nongnu.org>
References: <20230307143819.510186-1-alex.bennee@linaro.org>
 <20230307143819.510186-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307143819.510186-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/3/23 15:38, Alex Bennée wrote:
> From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> 
> To test Alpine boot on SBSA-Ref target we need Alpine Linux
> 'standard' image as 'virt' one lacks kernel modules.
> 
> So to minimalize Avocado cache I move test to 'standard' image.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Message-Id: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
> ---
>   tests/avocado/machine_aarch64_virt.py | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


