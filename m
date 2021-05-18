Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F8938766F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:27:02 +0200 (CEST)
Received: from localhost ([::1]:55738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwwH-0007ps-M9
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwWN-0006WT-Kq
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:00:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwWK-0002xu-FV
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TN/P/FdST3zv5HfFdslQN9c1bhouwBfygrOPRXg7qgE=;
 b=bnGIuvedW1iVjL7AyMQU/TjCgiZjnJm7/xGH5ZCYOMCEHKYsqrg/dZN7m+04n3p8x2GT+T
 2maEmYku4I5pLLYQHmXgD8Pxg04D0C9mCsRzUTGez6zZSYXig3npe5N3NJP9dZmxLKI1UL
 Aqz8yxb/qN47SzFjz8CGr8+D8jGng3Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-dudnISkQOda9Jp-qDbaAUQ-1; Tue, 18 May 2021 06:00:10 -0400
X-MC-Unique: dudnISkQOda9Jp-qDbaAUQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 r19-20020a05640251d3b02903888eb31cafso5468942edd.13
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TN/P/FdST3zv5HfFdslQN9c1bhouwBfygrOPRXg7qgE=;
 b=CtOwLY6aE1zzOPOl/8QcnEoU0JjaRYl7VOEXWW6NAePN464aD/clIJM07e3aPYA59u
 kgVz4OS3ozWwKyxmt2/v8hr9RYvPGVLOt/PbPioM+5ejSc1S5xl3KZI4WHfeuHqLn4dG
 TPvdWX6XpTEnKWt75uwyyAa3ZLy6TRv6dMwOJiTtauZ8TJVzXdGMaCJZna2ELelRMw4J
 dMoZA/GIheka37nlkMXSHOTXQ6DdPdmL1cHz+zsYyDle0wnSMMG3q9N/CWjX6UFiMqIk
 Z6WCBwRengM9+F6KVKjJPKDa/bX7F93K6WijLCE0FsBdyv2SPcJwULdlosq8cRWzk7jU
 Yz5Q==
X-Gm-Message-State: AOAM531aZZztketq7SkI6U4u/fbykWyEiiqiMz0GMRS6HVTVEKfOsYKn
 RXpSKkifuweF1i1U4YCTTPgx2LLmOFH13l/OlUA6K9HHWio4+XcX+Fe0nrVvC2wPiRwkVFt5SKU
 6hbyTZEa2NLEwQns=
X-Received: by 2002:a17:906:c352:: with SMTP id
 ci18mr5088090ejb.149.1621332009244; 
 Tue, 18 May 2021 03:00:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLFdZMMRxbL+d5eCXlvJLio0j0XbhCTVWO+G2A8KVfVuNPhLzAuWpBq97blSWpdHz3ugOmGA==
X-Received: by 2002:a17:906:c352:: with SMTP id
 ci18mr5088081ejb.149.1621332009115; 
 Tue, 18 May 2021 03:00:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d5sm12775383edt.49.2021.05.18.03.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:00:08 -0700 (PDT)
Subject: Re: [PATCH v2 41/50] target/i386: Move invlpg, hlt, monitor, mwait to
 sysemu
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-42-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8cc4c6c3-4b3d-608e-3696-34593318014f@redhat.com>
Date: Tue, 18 May 2021 12:00:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-42-richard.henderson@linaro.org>
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
> These instructions are all privileged.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/helper.h                 |  8 ++--
>   target/i386/tcg/helper-tcg.h         |  1 +
>   target/i386/tcg/misc_helper.c        | 55 +---------------------------
>   target/i386/tcg/sysemu/misc_helper.c | 53 +++++++++++++++++++++++++++
>   target/i386/tcg/translate.c          |  4 ++
>   5 files changed, 63 insertions(+), 58 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


