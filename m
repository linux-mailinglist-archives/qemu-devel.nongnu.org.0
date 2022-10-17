Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EC36010D5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 16:12:53 +0200 (CEST)
Received: from localhost ([::1]:55408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okQrL-0006Xg-K8
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 10:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jirislaby@gmail.com>)
 id 1okJWn-0005rq-TR
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:23:14 -0400
Received: from mail-ej1-f45.google.com ([209.85.218.45]:33452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jirislaby@gmail.com>)
 id 1okJWi-0000GR-Uv
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:23:06 -0400
Received: by mail-ej1-f45.google.com with SMTP id q9so22686118ejd.0
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 23:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bpTbZUmJQLHbMXDMiOKvxLR79u+pXnVxpcrUOEllPyo=;
 b=o/ikDzL5feCj+qANXjT6PuDCzllQFwTpdnFqV7RLiFJBM2H0mYrWOImRVN1DsrNGIt
 KHOAVBvhRPSqHDqmbLO8QIZq8/hy7LlzOWUzMzUkO7E/91I50xUC+WmZDLrXdad3rPxQ
 6E1k7Z0eBBPNmbPYwAl2Tpyd9po0g4tEmr9N023ZVKP7PCxJBZt5ZkMyixQXuHv4xi5s
 zKcfmrfnUeHTYma91i6qXwhDcjm3wstKeGmd7N6be52jKGW6vx/WjTNEGAwlP1TYwq1E
 rISe0/FWsvhL7Uu5N0fLMjXHobpVTSzDl5bLhIywKcvyAi5sCT4gDzQ/SKouKG3RzxcG
 7CGw==
X-Gm-Message-State: ACrzQf1inaFDow2jUiSx10Fm2t65qfczLL2Nv8stEpp7UySXQG686lX0
 4Sl8HwCaktl5mZzz5IkFFuc=
X-Google-Smtp-Source: AMsMyM5oKWeXQqmz7APaEGtsQMBC9Bfv43YfCQATn+45OPLR4jWM3vkjW16NnwTWJsyxqAoOYDi0ew==
X-Received: by 2002:a17:906:cc0f:b0:78e:1208:8796 with SMTP id
 ml15-20020a170906cc0f00b0078e12088796mr7326810ejb.601.1665987781393; 
 Sun, 16 Oct 2022 23:23:01 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id
 ey4-20020a0564022a0400b00459148fbb3csm6714776edb.86.2022.10.16.23.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Oct 2022 23:23:00 -0700 (PDT)
Message-ID: <79e5307d-1c6e-614b-815b-4e796db71b17@kernel.org>
Date: Mon, 17 Oct 2022 08:22:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [v2] hw: misc: edu: fix 2 off-by-one errors
Content-Language: en-US
To: Chris Friedt <chrisfriedt@gmail.com>, qemu-devel@nongnu.org
Cc: cfriedt@meta.com
References: <20221015211025.16781-1-chrisfriedt@gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20221015211025.16781-1-chrisfriedt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.218.45; envelope-from=jirislaby@gmail.com;
 helo=mail-ej1-f45.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 17 Oct 2022 10:00:17 -0400
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

On 15. 10. 22, 23:10, Chris Friedt wrote:
> From: Christopher Friedt <cfriedt@meta.com>
> 
> In the case that size1 was zero, because of the explicit
> 'end1 > addr' check, the range check would fail and the error
> message would read as shown below. The correct comparison
> is 'end1 >= addr' (or 'addr <= end1').
> 
> EDU: DMA range 0x40000-0x3ffff out of bounds (0x40000-0x40fff)!
> 
> At the opposite end, in the case that size1 was 4096, within()
> would fail because of the non-inclusive check 'end1 < end2',
> which should have been 'end1 <= end2'. The error message would
> previously say
> 
> EDU: DMA range 0x40000-0x40fff out of bounds (0x40000-0x40fff)!
> 
> This change
> 1. renames local variables to be more less ambiguous
> 2. fixes the two off-by-one errors described above.

This should be split into two patches. This way, it's hard to review.

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1254


thanks,
-- 
js
suse labs


