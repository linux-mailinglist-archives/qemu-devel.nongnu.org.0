Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6985A1097
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 14:34:03 +0200 (CEST)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRC3e-0001GC-Bv
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 08:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRByX-0005XO-6J
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:28:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRByR-0006Iv-9L
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:28:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661430518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0v72m8WcuAUvi42YdeeZKCgcJy4h94TZHjM80WtqYao=;
 b=EzsM4PTG3tDLhelP4Rgu3XVY4AzS/Y4dL8eMSLhXXd75cEYtWcaO3aM/jRkTw6kYsYiT97
 xr5gCOhEKv3swyXJwfC3PuMf4+gVuhWouOQOMmcLZPXiSz+0m/t8T5iCly2MekOLCyqHY9
 XhR+0Hxo9b5vY2ByprJ2mdM7oZRsPbw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-214-rS4BWj-IN06TqN21gHpVRg-1; Thu, 25 Aug 2022 08:28:37 -0400
X-MC-Unique: rS4BWj-IN06TqN21gHpVRg-1
Received: by mail-wr1-f72.google.com with SMTP id
 i29-20020adfa51d000000b002251fd0ff14so3346132wrb.16
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 05:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=0v72m8WcuAUvi42YdeeZKCgcJy4h94TZHjM80WtqYao=;
 b=dUKP8yrnIrrS3DgzDdV//JqcWA08hnxX1TLqp/kY5R8BO7XTuiU07fUiFXIECSsPnW
 L9IEvXoIbzekS91QV784b6Nld3ftzZ7/ylq0dH4IWykaqkJKsHqblAcr+CydAHSYzn7F
 vo5KqzRS8kH8FkWdDEq+/0V6J7yrUsW5FeQXK8J6eQgBjNPB5rZrvMHXSCrd9xAmUn2Z
 Sb/65zPuF1VbNwiUS1XJ8v1kZUQGKUl5891toCL9wuxIhPtYUwezKovqQ52XqJzU/I/e
 4dZZpE3kyW+PL5jbHigkv0zzhcY2A3VZHbnrvx9kTlNo9B4pQ0lSZD3DOUskDMcZpLSp
 2GxA==
X-Gm-Message-State: ACgBeo37YHqK4rInPVYzDlIczE8gnoozWV4NDJEe/4vPblMc5UogbDFF
 us/i1WM9fyFJI1THF+BNM/ivjNsQkpkq6ycnMa8Aj133YYvLWZAgQKJoCzkjtPiectkNWe8AfoS
 p4AFIP4RL+cBG7V4=
X-Received: by 2002:a1c:7916:0:b0:3a6:3540:5b3c with SMTP id
 l22-20020a1c7916000000b003a635405b3cmr2140121wme.178.1661430515892; 
 Thu, 25 Aug 2022 05:28:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4PXFcraJFLrd77HaClz8HMceB0Wk/Yq3F5bbvCVpj8EvjARP8pXWR3g7AkUHJYxBK/QXKR9A==
X-Received: by 2002:a1c:7916:0:b0:3a6:3540:5b3c with SMTP id
 l22-20020a1c7916000000b003a635405b3cmr2140106wme.178.1661430515664; 
 Thu, 25 Aug 2022 05:28:35 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 d1-20020adfe881000000b0022063e5228bsm20071191wrm.93.2022.08.25.05.28.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 05:28:35 -0700 (PDT)
Message-ID: <6033ba91-e211-616b-1759-e7207c22721e@redhat.com>
Date: Thu, 25 Aug 2022 14:28:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 38/51] tests/qtest: {ahci,ide}-test: Open file in binary
 mode
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-39-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-39-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/08/2022 11.40, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> By default Windows opens file in text mode, while a POSIX compliant
> implementation treats text files and binary files the same.
> 
> The fopen() 'mode' string can include the letter 'b' to indicate
> binary mode shall be used. POSIX spec says the character 'b' shall
> have no effect, but is allowed for ISO C standard conformance.
> Let's add the letter 'b' which works on both POSIX and Windows.
> 
> Similar situation applies to the open() 'flags' where O_BINARY is
> used for binary mode.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/ahci-test.c | 2 +-
>   tests/qtest/ide-test.c  | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
> index bce9ff770c..be11508c75 100644
> --- a/tests/qtest/ahci-test.c
> +++ b/tests/qtest/ahci-test.c
> @@ -1453,7 +1453,7 @@ static int prepare_iso(size_t size, unsigned char **buf, char **name)
>        * Close the file and reopen it.
>        */
>       close(fd);
> -    fd = open(cdrom_path, O_WRONLY);
> +    fd = open(cdrom_path, O_WRONLY | O_BINARY);
>       g_assert(fd != -1);
>   #endif

Could you please squash this hunk into patch 32/51 where you introduced this 
code?

  Thomas


