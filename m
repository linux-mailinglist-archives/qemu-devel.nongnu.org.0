Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BD1674377
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 21:22:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIbQa-0004uB-Vz; Thu, 19 Jan 2023 15:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIbQQ-0004ro-Mu
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:22:20 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIbQP-0005H4-4R
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:22:18 -0500
Received: by mail-pj1-x1029.google.com with SMTP id bj3so3586671pjb.0
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 12:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SEPp6DiH5Xhd0Ln1FqUsGngSrBKAmuONu4ef+qE6t5M=;
 b=xPlvFxNqLTEMJ76jg5UKuzEP7DlH6NfFOQakaFBNZ3n6JJS88zZX1y/01GQABqJqBS
 f8W3q0a5e6VKQxkPnHBFGAPU2m7omwNOC4CYsRaRqaaRCkfTBk/YB3CPvnNftZ3Ertb6
 4kiZ61fGyEBv4SaOK/EVCgs0xWfnEnCgBtNMknaJg2/twtHwsU7NF1meZAWDpHz39KLm
 a6sgGQbNcX3Zv1hSboLjBI6lZPNvyhnXx2YnS9bLaFPMjj6h8xeIbFDYJCkYsjZaDU4n
 BPBrTv0ukFrdaL8/UFnddplaLrT8mNWi4W06BW1NUwYn9cyXKsHjQ2kD7sodirAeq16z
 fCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SEPp6DiH5Xhd0Ln1FqUsGngSrBKAmuONu4ef+qE6t5M=;
 b=wnx1ZukSpBtQwdrYddQbZrBM8cd+wZpPISOsZG1y8ohM0ffjyuUMmVLeudX6jxb2+A
 MqMWtD6Iqqnpu3VXEdmog5HIPYr+9bNXF5xUeXZyZVYx/b3UtkIqjrva/KQM/4lhZx/R
 ZlMdlrgx2NCzhcixp9Rny0cFez4mf7Q2mqnP994ymUF+Wk3zGiMvncJtwrv+5QG9bJ1N
 lETFKYfeXtkldrfipbXkXlJ+827u0cWY2+jCf8rjNaTKyOTvsbfm/CK9fGRdcb7JNfqN
 4c4IERWa0h/3irAWVopQwM0oGhA8mTb7Lsxd1cCKpuewkMTMfSdNVyb/B34xVVHjQtTZ
 yiGg==
X-Gm-Message-State: AFqh2kr+Oh4SddEtOt/A/0B1yXiVIIGE/oC5dT9ILxJ63rSt6eOUa2N3
 e2xRBd4423kYO78dC9fZv85u6Q==
X-Google-Smtp-Source: AMrXdXutVntAt6dCxlxVLs/U+dFpoxXjfFAWlJngB9Mw33p7MnEBEUKfjSjIr4z7FCX+GrQhAaph/A==
X-Received: by 2002:a05:6a20:c197:b0:b8:4c2c:7554 with SMTP id
 bg23-20020a056a20c19700b000b84c2c7554mr15067841pzb.6.1674159735732; 
 Thu, 19 Jan 2023 12:22:15 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 t21-20020a635355000000b0049f5da82b12sm20602342pgl.93.2023.01.19.12.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 12:22:15 -0800 (PST)
Message-ID: <2edada91-df3b-7e7a-cb92-03a1586d721b@linaro.org>
Date: Thu, 19 Jan 2023 10:22:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/3] tests/qtest/vnc-display-test: Suppress build warnings
 on Windows
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Laurent Vivier
 <lvivier@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20230119120514.28778-1-philmd@linaro.org>
 <20230119120514.28778-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119120514.28778-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/19/23 02:05, Philippe Mathieu-Daudé wrote:
> While this test is skipped on Windows, we still get when building:
> 
>    tests/qtest/vnc-display-test.c:22:20: warning: unused function 'on_vnc_error' [-Wunused-function]
>    static inline void on_vnc_error(VncConnection* self,
>                       ^
>    tests/qtest/vnc-display-test.c:28:20: warning: unused function 'on_vnc_auth_failure' [-Wunused-function]
>    static inline void on_vnc_auth_failure(VncConnection *self,
>                       ^
>    2 warnings generated.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/vnc-display-test.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

