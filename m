Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D29F387608
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:06:40 +0200 (CEST)
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwcZ-0006bD-Gc
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwMV-00076e-4C
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:50:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwMS-0004yv-M7
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621331400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u/blrLGZh/QS1TKkxH7kPDFJUJ2+ftIkpUwoHxgebU4=;
 b=HXkpq+gjwyJfU/qLCZpEnHTqte0XbD75oWl7VTx8P3qScpLOYiAKnrM7yPs3lDoxPNIzrK
 4POeYEGA7qhGri14onXuWlls/CPzMNhpsvTKK4v/d1YaAnhHqLlMo9LreNNeLeGxIf/Xp7
 LXNfdKMf5QCA/S2AtZy39zN5A3eq/hM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-qQnx1UeHPAuoAUr0Mogtlg-1; Tue, 18 May 2021 05:49:58 -0400
X-MC-Unique: qQnx1UeHPAuoAUr0Mogtlg-1
Received: by mail-wr1-f70.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so5303455wre.22
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u/blrLGZh/QS1TKkxH7kPDFJUJ2+ftIkpUwoHxgebU4=;
 b=tt68mPf/TtZ9vOz3KQXP87ToGLz9BO7J0UHobjWU7wFrArkYuEDWOZfqtgKENhCnZf
 /bC/hLS/x+m2opgxIhY8NUGSCNMdgLBkZmTY+jZ6kprF4n8lTlnk+ZNtpj5oWB9WylcQ
 1sB27viSe8GpT3lDxjQPwYwvP7BCgdHpzxCfaCG65Dks8LIN6XURrB0FxeYZV2VNeNTR
 mdN/irMK7oAyjR0fWWou8Npvt6r5cGhSIVG4xBYsv74Kdd1XYTTYFohMKJtgBRA2SmE0
 SZvWQgc2u6YQ+MDxEUZoD1BdgSZYJrcBdypXYlzFTSwkLiSMDKfLdGjC0tQ2loRDFFaL
 drow==
X-Gm-Message-State: AOAM533AGDksemQNTqa389nbiDUNZA1JvJHOo5u+IKQX+8XT3Popdk4s
 51NKoprlketKBuub4OGUwTG8A5XgkhJkH5emqRb1/y4c0wWkWx2VVEFBaxTUZGphAcdjuRtC/6E
 72THhOomZFx4ZO2M=
X-Received: by 2002:a5d:4dcc:: with SMTP id f12mr4640076wru.224.1621331396950; 
 Tue, 18 May 2021 02:49:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD34SXUcJp4eNDR3a96Ykq7AGhK+MImhDA/hl3yDFZaZ8w2aaaIoM6PlJ69plNeTcQfyhtdQ==
X-Received: by 2002:a5d:4dcc:: with SMTP id f12mr4640056wru.224.1621331396765; 
 Tue, 18 May 2021 02:49:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n2sm20392829wmb.32.2021.05.18.02.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:49:56 -0700 (PDT)
Subject: Re: [PATCH v2 29/50] target/i386: Add stub generator for helper_set_dr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-30-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <de7f6300-82eb-9c96-e2db-65c888905348@redhat.com>
Date: Tue, 18 May 2021 11:49:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-30-richard.henderson@linaro.org>
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
> This removes an ifdef from the middle of disas_insn,
> and ensures that the branch is not reachable.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


