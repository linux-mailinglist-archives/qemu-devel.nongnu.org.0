Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4804E3876FD
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:57:02 +0200 (CEST)
Received: from localhost ([::1]:43832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixPJ-0000Ta-4H
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwqi-0008Dv-0H
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:21:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwqe-0006S5-VH
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621333272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tj+u2F9QbnCSRp6Gw0eghYDf2rElEwbqZ/nRteRr8Ss=;
 b=RRpBUOyGFtLkq0gst8sYrWspRm0Oc4SCM0x8+lmAP+y7YRshPx41LadeYkZKXLklSdvZnf
 ZYcabPa4xPJy1iBcyjQeEr/RWT1c/BHy9KGNSqPQe+i0GE8N17EKuMPytIPODwkRQjr6Lq
 icRPBLmXhYPu2UMhqeEST8laZPFMglQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-JHNfLSTSMsGOceO36UHOAg-1; Tue, 18 May 2021 06:21:09 -0400
X-MC-Unique: JHNfLSTSMsGOceO36UHOAg-1
Received: by mail-ej1-f71.google.com with SMTP id
 c11-20020a170906170bb02903bbefa04cd1so2207122eje.8
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tj+u2F9QbnCSRp6Gw0eghYDf2rElEwbqZ/nRteRr8Ss=;
 b=Hu6FFvHICStoqBxtF93Pv66XGZ+vyNS5myc6h271LKsLLflxP0GdkRl0T7OQfkrbmV
 iACkxUMzrgQKlwNlaDe9O7p11jtjm8C9HwSuoLz9nS6DUdShRVhYAIujMS8tZ0XbI0+S
 jdo5/SvIBEeZBst6GKob6T8dvk6eX8l//Cz5qC464ad4jjILXHIJpY5IDrV3VGtFaX2S
 h2lTpiorQBbXKW2o5rBi9xeNFnJVPpVw4GfWf7Kb1GLwfPV06lZdNvuLD38JFwVIrnii
 Rzg5Ji3m+e1yhtfj9NXt/baUF/WSHCzOZLxBcZTwZUSZ0QTX69siMcWZHVOEe9gUkIIm
 L3jA==
X-Gm-Message-State: AOAM531ifPIvwxOSkNJUIc6t6xP6MJvlgyfk+INRbvEkbz4gS8FUvYKF
 pG++nLjiS3nsKZzGCkBcpnatAyDdm8TcCRJj4CaHluDYBBDKQL/IGhYy8LMWshVFscYa7+0ENH5
 KSL4WJ7Y03K/Z4xk=
X-Received: by 2002:a17:907:37b:: with SMTP id
 rs27mr5363662ejb.287.1621333268355; 
 Tue, 18 May 2021 03:21:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIDzCDOg1xDT04bYZLm0MOoKMviBlvoSlk1gYDtntMdwYY4orDiDtzYISM7I/Hq7CYXuk/zQ==
X-Received: by 2002:a17:907:37b:: with SMTP id
 rs27mr5363651ejb.287.1621333268205; 
 Tue, 18 May 2021 03:21:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y23sm4262807eds.60.2021.05.18.03.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:21:07 -0700 (PDT)
Subject: Re: [PATCH v2 48/50] target/i386: Create helper_check_io
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-49-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cef8d17b-a81f-8f42-a109-d9483a22415a@redhat.com>
Date: Tue, 18 May 2021 12:21:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-49-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
> Drop helper_check_io[bwl] and expose their common
> subroutine to tcg directly.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/helper.h         |  4 +---
>   target/i386/tcg/seg_helper.c | 21 +++------------------
>   target/i386/tcg/translate.c  | 14 +-------------
>   3 files changed, 5 insertions(+), 34 deletions(-)


Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


