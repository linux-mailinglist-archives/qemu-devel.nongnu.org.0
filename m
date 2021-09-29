Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C019541CB11
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 19:26:13 +0200 (CEST)
Received: from localhost ([::1]:40018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVdLQ-0005bg-Fr
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 13:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVdCk-0000kJ-SA
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 13:17:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVdCd-0000nX-F1
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 13:17:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632935825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tXl1kQCNkG/v/fivU3bysYAOlRNlRRlEE6VbQAcwtXE=;
 b=efnb4AQ2iethz/y4tDS5yImE9e06QgkgGtU78cKiRFY+myr8GgNujbDKKuxSGCDOnAh864
 //ya4R7HmdW4jh+xoWMu3v04p4L8bJzq7pbCSBkZWXHK3lTJNwoR+px7SMSHF7xMWB19m2
 FJIdejiC7ioTIE9P+0kOZazHpxMmi0U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-Wtsd4XKoNiCvRUOK3_s7zQ-1; Wed, 29 Sep 2021 13:17:04 -0400
X-MC-Unique: Wtsd4XKoNiCvRUOK3_s7zQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 p4-20020adfe604000000b0016074dc4c46so868154wrm.2
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 10:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tXl1kQCNkG/v/fivU3bysYAOlRNlRRlEE6VbQAcwtXE=;
 b=CjHb5vcx7BRclfcbWI/8GEmytJk6JVvzFXIOQ6UMR/NsMYgzZxXr4QYuR3c+v6OhG9
 C+XG/jCvoemzk9bmebkADflYKcPZuLKXcCxNQAIXTW8bOsegKeycN+1pxCwKx9u4D5yM
 GzCwOmkifpnHgVvGzGcfnjlHIrB3voeZiziJABWe4Fo6SaKGrNgPO9ssRMxCPF7ekyqO
 mki3ivcmUUGkSm/gL/e8cvAHSe1K91rCaZjMh7TBqNisOC7tEGFTHtN78Z+CtMe5KfWW
 PXoiKQgermCJXBXvaS2DPPS++3Bgn+Zmmftx5KAjc+ZzndLNVYbWaZHrWfWes4eOCmZK
 XMVg==
X-Gm-Message-State: AOAM5318oMPpG6KNLYmcQIiBaM0mi6Mt2glrqmvs/TzlIUnpTClE1zEn
 S0NkZ63Sdye1fwZBDrQZPTYNJdEfvfZfvgs95Jpd9hJX8xwLZ4nXPXIMRewcUMCelXAhY0PW3NF
 fncoqmcSLjr3KExw=
X-Received: by 2002:adf:d1c8:: with SMTP id b8mr1305758wrd.104.1632935823392; 
 Wed, 29 Sep 2021 10:17:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqG7BZki2NKK4+IQbo8mu6gcNkuwFAjk7tP/I7GbBu0CJ50wHo/Vcm3ppeRMOwjjeXO7NzTQ==
X-Received: by 2002:adf:d1c8:: with SMTP id b8mr1305744wrd.104.1632935823251; 
 Wed, 29 Sep 2021 10:17:03 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id w14sm499983wro.8.2021.09.29.10.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 10:17:02 -0700 (PDT)
Message-ID: <ede6f363-5df8-ede9-3932-7a3456163784@redhat.com>
Date: Wed, 29 Sep 2021 19:17:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] configure, meson: move CPU_CFLAGS out of QEMU_CFLAGS
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210929151850.65349-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210929151850.65349-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.03, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/21 17:18, Paolo Bonzini wrote:
> Flags that choose the target architecture, such as -m32 on x86, affect
> all invocations of the compiler driver, for example including options
> such as --print-search-dirs.  To ensure that they are treated as such,
> place them in the cross file in the [binaries] section instead of
> including them in QEMU_CFLAGS.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


