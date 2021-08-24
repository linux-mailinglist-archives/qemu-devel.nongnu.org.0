Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54233F5FE2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:07:30 +0200 (CEST)
Received: from localhost ([::1]:51844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIX5N-0003G3-HT
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mIX3h-00012n-OX
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:05:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mIX3e-00015H-5d
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629813941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xPK5CZzeg09zUod38zqfO1bAsMuhG9aCNWpjwkbAWuA=;
 b=TqdfyjikSBobbF5b8smelMCem0RBlTvCD1KRABWm4D+s/eF3yTUOWD15xxyoBXdhYeuwh+
 JaoPY7427zkVhQURQc0xYRGyx7pl8KoLhXVceuYJBjWS70g080GiE+RzpfFPrNO3HuT3+U
 NPy9r95hp+BouR9q+jVGNTosqDD9pFc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-ta1OmBp7OLeFsqcNgr2FXQ-1; Tue, 24 Aug 2021 10:05:40 -0400
X-MC-Unique: ta1OmBp7OLeFsqcNgr2FXQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso1285355wma.9
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 07:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=xPK5CZzeg09zUod38zqfO1bAsMuhG9aCNWpjwkbAWuA=;
 b=f3S282JAPmzFyZ52LsAUwxgqdRQ9JALUVAGEwnWeKcNzoxqGEJNGKqNvHhnfKrNJ2S
 rDP4//7SB2YEztotM7R9xPEwTJ9XICtjEdsXP6g1tfIxO6QllgIvOixOnCRImQf7MXxW
 GpoELWwo9YMFLH0q2UL2XQ7U47JtmzvDWlPALDvdpfjSFo9loYDTGDM1aceE2PnyN8Vm
 S7rGed8QZ1QI4GypZJCos3tOuUHDqC5flACSjkGevAwczZsKvr00yAhPacDKZDcvOWSD
 T6uetWIw9sjjzIYTC8n4x9nfo+3uAD67NT9vxJ4oFCor6inR3hnCwrLFAJxIelGBAVUa
 66/g==
X-Gm-Message-State: AOAM530TZ3//xP04+oLHyJvMQJZm+WvvUfOOCML6u2ek8y4XyZOV7mV4
 f5+yWszFo3jFck/DizUHSDbWUr+B7V/8M0tcfFBD9NDRV6Se5Nkg2H0xL0GyVjpEqWfkNn/S1gB
 /bCsmTL2vZ8qt35A=
X-Received: by 2002:adf:f490:: with SMTP id l16mr17924703wro.136.1629813939046; 
 Tue, 24 Aug 2021 07:05:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaAruFE2AUtLnhDzT+WOVI4DYyKdZ+21M9OtPyurqRbaptUAPa2g4UPi+tmhJ1qMS+lsOvDQ==
X-Received: by 2002:adf:f490:: with SMTP id l16mr17924679wro.136.1629813938803; 
 Tue, 24 Aug 2021 07:05:38 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 r129sm2524510wmr.7.2021.08.24.07.05.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 07:05:38 -0700 (PDT)
Subject: Re: [PATCH v8 34/34] block/block-copy: block_copy_state_new(): drop
 extra arguments
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
 <20210824083856.17408-35-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <241e0759-2986-cbd1-163c-34095435ab50@redhat.com>
Date: Tue, 24 Aug 2021 16:05:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824083856.17408-35-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.08.21 10:38, Vladimir Sementsov-Ogievskiy wrote:
> The only caller pass copy_range and compress both false. Let's just
> drop these arguments.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/block-copy.h | 1 -
>   block/block-copy.c         | 5 ++---
>   block/copy-before-write.c  | 2 +-
>   3 files changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


