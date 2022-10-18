Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD029602BF6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:44:07 +0200 (CEST)
Received: from localhost ([::1]:56320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oklwy-0003ve-EN
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklST-0000bH-P9
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:12:33 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:50958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklSR-0006w0-09
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:12:33 -0400
Received: by mail-wm1-x329.google.com with SMTP id y10so10579246wma.0
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 05:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QOtv0dj8ptJPbM9c3eLa3fGADqvJXNQGuzRSTVqKark=;
 b=MxKq1EAun5HrpToCxyF/w4aLJHfLcN/elfj3ritfE1s5q0BdrZ+3rxZaQnk31qGod/
 iZDd3hjHOwUkicGE2BJt7cNPSH9hv02z8e1sGRk6nAoFkprE4KFzu6RJy81N/Kd9D5zx
 zdw9cf4yxO9YfwJnOy7NgoPSWe7Iw/CMjnMZMMRGmC5dgYUE61JHvpf/ABu9pRqXMO88
 8EgRUKB/7o+cdlQBnlOMPEMaAXADHiKalMr2WKh4NawJMuti5unlpU6ujtFLYMCN9ev9
 2oMqALo3iGAxsx0TOKDtVfz0XEFV7ZBtF3A3GPI+awU9bs8jVY+YiEgwXeUBsp++rqjC
 9YmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QOtv0dj8ptJPbM9c3eLa3fGADqvJXNQGuzRSTVqKark=;
 b=xxEE8WmMidocySvcfDLtLn3rPGMnxzOgnAgErFMnOP3gNxD0LlMPFS9xBWO5JdlTSq
 UUZTq572Z6wwzjhB+k54L68twwGxwYb1feAds4/ycjbqVov7HsrBOIg3WPj9Cl/GkoYA
 aLXybfBBTRYaQMiAuJaspi7jgCE+w6Tiz9HHbTvLN3kZLUAd/YB7gqYS2HuwKbCyXzaq
 o0uJGPLsOfZcE92M20kBWYoPiCah+rVKLF7a00GGHQwIEg0e+xP9CbLTP1wmhrwzHFXp
 +CHODzTDYbG1FDnjtpayt2Wq9u/XbGoOMEwYEh/uoju8rolseGkuKX0L3nhoHvkMyD2/
 uK1g==
X-Gm-Message-State: ACrzQf1wwSSsxe13hyQiAZnhfIpqOBt0KaRv1lERTA9Mr1pXpwveFTdp
 x+8LBeKPXTVICKTg2cG2am2knw==
X-Google-Smtp-Source: AMsMyM5yj0yNjHDIXzowabT1I6wCZS6xeNTIjo+37zMeSsBucA8yZSADYdllVWZh29/wYgHZNZVStA==
X-Received: by 2002:a05:600c:5122:b0:3c6:fcce:e4e2 with SMTP id
 o34-20020a05600c512200b003c6fccee4e2mr2527815wms.65.1666095147983; 
 Tue, 18 Oct 2022 05:12:27 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a05600c4f5300b003c6f3f6675bsm8164060wmq.26.2022.10.18.05.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 05:12:27 -0700 (PDT)
Message-ID: <ba63aef1-dd76-cf7d-3496-c4fb7a31d0b6@linaro.org>
Date: Tue, 18 Oct 2022 14:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 17/28] qapi pci: Elide redundant has_FOO in generated C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
 <20221018062849.3420573-18-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221018062849.3420573-18-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/22 08:28, Markus Armbruster wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/pci.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/pci/pci.c           | 2 --
>   monitor/hmp-cmds.c     | 6 +++---
>   scripts/qapi/schema.py | 1 -
>   3 files changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

