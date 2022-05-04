Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF37E51A770
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 19:02:48 +0200 (CEST)
Received: from localhost ([::1]:47346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIOm-0008Gk-1u
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 13:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmIIO-0006vJ-2z
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:56:12 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:43848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmIIM-00037F-Ln
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:56:11 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 m6-20020a05683023a600b0060612720715so1265817ots.10
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 09:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=QNsBdgDANVzmqxow9mxwpgHM0wtI84SgPR+bRzvzMyk=;
 b=RnIs29sz9tv46FeF1Doah8QcZaMKKXW+BqA8yHZDCSC7UC/0HkmxATgY2U1vXZ/lYr
 Oo9PlAg4ddLxeODhkpSZ190dbUtUo7Mu3DIyROArNVt+SiH6lIg2qushxY/tEVD36a9o
 pC6Vdp0mT/ln27+kQorfyM0J9ghqA6VCPRdtSruPZNw9PRPZ10Y5C6op90HbdFkx5+Vt
 FpEuzgVTrY7AgixZ3lDRBkMXWDvt0VGj0+5ZNrP09nJOFrdiBBHHWXoaGldrxbcFuM+b
 BblqBQrDmAYrKgzJrLVpfbQW6i/ZNfwOYTLVSEDdOIx6uIrmXubxKTiMb3VYFULddBVn
 NQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QNsBdgDANVzmqxow9mxwpgHM0wtI84SgPR+bRzvzMyk=;
 b=p0vCGzuMoz/J75IIaNqlOFHrpFxY6V7T/V0fXGdGfOoXKGKwZhbdWYoC35BEStM93y
 vt7iDpvu1NrMsn78rLxLUFY6q0IORLBxFxfougf04SnZObqSAflObsed/wLXdcWWOlL5
 dyrRjnt7KxVOocApGR/5E90wsKScEIieveiU7mn5Dzofejm3E+vieCq7dJ5q8Vmb2MrN
 EXMmxcJ/infUsP8HxOttIC4HVFMnUFW0r9rRsN2ZCzHLf+FNU52hBLXabxZn4gCcmXif
 93xJzIdqUus6s50FtPgHzBhbrgxGo5m/wh3C2/MtJa7iODtk1m8Z11XIhopIB/+4Xo6R
 VQLA==
X-Gm-Message-State: AOAM530yrQpf1Bzj2d8MBQ5ziRIBREAYllKxnkZNKZRhEqrfqKac1vbn
 pMxPJQvIDMnwBbKQAcl6ZveOpQ==
X-Google-Smtp-Source: ABdhPJwuGI+AX/0YWNdVXUtXbLQFXI3RmEjmx2Z5S8MDe6HXwgSPcCn8cB9YplVXhW3yoXuczP/G7A==
X-Received: by 2002:a05:6830:1e16:b0:606:4dc:5494 with SMTP id
 s22-20020a0568301e1600b0060604dc5494mr7224819otr.131.1651683369111; 
 Wed, 04 May 2022 09:56:09 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1?
 ([2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a9d2789000000b0060603221279sm5239336otb.73.2022.05.04.09.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:56:08 -0700 (PDT)
Message-ID: <59ca6890-ad61-1c37-80a9-c10aaf6fc16e@linaro.org>
Date: Wed, 4 May 2022 11:56:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 09/50] dino: use QOM cast instead of directly
 referencing parent_obj
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-10-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-10-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/4/22 02:25, Mark Cave-Ayland wrote:
> Use a QOM cast in both dino_chip_read_with_attrs() and dino_chip_write_with_attrs()
> instead of directly referencing parent_obj.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/dino.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

