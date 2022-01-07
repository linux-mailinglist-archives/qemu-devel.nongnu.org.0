Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C3D486EC2
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 01:27:51 +0100 (CET)
Received: from localhost ([::1]:51152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5d6k-0001g0-DA
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 19:27:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5d3F-0006wk-Qm
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:24:13 -0500
Received: from [2607:f8b0:4864:20::433] (port=41472
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5d3D-00053S-70
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:24:13 -0500
Received: by mail-pf1-x433.google.com with SMTP id m1so3804137pfk.8
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 16:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nwpzfqvwi97zKUHHA5xtPbrd5FC4JTVyZ2H2ivQ1dpc=;
 b=qnavNhIo0pAE2kQ/dwkU4kCinCkzHdvHlzTpCiZHxioEJauRNQ7C8+Q4f6BMDOV63B
 feRvnbkUwHP1JXbrEMM+qw7UZS/xuFOxDMeOg9eKHOMj+Tn9ELMTxYr3WgmLoxW00aeQ
 WrHURCSUq5fh+XpKrKK3UTSQNYGIxh5InyG5Gfy9nKZwEsnZpXf44vOix2y2mGAhqu1U
 vsi7U7+coOR4tpGC+mne5uY0l7E5vxmEQe9ChN8VUYR5zK4FLm++PXx0Cb17mck/VQwY
 aJGVv+YePEscdsGRbmay8JYYMKfgH2CffUgwvO15FCq6YxxpZW/I/KWYuT05vd8KljX3
 5O3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nwpzfqvwi97zKUHHA5xtPbrd5FC4JTVyZ2H2ivQ1dpc=;
 b=2hWgeSAlDqrEMrz0FX0BRbWRi1lA/S/G8wKKgIoZh9VMMksdfsInO9YmoVUB92HKwJ
 VDUHxGDVcZiDI1+97aQ/Sw4Z29eInjtCGUn9HCHWOTb0N422HGG5U0hQrcqdMw2qZqwo
 ZrhUFKfYFzWlXNuNH7YiebTkLCQgGdgB5MNmhFbB+4ebFLWO+VrHDhJI3Fy3TbMVcrUV
 MOnjvV80o3NPRESK34j5VQGYuLEYRZu7tvF86l1WyfHLoQcORrVYIIQR4XuAb4rr31wH
 bieiIWNp+tlAt+J7IjonpWJ/eITN4fh6UTdQXIGoZox1Eru4lTKn/22H+pfh4TW0sPVp
 ymKQ==
X-Gm-Message-State: AOAM533IBkZmfQXuHL/V3hPR2x2rPoZzlQoizyPDyrIg18gb/YLt9Pyv
 aCHR5oWDCkrHAtEM1fSFoK+bqA==
X-Google-Smtp-Source: ABdhPJxv/1nbciDdZZFXavUBrfnFgDXmCzxwbm/wqyZW2AqdCQdN0AIEZIXbnXB9woW5Wko5aOc7FQ==
X-Received: by 2002:a05:6a00:2349:b0:4ba:98c6:48f6 with SMTP id
 j9-20020a056a00234900b004ba98c648f6mr62720879pfj.42.1641515049848; 
 Thu, 06 Jan 2022 16:24:09 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id x6sm2880759pge.50.2022.01.06.16.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 16:24:09 -0800 (PST)
Subject: Re: [PATCH v2 7/9] hw/dma: Fix format string issues using dma_addr_t
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <64c71103-7119-56be-ae67-e9191b2a2ed2@linaro.org>
Date: Thu, 6 Jan 2022 16:24:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104085431.2122999-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Peter Xu <peterx@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 12:54 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/ide/ahci.c        | 2 +-
>   hw/rdma/trace-events | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

