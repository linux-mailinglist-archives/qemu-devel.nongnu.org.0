Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D116B682AE6
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:56:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMoIF-0003Sc-Rk; Tue, 31 Jan 2023 05:55:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMoIA-0003Rh-Nx
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:55:14 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMoI8-0005ac-Uo
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:55:10 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so12135902wmb.2
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 02:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H9qZ8aviTuLuENx8ZrfrymKePhhEI35hvUy4tSMiPeA=;
 b=Ap3/P8sUs5otLvm5WA1bhWRXgw/H1fUVJpbgD+NY8L57fEtHm4cwrLViNbICgv1bJu
 Swbqvwx/b3L/FyQqUpuAc3QdDKTkuEJX6JLZ0BTN2F5aggQKM/pnBkQiUDEoo4+XNBnR
 1wxPamleX5N9yJusdIn64QpDEibnPuO+xm4lTOjQKM4WBL8i/l1Oc/G2AIrAr/HSbO9A
 wDHnkCqzacRFLHe/Iy01x9a92xnCWZ1MKh0iQT8flm9OtPX1+S6/H6GsWONJb8vYqfjk
 uhWZ1kXt/DC0kAt1s1abYda5xlPKbRDQMA5CP5ip700v7u6TOsM9JGa8vLOzLS4/IxTG
 b9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H9qZ8aviTuLuENx8ZrfrymKePhhEI35hvUy4tSMiPeA=;
 b=SCUYHoya7wvlW0+QKky0fsFlgqEuwEBwHc/QfFryo/E/7US7/Ztu+SN7/Fu4pv/VvS
 BNMJqr5zezxL5ZY1ATG9aAIebO9Ey//nowS8vR4SsG2TU5A9+VPXNZFYz1QqgbvNvWfG
 OYn3JifYWlU+Cz5h7tbZ9YqZA0wcsEP/nsEPYpCqUT99AL+eZ4EhQZyVya8GsXtbPPO2
 6FcUXZtoPcSctwUn8bqm+FrcUm7gdRrWlgmsqPoqKiUrWHxNMFkEQooQl4giG55lqEsN
 /GJjx9nuDhO/RCQsa/3GzmPLB5tvZ2cmNCXUxN2MehkQSMujjpQcZxAFsAjhaBZ8u9Lv
 D3sA==
X-Gm-Message-State: AO0yUKV5+cCtPaG81jKTmc3lEpuwCDuiuDi9CX7adc1xiNktw6kOrbAQ
 7Mly9mFSSv83lV74B/k0VwW3qw==
X-Google-Smtp-Source: AK7set/UzZeCTodxKLecVGkgQzMoieBKoG1V0t0ygkUzRIQpZqUJfD3x5iujnU/o6Qk1JhT6gn/f/w==
X-Received: by 2002:a05:600c:4f06:b0:3dc:5321:8457 with SMTP id
 l6-20020a05600c4f0600b003dc53218457mr3149651wmq.5.1675162506734; 
 Tue, 31 Jan 2023 02:55:06 -0800 (PST)
Received: from [192.168.0.115] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c4fc300b003db1d9553e7sm22277418wmq.32.2023.01.31.02.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 02:55:06 -0800 (PST)
Message-ID: <474f93a6-2b16-2fc7-2b1c-516e61109ecd@linaro.org>
Date: Tue, 31 Jan 2023 11:55:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH] build: deprecate --enable-gprof builds and remove
 from CI
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230131094224.861621-1-alex.bennee@linaro.org>
 <069349bb-a09f-bac4-3a99-70699bd4fa54@linaro.org>
In-Reply-To: <069349bb-a09f-bac4-3a99-70699bd4fa54@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 31/1/23 11:36, Philippe Mathieu-Daudé wrote:
> On 31/1/23 10:42, Alex Bennée wrote:
>> As gprof relies on instrumentation you rarely get useful data compared
>> to a real optimised build. Lets deprecate the build option and
>> simplify the CI configuration as a result.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Cc: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst  | 14 ++++++++++++++
>>   meson.build                |  7 ++++++-
>>   .gitlab-ci.d/buildtest.yml | 19 ++++---------------
>>   meson_options.txt          |  3 ++-
>>   4 files changed, 26 insertions(+), 17 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

(Tracked as https://gitlab.com/qemu-project/qemu/-/issues/1338)

