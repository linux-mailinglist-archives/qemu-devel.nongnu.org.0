Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE0052A4BF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:24:13 +0200 (CEST)
Received: from localhost ([::1]:42834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqy7Q-0004yq-EU
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqy4H-0000aU-H8; Tue, 17 May 2022 10:20:58 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqy4C-0006pJ-H9; Tue, 17 May 2022 10:20:53 -0400
Received: by mail-ed1-x52a.google.com with SMTP id n23so7695100edy.0;
 Tue, 17 May 2022 07:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fyS+ig8mLnLPduMr+mVi9xqDT9XyNKb6ZzX2FxkOsf0=;
 b=UqjEXc3k2eLe6F5GBwuRYX62+D2Pj1F8Qqr1nSqXvptHuMGNZvo1Istj/hXjV0RQT7
 QBmoPJMNx8st83m/rQFtfvxkPuzmyWwbGJr7ne/iEXqj/1lpOqJFAX26ceLRl8JTLs2I
 4e8kQQHo5p8SNO+CLYAVDo/45DsllRnhac3Qcwv8U9EZYQkIGrUh7va9fAr3j/mxPNIL
 oFynPRgSnVJNHSVgmd+D5mMYR1vCVTOcrH2OgMHZBbuUdofFc0CrxJ2VQlmtTQ53oTjN
 W1hN2JdOL4qs9hxC4HiULc4pzyxi6GgZPcRkhYwmMUJjHNclrJBpydxF81mAGA7YRt0H
 7m2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fyS+ig8mLnLPduMr+mVi9xqDT9XyNKb6ZzX2FxkOsf0=;
 b=EX84PT/OliTbjQRK5X8UU8VsEQN2+hNpzx8L7bWI17h6wc7ih25FGyU3KvFLj0g6AF
 wnvVGKx4tPaqyrrFdJAO2HJ1jjV9CAsvB88Sl5qAloYrEEGcdpDi4+gxw0IeKlt5ZnDM
 EyrIJvdj/9CTDVcTo5UmE0gdXGqyHyd8XHqIUdQwDrLscxkBWDjD2vGp1Q7DnmzN8gaH
 PEMK0BtK9YJncR38GkBvDnpOT/6FW4tL62oWFrmusN5a3Voqr0Pt8L6LiWuFXL5bRXjY
 ljgC8jdtmw66uM/ioGy2++kCoCW1vWzfBes3e5fJreHrRprupqurxKn13mYCzgBIwlTK
 /Fzw==
X-Gm-Message-State: AOAM533YZfinWtYasRdh5JmTrKJn/5ufHIbiQYchjoPpgDvh3wV33F2O
 YoEIXLViVpykKNEWIE+qln6xULRgKlmIHw==
X-Google-Smtp-Source: ABdhPJx4A+j0QXTw4D/Sm0KdLksg4o0BfZ4T/+QENEvIeBq8r5xzH8nj1ejQrXoTvBW3k4yFfMvW0A==
X-Received: by 2002:aa7:c318:0:b0:426:4aae:de6d with SMTP id
 l24-20020aa7c318000000b004264aaede6dmr19197877edq.208.1652797250811; 
 Tue, 17 May 2022 07:20:50 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 i15-20020a50d74f000000b0042617ba63a0sm7173031edj.42.2022.05.17.07.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:20:50 -0700 (PDT)
Message-ID: <a1f75c6a-18ca-775c-98e0-218bfe8bd481@redhat.com>
Date: Tue, 17 May 2022 16:20:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 05/18] block: Make blk_co_pwrite() take a const buffer
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113837.199696-1-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517113837.199696-1-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
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
> It does not mutate the buffer.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   include/sysemu/block-backend-io.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
> index 6630316795..6440e92028 100644
> --- a/include/sysemu/block-backend-io.h
> +++ b/include/sysemu/block-backend-io.h
> @@ -130,7 +130,7 @@ static inline int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset,
>   }
>   
>   static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
> -                                             int64_t bytes, void *buf,
> +                                             int64_t bytes, const void *buf,
>                                                BdrvRequestFlags flags)
>   {
>       QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);


