Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E663F0E11
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 00:21:02 +0200 (CEST)
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTvg-0003aG-Vd
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 18:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTu9-0002tM-Fb
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:19:25 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTu8-0007Wj-5z
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:19:25 -0400
Received: by mail-wr1-x429.google.com with SMTP id f5so5779192wrm.13
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 15:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YSndk9a2oacwkuHpbNVLabCE/SQx72BUikJrK4nPwgQ=;
 b=PLRrx5x8rIJaWtbiCGfifeehf/FiuebUrxk6tsPjnzO7PBlK8MetYBjmyuyqvD9POu
 MbhT6YWA4qmYYkEci208hUor3fCN7W4EEU1/M5cQXeF+rOOKw4yy4aMCEN2NLCFO+nTi
 dtMD0VjW4Yl+YyY2AUy9Xo0z6Oj8xZBHjvP0LQXNVW6rd3xzVZTTKKpD8snIn1P04lnC
 Bid/VZVPVWLwUMrXt8joUuF7qQ+hdVOl77jjLZKRGYKYLPajiZT+xcV6jMp80b2hHDAg
 IimlpKtef+FRUfmkpXebn46/NKStTy4TGt1vV0eKX52IqTIl0U465g8gGSA+q0DFOkLk
 lw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YSndk9a2oacwkuHpbNVLabCE/SQx72BUikJrK4nPwgQ=;
 b=ja9/tamFDWTUTLL5qlmnifzKf95oREvZk9uA56mS9CZXwYZDxrsl2Wie2KgCZdE9Xx
 DVjGhImreFRSAGkGRe7k3vXllFh+17Shb4URqIdRwxoGIHsdKvln1np0WzF/DUNzNc1m
 vonngJCXsPO4+u+aKq4mz3pZqMJghxskS7MI95YF0ZWcs+6ud+jWm3RBUPuBQFAk3hXX
 bgUXyK1JdH5RbvqWPK3S9EQh1mv5tZnEgEc4AL64JZwMcjqVhzLaHFUAk+6fKpWeZqit
 A3Ol+hCmIH7IqQd28h+cGL8w752IYYGUUvLNqKBFt195XV0OncSMxwsTki6Xusvx9dJ5
 4VtA==
X-Gm-Message-State: AOAM532UEmac2bONduC5eETyr/XSQgLOG9pSdx5jDovv+aShxBEbv6Ee
 g+yl3vy/9neNkCPWPxT+EGoOYfLZ5RE=
X-Google-Smtp-Source: ABdhPJwCwH0Crbovo+Wy5CnbMQZRdy9jYuOQ9dD+VOF61RmeyxlIQe2dzAbcz3RpIQWC9JHVuUcY9Q==
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr13209510wrw.368.1629325162500; 
 Wed, 18 Aug 2021 15:19:22 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c7sm905602wmq.13.2021.08.18.15.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 15:19:21 -0700 (PDT)
Subject: Re: [PATCH v3 09/16] tcg/mips: Drop special alignment for
 code_gen_buffer
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818201931.393394-1-richard.henderson@linaro.org>
 <20210818201931.393394-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6e7efb49-c775-9175-b6f6-ee531752e440@amsat.org>
Date: Thu, 19 Aug 2021 00:19:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818201931.393394-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 10:19 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/region.c | 91 ----------------------------------------------------
>  1 file changed, 91 deletions(-)

Yay!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

