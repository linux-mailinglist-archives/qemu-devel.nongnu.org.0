Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6CA690CDA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 16:25:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ8mq-0002ka-1W; Thu, 09 Feb 2023 10:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQ8mo-0002hT-Ay
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:24:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQ8mm-0000Ne-7T
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675956271;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bqRcoIFj3ysf0n7tpupto6ajKKIzXmHik5zCmJHlxpM=;
 b=fc5ZOt6JS0MiKk+pCHjleVKIWvLtNu2Vj5Gm9uMBkMNXWJvKHtceJDEwwUsmmbE/8VhZ6K
 k7l/tgOT30acHwqpzyLN6hoX8JIwC2UwQnrwlzokctMsGMKT7QK1vGp9DokMEyAJ6CMH8Q
 EE/0inRtuozC6Jwuc3dW62QXUDNmX3E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-Xqts_172MUec-eLX5AWxxg-1; Thu, 09 Feb 2023 10:24:30 -0500
X-MC-Unique: Xqts_172MUec-eLX5AWxxg-1
Received: by mail-wm1-f71.google.com with SMTP id
 b19-20020a05600c4e1300b003e10d3e1c23so2650721wmq.1
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 07:24:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bqRcoIFj3ysf0n7tpupto6ajKKIzXmHik5zCmJHlxpM=;
 b=jlU73kg8iq6IZYvvgsLvH78ZjGzjm5hLFsaPxqzmYTM9aqFoWni+z6Db7yElo/WBMF
 lc6dupBD7wJVPU/qyAX+NLgJfcpTTeMJipqowK7EmzD+lWUcbMgynv2xU0aH3r6ncgLb
 vLoGMUtncFJTp2vXJo6ZLyGMc/nW6r1gtDqSykB04y6YrQIc5xqU5htes4zSyj+mBbvN
 UBJ3bDF6PlDOhfGHfeaiFed9rO+7fpqrj1uMfrVebnk7i1AYO7IyBYU8VPDq4pTmLkMy
 X0laU+Yqwo1U6knwgzMOVOP9XSF8wLsqyhs6XXSm0NrgB0dxHD8vIDPfUT53+yRNDaSK
 Bfgg==
X-Gm-Message-State: AO0yUKWvCMecmUnLfujop2ci/Q6edsfOzJmLyu9NW3TNuu+lP4k/MF6c
 G2rVO2Y82z4TJe0OG5ceaN2bfvPu6jt/RYLL6Ikz+qtNNv5FAaMfbQtGEPc3YG7wy5PRjrLw2Xb
 VwN2sflmvWUU5r6E=
X-Received: by 2002:adf:ee4c:0:b0:2c3:e03e:8345 with SMTP id
 w12-20020adfee4c000000b002c3e03e8345mr11440304wro.66.1675956268129; 
 Thu, 09 Feb 2023 07:24:28 -0800 (PST)
X-Google-Smtp-Source: AK7set9SFFxndEeMJvQteDJyAIc5ahj+Si7BCnYmaoadFpLQw0hWKdqYScBloDq9UI7AP2CCKDBYTQ==
X-Received: by 2002:adf:ee4c:0:b0:2c3:e03e:8345 with SMTP id
 w12-20020adfee4c000000b002c3e03e8345mr11440263wro.66.1675956267892; 
 Thu, 09 Feb 2023 07:24:27 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 j7-20020a5d4487000000b002c3de83be0csm1559925wrq.87.2023.02.09.07.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 07:24:27 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Stefan Berger
 <stefanb@linux.vnet.ibm.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,  John Snow <jsnow@redhat.com>,  David
 Hildenbrand <david@redhat.com>,  Fam Zheng <fam@euphon.net>,  Thomas Huth
 <thuth@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  qemu-s390x@nongnu.org,  Christian
 Borntraeger <borntraeger@linux.ibm.com>,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  "Dr. David
 Alan Gilbert"
 <dgilbert@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Coiby Xu <Coiby.Xu@gmail.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Yanan Wang
 <wangyanan55@huawei.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Alex Williamson
 <alex.williamson@redhat.com>,  Eric Blake <eblake@redhat.com>,  Eric
 Farman <farman@linux.ibm.com>
Subject: Re: [PULL 03/30] migration: Split save_live_pending() into
 state_pending_*
In-Reply-To: <2c982100-990b-dcdd-bd4a-ff8dce33e59f@nvidia.com> (Avihai Horon's
 message of "Thu, 9 Feb 2023 09:48:37 +0200")
References: <20230207005650.1810-1-quintela@redhat.com>
 <20230207005650.1810-4-quintela@redhat.com>
 <2c982100-990b-dcdd-bd4a-ff8dce33e59f@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 09 Feb 2023 16:24:26 +0100
Message-ID: <874jru50b9.fsf@secure.mitica>
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

Avihai Horon <avihaih@nvidia.com> wrote:
> On 07/02/2023 2:56, Juan Quintela wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> We split the function into to:
>>
>> - state_pending_estimate: We estimate the remaining state size without
>>    stopping the machine.
>>
>> - state pending_exact: We calculate the exact amount of remaining
>>    state.
>>
>> The only "device" that implements different functions for _estimate()
>> and _exact() is ram.
>>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> I only noticed it now while rebasing my series on top of yours.
>
> I think the exact and estimate callbacks got mixed up here: we call
> .state_pending_estimate() in qemu_savevm_state_pending_exact() and
> .state_pending_exact() in qemu_savevm_state_pending_estimate().
> Also need to switch the !se->ops->state_pending_exact/estimate checks.

Good catch.
Sent a patch to fix it.

Thanks a lot.


