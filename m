Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C939C6C453C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 09:45:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peu5S-0005SH-Rz; Wed, 22 Mar 2023 04:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peu5Q-0005Rm-Ed
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 04:44:48 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peu5O-0005F8-Qa
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 04:44:48 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so5738139wmq.4
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 01:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679474685;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mqvRnvscLt/sKRRcXKUy/gxglY+JKSt/8V4/iKW4WNg=;
 b=DCoNJ4TfFDPt5nipniEOljuT+fnRSKQTDaJYLdy5Nl5BMTwZQM7JdLrmoAJIunuFep
 MObgQ6KnsCIvtdQsWHVAAwHBJKWbQUAun+CQ9p42MYEe4p/6wZAO4SZV6jMITeuUQifn
 uIwIkWOB9UvIj2KFV90uAotr0R+QBnVwEeTIjZnr4YP8U8F88Dh9KBhrI8Wq6rEflShU
 09CEiE82s6OJOt3/ryC0yAonSW29dT7SHNdh/E6n9RRYXAPAhe+fsnJlUKhsc4puwTAr
 ECSB8MezBpxFB1F9HqJO4G13iZPe0dGLD0CXpwNW5LIqVB4xm5/cBT8tazsL1LakKBi4
 hVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679474685;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mqvRnvscLt/sKRRcXKUy/gxglY+JKSt/8V4/iKW4WNg=;
 b=jVlytb/D6RLtJ28hBP3/GwvvusgmClfDXQtUkSMqFfG0BpPaipw2BM3P8M1BG3lL8Q
 fUQXMmTa3d/kcOXphVRd6embuGqqtVxkTFVQ3ssY2VJUqWI0OTfL9ri+nHewNdcnpMdq
 Fy3uvLd3T0NI10OkIcVyUdCIt9svpe6lO4+hOKxbfwBC6jmbUK1ReEMyLlSdM0srzwA9
 OgC6b1V8aDvHzH98AUQspVgeMizbmXhvv2mJnAG6j+Ty95M7GHWd9sAhFG4xC1spSc2H
 TxncdiRyUGqoEKj0ZIoKgmQtLpGGt4WIXuMNQOC8ypo6Jt7VJC/kQfvw55vtWCvmB5cU
 C3JQ==
X-Gm-Message-State: AO0yUKWNVV3Npr6N4ILvoDPzGBn36f1wfcUgexlmdCZxZ72MKhAmOOFH
 IzrXr9MYFidg2D9YslntCH8wyC2OY88dx7I/XomL8g==
X-Google-Smtp-Source: AK7set+7jD0+iPsPEByE6SsIkuV5ug2BSm7KZ7lbmBaksNAdQvq8liOogL8OP+4AECUoFS5tJrrIXQ==
X-Received: by 2002:a05:600c:2251:b0:3ea:f75d:4626 with SMTP id
 a17-20020a05600c225100b003eaf75d4626mr4421346wmm.38.1679474684728; 
 Wed, 22 Mar 2023 01:44:44 -0700 (PDT)
Received: from [192.168.18.115] ([91.219.21.246])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c204200b003e91b9a92c9sm15992657wmg.24.2023.03.22.01.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 01:44:44 -0700 (PDT)
Message-ID: <22607500-7b03-40da-362a-1ad09041a119@linaro.org>
Date: Wed, 22 Mar 2023 09:44:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] ui/spice: fix compilation on win32
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: berrange@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
References: <20230322075256.2043812-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230322075256.2043812-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 22/3/23 08:52, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> qemu_close_to_socket() renaming left-over.
> 
> Fixes:
> https://gitlab.com/qemu-project/qemu/-/issues/1553
> 
> Fixes: commit e40283d9a ("ui/spice: fix SOCKET handling regression")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/spice-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


