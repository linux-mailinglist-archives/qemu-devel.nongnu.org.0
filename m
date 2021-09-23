Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED884171D5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:28:26 +0200 (CEST)
Received: from localhost ([::1]:39534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkJV-0003O1-TY
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsa-00079t-EB
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:36 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:44654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsY-0003SV-NZ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:36 -0400
Received: by mail-qk1-x72e.google.com with SMTP id 194so27445120qkj.11
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pg1gyQEkbG2I0p7Qan2OJbGKu+mYxwzJo3Amk/H8iG8=;
 b=TgHtqKzhEfOtJ/UNA6i5K0bbRn02qAxn4Tr49FsLdBXWfoThmRc1M3lGjNdvzzOIdS
 f6dyIDzHH1sfytSrbAQOBD173BKcMf2tR3re4g+iQFNO923MyTjZAfmQlr0hnH6X7uhJ
 cwdqLeJtK3wapmEOdJJaRcs4IvTw0bqtorfi8GZpXgE4NJU9LkBtxJt433wlsh4tGgE0
 fRCEYsz9XJowIfItrwKloQlTqSlxt0jv4ElDxXaEbGd3WFwgfegmm+wJx2pOoB2P4yIl
 HE4s+Qik80TzNcQ61M05yODhAsqJP+N/0iXWoNcM1nLBqlcWqbVXz4xlpe90g0ZloexV
 1y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pg1gyQEkbG2I0p7Qan2OJbGKu+mYxwzJo3Amk/H8iG8=;
 b=XWO+grZ2YXUW2QXYZjnyrn+CG6o28CIAJklHdlgLFfP9CrtQHQFp2zoxyhm+7ZN33W
 KL+4lkFvm6bzDz4yI6aAHB34c31qXkI14YNWVuerOvRW9OG8MSSXLBsZnHuvXb6ibXRY
 zq9Tn23j9KLg3/y0RDP6OgIVVrs9sdqMI/xso0DuZrVhul1cCuCbyPyGQ3oUWFKtttcr
 RbQfYjCoIQIaXU6ml7PCJAFgYEugKfR5J+BIYHp/G5Tw+XklT9j0i2tnTq9z9Z7tv5Lj
 itp/RtS+fCYRr0t4HbE9fg0rKCx7ANnSlm5oD9tGrOP6PYs8FYLDGV6Ka5jTX89oAx7T
 5swA==
X-Gm-Message-State: AOAM530EL7kJkY2b+Lain5DN/O6GWrHrxv2fDG1ByaDPKvd4VSbr68N9
 m+sPgnyOLTXVkuI+KZXyEt+Rtw==
X-Google-Smtp-Source: ABdhPJzMv7sfMCb/nxggKWoTJfHPznskHCyrw63aYGvs1HdpkBY+vqUgHoCroniaDv5ZJkeycj9nOg==
X-Received: by 2002:ae9:edd6:: with SMTP id c205mr9705403qkg.289.1632484833724; 
 Fri, 24 Sep 2021 05:00:33 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id v8sm4953616qta.21.2021.09.24.05.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 05:00:33 -0700 (PDT)
Subject: Re: [PATCH 13/14] bsd-user: Rename sigqueue to qemu_sigqueue
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-14-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9528e873-42b9-c2c6-9fc2-bdb39c1e147a@linaro.org>
Date: Thu, 23 Sep 2021 11:09:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922061438.27645-14-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 11:14 PM, Warner Losh wrote:
> To avoid a name clash with FreeBSD's sigqueue data structure in
> signalvar.h, rename sigqueue to qemu_sigqueue. This sturcture
> is currently defined, but unused.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/qemu.h | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

