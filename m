Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4F11C3FFE
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 18:35:07 +0200 (CEST)
Received: from localhost ([::1]:52670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVe3e-0002Q9-Dq
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 12:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVe2C-00018Q-Pw
 for qemu-devel@nongnu.org; Mon, 04 May 2020 12:33:39 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:46779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVe27-0007TD-O7
 for qemu-devel@nongnu.org; Mon, 04 May 2020 12:33:32 -0400
Received: by mail-pf1-x441.google.com with SMTP id 145so5732015pfw.13
 for <qemu-devel@nongnu.org>; Mon, 04 May 2020 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qzl7Xz9Nr1ACa3t3aRFh72lgGoWAE9Z+asQafjUbDlY=;
 b=BVtI+uSI3ojFqJGMxTSnW7H1fTk9UHjxZ9ElggpziacbPy7nuV9g3L6yLtUCrgWYH+
 VlO7JxiACqkD5T8ZCG3UKINNIlkLb9rboykTYHhRE6cLR2kyRibj0ICo/DWv+jSkd0Dy
 T65EXsjy1qckjG+5fDJUXDmjqkU/CjBnLz4QHhG32RikfTA9hI0OYgg32mXUytR9DkJd
 KB4OrE9EhxrV6VrZL1CgHiHzaIh3Nl3B9ujZCWxytdTNQ97LdUlGnZZD+oQz8VjYjBIX
 kcaGooMA8qYEND2Pk/XC+YrzWzScQAdw+SRFhLqdl1d624yu77QVWuorNUWOtZlFg19P
 0NPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qzl7Xz9Nr1ACa3t3aRFh72lgGoWAE9Z+asQafjUbDlY=;
 b=knHQieKxyyOJgaq2Q7N/C6GSnKS+y2WFB++5fMGorIeAMetqnGrdhST9A8TxGyjXqC
 Jcr5gYhiusjevigYGhbB8vewKjDXAL8aM6/I0abA9lpP7qk/zUQ7w1iiwIBHEMS5Twaf
 wIDWMjxMb8m+OERxuHlvau1/iIGhaFqlTdMES/Sk0TnnNyPLtSXGHJWhr5BagACyeC+n
 5VH77JDhVZjZofeEMLGv2+7DsjcpcguP9hNLwshMVTPBzVofRXjB5iYElg/8HFqSlpMX
 MVuh21EjsvEWlRmRZko4zLyaV5kohVpdO9yrlE6x44CxdIjV9l3WKwroc4tKrepvg/A1
 U+3Q==
X-Gm-Message-State: AGi0PuZJ5Miy2bSZ3R2ubHL2RQ/NuPlz4YCfJi/v6qya2tbcvKhwjV5G
 hHnakoTPp7BjnBOX0RlJRxtFMg==
X-Google-Smtp-Source: APiQypKiOHvE1i3VJoRLoxZT71FsEvU5kddRXDo8uO/0T0ziUXxcRmeHik653FfC83Na7WH2WtgLAQ==
X-Received: by 2002:a63:ef04:: with SMTP id u4mr17509122pgh.280.1588610009737; 
 Mon, 04 May 2020 09:33:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id b29sm240462pgn.15.2020.05.04.09.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 09:33:29 -0700 (PDT)
Subject: Re: [PATCH RFC] target/arm: Implement SVE2 fp multiply-add long
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200504154303.5230-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9120944e-86a0-82b6-5d04-d679518616b7@linaro.org>
Date: Mon, 4 May 2020 09:33:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504154303.5230-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/20 8:43 AM, Stephen Long wrote:
> +    for (i = 0; i < opr_sz; i += sizeof(float32)) {
> +        float32 nn = *(float16 *)(vn + H1_2(i + sel1));
> +        float32 mm = *(float16 *)(vm + H1_2(i + sel1));

For integers we could rely on C types for the extension.
For floating point, you need to call float16_to_float32 here.


r~

