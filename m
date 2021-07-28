Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBEB3D99C2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 01:50:37 +0200 (CEST)
Received: from localhost ([::1]:48942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8tJt-0000dY-01
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 19:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8tIR-0008LG-5f
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 19:49:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8tIM-0004pG-B0
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 19:49:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627516141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RjifecxaAJ1sBCtISjKEsx7WtshzrX9+pUjLuVChEuc=;
 b=ihY6ZdLvpmeHUgE71fA4jF/GEq5RLx7Pqlcw8n1nkhgIG2TQ3nChSh/sy5iHNXPPH7H0W6
 /XnYyj1w9eoJXhyDNN4GFik2DIfTz8kAXea/BWXEb6PwkqGU7yDro916P6Mn1UoUYjQoqy
 Cmh21dRQWdMDEdKAdUoA2TskoYvlIrA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-GaBUMWXRPZCXPu6xl6R2IQ-1; Wed, 28 Jul 2021 19:48:59 -0400
X-MC-Unique: GaBUMWXRPZCXPu6xl6R2IQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 n6-20020a5d67c60000b0290153b1422916so1510865wrw.2
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 16:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RjifecxaAJ1sBCtISjKEsx7WtshzrX9+pUjLuVChEuc=;
 b=hf4mZXAuX9e2avR+EHiPuUlXnkPYqteRu1qsWl6qTUXeiVaxwjTl7ZaUmSBZxnIRvJ
 D7hAua9TQWbzWWFbYdC9pqpjkF9tpucWiWdej0WhptvPULD80zoodDa/xEEdz2DqUS39
 pC2vVRVAi6SUAGioN/5DS53fSe7LnkIUJs6oFgY4tyUZ7lCi6DNUqVAtBJfMHcEvTqVG
 G35lDPNxJUeMpq027SNJj4Uh90L7T/pc0BwsNPRAcq6JIbJHUFMkHPDUddaZ26cyMiI4
 YhNC2jgyQWUGFKS+dOP+EzujP2jON0akV/T2RVT0mTzoGt861JnDe2JXbXAEi4+BOMtH
 1FGg==
X-Gm-Message-State: AOAM5328Mw646ZgW/kdkE1lYlHJRk75esAIqjanGsR41Y9VEgde9pfOk
 /0dO+J5oYxL6Z37HytqkibtqBUH2vB49glg+d2FodSMMa2sMOCgxgguyXHHFrqcNbU4tjA95OcY
 gMFbcZ1x62VfP0aA=
X-Received: by 2002:a7b:c0c1:: with SMTP id s1mr1935383wmh.130.1627516138445; 
 Wed, 28 Jul 2021 16:48:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZvhuwl02Cu27Afx7MmiQy2oTe8iUh2G2OfUisYSD2x0S8VUnlYZUtmROCVKGQ/gxSaMRPQw==
X-Received: by 2002:a7b:c0c1:: with SMTP id s1mr1935365wmh.130.1627516138163; 
 Wed, 28 Jul 2021 16:48:58 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id h4sm1326723wru.2.2021.07.28.16.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 16:48:57 -0700 (PDT)
Subject: Re: [PATCH] tests: Fix migration-test build failure for sparc
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210728214128.206198-1-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <145cf8c7-84f3-6743-d1cd-02eba6a613bd@redhat.com>
Date: Thu, 29 Jul 2021 01:48:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728214128.206198-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/21 11:41 PM, Peter Xu wrote:
> Even if <linux/kvm.h> seems to exist for all archs on linux, however including
> it with __linux__ defined seems to be not working yet as it'll try to include
> asm/kvm.h and that can be missing for archs that do not support kvm.
> 
> To fix this (instead of any attempt to fix linux headers..), we can mark the
> header to be x86_64 only, because it's so far only service for adding the kvm
> dirty ring test.
> 
> No need to have "Fixes" as the issue is just introduced very recently.

Personally I find it very useful to navigate in gitk without having
to use git-blame.

Fixes: 1f546b709d6 ("tests: migration-test: Add dirty ring test")
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Reported-by: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  tests/qtest/migration-test.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 1e8b7784ef..cc5e83d98a 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -27,7 +27,8 @@
>  #include "migration-helpers.h"
>  #include "tests/migration/migration-test.h"
>  
> -#if defined(__linux__)
> +/* For dirty ring test; so far only x86_64 is supported */
> +#if defined(__linux__) && defined(HOST_X86_64)
>  #include "linux/kvm.h"
>  #endif
>  
> @@ -1395,7 +1396,7 @@ static void test_multifd_tcp_cancel(void)
>  
>  static bool kvm_dirty_ring_supported(void)
>  {
> -#if defined(__linux__)
> +#if defined(__linux__) && defined(HOST_X86_64)
>      int ret, kvm_fd = open("/dev/kvm", O_RDONLY);
>  
>      if (kvm_fd < 0) {
> 


