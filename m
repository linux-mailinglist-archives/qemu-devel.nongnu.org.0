Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E11A677BF5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 13:55:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJwM5-0000c7-Fv; Mon, 23 Jan 2023 07:55:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwM2-0000Tb-DF
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:55:18 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwM0-0002YT-TZ
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:55:18 -0500
Received: by mail-pl1-x62a.google.com with SMTP id z13so11272500plg.6
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 04:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LsymGaurdbvzt3AMVJ70iIgIZo8AfIsH09TZhMekPQw=;
 b=hEO01prMoNcItP0JlIb9UXa+j+tao72cQhNdDVFhe9eC5kq2Vct6ebLgeWjP8C9FRx
 Z3oYc8OF6KqQrshhfBtVDJ+XnmgpKyaaMk6C0AFPFuPRV/OBtrKYDuEMbW3xCEOw8mie
 HTO/FGopZ3rzOxZ6S5KAop9iENj8xebTB8Ox5q8D2UflydqzadL9i5Lq8ipfYmIWMV3g
 D7v3ASp/NnhzWtI73XA5N+GM62PDV6gD4Bqs0l+0v97cfKQNSNgriDwJkmY9710VEL1J
 aMj+DFEvhM+VugTyfLDYJt18/SbH1td+w70iY15lzDjxUvBYdLp2iKa7bBcqDLrIMq3M
 r45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LsymGaurdbvzt3AMVJ70iIgIZo8AfIsH09TZhMekPQw=;
 b=b4W1EMWWiowuFANSjKHfE7GHS57Nxl65vjgmLZa4N1tVKXliAatFNdHpw74+/iEuz4
 Ygqf8FwQJ8vxun9VfJKBXTAJKl0kNfv7tG9VJQydELJo9rreyzYbwH5p2hsN9ldeFnky
 mnymIMKV+0j7iaWobFCa1HaE7oYEoBkM3CvJNuk+3UBg9w5PO/cw4k0m71aGGib/Erh9
 7r92mzONJNXUQaLsIkCwHKv1ky/3sDZG0DHLYWOl/RUY3OOjf8zC0ue1MqKtZXmaBEJx
 1TkJoMhiyzYcIm2j1J+4H1w06/9ptZ0F+lVxOmG6DtkwesQ+rUMjyTe7DoLesd6HwA0G
 4ILg==
X-Gm-Message-State: AFqh2kqcy+KRpZp+wVnNyLjYFYGkJEuygsIg3HCaiFjEQOtrzaPgT03C
 RWqcrjR87rn8mhKzcunrwAo0HO1dp1n30afTWqMWxg==
X-Google-Smtp-Source: AMrXdXu78vhIEzIw836D7d4JWVE2YecpP6Wt98THuIC47GU1Y540dATeF3yRfBaWhQUDlnyQgM2EmV+6BdZyyCouH6Q=
X-Received: by 2002:a17:902:f7d6:b0:189:7bfe:1eb5 with SMTP id
 h22-20020a170902f7d600b001897bfe1eb5mr2539057plw.9.1674478515382; Mon, 23 Jan
 2023 04:55:15 -0800 (PST)
MIME-Version: 1.0
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
In-Reply-To: <20230106194451.1213153-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Jan 2023 12:55:04 +0000
Message-ID: <CAFEAcA9p3AftyMk26RZgcpoTMT8xFoOVVj8kHT1dM6O9oaa4yw@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Look up ARMCPRegInfo at runtime
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 6 Jan 2023 at 19:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Here's a short-to-medium term alternative to moving all of the ARMCPU
> cp_regs hash table to the ARMCPUClass, so that we're no longer leaving
> dangling pointers to freed objects encoded in the compiled
> TranslationBlocks.  (I still think we ought to do less work at
> object_{init,realize}, but that may be a much longer term project.)
>
> Instead of giving the helper a direct pointer, pass the cpreg hash key,
> which will be constant across cpus.  Perform this lookup in the existing
> helper_access_check_cp_reg (which had a return value going spare), or a
> new helper_lookup_cp_reg.  The other cp_regs functions are unchanged,
> because they still get a pointer.
>
> This ought to be enough to re-instate Alex's linux-user patch
> to free the cpu object after thread termination.



Applied to target-arm.next, thanks.

-- PMM

