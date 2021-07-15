Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18453C9C70
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 12:09:40 +0200 (CEST)
Received: from localhost ([::1]:34554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3yJH-0005dI-TZ
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 06:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m3yGY-0002M8-0Z
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 06:06:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m3yGW-0005BU-7m
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 06:06:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626343607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=12o6OgnjDS/JYxiivb6sya8QZM1dpOsJkOLQnRYwNaY=;
 b=DWnHUOTGXwoKFf3FsVFF+kA1TBi8Qz+ghMA99U5jKiZh6bPW+sWNE4+vYBaDzatKd/60zb
 zFUIS9tqPkHkId/mErheHDiOqRnXxYpYGx7Hca1FJiloFoJlHRhZm4La+OpvNe/ShGG03P
 vVhZIL59VL3F9aETt28Davcwb8zuMNE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-lU-nQZDzPFKn7VZjoePLVg-1; Thu, 15 Jul 2021 06:06:45 -0400
X-MC-Unique: lU-nQZDzPFKn7VZjoePLVg-1
Received: by mail-wr1-f72.google.com with SMTP id
 j6-20020adff5460000b029013c7749ad05so3098736wrp.8
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 03:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=12o6OgnjDS/JYxiivb6sya8QZM1dpOsJkOLQnRYwNaY=;
 b=gcNLZPzDxooP34B9OqOiHe5qOpjagj0hwS22l+1nhAfFv5XxULX5JU+EzVB9MAI3Pn
 hCatfX66GGK7zsaKyt0YEe8wzWp9B35Oj9FDXJDHmFxKVob441sS3xa5xTJZ1XjxUwH2
 xVnWWs+TT35l7SK2dZJXC21Vm+dGFKkw6/0OMELWa3O3Ng8In5HVUs2DiRIsPkIWKLTV
 FCjQSTvjKPlt2OUnzFZsE2Vvx2YDvueFgnpPtZ6c+Dg6xLJxdYf+R2DdJFMsuAQN31/8
 6pDbtCqfCeTsAdOpScse9M4pfNpzeMh7cgFC/5gqi3OekAgjBxqocxocZdpfY1UV+PTA
 HLDQ==
X-Gm-Message-State: AOAM533eXvI58opJ15e0epNP65poGBjTy1He983f4mDpYszKMZtkSHCT
 vZ1DqbXeBgAwwfM28sSxCrvEmEG3wRZHIZpSD1E6OoPr6eQwo550W3WnJ2xjeM2rYR0yRnnGB+s
 aaTv1PF9qfzPhfFCvjgDSC09Lt4/fmvvxkn29dU9Mpetw89P77uUjm6xgndKLEnYV
X-Received: by 2002:a5d:4bc6:: with SMTP id l6mr4531762wrt.53.1626343603943;
 Thu, 15 Jul 2021 03:06:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygBAmf35Fhf51u+SHKHzKUIXVo+ytx+l42jYhu6XVmVPs1QpVgoXePUN65QjfAfMR3OpP9eA==
X-Received: by 2002:a5d:4bc6:: with SMTP id l6mr4531721wrt.53.1626343603704;
 Thu, 15 Jul 2021 03:06:43 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 b16sm6260758wrs.51.2021.07.15.03.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 03:06:43 -0700 (PDT)
Subject: Re: [PATCH v5 0/6] blkdebug: fix racing condition when iterating on
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210614082931.24925-1-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <803b52b4-ebd5-6453-c12c-875b43560497@redhat.com>
Date: Thu, 15 Jul 2021 12:06:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210614082931.24925-1-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.06.21 10:29, Emanuele Giuseppe Esposito wrote:
> When qemu_coroutine_enter is executed in a loop
> (even QEMU_FOREACH_SAFE), the new routine can modify the list,
> for example removing an element, causing problem when control
> is given back to the caller that continues iterating on the same list.
>
> Patch 1 solves the issue in blkdebug_debug_resume by restarting
> the list walk after every coroutine_enter if list has to be fully iterated.
> Patches 2,3,4 aim to fix blkdebug_debug_event by gathering
> all actions that the rules make in a counter and invoking
> the respective coroutine_yeld only after processing all requests.
>
> Patch 5-6 are somewhat independent of the others, patch 5 removes the need
> of new_state field, and patch 6 adds a lock to
> protect rules and suspended_reqs; right now everything works because
> it's protected by the AioContext lock.
> This is a preparation for the current proposal of removing the AioContext
> lock and instead using smaller granularity locks to allow multiple
> iothread execution in the same block device.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
> v5:
> * Add comment in patch 1 to explain why we don't need _SAFE in for loop
> * Move the state update (s->state = new_state) in patch 5, to maintain
>    the same existing effect in all patches

I’m not sure whether this actually fixes a user-visible bug…?  The first 
paragraph makes it sound like it, but there is no test, so I’m not sure.

I’m mostly asking because of freeze; but you make it sound like there’s 
a bug, and as this only concerns blkdebug (i.e., a block driver used 
only for testing), I feel like applying this series after soft freeze 
should be fine, so:

Thanks, I’ve applied this series to my block branch:

https://github.com/XanClic/qemu/commits/block

Max


