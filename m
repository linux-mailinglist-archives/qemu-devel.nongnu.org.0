Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7804138FEEB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 12:19:21 +0200 (CEST)
Received: from localhost ([::1]:47104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llU9g-0005Wx-Bc
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 06:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1llU8c-0004iD-F1
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:18:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1llU8Z-0003wM-Og
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:18:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621937890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OdoUBHFzJb0UAcFI839y36Z7gjdC1iP6jhh6wlblYOk=;
 b=Pd4EcRVl8gzTEit7QJAIURmW6ztI6fGHpXq/IitKz87LOPFQnfaFJdvt2sv67jz/h4zKGp
 kkxP8dMBMMhY901k87el8kKijyxezH8gHoGS4GLA3U5hiygHBDnxM+t1VphXoANInqgxaQ
 H9pVgGfQIhf51puFaNULDyfvCF2BauI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-afiMgmMwN5-wPCxStKolOQ-1; Tue, 25 May 2021 06:18:08 -0400
X-MC-Unique: afiMgmMwN5-wPCxStKolOQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 y17-20020a0564023591b02903886c26ada4so17072474edc.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 03:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OdoUBHFzJb0UAcFI839y36Z7gjdC1iP6jhh6wlblYOk=;
 b=MJOaccr4i3A93/O19hgkhjH5Ko/ahWHILrFubb44ex27JWuc/MuARx5+LTwBmb+T7w
 zty2tRzVXuXf1Q0OKJEI7PCYsK6jcK5IfN66zJpyvVuGFh+n53UHEjDXvYB0o0vqLt9B
 1LGFCyO8kZmt8PkDYAMyc1m2UAJwbsggcxWWhvIZ7KNn40cl5fvaqSShiYA42Kq/by/q
 2/JbjEdahrjJUkgXclS2VUXwUIpmqDfiCVDp1sZNDsotjCbsWbjZ5OLr8BPW6ld3ZBOU
 8QzMhBKwah1XE73GgzUn/hd6ze8zIq6PyVqoUSOmN1wmEhg2LftgXVVIr+Q8/iYnod3V
 Oqsw==
X-Gm-Message-State: AOAM530rjohfbisWS8VTBoscZNgDFiNK1XmyaSkEvMvw71wxsPRpvZPf
 JX5gM+R0va+lZAlD+KzkF0WHplBGzuQVSgkSfaTBml421S/LUhWjGo90OPzKHSOM30CvNUS8UJ1
 E/LnNS6fXgp8DI50T3Ql0B+Kp8NTH+5owyTSDOZwrhxVHekD0qiEkmKMVyClXEoxrPqE=
X-Received: by 2002:a50:aa95:: with SMTP id q21mr30549820edc.329.1621937887474; 
 Tue, 25 May 2021 03:18:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy14e+WJTxcPKJEECCsM4KHKVE2ULZAu4Wgiq+GsNZl1Btr3+1D6ojD5TlwL9G70vnj8XKQKw==
X-Received: by 2002:a50:aa95:: with SMTP id q21mr30549790edc.329.1621937887179; 
 Tue, 25 May 2021 03:18:07 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 t14sm1990498edv.27.2021.05.25.03.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 03:18:06 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] block-copy: protect BlockCopyState .method fields
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-8-eesposit@redhat.com>
 <404e2891-9c03-bc7d-2c69-a572422d7804@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <4403ee17-0c12-c545-7f64-683bb9057b91@redhat.com>
Date: Tue, 25 May 2021 12:18:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <404e2891-9c03-bc7d-2c69-a572422d7804@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 21/05/2021 19:10, Vladimir Sementsov-Ogievskiy wrote:
> 18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
>> With tasks and calls lock protecting all State fields,
>> .method is the last BlockCopyState field left unprotected.
>> Set it as atomic.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> OK, in 06 some things are out of coroutine. Here could we just reuse mutex?
> 
> I believe, that we don't need any kind of protection for .method inside 
> block_copy_state_new(), as it's just a creation and initialization of 
> new structure.

I agree here, will remove the atomic_set in block_copy_state_new.
> 
> And other things are called from coroutines. So, seems no reasons for 
> additional atomic access logic?

But... why should I use a mutex? I think the .method usage is pretty
straightforward, adding a lock (which one, tasks_lock? does not seem 
appropriate) would just cover also functions that do not need it, since 
the field is modified in if-else statements (see block_copy_do_copy).
It looks to me that an atomic here won't hurt, and it's pretty 
straightforward to understand.

Thank you,
Emanuele


