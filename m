Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBEB510160
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 17:09:17 +0200 (CEST)
Received: from localhost ([::1]:60276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njMoW-0000wc-V1
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 11:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1njMnF-000852-5R
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 11:07:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1njMnB-00063C-09
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 11:07:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650985671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sbckvQYIWR7NKAYqvsvakxLYeahKVtLqARfwAmRUTCM=;
 b=ViirCAcwh3uhdFOgBOggH5dFvuIUQtDAeqaKZilaKs23y/KKYzqZ51HawX6716On33cU1Z
 9x7KNAZ93wNFvapi9e9/3xz4bUlD9nTT2BVAuAJmXetWbAyJBzWW16L7184TgtLQnzvi0w
 +wDhbfVj/9xwAUIKC6dchSEF/IZFWmU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-mqPNgxGPPzyTFxbHWezpzQ-1; Tue, 26 Apr 2022 11:07:50 -0400
X-MC-Unique: mqPNgxGPPzyTFxbHWezpzQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v191-20020a1cacc8000000b0038ce818d2efso8164781wme.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 08:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sbckvQYIWR7NKAYqvsvakxLYeahKVtLqARfwAmRUTCM=;
 b=W2UEj1RBxpjmciYqYZZlweYRIGrGPa6Fl02C0HqWYWW56k82aFizSkM2r0wzYCLna+
 +i6HRjGtP6gmHoR69BvozNoV0X/S1WcLPIbWd42TjpmZfc7qcdFDbtttq9OGSSTNmOwJ
 9Nz/KaS9aPu81XZJsBA4Ip9z6GQ3I+a+8qbIFLETbixe1BrPKSDoSX3YKeSBJPs7QLnw
 wNjP6LXHr1AWC+E9UIXX6RGC+D6CfetLWI+RsBKIInRdN+lLEctoDzQYPtUHilU7C0hm
 oK+22y4gdnf9LBizBIQHOXYsOWXM9fYLuMIR9Sg6nUguGHEPRO7KbM/FCc/0qnPmNKIa
 NOZw==
X-Gm-Message-State: AOAM53218sKwMCyKEpvqXXc2glV1Nj+G6i3kJOzSccDqCC1yC/vF4NjB
 jWW0Iw/ERJTnc/5DRYQ67/qngF3fvHWsBx3sQzJ1ZVsDC4S45BXitEAUlRhInIzWkyVGJtCAH6v
 4SvcjeVFEA60GeaU=
X-Received: by 2002:a5d:6488:0:b0:203:b628:70d2 with SMTP id
 o8-20020a5d6488000000b00203b62870d2mr18748270wri.83.1650985668818; 
 Tue, 26 Apr 2022 08:07:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7j3iFW9ImR28xAsxvWd+OKtfql4w18E2emVozJ1/YF20Mbbko6KlPHP0t4dcj+Tpciy4DdA==
X-Received: by 2002:a5d:6488:0:b0:203:b628:70d2 with SMTP id
 o8-20020a5d6488000000b00203b62870d2mr18748245wri.83.1650985668442; 
 Tue, 26 Apr 2022 08:07:48 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 k11-20020a5d6d4b000000b0020599079f68sm11694522wri.106.2022.04.26.08.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 08:07:46 -0700 (PDT)
Message-ID: <d74b76ae-b2c0-bd6a-71ca-1fa4db0c729a@redhat.com>
Date: Tue, 26 Apr 2022 17:07:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 5/8] block.c: wrlock in bdrv_replace_child_noperm
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-6-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220426085114.199647-6-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 10:51, Emanuele Giuseppe Esposito wrote:
> The only problem here is ->attach and ->detach callbacks
> could call bdrv_{un}apply_subtree_drain(), which itself
> will use a rdlock to navigate through all nodes.
> To avoid deadlocks, take the lock only outside the drains,
> and if we need to both attach and detach, do it in a single
> critical section.
> 
> Therefore change ->attach and ->detach to return true if they
> are modifying the lock, so that we don't take it twice or release
> temporarly.

An alternative way to implement this could be

struct GraphLockState {
     bool taken;
}

void bdrv_graph_ensure_wrlock(GraphLockState *state)
{
     if (state->taken) {
         return;
     }
     bdrv_graph_wrlock();
     state->taken = true;
}

void bdrv_graph_ensure_wrunlock(GraphLockState *state)
{
     ...
}

and pass the GraphLockState* to ->attach and ->detach.

Paolo


