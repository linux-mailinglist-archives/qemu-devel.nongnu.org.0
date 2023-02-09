Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7856901D7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 09:09:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ1ym-0003r7-Oc; Thu, 09 Feb 2023 03:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ1yk-0003qa-Tk
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:08:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ1yj-0008TR-Fm
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675930104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3zJYWli+gCH5XtfHWYg4O8/ODgX1N9zx8H0WiJjT8nc=;
 b=TpUQ+XjRN6tyG1UheHsiBCOE6A8XWq1JdSD5AwP1F2BN5js1OdybZjnSFd2b/NDqs0qpXO
 eqVGrAvSuFlLkIKCLL3JWDNsVPjVO2stQwMGNhsrrMlJeO7/4OdJni4kPpWEVv3EMcn+jg
 8T7V+MpdnHRy0LdNaSd4jJ77pgkFkIk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-660-G78jwPb8N-Wd5DPEjU6J4g-1; Thu, 09 Feb 2023 03:08:23 -0500
X-MC-Unique: G78jwPb8N-Wd5DPEjU6J4g-1
Received: by mail-qt1-f197.google.com with SMTP id
 x16-20020ac87ed0000000b003b82d873b38so667668qtj.13
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 00:08:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3zJYWli+gCH5XtfHWYg4O8/ODgX1N9zx8H0WiJjT8nc=;
 b=xf6vYd4GTsVpXXWFIbgXdfsi2mo6W/I8vb5182nlvJVElLRO4LQExnsdISJ9Subg3N
 KaVKGf1VNMuv7+614FLNqe9icc8OUDYz+b0M4nb1AInDMQlAZQ0XrHH5w8N1ffseMg3t
 OtHq71sNwiWicaFXHdLEnOhr/+Uv85qznl+w9MUSb1WsmE65BdEjUuymjbOGRx12Txg/
 hIQl6G07Gi9y1o+4PPnDAfFgl01W6YeWle4FlaXk9bCIwc7KVti4wd5Xqe6UFM7ITQDw
 i1mmRucMot1KtP7SXLQuDazHeqh1TNFZkwXbzDU+1THIveqyEw0zhLIZKRTqzR+RbiuJ
 nhUg==
X-Gm-Message-State: AO0yUKU6TzOgmTy6RLOja4BdZJeNq2d1eQzOOAERqSnylSN70+ZBmFoB
 PBS1a3e4MZf3e71SrQ3wxWI/1uPdmWH9U6uRa6AV796R0VD9aE8+GRxBahx25SR0yyyqEPN0jsX
 /kLipvuX32JTow6A=
X-Received: by 2002:a05:622a:1044:b0:3ba:1696:87cf with SMTP id
 f4-20020a05622a104400b003ba169687cfmr19384191qte.44.1675930102626; 
 Thu, 09 Feb 2023 00:08:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/fC0KEdmuZwIUjz3cedBUjdfilLzgefJdT4gI3bIpyo6tAMnFi50tO1IhYC5xeS40oF1ZVcw==
X-Received: by 2002:a05:622a:1044:b0:3ba:1696:87cf with SMTP id
 f4-20020a05622a104400b003ba169687cfmr19384178qte.44.1675930102447; 
 Thu, 09 Feb 2023 00:08:22 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-209.web.vodafone.de.
 [109.43.176.209]) by smtp.gmail.com with ESMTPSA id
 p73-20020a37424c000000b0072692330190sm876309qka.64.2023.02.09.00.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 00:08:22 -0800 (PST)
Message-ID: <83e17f5a-ff9a-7fbd-417c-b0918368bf4f@redhat.com>
Date: Thu, 9 Feb 2023 09:08:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 06/12] test/qtest: Fix coding style in
 device-plug-test.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230208194700.11035-1-farosas@suse.de>
 <20230208194700.11035-7-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230208194700.11035-7-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 08/02/2023 20.46, Fabiano Rosas wrote:
> We should not mix declarations and statements in QEMU code.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/device-plug-test.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


