Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBC3696C91
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 19:16:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRzp1-0007FD-T5; Tue, 14 Feb 2023 13:14:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRzoy-00077c-D5
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:14:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRzow-0003Pt-Pp
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676398465;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/fpTteWCny99fUNgK5KdJzIjeUZWFWUtymVc71+atDE=;
 b=KbftdxSVRvGCZMPKHdrl+lBBMCTkDFkfVppUFniKM6L/k7fxPRDMbnLNJAfrM9NLy8icm5
 OFlxGYKNEAvmA49qwH1TNRKOMqyNEpGLYC+k39O1Am5MvgwfYdf7NaTKLNC8cujnEjpwm2
 U1BzVP3jlPYrzwfDNAmcM7tMOWfWxeY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-PP5x5pGhO_q6g9SUPpq1PQ-1; Tue, 14 Feb 2023 13:14:21 -0500
X-MC-Unique: PP5x5pGhO_q6g9SUPpq1PQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n4-20020a05600c3b8400b003dfe223de49so11347988wms.5
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 10:14:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/fpTteWCny99fUNgK5KdJzIjeUZWFWUtymVc71+atDE=;
 b=ED/ZXsvVESyEHvi8H7Oi7oa64nDVr9vN5HpwDeGUbkLAoI1meu73xnrM723KxGe6DP
 uKICOk+TjWQs5M8sGtOOOMN4bHjIBv/rk70EysYTCMDNnbZeg8aOi3EafVS6nTQCmBv7
 tsPPh5FlLUO2ymftdL6FuSPap89NhMwnr5WTRk06tZdmO90ikOR5OUmYBqEUnDiVob+J
 TnWcwyOTyYHedIEp4JOE9thYYJyGsBtxm+abhI12mUP65d+WM3MigtF2YxHwMqpjdrBp
 N5Fdcg+QgP8SkBj4bB2PD5it/i7Rrb/XEKFjuaKK0Pm1P4L6gueFDAeTxXAuRG2EhD1y
 2Eyg==
X-Gm-Message-State: AO0yUKVK8uaf3c4a8gYYOOCvv6bGiqBef7lZMceLE54uz1pm4wESkEzw
 Q9UM86Ro9ECQnCgZj0y+m75TJ+mQTEOL8wSdtILNNQf4IXG0+bRX70PvghRgniZim8N4Y2wmukB
 wP+V8IDHprgS0gmw=
X-Received: by 2002:a05:6000:192:b0:2c5:52f9:8e9b with SMTP id
 p18-20020a056000019200b002c552f98e9bmr406283wrx.29.1676398460499; 
 Tue, 14 Feb 2023 10:14:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+r0f+tTL7Q4Pj8S95LtiKliZ0yfrgjGVTllQiZ57R2znKdoWlwjxQKe7L1FsCDX/roLOxwLQ==
X-Received: by 2002:a05:6000:192:b0:2c5:52f9:8e9b with SMTP id
 p18-20020a056000019200b002c552f98e9bmr406256wrx.29.1676398460236; 
 Tue, 14 Feb 2023 10:14:20 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 q2-20020a5d5742000000b002c560e6ea57sm3249884wrw.47.2023.02.14.10.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 10:14:19 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-block@nongnu.org,  Alex Williamson <alex.williamson@redhat.com>,
 Fam Zheng <fam@euphon.net>,  Eric Blake <eblake@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Halil Pasic <pasic@linux.ibm.com>,  David
 Hildenbrand <david@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Eric
 Farman <farman@linux.ibm.com>,  qemu-s390x@nongnu.org,  John Snow
 <jsnow@redhat.com>,  Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/3] migration: Remove unused res_compatible
In-Reply-To: <c88e6eed-b8e4-56ca-2aa0-686ae2c0b133@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 14 Feb 2023 18:09:12 +0300")
References: <20230208135719.17864-1-quintela@redhat.com>
 <20230208135719.17864-3-quintela@redhat.com>
 <c88e6eed-b8e4-56ca-2aa0-686ae2c0b133@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 14 Feb 2023 19:14:18 +0100
Message-ID: <87ilg45d39.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> On 08.02.23 16:57, Juan Quintela wrote:
>>   {
>> -    uint64_t pend_pre, pend_compat, pend_post;
>> +    uint64_t pend_pre, pend_post;
>>       bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
>>   -    qemu_savevm_state_pending_estimate(&pend_pre, &pend_compat,
>> &pend_post);
>> -    uint64_t pending_size = pend_pre + pend_compat + pend_post;
>> +    qemu_savevm_state_pending_estimate(&pend_pre, &pend_post);
>> +    uint64_t pending_size = pend_pre + pend_post;
>
> Mixed declarations are "gnerally not allowed" by devel/style.rst.. Preexisting, but we may fix it now.

They are used left and right.
But you are right.  Instead to change my code, I have sent a proposal to
change devel/style.rst.

Discuss it there O:-)

> Anyway:
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Thanks.


