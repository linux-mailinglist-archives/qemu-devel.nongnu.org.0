Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8439150A70A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:25:49 +0200 (CEST)
Received: from localhost ([::1]:57448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaYu-0003sO-L5
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaH3-0006rr-8j
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:07:21 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaH1-0007Wb-OF
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:07:20 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so8283154pjn.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 10:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=S8QSuWiCKLdhVzdi+N+Nub5FNHJL4mdi+uVSoh9w5uM=;
 b=emjojJEyHrc/8x/xIF9tWA78AnDoFxf99WZT9A/VSvvD7pebUKatG06F6e8FUZwaZi
 2Pynjv6FBJ8o24PS6hGmVNGx8I157fh/CpfWmXfxcSqamcCu0Ls+9idCzmvWA53QrD7n
 2q/iqvk1qU9mtT/4A7nhH2nVtXdMwoo0NEgyRnsvvJW7+pEOosBoLmkt+wU0WVhvtBv3
 FfmZnPGEGVG0HBDH9Np7P2JBc6tUk/+6k+mX0RS2q3PuNR6yknEnoolZut1NjJZuy40a
 hQ0ffmVHQJvm9Ty6rl90ZgzvJGniWrPLuuexma8YK5OHcGplZxDpIWGAbmLOevUrp+Lg
 REsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S8QSuWiCKLdhVzdi+N+Nub5FNHJL4mdi+uVSoh9w5uM=;
 b=MEWA3jY1dn7AiWoNewPeEio4z2RK2pfKIWDhGXNjmZ+2++UhexoebvGoKVaWiWPQUU
 a63eOrT1K0S7lErQ8XhBZ6CIC5eUF9VCxclQdk89BFRKIz20Blz/Yj2Dd9zXFyHeXq6H
 KcXRG2y5jf7FX0yo2Axe4XgOCufx6GNN9BYn5qrT/nbbWET0z/fWLXZSDabYaGSfEQir
 pb2YiL2oF52lnnUM7gfHc4lazCwpy3ya7Naj9IwfnBT1J/TYaD9etfVhYnY5iEk+zibr
 eCkZBGZKa42I/P6M6JAOvuiaOdEBKoXKwnaIZnRPigeNrhSxOaCUfxNS0IsgSLVyTDap
 4Jag==
X-Gm-Message-State: AOAM5308wmbWh1IWcrot99dVX3kkGCEkbKpzSkjX1mbqvoCcdPttOSm7
 PHS4LtuT/Y+JA+sJn758vFSgpA==
X-Google-Smtp-Source: ABdhPJxyCB7iYc1ObkIpV8meXdmI40o7ab+vXUsvtRkPhur/95IKCgcWopt5AcHXU32yWTBWobm6/A==
X-Received: by 2002:a17:902:e98b:b0:158:bc16:d5d2 with SMTP id
 f11-20020a170902e98b00b00158bc16d5d2mr464454plb.103.1650560837294; 
 Thu, 21 Apr 2022 10:07:17 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09?
 ([2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09])
 by smtp.gmail.com with ESMTPSA id
 o197-20020a62cdce000000b0050bb32e3b8dsm2289278pfg.179.2022.04.21.10.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 10:07:16 -0700 (PDT)
Message-ID: <4db53278-9181-df6f-55eb-e7bc0b3085e6@linaro.org>
Date: Thu, 21 Apr 2022 10:07:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] hw/rx: rx-gdbsim DTB load address aligned of 16byte.
Content-Language: en-US
To: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20220207132758.84403-1-ysato@users.sourceforge.jp>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220207132758.84403-1-ysato@users.sourceforge.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/22 05:27, Yoshinori Sato wrote:
> Linux kernel required alined address of DTB.
> But missing align in dtb load function.
> Fixed to load to the correct address.
> 
> v3 changes.
> Fix round value.
> 
> v2 changes.
> Use ROUND_DOWN macro.
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Queued to target-rx-next.


r~

