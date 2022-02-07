Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65EF4AB4A7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 07:23:59 +0100 (CET)
Received: from localhost ([::1]:41424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGxRO-00065u-5e
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 01:23:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nGxFa-0002aH-Vu
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 01:11:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nGxFW-0005Fw-CD
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 01:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644214299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7xi89ZnhcvtOL1ZBfDcWvRmyB8v8kO2JALHT6IQugTo=;
 b=HDeOqXJBqn0VERFZ90GOe9+Y40UlqnKJJBmw2NKxNGqwuwFozk7YOuBMVlswRT0lsmbg4b
 aouzRzOblwHfkAf/gYkOnzJBDBVaNliyFoto/c19uqhFPT0L44q8aeachulwPVaxDEakas
 p3cu0+EkJZZdN41B4PXys+ZQc1oNuFQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-HUCsmxsmNLW6nPfPbxlmdw-1; Mon, 07 Feb 2022 01:11:38 -0500
X-MC-Unique: HUCsmxsmNLW6nPfPbxlmdw-1
Received: by mail-wr1-f71.google.com with SMTP id
 t14-20020adfa2ce000000b001e1ad2deb3dso4050159wra.0
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 22:11:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7xi89ZnhcvtOL1ZBfDcWvRmyB8v8kO2JALHT6IQugTo=;
 b=tDfQEW5ZZ3TFlAOcrizXjFnL0ZcqlfF5rQCoISm14uYBVAD+G1F4ZEv5fwNf4NYwvC
 igmt/FafCsHrLrMMuTlkZM1Z8As4zwT6NER3+yAVRVZ+5OrkMfLq7+fZJeN3DbxPstN9
 Ave2C/Z0MqCWLTJl4RdSRz9FVdrRWNE4f3pcaLASo7RI3cQXFL3slHbAPOjFlJ6r7PVt
 uZH6nG7K5bZso/rG7B1YooWb1f62Kxbs5OFEHYd+GZzQso1bAIqaliETmovcTiWG9r5N
 uDp2tGZ9OtKrdpoUc4AkZk1Hfyks3LjZ6rRdMwVly1uUJr7H/JeMidmi44cTsyFhzxgw
 lmfw==
X-Gm-Message-State: AOAM531OCt4RaZDiQ0tu6Cnac6FI9frWiDV91ZF18pSqUCmD5zuhxABU
 JelplmW3QSrGkSm5Vm7Cw8JOtvNBNSVIGUIMCIqimX2Ip8wS2j7eFv2YBbRLDHmY3CYJZxCteTp
 dl1kReOsyuuaOnI8=
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr12738500wmc.123.1644214296954; 
 Sun, 06 Feb 2022 22:11:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlY1cD13kvCn996HduilKxyJImZcFTrTF3nVYBVq+j08rL2xF0lFACBq18GgTYAx1XT2Y/lQ==
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr12738485wmc.123.1644214296707; 
 Sun, 06 Feb 2022 22:11:36 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id o10sm4130252wri.69.2022.02.06.22.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 22:11:36 -0800 (PST)
Message-ID: <773614b0-cb96-8d6c-ff0b-a608bfcd9671@redhat.com>
Date: Mon, 7 Feb 2022 07:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] erst: drop cast to long long
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20220206093547.1282513-1-mst@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220206093547.1282513-1-mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric DeVolder <eric.devolder@oracle.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/02/2022 10.35, Michael S. Tsirkin wrote:
> The way to print uint64_t is with PRIx64, not with
> a cast to long long.
> 
> Cc: Eric DeVolder <eric.devolder@oracle.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   tests/qtest/erst-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
> index c6a0ae4013..f94cd8dd8e 100644
> --- a/tests/qtest/erst-test.c
> +++ b/tests/qtest/erst-test.c
> @@ -75,7 +75,7 @@ static inline uint64_t in_reg64(ERSTState *s, unsigned reg)
>       uint64_t res;
>   
>       res = qpci_io_readq(s->dev, s->reg_bar, reg);
> -    g_test_message("*%s -> %016llx", name, (unsigned long long)res);
> +    g_test_message("*%s -> %016" PRIx64, name, res);
>   
>       return res;
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


