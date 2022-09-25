Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536775E9212
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 12:22:53 +0200 (CEST)
Received: from localhost ([::1]:58264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocOmi-00041K-Ev
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 06:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocOdp-0004gT-7w
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:13:41 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:36687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocOdm-0003Tf-Lz
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:13:40 -0400
Received: by mail-qt1-x82c.google.com with SMTP id h21so2584825qta.3
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=HAkWEPB3QTD4uU/wGZIiOD55OtY0XtC+4BLlyHw3x30=;
 b=CyYHFsTyMjHhnI8ZDHh/2/nGv2F9NS1PybsDcjjvZ9I+hVHMx7ttn5SKpWH8p1SIC0
 klUKcP4K87/jt8CvUxc2bnCLDU25vj3RdVqAAGRx5/N9MDD+Ta5pXMTDVGQFjGVnjawH
 NjMn4SmQRieG1Huw96DqdHuDRhWZxMel1irW0CM8lIeoYAn87t+M+F9IkQE+zmPlVLDy
 12YJKR/oKXf8jVDK0K5ulYKoxMY2T61TaFm7EY3uBcsz36IRjmLfQjUhdTKkboCtZluB
 P0/ArdR30ktjzIUi7VmiZKb2Sl1ivI5y2XmvUVyrZvOssDh8DwOvuQ9btbhBIEgBQ9EI
 mfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=HAkWEPB3QTD4uU/wGZIiOD55OtY0XtC+4BLlyHw3x30=;
 b=pow0feQ70G80u5SiG1YLpUSF73cHbtAwSixusJRV8N5QUTZK7g8K9SISBI/+A/9ne9
 uVQl7DdSCtuR23sxd6M4kg/ymAZ3SoQ8VBtEFhuUU4SPpAWLEb+Vb5P5mUWTaN4IoEez
 eqNWdcnoNBdQn2XpEjU9cSuXz+BX+5tDya6sVcJkcZw2bGdV7eNKi/yLWd+1VCFjU/IS
 +VXXqdCCRnERiPbezP2bQhaVG1g5UnaASpjyVkO4fPP6zFiBo+ANyWAn0OfY7G9dC/+l
 TQUHe9SfwL3a4+EUS1vLy1hvk/UE6JP9/T4qLzpnQglKwoYemUIVVMOtruMjw9YMLRtV
 REfg==
X-Gm-Message-State: ACrzQf3zPxTA0cWRyS60HZq5jxQaTKOcVatJIbYbGRrQLTp709kMvUG3
 BM0alWdwMmTDXkf9z7yfFILNOA==
X-Google-Smtp-Source: AMsMyM5QP5LSng8Zl1tBrn7gTr7rATgPBWC8hCiTbcDIl8kPnMnAQzirsAGhHHcrRSBsdLDjxQWoXA==
X-Received: by 2002:ac8:5705:0:b0:35c:d722:175d with SMTP id
 5-20020ac85705000000b0035cd722175dmr13530306qtw.192.1664100817001; 
 Sun, 25 Sep 2022 03:13:37 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:413a:430d:cdd2:88af:d4b3?
 ([2605:ef80:80b2:413a:430d:cdd2:88af:d4b3])
 by smtp.gmail.com with ESMTPSA id
 r1-20020ae9d601000000b006cbbc3daaacsm9525794qkk.113.2022.09.25.03.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 03:13:36 -0700 (PDT)
Message-ID: <f02628e5-40d8-5016-4f29-0acf78309739@linaro.org>
Date: Sun, 25 Sep 2022 10:13:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 6/9] gdbstub: move into its own sub directory
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, Stefan Hajnoczi <stefanha@redhat.com>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220922145832.1934429-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/22 14:58, Alex Bennée wrote:
> This is in preparation of future refactoring as well as cleaning up
> the source tree. Aside from the minor tweaks to meson and trace.h this
> is pure code motion.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   meson.build                    |  4 +++-
>   gdbstub/trace.h                |  1 +
>   gdbstub.c => gdbstub/gdbstub.c |  2 +-
>   MAINTAINERS                    |  2 +-
>   gdbstub/meson.build            |  1 +
>   gdbstub/trace-events           | 29 +++++++++++++++++++++++++++++
>   trace-events                   | 28 ----------------------------
>   7 files changed, 36 insertions(+), 31 deletions(-)
>   create mode 100644 gdbstub/trace.h
>   rename gdbstub.c => gdbstub/gdbstub.c (99%)
>   create mode 100644 gdbstub/meson.build
>   create mode 100644 gdbstub/trace-events

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

