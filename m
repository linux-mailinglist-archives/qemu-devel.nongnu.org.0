Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450073D956A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:40:35 +0200 (CEST)
Received: from localhost ([::1]:55026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8oTq-0005NC-Ay
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8oOn-0003ci-BO
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:35:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8oOl-0000cR-Na
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:35:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627497319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9nsNQK/gynxSu7ti2almXS+dUXqMBzZWg1AIUrUwFs8=;
 b=eMmZPqxpqFc6So4gJP80Txk2ofmDE7t5fCLMMHDfY1Jf5NDt4/ShUvdCOpLT9dj96EAiYm
 l1ZiHauNc28ntl5TtNb3q9ykEhSlymHXpuGtRJpJihuOmb1TINoTN6sOTLgGun1+LK1pXw
 oCCPSMpcgTT6USBKpC9l46a2i8bnZdI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-SDVQWodKOdCD2lq8o-2dnA-1; Wed, 28 Jul 2021 14:35:17 -0400
X-MC-Unique: SDVQWodKOdCD2lq8o-2dnA-1
Received: by mail-wr1-f70.google.com with SMTP id
 q7-20020a0560001367b02901541c53ad3aso645160wrz.10
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 11:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9nsNQK/gynxSu7ti2almXS+dUXqMBzZWg1AIUrUwFs8=;
 b=NRAmk1ezYptllR7Z3m5KUL+JjEbo2Y0GCY59YMGFnheD5mjXoUFSM09QMfl1/3N6iN
 kKAM9bV3Meo2jqTeDlLzcIlFR/ZEi+O4rULXw8zcOLq7pZrmjZlvgDLlS2E3nyep5vYC
 N8cXMEzfHUa1Q2Bn8mteLCXIQJD34GSv0t/v2h9DSV1GtX/7daRGgZk10qbd/KBT7C3y
 AbFPV0q2glZrP6u6FrsOG1bX+pLR/tawLRPUDdjcNVTo9jKB4Dj4SPO+RVqTuQ4wlqtF
 MoO8Dl8cAaXcsWEYKyiDRVVibsndMzxL06hdZvOjHlwYzv1blxJml4HlMGa8emZUI+Wm
 FYXQ==
X-Gm-Message-State: AOAM5300UW11Pdh7USk5u0MvTNZzw5jnYW1UctnJtEV4q3wiMI2ycr/j
 1UDvVUEfjXqtrb6R9rVheQXV3zBSVZYz6THepCvHfc6p/YNDbcwavU1VR0edukuFJ5nK/XO66zr
 krcoPkyOX4QrEudE=
X-Received: by 2002:a5d:69cf:: with SMTP id s15mr788451wrw.0.1627497316595;
 Wed, 28 Jul 2021 11:35:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhoVttfk/trIUnx+DYxDr9saqdoJt1sJP/5FN0/3ic0BZ8NkP2kuAUK+mJnIqIf5tQH4uMFg==
X-Received: by 2002:a5d:69cf:: with SMTP id s15mr788444wrw.0.1627497316414;
 Wed, 28 Jul 2021 11:35:16 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id m20sm708949wms.3.2021.07.28.11.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 11:35:16 -0700 (PDT)
Subject: Re: [PATCH v3 2/8] cpus: Move do_run_on_cpu into softmmu/cpus.c
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210728183151.195139-1-peterx@redhat.com>
 <20210728183151.195139-3-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c9a2d8d8-e8b0-71dc-bb67-468e2525f048@redhat.com>
Date: Wed, 28 Jul 2021 20:35:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728183151.195139-3-peterx@redhat.com>
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
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/21 8:31 PM, Peter Xu wrote:
> It's only used by softmmu binaries not linux-user ones.  Make it static and
> drop the definition in the header too.
> 
> Since at it, initialize variable "wi" with less loc.
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  cpus-common.c         | 25 -------------------------
>  include/hw/core/cpu.h | 12 ------------
>  softmmu/cpus.c        | 23 +++++++++++++++++++++++
>  3 files changed, 23 insertions(+), 37 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


