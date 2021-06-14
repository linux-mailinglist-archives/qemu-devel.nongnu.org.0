Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D0F3A63F1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 13:18:01 +0200 (CEST)
Received: from localhost ([::1]:53378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lskbQ-0002fi-Nd
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 07:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lskZr-0001Xr-TS
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:16:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lskXu-000252-KX
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:16:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623669262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b12vMm9EL9U7hzalCPP4gmxU5jc5v83J0g+aoMK1R0U=;
 b=B5s0V7bvpdOTvRfZo28jC9TMuEt/n3W3lGi1ypW6e71eiaQJSG00xHKVx2eBcJ9XFuTZzi
 lHj/IrmF0dETzsnwWAZ9ablFPhsmdGgGMmMtc4X0+VpjfHQjdat1dvSmQsAcLRRhaDmyIy
 j150ZlNs88ivZV0+eRvFpgXZc1kD3aM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-UNczmQL0MpupLmlsUGEE0g-1; Mon, 14 Jun 2021 07:14:20 -0400
X-MC-Unique: UNczmQL0MpupLmlsUGEE0g-1
Received: by mail-ed1-f71.google.com with SMTP id
 z16-20020aa7d4100000b029038feb83da57so20005375edq.4
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 04:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b12vMm9EL9U7hzalCPP4gmxU5jc5v83J0g+aoMK1R0U=;
 b=q8fA2m2Ot6Zcx/r5cfCbwqslI7mEsqSepOB6UHBK2DAIxo7OL+IcqUiODPGRP89KUc
 IKONbtzMUSWV5iBSWo0hjM9jOgR903OvD//cSqq01xeOXqwEVS6K9wGiyU27KLejnLZ1
 ZSpHQMXd/JvOgN191KGSftJyW9YPQOblPYgm8RslyFaGDvkxB9Mlf/O0yhhSJlStaPjO
 v4CYHDL14FX7EwwYMKxh76cC9HVcn6SHAIsMh6TA+zsRQaUJn8rHnJP/+bSRTlhz3j61
 CF1kA5wSO+p2enlUEjjHo0nwiTefLF1I4kpXONvF8ZMM96OJLzvfRugVNbRnsdcYe7og
 T1VQ==
X-Gm-Message-State: AOAM532W1xwped4mNYePH7LDnEPGqqKGgSJ6fkXXYbtvyuy/umUDFWcO
 Jh9UTUTSCuDn9SqEN0IZh1CrBJCgv7TygKyZ2IxSoTkrWvRsnb3ojNIOLtE/lL7YTx8eNu62YLu
 X7mNcQgMi1AzfmC4=
X-Received: by 2002:a17:906:2752:: with SMTP id
 a18mr10090172ejd.458.1623669259577; 
 Mon, 14 Jun 2021 04:14:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdLAXrd7iQZuf4ZMBa7fYHDuCWibx8JV98YBQiaySz4McfirQ9p/yk1IqulMEDklUFdTUnVg==
X-Received: by 2002:a17:906:2752:: with SMTP id
 a18mr10090149ejd.458.1623669259381; 
 Mon, 14 Jun 2021 04:14:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cw10sm7159746ejb.62.2021.06.14.04.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 04:14:18 -0700 (PDT)
Subject: Re: [PATCH 6/8] include/qemu/lockable: Use _Generic instead of
 QEMU_GENERIC
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210611233347.653129-1-richard.henderson@linaro.org>
 <20210611233347.653129-7-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7a2d107e-40f0-f1aa-fb38-f1c4f7a9186b@redhat.com>
Date: Mon, 14 Jun 2021 13:14:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210611233347.653129-7-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: thuth@redhat.com, ehabkost@redhat.com,
 Richard Henderson <richard.henderson@liaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/06/21 01:33, Richard Henderson wrote:
> -                 unknown_lock_type))
> +/* Auxiliary macros to simplify QEMU_MAKE_LOCABLE.  */
> +#define QEMU_LOCK_FUNC(x) ((QemuLockUnlockFunc *)      \
> +    _Generic((x), QemuMutex *: qemu_mutex_lock,        \
> +                  QemuRecMutex *: qemu_rec_mutex_lock, \
> +                  CoMutex *: qemu_co_mutex_lock,       \
> +                  QemuSpin *: qemu_spin_lock))
> +
> +#define QEMU_UNLOCK_FUNC(x) ((QemuLockUnlockFunc *)      \
> +    _Generic((x), QemuMutex *: qemu_mutex_unlock,        \
> +                  QemuRecMutex *: qemu_rec_mutex_unlock, \
> +                  CoMutex *: qemu_co_mutex_unlock,       \
> +                  QemuSpin *: qemu_spin_unlock))
>   

These are not needed anymore, are they?

Otherwise I agree that it's both more and less complicated.  The 
duplication between QEMU_MAKE_LOCKABLE_NONNULL and QEMU_MAKE_LOCKABLE is 
tolerable.

Thanks,

Paolo


