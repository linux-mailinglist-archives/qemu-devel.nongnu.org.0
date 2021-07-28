Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584B33D8877
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 09:02:27 +0200 (CEST)
Received: from localhost ([::1]:59766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8daD-0001ad-T2
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 03:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m8dYf-0000lB-AN
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:00:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m8dYb-00005L-CU
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627455643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KIVZDGw1PSZBBqsViOk24Qh8QgVI7xvpYtJ9WQb8U5U=;
 b=V4mId6wNZX/c9sXXbzDOSAbSB7oTUZkbMnO29oD3r7ZYs3k4L4DR3SGnU9VjmS0kIK8338
 pXKm9W3P3qTwnj6q91ti6pUWjFWWEBOA9SHzOzPU9h5AMBBw5byRLxxdPBRY6n55scSO+v
 efXjPB5HSlDq2dJygFXiHqfl9VyD8P4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-fYjSJSBYNmGSAqhGvqbTWQ-1; Wed, 28 Jul 2021 03:00:41 -0400
X-MC-Unique: fYjSJSBYNmGSAqhGvqbTWQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 l12-20020a5d6d8c0000b029011a3b249b10so526455wrs.3
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 00:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=KIVZDGw1PSZBBqsViOk24Qh8QgVI7xvpYtJ9WQb8U5U=;
 b=kc4BZg/Gi/ID/3XJQtaR+MvOhYAS/MIOoadbgOJmV4QwWYuYRZGpAqpwHKaJWAeus7
 tY6VAmo6WKUKvp+3L2l5nKLS+3yn8WFbsjQux/mktiYT7wxw1ILWymnQJt3WX6t+lh1r
 ERmYZWXbz4fc8elVARYv5tVVgsyKwqE/WByTRmPtaWlpJwjIIjJzyWO5v2n+8KlsYaKw
 9Xcx6DGjpImEbs1pKb69xEm6Z5VmLkZX9qBK0JTMYu8hKVUR0hFy/BE0PV2EOzeYR0bE
 rDbVI8JOKcJNNSJfCBmwFRfkMTy9yEJhFu9YPvb/7owzxFdAVaoczbQFOywvss8Kjkmf
 ZmTA==
X-Gm-Message-State: AOAM5313CNEugpXadhbRZAKPTZiGKVPu9ifoNtMmqOuzlIaWb8q85jq/
 K9EZ7jRCeurjsTTtFP4DHSxMmvxBw9hVEDH1SD8hEmV94uOEkfiFiZoIrF8/fLWspzMYSm+aSbW
 kysHu8c5deZRlWYo=
X-Received: by 2002:adf:e6c4:: with SMTP id y4mr15614187wrm.220.1627455640638; 
 Wed, 28 Jul 2021 00:00:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0iCBVNP4/lakkVJd55aV3lCi2c5aMYZCmepJDMJnzAX6rpcJX+Q7x2rpej7Nx44P9Dp3PHQ==
X-Received: by 2002:adf:e6c4:: with SMTP id y4mr15614153wrm.220.1627455640328; 
 Wed, 28 Jul 2021 00:00:40 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 w15sm5242886wmi.3.2021.07.28.00.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 00:00:40 -0700 (PDT)
Subject: Re: [PATCH RFC 0/3] mirror: rework soft-cancelling READY mirror
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210727164754.62895-1-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <eb6db91e-9b6b-331e-8a8d-ee4fcf60ff2f@redhat.com>
Date: Wed, 28 Jul 2021 09:00:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727164754.62895-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.07.21 18:47, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
>
> That's an alternative to (part of) Max's
> "[PATCH for-6.1? v2 0/7] mirror: Handle errors after READY cancel"
> and shows' my idea of handling soft-cancelling READY mirror case
> directly in qmp_block_job_cancel. And cleanup all other job cancelling
> functions.
>
> That's untested draft, don't take it to heart :)

Well, I would have preferred it if you’d rebased this on top of that 
series, precisely because it’s an alternative to only part of it. And if 
it’s just an untested draft, that would have been even better, because 
it would’ve given a better idea on what the cleanup looks like.

There are also things like this series making cancel internally always a 
force-cancel, where I’m not sure whether we want that in the replication 
driver or not[1].  With my series, we add an explicit parameter, so 
we’re forced to think about it, and then in this series on top we can 
just drop the parameter for all force-cancel invocations again, and for 
all non-force-cancel invocations we would have to think a bit more.

Specifically as for this series, I don’t like job_complete_ex() very 
much, I think the parameter should be part of job_complete() itself.  If 
we think that’s too specific of a mirror parameter to include in normal 
job_complete(), well, then there shouldn’t be a job_complete_ex() 
either, and do_graph_change should be a property of the mirror job 
(perhaps as pivot_on_completion) that’s cleared by 
qmp_block_job_cancel() before invoking job_complete().

Max

[1] Although looking at it again now, it probably wants force-cancel.


