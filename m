Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAB052A5A9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 17:08:45 +0200 (CEST)
Received: from localhost ([::1]:44400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyoW-0007eM-Kk
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 11:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyDr-0007VW-IO; Tue, 17 May 2022 10:30:51 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyDp-0008V2-7I; Tue, 17 May 2022 10:30:50 -0400
Received: by mail-ed1-x535.google.com with SMTP id g12so7344698edq.4;
 Tue, 17 May 2022 07:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xYqesNoWxAxq1C1IQKncfkXfg2VHP1KWoTqEuMibGIs=;
 b=KAJT0q7BFIeiYfrGzNxg5hisDX7tfB51lHrqybTFJUe0ZStUuHpuZeHEg6NcWeJIKB
 fJyXOLUqCzRvcVP+bBoOspxRKaHdEV8ZIAmyA9WZRjRFggQ7raiGV59ea3X1mGXtGbcg
 88sVVsovWsaS6RAzXwo75D9j4KmKDOfaHhxrkvihSQ6IwqFCCw410VeqZlZNLq8yvpqB
 lNJeVTZEPZZw0bXhi0nXpG8fKxwshCddYZE9VBu4rn7tJffHVK92HSqJzxYwRxraSAUR
 cIeduPwpzHA6LdSkrmYNx8DHqAk1bQe+GAShyKK1ImmeccxLQq5MrGxJeL4kedFauvnU
 eiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xYqesNoWxAxq1C1IQKncfkXfg2VHP1KWoTqEuMibGIs=;
 b=7r11JkPl8JypUmjKiqqbnQiLt8wH6G7NW2GhSRx05Yk+wxdIr9qaNK236efl5NJDNc
 KONOUjJgETf8CrT7KXVlZtu5MeW+xwXIUEzpblo2/wN9UPU9JGC6bgfg1G8H8X4IC49r
 jNpdTTosXOA3XA3RRwdJZD85l70Fd8SBD9oPDp6pwH+lXmA8uIj1H1ZXc64jAmX+fSBw
 /PiYVGjiTeRmntwIQ6JSQxBd55M8r5FNP+MJgn+oP7l/IVvOYjbJCskRE73LNQ6oKjhc
 2MkRx3mFBM8tUZV63ccR66M3BZQNuYV0TxJ42wa4FIUxdOln+G2oBnQdQOzVcSnI5KZY
 whfA==
X-Gm-Message-State: AOAM532skEO6TGXuG02b7VeTFBrNnTJuUDg+p/+bVX3X0r/QULuqAJ2e
 xIxlXGTscJlJGmXIiPjR8YY=
X-Google-Smtp-Source: ABdhPJwgq/Uq1QLK9ofrvryG3aQGLDBhcfAdMh3APvkNF20oo0Wxh+Cn1LZ6KB0SBzd1grNY54krUA==
X-Received: by 2002:aa7:d6d0:0:b0:42a:a617:7664 with SMTP id
 x16-20020aa7d6d0000000b0042aa6177664mr15674056edr.161.1652797847587; 
 Tue, 17 May 2022 07:30:47 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 28-20020a170906005c00b006f3ef214e79sm1109346ejg.223.2022.05.17.07.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:30:47 -0700 (PDT)
Message-ID: <96965cd6-2fd8-25b6-3018-f7c5bfc37828@redhat.com>
Date: Tue, 17 May 2022 16:30:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 09/18] block: Export blk_pwritev_part() in
 block-backend-io.h
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113837.199696-5-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517113837.199696-5-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/22 13:38, Alberto Faria wrote:
> Also convert it into a generated_co_wrapper.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             | 14 --------------
>   block/coroutines.h                |  5 -----
>   include/sysemu/block-backend-io.h |  4 ++++
>   tests/unit/test-block-iothread.c  | 19 +++++++++++++++++++
>   4 files changed, 23 insertions(+), 19 deletions(-)


Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

