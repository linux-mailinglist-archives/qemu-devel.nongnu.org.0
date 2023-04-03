Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 472076D3E12
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 09:27:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjEat-0005d1-Fm; Mon, 03 Apr 2023 03:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjEaq-0005bC-Vf
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:27:09 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjEao-0003gK-NO
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:27:08 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l15-20020a05600c4f0f00b003ef6d684102so13808069wmq.3
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 00:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680506825;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wOlvJY53bQZZemYqMt1CiZLMjDogNbwriQzMkjT7dXM=;
 b=Bjt0bbrhrv0Cag4ZTvtB3ucODcplVBmUkzt1uXj0BOoRJvFe8Y/9dAwDflEvg1Cpwh
 2HgZywBwxlwDjBCFDPJ9AntU22qUPppsIIZgd+oDSWb6fBKR6PQVJNzhx33ev2eCbMb3
 LRSYsfxR4jmZfxS0L40SzlowRHhBBCS9HvVPAFqgRTqujGH7Ay8jqgR7YE64hIJoYXYC
 51WdvqjBBoUuRLLmaggLzXRuNdDKS6aMR/H64e2ZAylDAc8eqS6ptZIK4VAM6dBAtGcL
 8FWfVMLqWRBIFMWvfqKfAC2ktcGcMk/NEHTJz/2A7M504OiRx8fnmKmOssxygqYjIAYj
 jS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680506825;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wOlvJY53bQZZemYqMt1CiZLMjDogNbwriQzMkjT7dXM=;
 b=ppRfTSeM8XyRPVj7T7QPAwvWDwmZK6RK1wUtkuugH6ukY5UqmYDeiFuZCYIRbEy+Xn
 Ca/68X3KO8zMjLAat53NpTg6oBZiTuJKrxVgjWUX1tX+yXyVnpc8hJL6t034I1hHn6bP
 BjueVLSSkKiSpN1EeA9qto4IEPCwkJEpDgUy26N01OFFxRUorZ76jxroc5zc76FVZvBE
 Oo9VNfHI76GzrAka3nZI2qWLoUtEW/VHNtREP8z95weHn3JKrOujxZr/kgxPlMSZNuqZ
 Me/jbf+eyoK5B399EhOs1HMHbrts7geDGWVijtlGN7VhGFehN5YphrARu34/USh7asOO
 4A2g==
X-Gm-Message-State: AO0yUKV/fBeUxJ/g91SkEJHZJO/UNJytUAknFz7adn6urW3lO2V3evjn
 aaO8P2j8bRywIs9O7zact21+HnMG/blNIVMpsNISxA==
X-Google-Smtp-Source: AK7set+tz30N3zyfFD+579V9KbPX2Auqh1flgxOEABJHkjweLI31WAKpvRsj2xMcA+rP/zmrI6GX3A==
X-Received: by 2002:a05:600c:ad0:b0:3ed:abb9:7515 with SMTP id
 c16-20020a05600c0ad000b003edabb97515mr26468809wmr.11.1680506825013; 
 Mon, 03 Apr 2023 00:27:05 -0700 (PDT)
Received: from [192.168.127.175] (246.red-95-127-42.staticip.rima-tde.net.
 [95.127.42.246]) by smtp.gmail.com with ESMTPSA id
 m8-20020a7bce08000000b003ee70225ed2sm11194278wmc.15.2023.04.03.00.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 00:27:04 -0700 (PDT)
Message-ID: <bfe8739d-e1e4-fd6e-fa92-6cad44ebec47@linaro.org>
Date: Mon, 3 Apr 2023 09:27:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 10/14] ram.c: Move core decompression code into its own
 file
Content-Language: en-US
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
References: <cover.1680457764.git.lukasstraub2@web.de>
 <2af9a607c95a9b543a213c7123be5c8f131e922c.1680457764.git.lukasstraub2@web.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <2af9a607c95a9b543a213c7123be5c8f131e922c.1680457764.git.lukasstraub2@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/4/23 19:56, Lukas Straub wrote:
> No functional changes intended.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>   migration/ram-compress.c | 203 ++++++++++++++++++++++++++++++++++++++
>   migration/ram-compress.h |   5 +
>   migration/ram.c          | 204 ---------------------------------------
>   3 files changed, 208 insertions(+), 204 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


