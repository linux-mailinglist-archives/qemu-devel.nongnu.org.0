Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA0D37049E
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 03:07:58 +0200 (CEST)
Received: from localhost ([::1]:34066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lce6v-0005Lk-F2
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 21:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lce4e-0004V3-Lc
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 21:05:36 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:41646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lce4c-0007ju-4V
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 21:05:36 -0400
Received: by mail-pf1-x435.google.com with SMTP id v191so275590pfc.8
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 18:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lY5pom3kH/xLE4+n3urrDVhayBhP3uOpQRehl5nWQXI=;
 b=GsO+CPoD+8lQ2WiPZVsEewpXo3x8E3s2vWkw/8FYc9blVcwu0pQkBXLlkO2HEn0XIc
 9D7JxrRnLAZ/ke46SKPwRoXUIQZZDKW/D0q9VQpZbfkd3d+FmX50ctHFkQ8I8lkfKh63
 sGZGkuv+ZMo0HZipUsKq9WWqB/DkpTQHAcUa+eyGRXPkAbuyoXvjIVpRQJcLFlqAGkFZ
 BgWc77SVXSv7SSWIokn/fdT4SvHBQWg6lvxCpzlZNgCLR758GvV/HZyygPpvC4XM45x0
 RhAUj/VdBl/g9zxUCrsBYUNq/eZsSsQWu2/teMvH6B0kMVaMDPk7MH6UGjckC6bBqIKj
 3ZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lY5pom3kH/xLE4+n3urrDVhayBhP3uOpQRehl5nWQXI=;
 b=AAvBVXeTAuUGFVRm0+oZOdCyXBsbfhNaCZdw0j1OoMM25tG/wlyLwPa1jm+UNyOGqx
 lOwRbHh2cAdci3A2/td0QkfB0FQ4bWF0AZHO4/fPOrGHdnSgCWF69OIzBpt37q9ZbYOj
 l+ZVPDc3ncJ0JM3+42Xb822Ag8jLfMtauLCmtd3S62mK78hPITEcMFDX02K/MaeU4oRn
 6HRw07slmFcLPAu7uBNXy7HjDabV+Uxv1NaqIdCP/ioiL58YehZXw0Wv3k+dNGJCqMeX
 wDHh4Spypfkn1J0dg3y2JP2bmLjfjBLujqF0n2q2s42gw4XU4tU+V3b9722g7XgfyqcV
 kMJg==
X-Gm-Message-State: AOAM531TEtZrn6NgWezhGU4gTSGXRFb+YjhfUov3APETPe5pZVP4Zh2i
 5uNvgQhlAcUShFKBv8v6WYARPg==
X-Google-Smtp-Source: ABdhPJz5R+PwszbrR9uhTS9ZA/Xb+44kGLfMO6uWJTP5j58Z3tEK1F7jVMFcVsog/NM3dGGd/9Tp3Q==
X-Received: by 2002:a63:df11:: with SMTP id u17mr7288084pgg.79.1619831132506; 
 Fri, 30 Apr 2021 18:05:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id y23sm2848648pfb.83.2021.04.30.18.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 18:05:32 -0700 (PDT)
Subject: Re: [PATCH v3 4/7] target/ppc: turned SPR R/W callbacks not static
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
 <20210430193533.82136-5-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <79cda095-9ba0-0ec6-c89d-77e2d6dbf312@linaro.org>
Date: Fri, 30 Apr 2021 18:05:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430193533.82136-5-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 12:35 PM, Bruno Larsen (billionai) wrote:
> +++ b/target/ppc/spr_tcg.c.inc
> @@ -17,6 +17,8 @@
>    * License along with this library; if not, see <http://www.gnu.org/licenses/>.
>    */
>   
> +#include "spr_tcg.h"

...

> +++ b/target/ppc/translate_init.c.inc
> @@ -42,6 +42,7 @@
>   #include "fpu/softfloat.h"
>   #include "qapi/qapi-commands-machine-target.h"
>   
> +#include "spr_tcg.h"
>   /* #define PPC_DEBUG_SPR */
>   /* #define USE_APPLE_GDB */

Including this header twice, in files that are themselves both included in 
translate.c, is sketchy.  You really shouldn't add the one to 
translate_init.c.inc until patch 7, when it becomes the standalone cpu_init.c.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Note for future cleanup: Make spr_tcg.c be standalone as well.  Just need to 
move a few declarations to a translate.h.


r~

