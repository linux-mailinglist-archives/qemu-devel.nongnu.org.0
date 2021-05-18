Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B01538753B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:33:52 +0200 (CEST)
Received: from localhost ([::1]:40732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liw6o-0001Cf-I3
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livzO-00072a-GV
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livzL-0006wz-SX
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621329967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAaRqB/ZatgD551TJiRd6ZKVg0Ll6dUlzSe7QLsqdRA=;
 b=JRyNf4yGfEme1d6Mgm7TdEs3ucQwLJZLiqTST7BjUM88/9zn2PqUrctDGFyRPRVBBbuQ1j
 edC4Nxi/XwCnbXNQYSp7w9ICAqpEhhkbpLMLfprZK9fA3SxxtnTnWsG/tEF4t0hl3xlWmw
 nhlxfnWsgXBZA5EU4VZSuLl253TDzXI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-rf1w_eWfNPql4Y8IfnAyVw-1; Tue, 18 May 2021 05:26:05 -0400
X-MC-Unique: rf1w_eWfNPql4Y8IfnAyVw-1
Received: by mail-wm1-f72.google.com with SMTP id
 k124-20020a1ca1820000b0290175dd5429afso348218wme.7
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CAaRqB/ZatgD551TJiRd6ZKVg0Ll6dUlzSe7QLsqdRA=;
 b=Fj/3EUwv8WT2qqkF5nvwQb/HAZA9P5BS9n8Cmn/SBKxFCkdMUsYxYnogEKprG+tUaK
 sreohU5CPGNrWW+g5bcaxVUO1u9Hy2+zGg9/c8hOowT5RPzthKrOxVUgeVpyjbdQnP4W
 dfbDvN2W+V3ek4pJCexQKO13KchH2aQa8L7Vta7jByOTStEEY7gzwni5YQdhenJ7oSET
 oOX5ym75+/PbymerGXnQjIt+BErOTwc/2Gdyers9ziYkVjas7Z+4roJKZv55Hc9+JdyX
 kuZxGVEEPU+IWS81vcAgPpjbIf5SxxCupbnm+jZYMarb6Dk9BmXHMepjuLmQY4kIQrM6
 Cv2Q==
X-Gm-Message-State: AOAM533we4vxfZqFwmsjlPGjVTU7MJ40WBJBNhJGbWieX/wTk0TnHmGb
 vxzOIevcU7s7EFtkoQHbqOY+MhmkTBqVcCqudjwvypGP2ziXy2tgOjHVvkTfooYWxNAG/bYNtld
 9CeiM/ND/e4OdXAc=
X-Received: by 2002:a5d:47a8:: with SMTP id 8mr5693325wrb.124.1621329964216;
 Tue, 18 May 2021 02:26:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8JNmGoRrXvKwWadekhpO79bTrS1JFE26ycYDayrm4/MX9ItMsRc9R/GNfC2S29U3VYsyS6w==
X-Received: by 2002:a5d:47a8:: with SMTP id 8mr5693306wrb.124.1621329964045;
 Tue, 18 May 2021 02:26:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q10sm17405445wmc.31.2021.05.18.02.26.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:26:03 -0700 (PDT)
Subject: Re: [PATCH v2 15/50] target/i386: Introduce REX_PREFIX
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-16-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <205c84c7-081f-2a7f-6bfc-215bc920130e@redhat.com>
Date: Tue, 18 May 2021 11:26:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-16-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> The existing flag, x86_64_hregs, does not accurately describe
> its setting.  It is true if and only if a REX prefix has been
> seen.  Yes, that affects the "h" regs, but that's secondary.
> 
> Add PREFIX_REX and include this bit in s->prefix.  Add REX_PREFIX
> so that the check folds away when x86_64 is compiled out.
> 
> Fold away the reg >= 8 check, because bit 3 of the register
> number comes from the REX prefix in the first place.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 29 +++++++++++------------------
>   1 file changed, 11 insertions(+), 18 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


