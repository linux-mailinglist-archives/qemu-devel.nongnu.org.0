Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD913B3E0F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 09:53:36 +0200 (CEST)
Received: from localhost ([::1]:49272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwged-0006WS-CW
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 03:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwgdo-0005jU-3t
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 03:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwgdl-0005f9-Ow
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 03:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624607560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jn8hkH5HCvV2P2qC2chvpKEmitrXo6WW+CJAcQti6s4=;
 b=Y+U9U9iG1LfQrP0QegXPrwPwNaeBbjhnvLZzoyT2YUEoDyKycsjWp36QmnQMen1sm6sNc3
 zqk8MUqrqhEf2iD/eYd/fx4EmM8LflqwnOBk2kgiudLi+CGIoBFLBkqhF3Po20vqKXpD1K
 jbRTWrXkBHx6lLzsDk7YYLGLLLQEAbc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-f5TGqlYxMxGvYC24ajkGWg-1; Fri, 25 Jun 2021 03:52:39 -0400
X-MC-Unique: f5TGqlYxMxGvYC24ajkGWg-1
Received: by mail-ed1-f70.google.com with SMTP id
 w1-20020aa7da410000b029039533674a84so53931eds.9
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 00:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Jn8hkH5HCvV2P2qC2chvpKEmitrXo6WW+CJAcQti6s4=;
 b=OU8NNTP4T7FdMgNVJgV+Ry6Z5bmF7S4Y+40m7m6Sdoopq0k69LLpSrY4GQyh8vefJF
 vozzjQXrwADxCfNTodRAdxuT0cTwV+7AbPKg8edM3pFGFs5VKN1GPxV7/G9AGYUHVhgN
 YOHzYiYzjnXgxN7/lNb6NsMX4aSvjzaRu3Yf/oN1/iEuLCmwooLRKVMCD7UIGqbxMAnv
 lL1kkga9VfBAH702J2a72r8vjdxS7f/aayoNp1rEl27FzQdcOawdDGsyFjMAVN9tyJpz
 a7McMO8mRYm5wRh9y+l5R4oDw3Q9fLkb0ubqTzyEyQVkGt0jA1Bdr/99JzZPQ9f0eAiY
 QTGg==
X-Gm-Message-State: AOAM530NQVXcd5kN1J3Dcq4KkNX5USC6XPAQKqW0berthyju4UdQf8rq
 tWI/cbIhIgTz3dTF1QeH6sQihDbanIQUM4kZnvDjChl0YBcsUlsB7pgaIRa3SdGvNm8pydYrO3d
 IgXE5c2eDD+2n6Ak=
X-Received: by 2002:a50:eb8c:: with SMTP id y12mr12726119edr.189.1624607558125; 
 Fri, 25 Jun 2021 00:52:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDYjDN0J4/Xlu1cxcNIDeHEAddoNcUBa47pSGlOGi70mSS9lmzQLJ36AIWjqGDkPF6pJ4W8A==
X-Received: by 2002:a50:eb8c:: with SMTP id y12mr12726103edr.189.1624607557974; 
 Fri, 25 Jun 2021 00:52:37 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 dd15sm3417978edb.45.2021.06.25.00.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 00:52:37 -0700 (PDT)
Subject: Re: [PATCH 04/11] block-backend: align max_transfer to request
 alignment
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210624180423.1322165-1-pbonzini@redhat.com>
 <20210624180423.1322165-5-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <90a7ba21-6039-ee89-e4fe-04d86b6b19e7@redhat.com>
Date: Fri, 25 Jun 2021 09:52:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624180423.1322165-5-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: qemu-block@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.06.21 20:04, Paolo Bonzini wrote:
> Block device requests must be aligned to bs->bl.request_alignment.
> It makes sense for drivers to align bs->bl.max_transfer the same
> way; however when there is no specified limit, blk_get_max_transfer
> just returns INT_MAX.  Since the contract of the function does not
> specify that INT_MAX means "no maximum", just align the outcome
> of the function (whether INT_MAX or bs->bl.max_transfer) before
> returning it.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/block-backend.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


