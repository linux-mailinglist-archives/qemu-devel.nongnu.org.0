Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512E049CF30
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:06:57 +0100 (CET)
Received: from localhost ([::1]:55846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCkox-0007Cf-5s
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:06:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nCkh3-0005Eg-4A
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:58:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nCkgx-0006pe-BM
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:58:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643212712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6todBIh0yqbjP2w3uTm/a8Z9ErnA64pTBo02dXd96us=;
 b=VNA0iaqBSsx0OZLJJ4lKvMdo2ERTDHHWkr11w4dEsLhGt4F8xJ9XBecb6wR8e21f1GZRXe
 2In/sbrbybuAz860wpZ1Lk1wG6Nj0HZrQrMmho1xCzqXNDLJPoD/+6d78dyPjyjjhPKAZR
 K8O/L2WdppaZpWn8jpR2iHrNyFnzL6k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-81E4Au9mN5qGv5MprJuUHA-1; Wed, 26 Jan 2022 10:58:31 -0500
X-MC-Unique: 81E4Au9mN5qGv5MprJuUHA-1
Received: by mail-wr1-f70.google.com with SMTP id
 i16-20020adfa510000000b001d7f57750a6so4468000wrb.0
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 07:58:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6todBIh0yqbjP2w3uTm/a8Z9ErnA64pTBo02dXd96us=;
 b=RHF854YYQeDJwD+3PSSWPJyXweNfX/5MiHgcs4ktZ2g2AHi8MmJaQGFGROApNMBAv/
 EJQ8r1ynSJ8Jlym54OpaE2zRoFpWEEt8mI/JH+p9u6APAhr5OPpe+YrRLDLdRQqWH+qB
 PhzK0uYMDxPqfovlpAjm31Nk4o/nlKI75dV7kShM7p715XARRdn1WT29jDh6m+JjhEww
 nI8aLLO/cO5HmY0T04QEDHZTo6MkLHm95n6342xy4z8Emvk/2knuNqPLpCZzPkEXfaCr
 +koYDTlm+vn80fztwTB25x95YCXJKbFcS8QhVPhiQ7qbJGwRoqpR7uRgoXYStKFo1LyD
 R0yQ==
X-Gm-Message-State: AOAM530NoeOOgdVgU1kgBi9+xi9EIwOR7fSggMjMprO6Zxi6I6ArMVPm
 Av7uWkheKxqF+qWweLIbOQxw07pK/Qn6lfkznoIfJiMYv6O0ukdsvc/IVLJcP4qyWK4aiedNiCg
 heh568hUdwmiuXEs=
X-Received: by 2002:adf:e19a:: with SMTP id az26mr8150804wrb.665.1643212710546; 
 Wed, 26 Jan 2022 07:58:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwALFjYgPPEozsDxdLYyfcdQDDMGseFGf6S/sZt42IumdQdTgk1VgpRYXnv/kYGe4ErK4nTsw==
X-Received: by 2002:adf:e19a:: with SMTP id az26mr8150783wrb.665.1643212710332; 
 Wed, 26 Jan 2022 07:58:30 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id z1sm3675083wmk.32.2022.01.26.07.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 07:58:29 -0800 (PST)
Message-ID: <ce1c3a14-4b70-0e25-c22e-85fcfedab87f@redhat.com>
Date: Wed, 26 Jan 2022 16:58:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 14/16] job.c: use job_get_aio_context()
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-15-eesposit@redhat.com>
 <19305447-1ba0-0646-1c81-83b83c56ba79@redhat.com>
 <4565cc3c-f472-e261-7ae3-e92253f1f3d6@redhat.com>
 <9d458486-9ed7-1fae-28ff-84ee3d7e34f8@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <9d458486-9ed7-1fae-28ff-84ee3d7e34f8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 24/01/2022 15:22, Paolo Bonzini wrote:
> On 1/21/22 16:18, Emanuele Giuseppe Esposito wrote:
>>>>
>>>
>>> Better to use aio_co_schedule here, too, and move it under the
>>> previous WITH_JOB_LOCK_GUARD.
>>
>> Unfortunately this does not work straightforward: aio_co_enter invokes
>> aio_co_schedule only if the context is different from the main loop,
>> otherwise it can directly enter the coroutine with
>> qemu_aio_coroutine_enter. So always replacing it with aio_co_schedule
>> breaks the unit tests assumptions, as they expect that when control is
>> returned the job has already executed.
>>
>> A possible solution is to aio_poll() on the condition we want to
>> assert, waiting for the bh to be scheduled. But I don't know if this
>> is then useful to test something.
> 
> I think you sorted that out, based on IRC conversation?
> 

Yes.

Thank you,
Emanuele


