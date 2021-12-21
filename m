Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA95F47C9A3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 00:19:56 +0100 (CET)
Received: from localhost ([::1]:58432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzoQF-00012M-Ok
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 18:19:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoMo-0004M6-1o
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:16:23 -0500
Received: from [2607:f8b0:4864:20::531] (port=35578
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoMm-00075I-8S
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:16:21 -0500
Received: by mail-pg1-x531.google.com with SMTP id v25so391951pge.2
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 15:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ub4BgU81RFax2Mxxmm5QqsmMIbEgr44W13ty0JqSaL4=;
 b=vZrc+MUf5LXFf9TxSjngRYgFvUaLP/qapwIf/UU2q0SCJfpDRDa2SJN2ssiA7zzrUc
 VvnbwoLPywG0qgIkkq0Q6JKKX4dWYmDsj0taV/7nwXCVoJ+hhJVsNXhDgwIPtwsZnq7Y
 H3O88lrwC5b8SOUmpcdpGivn54Mw7St79jX+RSHU9V0OzFy+uxhM7bra1WTsECCSiFZm
 bW/IYHH/GDQJQ7KSKWpWoOnNU/rvKTvpDkIkOGFPb8TMwskgtqh6W3pVoO7FLD107BcN
 9Y0pVpgmkAzsE9KDelnJZkSrAZdo8J7XG2q92bV9BLqlmJ/5rUDDWwlHoZotA4fuc6Dy
 zYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ub4BgU81RFax2Mxxmm5QqsmMIbEgr44W13ty0JqSaL4=;
 b=JQj0YkcSPtqtDz3yfD2T5D5lyMbR+kgQ5ED+7Lidu77wzSZlHEpmDSzM+yWYzHZvWY
 gqducLIfd/cat31OlOhpXscCBgLJKuy4/Tuuy+GgDSu9jbUjm3DM6xSATj02lhxYH4Zn
 kahNtJQf4JUeqhjYVdK/CcyOKeHBQBPaAnV1DKD7D047b5vuPpXwj6MgIVEjzEE9RSw5
 m1yQbeiBZ2o13wkgjr+HVKLUjDp2ld0vzJ7/TlBnCDZ7+e9b+EVFSkIey1vKLdbIDpl5
 QMuXQfPngwCiZW/uyCyPDZ4LsckLkWNrmLqNqwxDk4LrB8K5zP9DK6Pxl297q0RT+SPK
 Y1+g==
X-Gm-Message-State: AOAM532nawuJkYtHTHfjqquYsAbxWAe3lIDgH5TnfXr20eTq0SiyCD3i
 eSFJ9UhZMSSwPGVVBjfYxKH+PA==
X-Google-Smtp-Source: ABdhPJxnnZBQG7DpA1kQEpp4dsrWmi1UZVRGJIRt2Co/p4zz+qgUCwAf5BGmPZo2k67LsOT92VTG8w==
X-Received: by 2002:a63:6a49:: with SMTP id f70mr517760pgc.244.1640128577882; 
 Tue, 21 Dec 2021 15:16:17 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id s29sm135418pgo.34.2021.12.21.15.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 15:16:16 -0800 (PST)
Subject: Re: [PATCH 4/5] dma: Let st*_pci_dma() propagate MemTxResult
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211218151053.1545962-1-philmd@redhat.com>
 <20211218151053.1545962-5-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a27eef25-feaf-0883-dcd0-d3f9e73b22c1@linaro.org>
Date: Tue, 21 Dec 2021 15:16:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211218151053.1545962-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
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
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/21 7:10 AM, Philippe Mathieu-Daudé wrote:
> st*_dma() returns a MemTxResult type. Do not discard
> it, return it to the caller.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   include/hw/pci/pci.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

