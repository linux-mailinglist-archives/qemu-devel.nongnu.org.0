Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F642702691
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 09:59:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyT66-0007Qi-Rl; Mon, 15 May 2023 03:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyT5h-0007Q6-Fq
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:57:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyT5g-0000ZD-1p
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:57:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684137474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FG5aHLUJEn0MDC7rmMDESGi2ifK0622UHnzc7afZX0g=;
 b=cbYmdTGly13BbR0qzEx00JhHnZ7uAC8WMryJjaaQQKsVnzCbv1ts63up3wFdFzWitItr4x
 mB19xQs8PjWsNd7WTE+R4It8cHkfYaaQ95l9TDa4P+lk4fqQQnIe1CXS6ZPbsJzV6ARaZ+
 5Ou1Z/mIJ3gcaVWAXSjiqkobtAbsy9k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-u3GgSzn4M5yZ_YUYYoTHhg-1; Mon, 15 May 2023 03:57:53 -0400
X-MC-Unique: u3GgSzn4M5yZ_YUYYoTHhg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f4fa463282so14410235e9.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 00:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684137472; x=1686729472;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FG5aHLUJEn0MDC7rmMDESGi2ifK0622UHnzc7afZX0g=;
 b=TEHkCwHPfplkoj+lNxQzc56o6aMg01WSfUxW0uAaqFf1Pv5XXkncwo/G+rSDCgpvZO
 ouFH9TM4zxh+t3+JzBUP5w0sBFuUpFt7flaAATnLs5E8R74ZqSrGWqFXGkZanyJeJ00L
 x8vAmP1bTTyn6Oo4GDRXQ0wze8srKyDM0ctKFUCoqdu2LzJk5ZqtD/d1jT9wsdZM7pr6
 460bBv1BhK7CrBe5XxrpOV4VPzKYjbdH258Emd9ASMDUf3dIjTAyS1sDl6ngkCyEQgKx
 fgkOAtKcrYRQ47MvUJpgpOCTku9pv9T6wpEnlHB3RVtlGYqOUU0hjQ8n+DXfpbwlDOAo
 RAnw==
X-Gm-Message-State: AC+VfDzE14KYlSa1ZxWAIxEfJURq4cWwIC9QYuJ3dh+buLz61l41Zjf1
 KCd+snRv/0kcoCdBvl0MG5WHc/wS1QLwXW3ravwfsGfbJtwjCx08N1pWaZVd/5OhJTToKzTI7a7
 bBfPAoq/ZAOf8uWw=
X-Received: by 2002:a05:600c:3658:b0:3f4:2374:3517 with SMTP id
 y24-20020a05600c365800b003f423743517mr17139486wmq.19.1684137472370; 
 Mon, 15 May 2023 00:57:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4FxfhYv4giHftjax/329483Sdu/I+2LkVB7IoX1lTr2c+eAuqjmaaqzicI+wBALj21LDtaHw==
X-Received: by 2002:a05:600c:3658:b0:3f4:2374:3517 with SMTP id
 y24-20020a05600c365800b003f423743517mr17139474wmq.19.1684137472031; 
 Mon, 15 May 2023 00:57:52 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-139.web.vodafone.de.
 [109.43.176.139]) by smtp.gmail.com with ESMTPSA id
 f8-20020a7bc8c8000000b003f4e8530696sm12509317wml.46.2023.05.15.00.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 00:57:51 -0700 (PDT)
Message-ID: <9277a6a5-3984-60bd-b93f-fb37d6222194@redhat.com>
Date: Mon, 15 May 2023 09:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] net: stream: test reconnect option with an unix socket
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230503094109.1198248-1-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503094109.1198248-1-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.93, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03/05/2023 11.41, Laurent Vivier wrote:
> We can have failure with the inet type test because the port address
> is not allocated atomically and can be taken by another test between its
> selection and the start of QEMU. To avoid that, use an unix socket with
> a path that is unique
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   tests/qtest/netdev-socket.c | 39 +++++++++++++++++--------------------
>   1 file changed, 18 insertions(+), 21 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

I'll queue this patch for my next pull request.

  Thomas


