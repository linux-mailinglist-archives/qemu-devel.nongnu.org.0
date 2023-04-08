Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE956DBC90
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:11:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plDyN-0005AP-1G; Sat, 08 Apr 2023 15:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDyK-0005A8-0f
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:11:36 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDyI-0003u6-HK
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:11:35 -0400
Received: by mail-pj1-x102f.google.com with SMTP id v9so6185074pjk.0
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 12:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680981093;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M7ZU+xrvU7fTGXLY/ty31Fdc46N/5zk2GttFuiD/2JA=;
 b=COO1MlaBg6qLZ97x3M2WSjVVviNq1A/pReNpW5VO8FWXpPxk0NfeJzt/XkxYfkgFLE
 NW03FERq9zewRBjTeOM7Ad2YFxYs3xt4l6pDIWDiIl+T8IYMdaxMnUXd3X3ITzIp79xn
 CHCEDbJCXhNpWWPXfkIaFC3nar+RcnFknfGCWSupoTuB3nvoFbflJ2rSXw75UQ/TGl9f
 80ahNChCRa41TVs+QGKaTWPDYgLNvfrIjhImGpbEZn7D9a5GQRbjraOGdHGBdXZEq0ku
 5B+8H6j75BZwfjcK+JgkCH+bwml/5GSwJf2mF+rMwAoO8m0F0ZBO098//WYcqblZUO/T
 W/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680981093;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M7ZU+xrvU7fTGXLY/ty31Fdc46N/5zk2GttFuiD/2JA=;
 b=BUsuP/21EEi4ZlMUoP4bSdpymydJffQoUWWC7sDpvEGum6/HrwMwkToBvFIK8z0sLw
 YMe25hq1DNpYUvId73vK0ghXCsWl7MRsAhLOlx59CEikrwSl5uikZF26tOXfyhRuaYoe
 HBljm77yY8YCtpI20anWFtD4oTPnscUGWs6noHPHqh85A/bZodUTxyfV/aa1pEm6PMsw
 Fkx5wftBkypyGzBKZFWKttHew07kak07vZ0X+b3oxkaAaVp66+PdKDcRblbh+VknFYf8
 tNEHvUjr7qxsVoY9pumiM6UqlyYC0akijnFjz+ashCnLQA1VdOP8qw/THYDrUO8nbq4T
 6d7A==
X-Gm-Message-State: AAQBX9eKv9VXumg8GzEfthQ+eGpNiD/IMNbtRvLJuilg0kw4HOhZfx+g
 Zdi/ymi3G9WrPpspnNI57lbcaw==
X-Google-Smtp-Source: AKy350aE1CrWExVtc3nMIIr3Z2GOzoJmh0vD0XjVtMIHPoVYzrmr8LZ9w+9fyfnSkYIZd+MRY5ToHw==
X-Received: by 2002:a17:903:846:b0:1a5:167e:f47d with SMTP id
 ks6-20020a170903084600b001a5167ef47dmr5205465plb.34.1680981093145; 
 Sat, 08 Apr 2023 12:11:33 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:fcd:4458:21c7:367e?
 ([2602:ae:1541:f901:fcd:4458:21c7:367e])
 by smtp.gmail.com with ESMTPSA id
 ik8-20020a170902ab0800b0019f9fd10f62sm4887806plb.70.2023.04.08.12.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 12:11:32 -0700 (PDT)
Message-ID: <bdd9a985-1903-f2e8-1f12-bcb80ca9c3b7@linaro.org>
Date: Sat, 8 Apr 2023 12:11:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 10/16] bsd-user: Implmenet do_sysctl_kern_getprocs
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, kevans@freebsd.org, Brad Smith <brad@comstyle.com>,
 Stacey Son <sson@FreeBSD.org>
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-11-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405213612.15942-11-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
> From: Stacey Son <sson@FreeBSD.org>
> 
> Implement do_sysctl_kern_getprocs to retrieve proc info from the kernel.
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-sys.c | 165 +++++++++++++++++++++++++++++++++++++-
>   bsd-user/qemu.h           |   3 +
>   2 files changed, 167 insertions(+), 1 deletion(-)

Typo in subject.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

