Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E99A4F12C8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 12:11:00 +0200 (CEST)
Received: from localhost ([::1]:57110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbJfl-0006jh-3f
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 06:10:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nbJcs-0005qg-0r
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 06:08:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nbJcq-0005n9-Is
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 06:07:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649066875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zuhcgUBU/FZQjyTdAOF7nato5B72p26hdsgQwSDHLVo=;
 b=BliP0WGFVNGR2AH4IIl8CA3QHYsYa9H0RXod/MbXYvDN4PI+BfQM8iDS1eNzs+iAeVmoTn
 aMjFGlj4Nfs4Vf8cVGv8Oc+v0hGX67DIR+M66QwvDXoC1/QsL+X7JTCQpOOQ/H7JEuN9Eg
 RMep51OYBADUhDr0NWGE8YJLlUi943k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-dH38ZX_HOqGgU0lRMOZ-Ig-1; Mon, 04 Apr 2022 06:07:51 -0400
X-MC-Unique: dH38ZX_HOqGgU0lRMOZ-Ig-1
Received: by mail-ed1-f70.google.com with SMTP id
 cn27-20020a0564020cbb00b0041b5b91adb5so5187806edb.15
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 03:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zuhcgUBU/FZQjyTdAOF7nato5B72p26hdsgQwSDHLVo=;
 b=SxsnD9Opi4IyoS5Fg8ZUr/DMWC5LCfw0cst8+nWZv5pVBLpX18aVB7esF7aEdI+2r+
 M4qsjUZSbWVanuBGD1yJDPLPhsqDrsSqN6CHycmM0/8ot5VKtZFSMXU2IxdsF+hTYuqU
 wL5ZYHOfD0feZC1tGm7HnbRR1OJVLC13Eqb4jCE5xhGmOU6NhFOfnR0QCCgXSS5W1hkB
 DFBWIt0ivN2GTuTpyj4px56cUddca8+IFVPhsQdncr4pDpvjHH/93kBzUQzExFFzSJk6
 XJbp/FSDv5hH4ge0TzGAf4ssEDc4UiuR4V0xkkWTuwz1m//MyHDHaxy6cBo0AcRsd3/9
 Lz/A==
X-Gm-Message-State: AOAM530117wzAUczcFjD3A4bfKBw4oqi6Odccyklil+Kf1JPIIFlrFSJ
 tQL5IyuMh1INeL/byXwtPq9Xb5G89905nxOtc9ykeyVvgDvNHwQsXZGDdkjpIzqizi7T3J37Zmn
 kWLxMZ5GxlG+Kobg=
X-Received: by 2002:a05:6402:548:b0:41c:bf00:307 with SMTP id
 i8-20020a056402054800b0041cbf000307mr6646192edx.6.1649066870725; 
 Mon, 04 Apr 2022 03:07:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOCCfNGVsHzM7m94fpS8BqfKdYYVThFYaDfv5ZiRvDDh3tgG5dz8ySM9WbOTOxf8XwoYIIDg==
X-Received: by 2002:a05:6402:548:b0:41c:bf00:307 with SMTP id
 i8-20020a056402054800b0041cbf000307mr6646167edx.6.1649066870460; 
 Mon, 04 Apr 2022 03:07:50 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 n13-20020a170906724d00b006cedd6d7e24sm4170048ejk.119.2022.04.04.03.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 03:07:49 -0700 (PDT)
Message-ID: <de75f62d-7003-047c-8969-451eb7772de1@redhat.com>
Date: Mon, 4 Apr 2022 12:07:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <Yh89L8gT46MbSJCQ@stefanha-x1.localdomain>
 <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
 <e9eeec7b-d03e-5e8e-cc42-568c670726ca@redhat.com>
 <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
 <c6a12090-b6c3-31d8-fb90-a76c9dd2e949@redhat.com>
 <88f2798b-9327-e54f-5792-e37404b94ef7@redhat.com>
 <8ae70388-ff46-6ec1-7f84-14d41ca9a6dd@redhat.com>
 <311c2e0a-fb2c-241c-cbd1-1162f7e74e18@redhat.com>
 <9d3c36f0-0834-ec9c-8473-d052d64a61dd@redhat.com>
 <69b2ce82-4826-71ed-9c32-d323df69b7c4@redhat.com>
 <Ykq5cZPiC9uw9T1a@stefanha-x1.localdomain>
 <CABgObfZ96TOf9nxdrHrtKtrfyG0sZS9rPqAaReQgxNQ+AkKKpA@mail.gmail.com>
 <7d82deaa-e34e-c3b4-0d1a-80fe9053c1a8@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <7d82deaa-e34e-c3b4-0d1a-80fe9053c1a8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/4/22 11:51, Emanuele Giuseppe Esposito wrote:
>>
>> I agree that it doesn't. This new lock is only protecting ->parents and
>> ->children. 
> Side note: it will also be used to protect other fields, like
> .aio_context I think. I haven't checked if there is something else we
> might want to protect that is currently protected by AioContext lock.
> 
> At least, I think we are going to use the same lock, right?

I have no idea honestly.  It can make sense for anything that is changed
very rarely and read during requests.

.aio_context has the .detach/.attach callbacks and I wonder if there
should be any reason to access it outside the callbacks.  A lot of uses
of .aio_context (for example for aio_bh_new or
aio_bh_schedule_oneshot/replay_bh_schedule_oneshot_event) can, and
perhaps should, be changed to just qemu_get_current_aio_context().  For
multiqueue we probably want the same BlockDriverState to use the
AioContext corresponding to a virtio queue, rather than always the same one.

Paolo


