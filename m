Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B685B6920
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 09:59:56 +0200 (CEST)
Received: from localhost ([::1]:52464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY0pn-0001AI-Vz
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 03:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0kd-0006JM-Ar
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 03:54:35 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0kb-0006f4-M2
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 03:54:34 -0400
Received: by mail-wm1-x333.google.com with SMTP id e18so2696572wmq.3
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 00:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=cr0FYEC8N/9cpLR6UjtJaUGvYAv9xu00Chg+N+Yzs8U=;
 b=OBHM2YPO5wWKC2op1l9f4z7z1tcT1o0TKI3n0xBqIhJjchQX2XMJS0fsTB30/xLvEm
 IleKiS5d15p4rhBH+rY430a2WChfFHqS3513/nc4wNHr1Cd8BKUt7Mv0L+tcByUjNUMX
 C3DbQ1jIJqb9xKPHjG3isq7Iq029T9+jXviQ2MhS4cEytSRpnEi+Aur6excHzcKvgb+j
 Vu5F4+nV3LqcxqZ+vLp949xocIGY6ZJm2xpys+vJBwK04Yc1+efa+oxEcYWSYfx6Evn2
 fBkpTmuaZ+5ug4cXOL1yBH5tAPAm9OYn/8qLvoebQ58kOWS62T5gGs4pbK7t13u6/z2e
 UVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=cr0FYEC8N/9cpLR6UjtJaUGvYAv9xu00Chg+N+Yzs8U=;
 b=cEaNA/LKAPhxWnwWF8r8WSQVbMezyi/RDph0YYaBDjxdkWe95Cg8c8txQ1Z7s7k+RI
 aY4f/4nKsoOEyCe4gEnMEuhDaGTdG0bElsotECh7wdp47U9N4dS/m/zv7X56dN9mpXGh
 fxrZE/oDS3yduCEgwTJ1XyWXI7vlaW92CPe4U6gf4ZdhNJl0OGBx+w25skM0mF+ZxMdM
 IHHizesDEWHMBGFY8UIrVjRu/ePhROvu2WCvnNUYNgTwCiDrbdQVV56LFjAWApWQVyEM
 2cIVBG1pvkC9lH+gORaE62KPKTHgGfFP29+8vhSGQuKOWcdmpj/+SJ4XpnlhmvXU7xxH
 PGcA==
X-Gm-Message-State: ACgBeo3pruJZBjai/oYZdx8U8b2pxpXQkJRnE0e96zji0+HY7m2IQxZ6
 Kul4byS6UDFW4leW3TJA/53Jmw==
X-Google-Smtp-Source: AA6agR75x9EnKhF37JpSwuh2hNntgHy3c4HhpJ3UD617azzeDXqk2I0ZDl8v3XoO0AjzgPyJloy8FA==
X-Received: by 2002:a05:600c:1550:b0:3a6:1d8c:247e with SMTP id
 f16-20020a05600c155000b003a61d8c247emr1388663wmg.63.1663055671394; 
 Tue, 13 Sep 2022 00:54:31 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 j24-20020a05600c1c1800b003a8434530bbsm13696644wms.13.2022.09.13.00.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 00:54:30 -0700 (PDT)
Message-ID: <30f1d9b3-ec0d-c398-3d67-cfff9acb3cb1@linaro.org>
Date: Tue, 13 Sep 2022 08:54:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 14/24] disas/nanomips: Delete wrapper functions
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
 <20220912122635.74032-15-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220912122635.74032-15-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/12/22 13:26, Milica Lazarevic wrote:
> Following functions just wrap the decode_gpr_gpr3() function:
> - encode_rs3_and_check_rs3_ge_rt3()
> - encode_rs3_and_check_rs3_lt_rt3()
> Therefore those have been deleted. Calls to these two functions have
> been replaced with calls to decode_gpr_gpr3.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 18 ++----------------
>   1 file changed, 2 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

