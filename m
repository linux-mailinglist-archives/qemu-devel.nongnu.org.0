Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3B56DD82D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 12:44:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmBU5-0001xA-I9; Tue, 11 Apr 2023 06:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmBU3-0001x0-J3
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:44:19 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmBU2-0001vR-2V
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:44:19 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 gw11-20020a05600c850b00b003f07d305b32so5109675wmb.4
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681209856;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wqZXfvrwtZOxvuU3SXpKa3bi7BmFnMZB5/gUarJYtX8=;
 b=zqj3XATDsWgqxDx1l+CUUDeiyIDJM38RKj/8tkYU3c5oqZTcQyjUgCw8OSyNSBeqSK
 ZZ03H8jv0gfs6DNj3e8RQu5UrzZUaSesHoanLINpVGu1leTl4ecUw8oe9ZaPwPu9JVd7
 ynLID+HrtSE3PSXTlxPgztwkIe2Sp7hHDbzuI/fIy4XycGU234ZIIJR8o06nMlqUpRvD
 TAWEb+P5GUBmpU3rYXl6dtaKW3zfSlMyhSI35S6xftii9skds1rcdwJ5hpHVhYQIc65P
 CpS/1E6GTC1hHtX2oHxDt9CCcPKyKu3BBaDjGKaJCuGdYflYqramQjHilohUOyEUtljf
 JQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681209856;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wqZXfvrwtZOxvuU3SXpKa3bi7BmFnMZB5/gUarJYtX8=;
 b=L++bNWLU8vRdNuKDTIFAi9JM6681Rg7UNpPwJRkj4tRs47TlgwALi2vehbHCEqtmKf
 pNSvu5kz837UD0J0dYjXEYqt1bzE/jlWM7qXFNB3AZwrqIUPPcKInY9biSa8WnJFveX1
 sBQ9jxDZqUD81qhH22k+9053SZeW1iz77Z7fk8g83GGLZ2cQLGOhoxGmNGAyC7Mui9qD
 xvwPyYzHDPveh0fG9fGGpsbaoNHOOeEDUYTy5IJo+lc5mU/O/wUfzSm42MQ4EpYM45TL
 TLB+MkPcEi5lbWSt4psGDAVdVvjCY/0JRdgvgsiuFJ0L4AkeDl+AwNSt3sc79WrDko5N
 RkLQ==
X-Gm-Message-State: AAQBX9cZ/S3NkCNLVYfrjSusYmVHpZgg+rMs4dW9QPSg7wM0PeMIF84y
 oVdf8Xce7TkCE6FFVal7pE3Riw==
X-Google-Smtp-Source: AKy350Z33WGkR47PX+MEdn4TY75XByNBJJf/YtziCKJUhtXAJbCkrD8kI2M/oFXzC0ODpevNmYBi7g==
X-Received: by 2002:a05:600c:22c1:b0:3f0:79ea:256d with SMTP id
 1-20020a05600c22c100b003f079ea256dmr8959712wmg.30.1681209856488; 
 Tue, 11 Apr 2023 03:44:16 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a05600c224b00b003ee1b2ab9a0sm16514598wmm.11.2023.04.11.03.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 03:44:16 -0700 (PDT)
Message-ID: <4ceb989e-0df3-524c-6bd8-50f929369001@linaro.org>
Date: Tue, 11 Apr 2023 12:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] tracetool: use relative paths for '#line' preprocessor
 directives
Content-Language: en-US
To: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>
References: <20230406080045.21696-1-thomas.de_schampheleire@nokia.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230406080045.21696-1-thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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

On 6/4/23 10:00, Thomas De Schampheleire wrote:
> The event filename is an absolute path. Convert it to a relative path when
> writing '#line' directives, to preserve reproducibility of the generated
> output when different base paths are used.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>   scripts/tracetool/backend/ftrace.py | 4 +++-
>   scripts/tracetool/backend/log.py    | 4 +++-
>   scripts/tracetool/backend/syslog.py | 4 +++-
>   3 files changed, 9 insertions(+), 3 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

