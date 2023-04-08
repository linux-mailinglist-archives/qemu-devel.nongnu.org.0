Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0786DBC8D
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:09:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plDw8-0003Ft-1H; Sat, 08 Apr 2023 15:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDw4-0003FW-2A
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:09:17 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDw1-000305-Cv
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:09:14 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 pc4-20020a17090b3b8400b0024676052044so1429498pjb.1
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 12:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680980952;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=asw5nl6Q24ivG8xy3w3w94QSSPYeL/X8vY23n3InJWw=;
 b=P/0lOnBXWHxJ8/eC0L/K6Sr9l9t8G9AJcDVIwh6AXWnpVAUKWBrpiakgLSPzFoQfQ3
 0OJG2aS5p6wivYBbGNyySYiLGfcfquOSo9+YZN004EZXXMrjSw55ut8rSG6+3h90CfCp
 6+Kj/NOX+k6t2PPmV1yV9soF7Wj/L8MZsYlxpZV+9kS0n2NanHd+fwM0wqwr2E0jeenA
 MfbKB67YZWyXf70h9U5nC8dIzMiyL7IHYmw3jNM3027NzQ//2IQgL4ch/npVxDPzSzNS
 hUfSOD2b7rTHtYK3lc+NmiAQ5bSPsTIhr2p6ztdVa6Yp9moxZztybY9k/GqvXAtcUSJC
 k9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680980952;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=asw5nl6Q24ivG8xy3w3w94QSSPYeL/X8vY23n3InJWw=;
 b=TS48Lu9K5FAYvdtm7iAmzjqwPfu7Go1NGna4BfAnQJr5/JSuV/0VpvUGJ4x128FhcO
 AOagx4I+KJ56L4NnutWIXfAFHKdSioYJPouumGiHtQlU0FbBUDfCj4Nj2kiH+N5yRM+g
 lHnXEw0Geux0vODOyDSIjR0NlXQRf8C5wJdgYCBZ7Q+xe6AXZCh17FvP33CeXVk6X5kY
 6ICwLOU3PbqSAViOpl61dPBBzVNOJMYLCsZkuszEtyRc1YiHquaHbPt2gt0PK86I5FJf
 /Jqb4rkJrGYzqeOILRoSAmIY5O5gzGOm+784MKWSP9K05Qq1Fq+E/Ob39XQt21csCfwa
 1oDw==
X-Gm-Message-State: AAQBX9cSmKMM5rMgy99qqZuBiVhk8/z9uKfFBpv0nt5yiN3bpxu4EP3W
 w901lj3dLOWdjQzWO71w1f0lWQ==
X-Google-Smtp-Source: AKy350bZ8blP/4z6rPZdi4wYMmLqUuOnjA9bh7+QNmwr5dOe9hTP2xKhfQXyfyva0TSPW3vPcKjmLQ==
X-Received: by 2002:a17:902:fb44:b0:1a1:b174:836c with SMTP id
 lf4-20020a170902fb4400b001a1b174836cmr6951249plb.16.1680980951899; 
 Sat, 08 Apr 2023 12:09:11 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:fcd:4458:21c7:367e?
 ([2602:ae:1541:f901:fcd:4458:21c7:367e])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a170902868500b001a0667822c8sm4841546plo.94.2023.04.08.12.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 12:09:11 -0700 (PDT)
Message-ID: <a130544e-54ed-8421-012b-73db30b975d1@linaro.org>
Date: Sat, 8 Apr 2023 12:09:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 08/16] bsd-user: Remove useless mmap definitions
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, kevans@freebsd.org, Brad Smith <brad@comstyle.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-9-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405213612.15942-9-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.113,
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

On 4/5/23 14:36, Warner Losh wrote:
> On BSD, all architectures have the same mmap flags. Since we don't
> translate the flags, we don't need these defines here. We can't
> cross-run different BSD binaries.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/syscall_defs.h | 36 ------------------------------------
>   1 file changed, 36 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

