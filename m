Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E1540B627
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 19:45:53 +0200 (CEST)
Received: from localhost ([::1]:50578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQCVE-0008L7-CV
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 13:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQCSG-0006tL-48
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:42:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQCSE-0006hH-HI
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631641365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZCxhZMR9hJ3z0zVDErhqJhiSwcccPRu+W9EhoW5EAQ=;
 b=JBeoV30wRW/MId5vKKusijSAL01VvGeMbJD4p7X5dX8w+6NiUnigLGObksYECmYMBzG78c
 lAlxklylGjaAXKT49K+JGDrwfDy35OJju3FDrOKwJHvu0H5u5GsVTM2lDnN7DVxMsPIgXE
 EQCmnwCiHqJsg2lEZYWCYOgCQBly8Fs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-tFkHFvEBMiSc5f3N_EII4A-1; Tue, 14 Sep 2021 13:42:44 -0400
X-MC-Unique: tFkHFvEBMiSc5f3N_EII4A-1
Received: by mail-wm1-f71.google.com with SMTP id
 f17-20020a05600c155100b002f05f30ff03so966913wmg.3
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 10:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lZCxhZMR9hJ3z0zVDErhqJhiSwcccPRu+W9EhoW5EAQ=;
 b=vdqLt3oFWXLjdb9huhaYfqQD0yGrT/h6Z+M9ctQKI0JiipQ3+9aIwPrTk2cqVESlZ6
 6I9qs9Tc+foKM39sHBZLsXd1bfxI/SU5wZ9ZqhouoABs07gZ39thuT+23bOft8zJd1I6
 ne6vhPqpJ/tTQg57yR8yvAnXsFbVh8D0RrJPJzJA8QAYQ5qE7/1quCMBKbF/EggX0hvm
 OxMhLb8UD12HLLSoK14UK8cvHzVaNJkY5Hc3ncrFvre1hYfUsXRlp9rBphszxVF1rogT
 y0Xu8l1HYtJh7Fm2Rt9kFwQ3nL0GI8nhWx0C6QCTXkpvC98vLsvInwmeZZpRiuffrx0s
 /Zpw==
X-Gm-Message-State: AOAM530Y5aEzZJB29awz5yK/82pi26tsXhv/Ab0cq5lw0RrZCu8ZI35U
 VsVeOVo9gVsteT62PB4hhwJ0RtrDdbEpH0ac7YG30DskCahyBOhzRpENUWKzpyaWw8OXM9Gyqaz
 HUhZcHKmL4h627ANKE5KZjjPXEEnAFYouqdaopT50A5bFs8WwX8/BxLf5VXL0JVg=
X-Received: by 2002:a5d:56c4:: with SMTP id m4mr375852wrw.225.1631641363352;
 Tue, 14 Sep 2021 10:42:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9Tfz1uc6WQD1hlAZhUixg3i6Xlo78XGIpLKZevcCPFHVNLxbyZDWFcs04L/urNEBUNLYTSg==
X-Received: by 2002:a5d:56c4:: with SMTP id m4mr375832wrw.225.1631641363134;
 Tue, 14 Sep 2021 10:42:43 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6041.dip0.t-ipconnect.de. [91.12.96.65])
 by smtp.gmail.com with ESMTPSA id
 g1sm1798112wrr.2.2021.09.14.10.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:42:42 -0700 (PDT)
Subject: Re: [PATCH v4 12/16] tcg/s390x: Implement TCG_TARGET_HAS_minmax_vec
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
 <20210626050307.2408505-13-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <744f3ee3-f0ab-064e-cd03-cdbd79c8d9cf@redhat.com>
Date: Tue, 14 Sep 2021 19:42:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210626050307.2408505-13-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.06.21 07:03, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target.h     |  2 +-
>   tcg/s390x/tcg-target.c.inc | 25 +++++++++++++++++++++++++
>   2 files changed, 26 insertions(+), 1 deletion(-)

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


