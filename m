Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A406BA9B3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 08:47:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcLqZ-0004w4-L3; Wed, 15 Mar 2023 03:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcLqX-0004vo-JN
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 03:46:53 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcLqW-000470-17
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 03:46:53 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so473048wmb.5
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 00:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678866410;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BLTSi65t1rfvE7OlQgpIzjfFJui7r3fQzhkG5SGQJj8=;
 b=J4sJQ4W1lvXgg57JO+koLw3VlUZQ2N85DPMowrl/haYx2TwDGc5x1hE9jGV7JV+iVq
 v1w8vkh/BLDv8PREu/urJ4qKUX/9z3zRJ7N33tBhdG3ucd1Jll5aMk6u9Ppw9d+7DHLr
 xxK6aa3Gi9M5R/eAACGVqKQJ6c1sQjWEShe29huI7gNsJuGTpDiXv7+/53062Is8O+XF
 Hb8uM0zhgeOreTqh+oSygqVXRqA+n3p1rUf4Mj7/uWxwo/vkFYpBrjB+ReSH81gjzd8g
 Kpksj90DiJLTZsSCio80ix59y4ws2/va52afxkVkm4R7Ei4IOpYhsiIjY6hNi6pnduW9
 5IFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678866410;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BLTSi65t1rfvE7OlQgpIzjfFJui7r3fQzhkG5SGQJj8=;
 b=PiAuJ6wmejHuUgD31SxorTk3OGJo1iPTiqBK0zwTxLcStb2XqzdpW4zwy6xREBBYl5
 iYl8sZ6tjovAng/gJS8gwbOlB0FuQUVYwPI3lnL7loEDseZNdDZagikUHeH6ZQCh31QN
 YbnZdlelnVOBFJLHOBwqvNShIGvp/3GG+aRmvnw7X8XNFWF2xPmJLZiviw+5CZ/smHdO
 DuIrm+V23chKSwlCDFw6NhN6PKHAhTbaxb9ydmY9Rle2QR9B0s7OwRZb5RU2jdbh6euh
 qJaViSAMeULlgHpNkCVSSj0SS8SCsx8Qxx9Zt693kccmgf+/iGcAlWpO1wkgb35kB7Vo
 khLw==
X-Gm-Message-State: AO0yUKWZtFwiXE2y3/+JOwVwEJmOqQp26Yj1XxiZKXTAd2wETQ5htN1Y
 CK3efEWR5UzpMRN7RohCl39mM5bXUjq+9Ku+HdTC2A==
X-Google-Smtp-Source: AK7set8zEn3n4FEbbD84is+cEuifXGWeT5prdKxTrPiXcqZh2xyR4Qi15IzcTSXc2cdEKy9ZKcLcCQ==
X-Received: by 2002:a05:600c:4e16:b0:3dc:4042:5c21 with SMTP id
 b22-20020a05600c4e1600b003dc40425c21mr16419533wmq.6.1678866410474; 
 Wed, 15 Mar 2023 00:46:50 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v22-20020a7bcb56000000b003e215a796fasm961076wmj.34.2023.03.15.00.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 00:46:50 -0700 (PDT)
Message-ID: <881540e6-5720-268f-6141-c99f3663c2fa@linaro.org>
Date: Wed, 15 Mar 2023 08:46:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2] Use f-strings in python scripts
Content-Language: en-US
To: Marco Liebel <quic_mliebel@quicinc.com>, qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>
References: <20230314212418.3925751-1-quic_mliebel@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230314212418.3925751-1-quic_mliebel@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 14/3/23 22:24, Marco Liebel wrote:
> Replace python 2 format string with f-strings
> 
> Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
> ---
>   target/hexagon/gen_analyze_funcs.py     | 115 ++++-----
>   target/hexagon/gen_helper_funcs.py      |  54 ++--
>   target/hexagon/gen_helper_protos.py     |  10 +-
>   target/hexagon/gen_idef_parser_funcs.py |   8 +-
>   target/hexagon/gen_op_attribs.py        |   4 +-
>   target/hexagon/gen_op_regs.py           |  10 +-
>   target/hexagon/gen_opcodes_def.py       |   2 +-
>   target/hexagon/gen_printinsn.py         |  14 +-
>   target/hexagon/gen_shortcode.py         |   2 +-
>   target/hexagon/gen_tcg_func_table.py    |   2 +-
>   target/hexagon/gen_tcg_funcs.py         | 317 +++++++++++-------------
>   target/hexagon/hex_common.py            |   4 +-
>   12 files changed, 243 insertions(+), 299 deletions(-)

Preferably unifying style using single quote (') first:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


