Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07812693F4C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 09:04:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRTo2-00012R-3Q; Mon, 13 Feb 2023 03:03:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRTnz-00011o-5z
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:03:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRTnx-0000mz-I0
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:03:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676275396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSitCtNhmp5AtYUbGOXfqv/6Iaoyb77s5SuNMIJ2sXg=;
 b=NsUqfAraGiEyvt/niE6/jcbJJ+sZxfrf38WnX0+T1O6Nx6BeE99g0/onIx4i9PYOqo9ZGD
 EV0ThB0zAk97jB87Wa8D9pgPMhYvrbZIuk9OmbHcWsqUxjWaDMQWjSMEf2Fvt3l247fizJ
 0/MXsTERh2AXZDMqE/A1Z/cWF9ozvJs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-YUmzQ0-5OheL02dlImj8cA-1; Mon, 13 Feb 2023 03:03:11 -0500
X-MC-Unique: YUmzQ0-5OheL02dlImj8cA-1
Received: by mail-qk1-f197.google.com with SMTP id
 bp30-20020a05620a459e00b00738e1fe2470so7098006qkb.23
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 00:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aSitCtNhmp5AtYUbGOXfqv/6Iaoyb77s5SuNMIJ2sXg=;
 b=RYGl5TNlOqRTKWFiiNHrxuVOkO1EJJz9LXzCzddPdl41jOJKgna78RSd5Uoufk1kGs
 4tCTNjQvQJN3RmDjnbRtcp5+B+leqgddkebU8Y6+phS7/YZfqmTneR31RjNnrjuA0/4q
 JkkAmwkSNhJOi+d2Z3w4dO4bQRhF9I5f/PGjUs2ZSWJeXgshWyqBq75y7e9V36ajvtJW
 mGefjP/QFVhlTfXqNoazycuxs2FJpwvCLQIFZv1/4D2Ma4SGMIJwCfj0rGnSeFP5f96w
 kawF+1L10fST+obeYaoZ2t+uUUWIliTGrnVKYRGU6c/wAFaImz4UoST8er76JrAGQA7t
 jArw==
X-Gm-Message-State: AO0yUKXyPywHap+3RyMbsmXTGr9+leo0mZcWulvLnL0d6EZEb79tqM2N
 PMGZ2VOe/DXQUvDjsAJgcM3HOBKH8fhM+iTzPtMsLLwdvsQpo+j/dqpap7CewBhhCoUBWpx5Xo/
 8sk15MryYRYJvMVo=
X-Received: by 2002:a05:6214:765:b0:56c:20e1:2669 with SMTP id
 f5-20020a056214076500b0056c20e12669mr27027903qvz.42.1676275390701; 
 Mon, 13 Feb 2023 00:03:10 -0800 (PST)
X-Google-Smtp-Source: AK7set9f1ojCDnItoOuD7SA/2zBJYjeZkv4mCMNlVymmvi5x9UQ5RD+S7YebOzIqD1IeD5G7QhNcdA==
X-Received: by 2002:a05:6214:765:b0:56c:20e1:2669 with SMTP id
 f5-20020a056214076500b0056c20e12669mr27027881qvz.42.1676275390477; 
 Mon, 13 Feb 2023 00:03:10 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-185.web.vodafone.de.
 [109.43.177.185]) by smtp.gmail.com with ESMTPSA id
 69-20020a370a48000000b0071b158849e5sm9330793qkk.46.2023.02.13.00.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 00:03:09 -0800 (PST)
Message-ID: <6e4c4982-4865-8237-0dd1-a187d0ab757a@redhat.com>
Date: Mon, 13 Feb 2023 09:03:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/4] tests: use closesocket()
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
 <20230212204942.1905959-2-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230212204942.1905959-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.348, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/02/2023 21.49, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Because they are actually sockets...
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/unit/socket-helpers.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/unit/socket-helpers.c b/tests/unit/socket-helpers.c
> index eecadf3a3c..914b3aa0cf 100644
> --- a/tests/unit/socket-helpers.c
> +++ b/tests/unit/socket-helpers.c
> @@ -117,13 +117,13 @@ static int socket_can_bind_connect(const char *hostname, int family)
>   
>    cleanup:
>       if (afd != -1) {
> -        close(afd);
> +        closesocket(afd);
>       }
>       if (cfd != -1) {
> -        close(cfd);
> +        closesocket(cfd);
>       }
>       if (lfd != -1) {
> -        close(lfd);
> +        closesocket(lfd);
>       }
>       if (res) {
>           freeaddrinfo(res);

Reviewed-by: Thomas Huth <thuth@redhat.com>


