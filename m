Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA274EA2A3
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:02:16 +0200 (CEST)
Received: from localhost ([::1]:50928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYxRH-0004DE-R8
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:02:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxOj-0002fb-6M
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:59:37 -0400
Received: from [2607:f8b0:4864:20::42a] (port=33506
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxOh-0001zD-C8
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:59:36 -0400
Received: by mail-pf1-x42a.google.com with SMTP id b13so12196097pfv.0
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5gDtd1NDwKlje79nWAScNLxoRXYKxA2zv0KAK+SBquI=;
 b=VueFUnx8jjKcQ9Ko/E83yHwA+sWIBEUSNKR2M/pfQijLR25PUceZtGA/t+poxC6cju
 pQUFnmIgmX8SK4aJ/KSeP1f9vvJg/1NUhXM9gO9leNuQe4S1KMe92QI174R/oogz3yaG
 inZQDpuL3jXasTGf3FtMQlLsvF9eqNK/7OLPRyk+GiLsRvRrcYYwF/7cuSWqmWL7zxcF
 6oZyxP3FGoV3mEIBu9YxC9cfuaoLlJz+STCgGFtnzkjCPHhAAGt2ONYvpNGT1/srQuPo
 L+4xwFU67mQSkwBQR5nMIIeSZ11ldvEp2cGiTgw8Obd1fQuwlQLD+euEJh271Sw7eAD2
 +lqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5gDtd1NDwKlje79nWAScNLxoRXYKxA2zv0KAK+SBquI=;
 b=JNtgXXmJp8r8dWszerZSKJDAwG3rg42wuW2V8Kw5iTYmVdzfLw/GjQtcwdNDHQt/DS
 sK5K619ZsL8bEhKBZcyNJn3iyU0E7AVsoxQyw7QFabiYy1l6s7vhfXwBlzJl0GZDXhJM
 Xy1LTTPIExhQmP6MeBTrtKTAriEacUbLMYqEFZbtszOhdMGZ+CmY7kkBOK238AHeq4fw
 uGhjn0k0Q5WRZnVS2xxQZB7XGdwdXfS31E3p5UeixvRzT3kAqIlbYw5NshD9pkjVzjyg
 Z+AWn1LVHgCkFLHIhBRYnGwFA8X3P/V5bkpjB+PZPeJjCOLXRkVQMb1NqZ5WMLO5w720
 p7iA==
X-Gm-Message-State: AOAM531z7x+sksh1AXFB0ei2/zOjeC2+Hfbcb0TyXdRcAvIIx3ORiBNJ
 rXHVCCO+r1ewx82nzjbWNFoYwHX1kw4hqQ==
X-Google-Smtp-Source: ABdhPJw96icALXZDcs6wczOzNEIu6d0s2/YZDoNeTT66ca75gwV9Nk4tWcceUkykopi+9VHS6UZkMQ==
X-Received: by 2002:a63:5b63:0:b0:378:5645:90f6 with SMTP id
 l35-20020a635b63000000b00378564590f6mr11497153pgm.505.1648504774122; 
 Mon, 28 Mar 2022 14:59:34 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:3c84:1cd:456b:b750?
 ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 x14-20020aa784ce000000b004fa79973c94sm16501664pfn.165.2022.03.28.14.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 14:59:33 -0700 (PDT)
Message-ID: <7ea84c5b-2ffa-f702-d38b-aa0fef724400@gmail.com>
Date: Mon, 28 Mar 2022 23:59:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2] ui/console: Check console before emitting GL event
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20220325161216.74582-1-akihiko.odaki@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220325161216.74582-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/3/22 17:12, Akihiko Odaki wrote:
> Without this change, The GL output of a console overwrites the
> other consoles and makes them unusable.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/console.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

