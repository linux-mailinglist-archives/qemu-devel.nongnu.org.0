Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8A225EC70
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Sep 2020 06:09:48 +0200 (CEST)
Received: from localhost ([::1]:55616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kElzw-0002FD-0Z
	for lists+qemu-devel@lfdr.de; Sun, 06 Sep 2020 00:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElxl-000804-Q7
 for qemu-devel@nongnu.org; Sun, 06 Sep 2020 00:07:33 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElxk-0005tW-5y
 for qemu-devel@nongnu.org; Sun, 06 Sep 2020 00:07:33 -0400
Received: by mail-pl1-x643.google.com with SMTP id z15so2938902plo.7
 for <qemu-devel@nongnu.org>; Sat, 05 Sep 2020 21:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PCSxRIYL5MvsEumYLS+k8NBn0TzZSDj9/oWkGoo/eyo=;
 b=MW4O3iNpzUSXmWL/bEKH17pAnLFVu67/JglkGcNekKj5XOhNU7PQLj4ZGJSqva5M45
 yq1jqiDstkBGinQf54x+mANV7eUkqosrXIaCN29SVrmMGtjB0VZ/7Jij9aHObQJ9WoUx
 0lpDqUzuXj99NccoOOtVlvZ+NCMBcwI25ndAlXE8x3xiRMj4cTzXxOdPw5jwAF67rGan
 JoqgRrY59e4ei84mrt5CVfurEHMji2snVonGduHmDlCz4s26kPUb7uCgXyHQ5bDC2YRR
 fmhfYsPBLQdkS15WL+9CJxKTKMXG9/988pVjRFFpkxWpaz3GIsk1ySh+WK3NoF6PO8K/
 LjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PCSxRIYL5MvsEumYLS+k8NBn0TzZSDj9/oWkGoo/eyo=;
 b=oXfEcOeCIOZmJDnmBaJ2xhuTZQF00NUiaz9QpTVngbVJDyq9VGKfK1IGi+Lz8j2qXV
 GYb1zPlakZ8kwnZR6MA5pxlGH/4VqvMBlnEt4gRW9M4NW7o5FuAdgqulctoQiL0zILBN
 Iuv82gkB/tSHUq9xeSSnlzZoCc5T8G8OoVHwd6n0EOKbNMqAJvTYN800cSha37BapIRm
 J8p6S8+ymDKsWO1vF1tFQAsIkqS4JoQtydi86wuxlc7hcM50kDewmiB1hUxCJRjzS9iX
 SdIHnbH7aXy6Qw+U8O2JNzoeVjqqCNPF/p/de58pueFDOQsDCyrjiJEFRmskeGX3ejtE
 1Vfg==
X-Gm-Message-State: AOAM533/ejeRyS7sxoSEC7v4YQThy8ZVY6F6w5lB3zvT8EsOVggKM8VJ
 oZskmjq1xBAtullDSM5cGtq0t8TAqigXvw==
X-Google-Smtp-Source: ABdhPJxHpZf3/g2t1g07ZDhHLIMsBdPXcFrxxzEic+MLrix0kLDs4s+rt5IzxvPu17zS4DWMp9w04w==
X-Received: by 2002:a17:90a:55c8:: with SMTP id
 o8mr14589561pjm.215.1599365250908; 
 Sat, 05 Sep 2020 21:07:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 19sm7475879pgz.42.2020.09.05.21.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 21:07:30 -0700 (PDT)
Subject: Re: [PATCH 2/3] pci: Let pci_dma_read() propagate MemTxResult
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200904162620.657726-1-philmd@redhat.com>
 <20200904162620.657726-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7bd4e8e1-a04f-2715-c27b-1ba3c3835d91@linaro.org>
Date: Sat, 5 Sep 2020 21:07:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904162620.657726-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/4/20 9:26 AM, Philippe Mathieu-Daudé wrote:
> pci_dma_rw() returns a MemTxResult type.
> Do not discard it, return it to the caller.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/pci/pci.h | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


