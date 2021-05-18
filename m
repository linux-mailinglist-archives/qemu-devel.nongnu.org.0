Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7163875F3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:03:41 +0200 (CEST)
Received: from localhost ([::1]:55416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwZg-0001cC-35
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwVz-00068D-PZ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:59:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwVx-0002k0-PD
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621331988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DsS+2WAHp8gnPWu56TkbwvPQkpvOnmkH/E4UIg+5mu0=;
 b=ZsxnkUFdFD+XP5WtEjuMNFw+c6SANTzFrZYCY7CqUJi3H5lFRNPXp40K8nFq4orKseCSe5
 fF3tqQepSGz8GJd1gV6B76d6ScQFRi4Zyx8+j0P3Q3gcVWcR6mS4CItLm1rVtn/L7MLWZS
 4o9pMrsD+EYE05lAP7/Qb1M2Bf8GIKU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-26hV4YdFNRWKMVM5ltqThA-1; Tue, 18 May 2021 05:59:45 -0400
X-MC-Unique: 26hV4YdFNRWKMVM5ltqThA-1
Received: by mail-ed1-f72.google.com with SMTP id
 h16-20020a0564020950b029038cbdae8cbaso5439560edz.6
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DsS+2WAHp8gnPWu56TkbwvPQkpvOnmkH/E4UIg+5mu0=;
 b=C99IlLPogEVXRoQFTzD+/J/qOmS2MFUCHU/Wh+N2SfPxjqWS3GzSPXbVUqNgo71HEN
 umm8TZZnLYM5qmD8VCH0l/RWhfJt5k+uPrT15RGhzarmN2KqoAO1TggAUK3LV+2BYJEe
 TfJ2mXSw6tbFRAPj4ibFQRR/hGzRgWz38EnecLrOjPWtxhJ2Mzsjmmrx+xn2e6LLjD3i
 2/Mn5RNmUwIgQfraEIkAPx3uUF1f4bREU5BjbLuT2fwws72NKPSH2pIY7FZcXXmoQtr/
 DDqO/gSOePZzCzU1QAiM6kFRMBsxVIC2w2LUPtusrFZPxuj1LzAbu2PKyp20VSOeMWCd
 p9zw==
X-Gm-Message-State: AOAM533rf/Nn3bRtc4HzPueSqlfpKnsuXoPfR3Vzu3HbEa2HVPTYIEjN
 SdV38jKlOpSOgcLetEaHsSdaph7pEn7J6b3ERBjS/Rcyba3WOl1jyE/Zszi/1se3Hgj2rEmqMCm
 3vKo+VYHOqK51rOo=
X-Received: by 2002:a05:6402:22c9:: with SMTP id
 dm9mr6092210edb.281.1621331984204; 
 Tue, 18 May 2021 02:59:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0mFzaJJgSYZe9DyB5D/aGU3sPh2VSF9mWoaWmRgCPibbrx7Lnetq3g7lm/Uehlz33oFihaQ==
X-Received: by 2002:a05:6402:22c9:: with SMTP id
 dm9mr6092202edb.281.1621331984087; 
 Tue, 18 May 2021 02:59:44 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ju17sm10118551ejc.72.2021.05.18.02.59.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:59:43 -0700 (PDT)
Subject: Re: [PATCH v2 40/50] target/i386: Pass env to do_pause and do_hlt
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-41-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8d53ac46-433f-91bf-aec0-b9f057579a5c@redhat.com>
Date: Tue, 18 May 2021 11:59:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-41-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
> Having the callers upcast to X86CPU is a waste, since we
> don't need it.  We even have to recover env in do_hlt.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/misc_helper.c | 22 ++++++++--------------
>   1 file changed, 8 insertions(+), 14 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


