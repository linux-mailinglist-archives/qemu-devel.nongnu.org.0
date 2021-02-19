Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA0A320162
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:33:08 +0100 (CET)
Received: from localhost ([::1]:54348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDEKh-0008KM-GO
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:33:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDEIN-0007jj-Ii; Fri, 19 Feb 2021 17:30:43 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDEIM-0001j7-7G; Fri, 19 Feb 2021 17:30:43 -0500
Received: by mail-ed1-x530.google.com with SMTP id p2so12338057edm.12;
 Fri, 19 Feb 2021 14:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hSWSvgi2Ca6+Ewwd+A5faBI/ErT/tO5ch6FdhvKc8C8=;
 b=aS56z1lg5tZnmShYLIvWicFk+L2vpE+o4UfNTT8K043tdsQBZlzEz9KzM3ggO0uSJW
 eWQQbsLdFTcxhZb0ACOsIGSpU7hxJPEgC7lMMBcXkPouhVyRCUHCd+NZryEJXnXVhcLS
 Rem7i11PSvTZWPVw+zpm9MpWILEP3J3NuLLZ0srD3rFiE7YBTwkWvkMHr9ohjxVtG04E
 TxjTBha6S98/QT2hK5eEu9WWsVgcGBvNHyq5vHCsxF4C+UORnsEC582MlBrtw0WwxIB1
 XXBA8QAa780oz+nYhRhIrCUPDMnpIwMgb9k+jWeBewWPCGBwl+90mq5KfAru8PY6ZfKi
 Z4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hSWSvgi2Ca6+Ewwd+A5faBI/ErT/tO5ch6FdhvKc8C8=;
 b=Xe8zEuEt5kvsl9syYQoYhrVyzPnNY371co+xXG2ZMSxbPbtnQCsA27eQGfe0984ocC
 IzwXItZu/Qd3zlugQdnCVWIg5G+3ffIvvNRFa/pDkWSZGxqmaPCPPLNYmLzSwY2duGse
 hpHs9EMfBF6fMy0Ji+qgURktKFA2a44j5RrXlE0HRB6CS/pESWNDYSqLUaD4G9kxSYlf
 PsFaXfdwHi/LWCRn4H0rj7A4nfGoX/fsYEAuHXYAj/Cni1d7eTJoZXG3Xoe5IWWua6rb
 pN8SNFP+i4jhz21VM+CcdqPE4SjBhbAaHwwm9rAqSxByOMHsgNTNC4auoyr6D9nzeG7d
 WWYA==
X-Gm-Message-State: AOAM5328C5jB7Z5jMnHZjobMUpW06AHJvpeyLZw6XF2N8aA0BKYFbwRj
 NYBWtdTV/IleLebCQBWGOkc=
X-Google-Smtp-Source: ABdhPJxtRkmNlqZQRJj4zQNUf7zNsxlBvAHGpQijdqPBCKCy3NhdulbbLQUMFuZ2cki8OvudabQByQ==
X-Received: by 2002:a50:9ecf:: with SMTP id a73mr11103958edf.181.1613773840472; 
 Fri, 19 Feb 2021 14:30:40 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i18sm5906967edt.68.2021.02.19.14.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 14:30:40 -0800 (PST)
Subject: Re: [PATCH v2 5/8] hw/sd: sd: Skip write protect groups check in
 sd_erase() for high capacity cards
To: Bin Meng <bmeng.cn@gmail.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210216150225.27996-1-bmeng.cn@gmail.com>
 <20210216150225.27996-6-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <58464268-30d3-5755-600b-9a04d849478c@amsat.org>
Date: Fri, 19 Feb 2021 23:30:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216150225.27996-6-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 4:02 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> High capacity cards don't support write protection hence we should
> not preform the write protect groups check in sd_erase() for them.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v2:
> - new patch: sd: Skip write protect groups check in sd_erase() for high capacity card
> 
>  hw/sd/sd.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

