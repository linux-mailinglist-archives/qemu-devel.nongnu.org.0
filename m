Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542F65143B3
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 10:13:23 +0200 (CEST)
Received: from localhost ([::1]:34744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkLkg-00044z-Ds
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 04:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nkLeA-0007mi-4A
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 04:06:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nkLe7-0000jG-58
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 04:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651219594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WTYj11AUO1e9QV8caxr2htDAv/L/JDFXxqO07Mwyemo=;
 b=R8iINu10dhRBRWjMM7mSZ+1rOCtDm15QkUGNHs9WgDtFrfIl3bqavxmGkEcvnkE2ma/oRB
 /h4+VZ2D2pKf8LqZhHyf/LXFR8VNl5l+FmceElch4AC7x8l45UPpYLiCQeH9ot1r3nunvc
 XIskVbdAsqNFftQbNTnhdNTCf0YfbNA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-z9_3YxEIN1e4wtTazzNXWw-1; Fri, 29 Apr 2022 04:06:32 -0400
X-MC-Unique: z9_3YxEIN1e4wtTazzNXWw-1
Received: by mail-wr1-f69.google.com with SMTP id
 l11-20020adfc78b000000b0020abc1ce7e4so2783473wrg.1
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 01:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WTYj11AUO1e9QV8caxr2htDAv/L/JDFXxqO07Mwyemo=;
 b=hd6YEzhDpSDObyywTlDd3bAU8pOiFha5TZnkf2ivN1uKEZq/wL7T4Bl8Nvl+nNWmoq
 gqnjWAl/mrA8Vc9aDwaDZelnO8pbs5p9/qiO024a6sL+6I8+TUHPiSew+eTGa941YcHU
 a0RC81lQVa5fdVAITqc0CCltVtYRrNIuwLbmuN9If+yz+IJgaOL91LDs5f5kZmm0V8Kg
 UfYk5TpFcRcXzkFCzGTbdqQQEu1Phk8te3KJdDAFZavy7BklnKxApVUrHl+OOn28vPzb
 z3baTqV1AifISq6PPYAxjtwgPkXO40Dk5WsNbs1m6HUGh7XiIE/gro0QkOM3x8jY4iBB
 eX5A==
X-Gm-Message-State: AOAM533qW8sSl+tvbPlGVsaoFg1q5y+PqBYjyfgActLlW0i9zUrAkztP
 rnZiLuqCUzFYcCJRZ0biwlHE8a6yFRUOE1cKMKaURvVeHE6Xd0ov+ZnwD0DGWg/Pl0Z1Bj2Za6X
 MBKS9R/8bqDQlS1E=
X-Received: by 2002:a05:600c:1991:b0:393:ef28:7ab2 with SMTP id
 t17-20020a05600c199100b00393ef287ab2mr2066779wmq.20.1651219591146; 
 Fri, 29 Apr 2022 01:06:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAgPJQ9sgZI7D6/sesnY91AP3jt/bB+1E0AAG+MSv8HcrKp072aSfZXQzR5eAUITHPbBcXzQ==
X-Received: by 2002:a05:600c:1991:b0:393:ef28:7ab2 with SMTP id
 t17-20020a05600c199100b00393ef287ab2mr2066748wmq.20.1651219590815; 
 Fri, 29 Apr 2022 01:06:30 -0700 (PDT)
Received: from ?IPV6:2a02:1206:4552:34c0:71ab:1dfe:eb3b:43f9?
 ([2a02:1206:4552:34c0:71ab:1dfe:eb3b:43f9])
 by smtp.gmail.com with ESMTPSA id
 bi26-20020a05600c3d9a00b0038ed39dbf00sm1986066wmb.0.2022.04.29.01.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 01:06:30 -0700 (PDT)
Message-ID: <876f8360-bd93-8dc9-2e4a-d35f545152f6@redhat.com>
Date: Fri, 29 Apr 2022 10:06:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <Ymptphd9lpctkTj/@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Ymptphd9lpctkTj/@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 28/04/2022 um 12:34 schrieb Stefan Hajnoczi:
> On Tue, Apr 26, 2022 at 04:51:06AM -0400, Emanuele Giuseppe Esposito wrote:
>> Next step is the most complex one: figure where to put the rdlocks.
> 
> I got a little lost at this step but will hopefully understand more when
> reading the patches. Earlier it said there is a counter for readers, so
> it seems trivial to make it a recursive lock. I don't understand why you
> want to avoid a recursive locking - the complications you described stem
> from the fact that you want to avoid recursive locks?

I'll let Paolo to further elaborate on this. I think it would be cleaner
if we try at least not to have recursive locks.

> 
> Secondly, can you describe the role of the lock? The text mentions the
> old AioContext lock that is being replaced but doesn't define this new
> lock in its own right. Is the idea to make ->parents and ->children list
> accesses thread-safe and all loops "safe" so they don't break when a BDS
> is removed?

Yes. Replace what AioContext lock is doing right now.

Emanuele
> 
> Stefan
> 


