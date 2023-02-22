Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CBE69EF36
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 08:18:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUjOb-0008L7-Sx; Wed, 22 Feb 2023 02:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUjOZ-0008KD-JD
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 02:18:31 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUjOY-00047u-1m
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 02:18:31 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso7793434pjb.5
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 23:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PfEbHwlwMfpjujp8c64f35NrH6cWGiCgHLm6uEurazc=;
 b=cXrHcZiaqDO95V8ivWemzqbrYu6oUvh2wGjv9Rd1Oa8+Zr0GJPfvVVEfdrACOiVSeh
 QvGsMgMyK3wDnBMSQ6XWDlrvIJ/ahRtZi+mKd/vaND+xtdBT6vttD32mSe2wknnX00+O
 CLguKgxtU98isgjI6TWo9oyBsZ3Zw+uzv/mQY7kaBL6SZXH0ffr2miQ26FG/nc3LkAjn
 LYwQUwUpTJ5b96JKVe6ubZtZZSddzr0Kb7nqUA1ba+l89cZXgk0J7L6PIET11LDpq8gV
 M9f/t4e9NoKy6U+3FXr5LoBmsTVjMXch36aqCJCuuRobXxRV7dm+rajLB7PgHhWzHLk/
 OQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PfEbHwlwMfpjujp8c64f35NrH6cWGiCgHLm6uEurazc=;
 b=P9JB18DZF/uMoN9sSdP5TgbMD4fPhVHtuT91NyNwVN6ggpO/OchpQJpRu+/pilIsPh
 sH3UmabqMpvjkUv5Csc2QNUNe23FBtB+zNe5dFIuE1NTaPJLxKUu8g3Ufboo9ZfnZukN
 B1vofQdP+Po3N898/5goII0iGiRSC9dd4lzZNSl7WoOX5HVQAv0YkHf4x+K4MgvFS2t2
 WpUu3LwaEsdFPH0jX0s4a/BIrsv7R7kWWIlOGVy4GnhIHS3xbPslPp7QXU4Iv4beBW4I
 p4CB2GcsLAnoAKq4+IOrBPR98O2nvWUHZomsfpi6zVeTHZdb4Mc9emjyThRKNsjGWXgR
 EoFg==
X-Gm-Message-State: AO0yUKUL8/QbQsrQWKo5OVEEbdXTJjEabb4kZKUafgTIt+SPalFebBB7
 +Bd8mahXXNA0g1C3+f8i77b56w==
X-Google-Smtp-Source: AK7set9ugAgaqcWwYbaOxY0zJlMX8l+SCphM0SpyHb0QQZwelpFppT+Y8XR/+zvWlBMT39gH6Zyx3g==
X-Received: by 2002:a17:902:d4c8:b0:19a:6ec0:50c2 with SMTP id
 o8-20020a170902d4c800b0019a6ec050c2mr10407728plg.26.1677050308429; 
 Tue, 21 Feb 2023 23:18:28 -0800 (PST)
Received: from [172.20.100.240] (rrcs-173-198-77-219.west.biz.rr.com.
 [173.198.77.219]) by smtp.gmail.com with ESMTPSA id
 p18-20020a170902b09200b0019a97faf636sm11045274plr.83.2023.02.21.23.18.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 23:18:27 -0800 (PST)
Message-ID: <e12a0ea9-d5eb-345f-84c4-2e5cbeb10615@linaro.org>
Date: Tue, 21 Feb 2023 21:18:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 21/24] gdbstub: only compile gdbstub twice for whole
 build
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
 <20230221225227.3735319-22-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230221225227.3735319-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 2/21/23 12:52, Alex Bennée wrote:
> -# and BSD?
> -specific_ss.add(when: 'CONFIG_LINUX_USER', if_true: files('user-target.c'))
> +# The user-target is specialised by the guest
> +specific_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-target.c'))

Looks like should be folded to patch 10.


r~

