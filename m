Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5D02E8437
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 17:56:30 +0100 (CET)
Received: from localhost ([::1]:39130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvNj3-0003FR-Jx
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 11:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvNhP-0001UT-OY
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 11:54:49 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvNhN-0001w6-Kh
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 11:54:47 -0500
Received: by mail-wr1-x42a.google.com with SMTP id w5so22277846wrm.11
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 08:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L1Ln9Zdd2AJ+Ckna7C1VbO1ZG0PxmepmdWbu7Nr8S9M=;
 b=AIy1usEpjlB0UTFSk8vk2tjzA/mGNI295UkHZ72eMJYKirkFPNJc1SIbnqJ58Xtvug
 uMvwfsAMfUdo3PSi1AlFk/NXiI8XlAC30hVz3ncaJYoyjaikCi5/uXQ0JEHwJxtdE2lA
 7QrYiDQBSPYfWRgPwhh34FVGPs5PFHw3EzIxe9uWE1FOYStYxsdIJES51kc613Gx/nH/
 7S8jsB2bEHiAzyDQVrvwBjpI/rNv/jB7WZczDDJ70zeNn3e5gig1V1gFp+ZiYbextqtv
 XX8U4lBmNFRaNc1q/rUjS760eRRTd4U7X15WDzallKp3tUGcCiIyZLfZ+lBg08wDu8m2
 Q/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L1Ln9Zdd2AJ+Ckna7C1VbO1ZG0PxmepmdWbu7Nr8S9M=;
 b=n7RkA+44D6S+QKOL/LRX/rhD3j1n10EK8lNrNNZ12p9GJ7I9PpAhwzIk+CixBAPXmT
 jhFeRlpWWpsp/oWm9XNN2cF84jhd8MRcNGC9QIazwXYsH+8A/oxa7d+XG5LYMNk9W1TK
 bn3nxMnoenCX3hiWfiiK0mjepj2pG1XAAv4t5UTQdZM+xTSQbfXvpVSY0ScHzF9LHi7E
 f49RRc23jXJiXNTl9c1V7N8V21gPKfclFG0a/V6SdnsZotouHUCv8ekHXDxubHvJqM8A
 Fr2D8zQR64l3qCHn8EJjDM67lemr6P0fsSOv6km+5fBLkkd4lYG12Yk91RRRIrdS7dix
 fQiQ==
X-Gm-Message-State: AOAM533akkSvGi6821I8euOgrlGEyiqpDp8aBZ19tmCZyyc2c+qyZ1S+
 Xcx+YI7pkYDCoedSCwS/o+k=
X-Google-Smtp-Source: ABdhPJxx451K0rgFwtLwtReCn9OVZi3ZhCkjUeHbWV/DQl4T8Kk1qHJ8rk1i+Vxv2ABdwHY1C2JeWQ==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr69208586wrr.61.1609520083962; 
 Fri, 01 Jan 2021 08:54:43 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id b127sm19705605wmc.45.2021.01.01.08.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 08:54:43 -0800 (PST)
Subject: Re: [PATCH 03/25] esp: fix esp_reg_read() trace event
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
 <20201230153745.30241-4-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6dd56e77-aac3-e648-9943-39fb2e5a9715@amsat.org>
Date: Fri, 1 Jan 2021 17:54:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201230153745.30241-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/20 4:37 PM, Mark Cave-Ayland wrote:
> Move the trace event to the end of the function so that it correctly reports
> the returned value if it doesn't come directly from the rregs array.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

