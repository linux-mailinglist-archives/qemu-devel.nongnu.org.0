Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A6067773C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 10:17:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJsvr-0005zR-LJ; Mon, 23 Jan 2023 04:16:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pJsve-0005x3-M9
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 04:15:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pJsvc-0005dD-EL
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 04:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674465346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VN+NM16VDHUGHb0FcZzCe0zYLFT/jMzdhaIasM/6QEU=;
 b=h253ipaFkEAoH8RzPs84MKuE5EsSFp5CajQYupbrXObpo+CnlFQEo668LJ7dZ/BPIBGYgy
 p4xobG6KgWEZRZXlDGCcW7WVPyyzqvOOOCmA6FBj+y5VOWE0C6n5/XLp9yVusKtgNQtYpQ
 dOquEJaG+zYa2sDVJwsobThrrKA2ylA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-339-M3ojwT3gMamvraxYTTP9AA-1; Mon, 23 Jan 2023 04:15:45 -0500
X-MC-Unique: M3ojwT3gMamvraxYTTP9AA-1
Received: by mail-qv1-f71.google.com with SMTP id
 c10-20020a05621401ea00b004c72d0e92bcso5667242qvu.12
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 01:15:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VN+NM16VDHUGHb0FcZzCe0zYLFT/jMzdhaIasM/6QEU=;
 b=zs876IfFs0BWPCUm9ikZ8KmxnD+e5Fni4GL+zCYIY9pZFJiAOGDFgBIwMGGy4hLlMr
 yDGA2UQkPWB24c9AxweworP9PUrrYLNbXtBEnyx8YR1bfEql7eFsWtVC1go6LkMAFZ5N
 41pqIXCQ3hT4SKSabeRYwETZGRU/P3fqNjzO0V1tPAGT6KiecAVDefpLfP0cQxEXQESh
 YtrOaKww6vRwuUzGwWp+WcD/yQIusvTe3PSVcg1ySkNw6YsBbX5Gh3L5z148AnQNPq2B
 T+ZbyUdwmJzMsBraxku7hqlAms5mOCLnCarR9q3canaSmStc8teHnvzTY/s4SF0Fv05f
 Zn4w==
X-Gm-Message-State: AFqh2ko1Ip8LO1TaNzRuK+Xlu3mdsW5yYJc7Y39pZSUOl6Uf+rCq9Hef
 nIKl1/bBLzJYqVClBejXHr9Yo9MNRZVtOU2MMd1UMmMrokTK4sOx1ZqiGID9WU18jU73sI1CqJJ
 B+EZmeXu9ox4ZGzk=
X-Received: by 2002:ac8:44b6:0:b0:3a5:9267:ee07 with SMTP id
 a22-20020ac844b6000000b003a59267ee07mr32473059qto.63.1674465344971; 
 Mon, 23 Jan 2023 01:15:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtbTIvus1bd4bbhR3pTGMecyroRAr+iOX8XIec2viR4NkmTcsbSBBjWwsgaWY5r7fZKemT55g==
X-Received: by 2002:ac8:44b6:0:b0:3a5:9267:ee07 with SMTP id
 a22-20020ac844b6000000b003a59267ee07mr32473043qto.63.1674465344759; 
 Mon, 23 Jan 2023 01:15:44 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-90.web.vodafone.de.
 [109.43.178.90]) by smtp.gmail.com with ESMTPSA id
 br31-20020a05620a461f00b00706c1fc62desm8455469qkb.112.2023.01.23.01.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 01:15:44 -0800 (PST)
Message-ID: <c3dbfd5f-d97c-844e-4dfd-b8bf9290cf11@redhat.com>
Date: Mon, 23 Jan 2023 10:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] migration: Fix migration crash when target psize larger
 than host
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-stable@nongnu.org
References: <20230120163147.2343050-1-peterx@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230120163147.2343050-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/01/2023 17.31, Peter Xu wrote:
> Commit d9e474ea56 overlooked the case where the target psize is even larger
> than the host psize.  One example is Alpha has 8K page size and migration
> will start to crash the source QEMU when running Alpha migration on x86.
> 
> Fix it by detecting that case and set host start/end just to cover the
> single page to be migrated.
> 
> This will slightly optimize the common case where host psize equals to
> guest psize so we don't even need to do the roundups, but that's trivial.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Thomas Huth <thuth@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1456
> Fixes: d9e474ea56 ("migration: Teach PSS about host page")
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   migration/ram.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)

Thanks, I've checked that this fixes the issue for me, indeed!

Tested-by: Thomas Huth <thuth@redhat.com>


