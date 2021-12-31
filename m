Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6BB4825B7
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 21:08:57 +0100 (CET)
Received: from localhost ([::1]:41220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3OCu-0002hU-7A
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 15:08:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3OAI-0000mL-1V
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 15:06:16 -0500
Received: from [2607:f8b0:4864:20::62a] (port=42615
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3OAG-0000hh-Ji
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 15:06:13 -0500
Received: by mail-pl1-x62a.google.com with SMTP id u16so20809685plg.9
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 12:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FuzZSVbhcQ0CA2x3SDM7NGDD6+Kzvi7uwLuUd00z16c=;
 b=Pi5C6WIH+4/ik4DjLqGLBlmp8klPfUWicD3x9v1xTags+kB5y0maqTd2sF2nZx3Kj5
 N8BTDq8QJF4waatiLhVY43h6MQYYmAzq0xJ1IdedKiFvqPCenL0R9J63TGJoluG+1bVM
 0xXuMy3sLsRxdRmPjZPC3kbH/xwFFFjtncnfTGgzBvDuPEZ6XzRiOR8Q7RPkY0bykA8a
 KXZ5nGvJZtuK38Mwy9C7PexJyhDzSKe/5POi8m08eVM0T6BdptqXEPWDcKF1SXQeNe1O
 HDZ/W6ZWR414GhlM4xRqwh3ApqSd9OVBSQmCbu5UdcIVqIf56yDRlyCPpDm0UNj5lV/B
 2xtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FuzZSVbhcQ0CA2x3SDM7NGDD6+Kzvi7uwLuUd00z16c=;
 b=ZwFXyqTwceKx38Iww9TsjTE5LggIJnOq2oayAbvnEVbGjNEDhHdRPzF5TbJxIMVj/l
 TWsLwESksZYDrAPPBi1fXrspTQ9kEDpxaM9pPEaWqr8x6h6oCuXN2wZMHPJKAkbPPAbZ
 J+Qd1BLUAU53/AAxYACIik6P2wX/yaY9ymslbisWlRdQUIJf4b/ZcqjE6q/cyHTBrYNs
 5E9IbzuvMFMnJNkfIHNt1bVx2FUovJEC/fHvVbTuiTiEJGpR/i7KJurYBwOSpDda7c+q
 nfvsGQKDIDYc2KXnHmMKy2N25cDEodZAlIVJ9BYz406OXylwSwvdgjckpBENGIvO1ARb
 v16Q==
X-Gm-Message-State: AOAM5329qy7Zz3x+CKVMn9f4sR63i3aUf7bMHlSA5vY74OLSUS5oOMdn
 OTewvbv7dWIsvCtA1WyHgIjXRg==
X-Google-Smtp-Source: ABdhPJzb2p0Dxvvjg7zX8OvChwyscUZlWSH6wJVclJgO3IJoPGMYfjFzDw/ffMPB3T4ihL1BdMKS+g==
X-Received: by 2002:a17:90b:4c48:: with SMTP id
 np8mr44667690pjb.51.1640981171484; 
 Fri, 31 Dec 2021 12:06:11 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:9312:6940:7d21:4efb?
 ([2601:1c0:6101:be80:9312:6940:7d21:4efb])
 by smtp.gmail.com with ESMTPSA id b65sm30275743pfg.209.2021.12.31.12.06.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 12:06:11 -0800 (PST)
Subject: Re: [PATCH v2 3/6] target/riscv: add support for zfinx
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
 <20211231032337.15579-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a522f7f6-b6ad-02de-dabc-0511740aef83@linaro.org>
Date: Fri, 31 Dec 2021 12:06:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211231032337.15579-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/21 7:23 PM, Weiwei Li wrote:
> +    if (reg_num != 0) {
> +        switch (get_ol(ctx)) {

Oh, you should be using get_xl here and elsewhere in this patch, not get_ol.


r~

