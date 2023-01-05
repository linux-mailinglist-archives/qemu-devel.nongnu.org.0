Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C5165F56D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 21:52:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDXDm-0003EF-Ha; Thu, 05 Jan 2023 15:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDXDk-0003BY-4P
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 15:52:16 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDXDi-0005Ba-I4
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 15:52:15 -0500
Received: by mail-pj1-x102e.google.com with SMTP id n12so28228668pjp.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 12:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uEof5lE4CQK97kgn9W9WMszYBRtu0o0m3zGchs+Qres=;
 b=KdZ/tdahJbU/mKbuU8hAN1cGK6yg5CczWie0f5oREN5tp30M7N6IUfZTRygi2/qgQr
 TV4YujlQlY2Q4Gr/iHVnVFtyrobOzhegTUTpXwxPdM5+KCkWKQW5SuzXk8giaJUwojcC
 1GD8UVQ8iY857M4lLeaLSiNucWScoDTeq2MRt2xtAJ+c5omnwTm8UIuOUFJtCpGN2EkA
 6QHnKhkwI1hr1MQBYom24DhPWF6xxcBc1XIEukyOxlRDcHGvUNIB6XQc5ezVCkJBJzVH
 bp8AUSk2AvJ2W5YUSa+wIF9cpQnHmzmS/01RSnsPhEBHLm89I9C5twylgB8RLz7aR4QE
 NaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uEof5lE4CQK97kgn9W9WMszYBRtu0o0m3zGchs+Qres=;
 b=hjzC1oOhvNJQ7opL5A8c8QmQ3xkXB77+bFbWE21tF5Dy+7NNqqABiLA74HP9BqaIwc
 +JLfYbLAH2B6Xvhar84ikyPwj7Bkg8RdsN6OumYvzcncsa5ZsXqH/E1aLx9yvWEAZGIw
 pDQb+H3YP/KDZnlz4tE19UhZiRZslMowPIpZPdSJrLtfnC2u5zeIE8fUTzOJ7cuRJRva
 GOCSegVLp1dMczGYdmpPEObKY2dUdlAxHQxSNXYbbvzgO7E3LWviDQ4zde6CMU4o3SSs
 mcEhL+37JwdM+bk9lr+ai8cj6du6GWFwQyA0RJLSSt8Bl+kO/CDBkfKbuoDUh/pddm7l
 uI8A==
X-Gm-Message-State: AFqh2krbg/Kg8Ewe2WyPj8KQNGSt5cTDF8CNBtN5aunCokYnWw+ZkxeV
 cacQHRrMfVGvDJ8n5hZsx7vCFA==
X-Google-Smtp-Source: AMrXdXtOqr56w46zdETC5StpQkeTJCiJPMGuGltEcySLQW2opYNaB9qpWYSFYBT8UUvIyLfZRi/pwQ==
X-Received: by 2002:a17:902:a984:b0:192:9a7d:c38a with SMTP id
 bh4-20020a170902a98400b001929a7dc38amr28288398plb.9.1672951932544; 
 Thu, 05 Jan 2023 12:52:12 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:2cfd:802:a4a0:c8da?
 ([2602:47:d48c:8101:2cfd:802:a4a0:c8da])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a1709026e0200b001708c4ebbaesm22867245plk.309.2023.01.05.12.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 12:52:12 -0800 (PST)
Message-ID: <48cc494b-81d5-f18f-dbe6-29bfd8a0e89a@linaro.org>
Date: Thu, 5 Jan 2023 12:52:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] hw/pci-host: Use register definitions from PCI standard
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bernhard Beschow <shentey@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20230105173702.56610-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105173702.56610-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 1/5/23 09:37, Philippe Mathieu-Daudé wrote:
> No need to document magic values when the definition names
> from "standard-headers/linux/pci_regs.h" are self-explicit.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/pci-host/grackle.c  |  2 +-
>   hw/pci-host/raven.c    |  6 +++---
>   hw/pci-host/uninorth.c | 33 +++++++++++----------------------
>   3 files changed, 15 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

