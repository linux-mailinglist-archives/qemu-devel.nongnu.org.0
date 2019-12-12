Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF1511C4FA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 05:42:47 +0100 (CET)
Received: from localhost ([::1]:54410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifGJK-0007B1-6z
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 23:42:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48962)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ifGIT-0006mP-IM
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 23:41:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ifGIS-0003ac-Jf
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 23:41:53 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34611)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ifGIS-0003YQ-CI
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 23:41:52 -0500
Received: by mail-pg1-x544.google.com with SMTP id r11so491551pgf.1
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 20:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TMZ0jDyFGMuzuCun35FlQjcRk8vnwVUTT98KZNlN13M=;
 b=rIC3UGOvk9L2dFuquPAhkVi0JGGUefnwwMeATGvEcJT9T9T0Ao/kbJWcrGIS3HG64H
 z6FPG4zIdt8ULJz/sD5A5B6ifRVIY2XburA/bFv9i3stuC3NtBD3qJm9lEgN5JYJqMZU
 XDSbUbHPhs+VTkW3zlTPBTera4He3/UqM7dOE6Ck0HL+wRZ7U0/hf1Cioz4kXANyTPqh
 JA11thxmywFY96WnRpL18925n1P6u/QduKAJ9nnjm1aSNIc7RbLg6SDrLK8+wDJOhTpx
 rj+/by9AKOGeibcBFqPzA94dPftUfTETF3AeReKNooSF+fdxo+hNOVIBqkWaWHsKgCu0
 VOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TMZ0jDyFGMuzuCun35FlQjcRk8vnwVUTT98KZNlN13M=;
 b=JDokP0SI2NA29Mdrqrw3Y5hJt8tIOvtPjvN+ylJPy9QrNmJJZY548bzQMqKtw4ydWG
 WqhD8Nw5K/PdiW8O/21JjUcyfVtHrzPDNHzGCShU9WvK9WKuSrydF8ULAXbznrtdNmao
 xoVreaTlaLr6YcsFGxG4dHraGB273FMBdQygoOQa4wCs8uZBfZhwoXx9ZI1rUQNRHRE0
 IjsYN8EVNsTN3hUe0zva+4hDFX/tEamBpTyEYM3Vtklp3S2fLbsvt8rLV30usGes98Ve
 O0D2GoLfUYxNfS76QEQnS8a+NXeJqsOo0zFSqCbDNzwyV+G29wMYXxY575+hTpY5YlGH
 BT4w==
X-Gm-Message-State: APjAAAWlk2+L2/3Xx1hs4gBB9BrDOJVGOuhlRNJbeU5AeVrrfck+mH/o
 ch++uQGy1DpuRA5caBVR7PjMkQ==
X-Google-Smtp-Source: APXvYqwK6/C7GUruSSPXAiesSBseeFs/8Mu2J3mL+fJ8sDvqVh+HY5vX+pLmTsjNeg4OhLLvK3mpQQ==
X-Received: by 2002:aa7:870c:: with SMTP id b12mr7866804pfo.82.1576125711350; 
 Wed, 11 Dec 2019 20:41:51 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id e6sm4945379pfh.32.2019.12.11.20.41.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 20:41:50 -0800 (PST)
Subject: Re: [PATCH v2 02/18] vl: move icount configuration earlier
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1575903705-12925-1-git-send-email-pbonzini@redhat.com>
 <1575903705-12925-3-git-send-email-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9b07e930-97cc-544c-d72e-22c5503bce0c@linaro.org>
Date: Wed, 11 Dec 2019 20:41:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1575903705-12925-3-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: thuth@redhat.com, elmarco@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/19 7:01 AM, Paolo Bonzini wrote:
> Once qemu_tcg_configure is turned into a QOM property setter, it will not
> be able to set a default value for mttcg_enabled.  Setting the default will
> move to the TCG instance_init function, which currently runs before "-icount"
> is processed.
> 
> However, it is harmless to do configure_icount for all accelerators; we will
> just fail later if a non-TCG accelerator is selected.  So do that.
> 
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  vl.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

