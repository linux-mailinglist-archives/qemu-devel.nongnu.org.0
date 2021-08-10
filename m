Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14C83E7C19
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:24:54 +0200 (CEST)
Received: from localhost ([::1]:42396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTcb-0003iE-M1
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDTb5-0001aO-0X
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:23:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDTb3-0004po-Lg
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628608997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lvc3x+dirx6YMyBNXJ1UxWjJ+TTnQ7zlyqtVFE/qnf0=;
 b=eZmrNbEJrG/DnVEjB8VRxgr88W9zUaL/sHQidtb4qT4AUAbe3ELmHbDj76ibsKTvAZ5mKK
 a4hQgYo6R/CikzxvbmaUiKEm6nireCOgZxHlYb9jKdoJjgSQgj7JIMr8fW0AMGmQODSCgr
 envqpgEjxFnhkcHqNR/SbxrFNMxehj8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-AdKRIxGPOm6drLGun0jlHw-1; Tue, 10 Aug 2021 11:23:16 -0400
X-MC-Unique: AdKRIxGPOm6drLGun0jlHw-1
Received: by mail-wr1-f72.google.com with SMTP id
 o11-20020a5d474b0000b02901533f8ed22cso6519190wrs.22
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=lvc3x+dirx6YMyBNXJ1UxWjJ+TTnQ7zlyqtVFE/qnf0=;
 b=J7grTANoITWhk813zdO6LqSGowkZrhtEy6I8kBk+ZHlelqCy58tGa8NR9Jci2DTwqy
 s9G/7JRH9bF92w+3hIbccKfReH6wPucKKnRtdMou/1qSohZF+PiVY6V2ZdHs7Lnt2DWT
 ZOlgP94Jgbt10f6f8ec5zTRY/OEJyYgIRPiaENSAmQ2YT/N5SwNwc4N/asL294AmRutr
 cgMtaoitR48TRv+uCyKo+5IaDa/vFeYNbcargbQEZIbRIiIvb9lbOPcKvLWu5Ux6HmBn
 i8uTqARSklFSxKpcLhfa2H7pIzjLTFKS+H8R3uTLkbrTPzjnsBNTLAeh3cMVHL2uZkr9
 8C6g==
X-Gm-Message-State: AOAM5336SkctGl/CqTLJBE1ZLtiU6BxPjlI7XejjpKBTRtqqMso+5vVl
 +w5ttM/tCm0WSHiVAVw3e+Y+oeyG2s8AIAsqjCmQHN7Iw11oSXhkkm2dL9E5kuVXMgUrCModCOd
 SIXOrWidHufsmkI8=
X-Received: by 2002:adf:f90e:: with SMTP id b14mr30203417wrr.28.1628608994719; 
 Tue, 10 Aug 2021 08:23:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyul8bmj4KaQSjZgMSmYgfISWR1WzqCOq/sn0fjNqFSNFcMod8+zufjpJgfhOZ9UvN51icZxA==
X-Received: by 2002:adf:f90e:: with SMTP id b14mr30203394wrr.28.1628608994545; 
 Tue, 10 Aug 2021 08:23:14 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 t1sm23081642wrm.42.2021.08.10.08.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 08:23:13 -0700 (PDT)
Subject: Re: [PATCH v7 20/33] block/block-copy: make setting progress optional
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
 <20210804093813.20688-21-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <7d1fe858-2400-b67c-e934-d3d2f3fe5c11@redhat.com>
Date: Tue, 10 Aug 2021 17:23:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804093813.20688-21-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
 pbonzini@redhat.com, mreitz@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.08.21 11:38, Vladimir Sementsov-Ogievskiy wrote:
> Now block-copy will crash if user don't set progress meter by
> block_copy_set_progress_meter(). copy-before-write filter will be used
> in separate of backup job, and it doesn't want any progress meter (for
> now). So, allow not setting it.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
>   block/block-copy.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)

(Sorry for the accidental reply to v2...  I’ll just repeat myself:)

OK, looks a bit different from when I last reviewed this, because of the 
rebase on e3dd339feec2da3bcd82021e4ce4fe09dbf9c8b4, but R-b stands.

Hanna


