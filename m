Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84893E7C03
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:21:10 +0200 (CEST)
Received: from localhost ([::1]:57866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTYz-0003RK-Ro
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDTWn-0001MN-O1
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:18:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDTWm-0001d2-9J
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628608731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=euxV1ft7EQGh0WeLhJpctk0zHQ+lta8iIwBOUfNWamQ=;
 b=hXTApbI9/WzXeHbn9eth1mMO4mh29qO/KGoBnH3tcdB7CplDxiL2FTuR2V5huApdEJ+sno
 HEVjCRrvkqt+HxRBXRMrqjb7Bmtx2Kb7vNYzgY08oJbkGY4gd7fqIYjVaP+HFBKJVLSBY3
 gjGQOPVh5pRwJHxI2592zJWTUNEh8wg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577--8tSIXHwPbC5hlL4Q-Mgag-1; Tue, 10 Aug 2021 11:18:50 -0400
X-MC-Unique: -8tSIXHwPbC5hlL4Q-Mgag-1
Received: by mail-wm1-f71.google.com with SMTP id
 i6-20020a05600c3546b029025b0d825fd2so1105542wmq.4
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=euxV1ft7EQGh0WeLhJpctk0zHQ+lta8iIwBOUfNWamQ=;
 b=SMqnrq3jCYTfx9N4P2QVNlfXskdWXpj0meBo2nqURcp7P2AzcfVv+/Rxv6OYGMV0k4
 aGKmwRcMx+/shRrkbKPMqQIAlK+MAWg++ht18N1JTx7bk28oYszLchK78T/ZRhOw3fH+
 M21/z81WhnpQQm2UKHPnMoMUGGj4BlipCkujrZ1bWmX+/NHqQD5RjiR4z3Umk9o0vH+m
 31+4OFABPT/OnJClnVeR7/4KBu7++5EUSAKmEr2FgktHdz9EqkzucQooD3dWhRHOcjgg
 C/sUw0qO0spjkvekmgPvuYetDB0a3XC/xt5aTlWDR3NeCfD5kCwzDlDM+KGz/VbDqWUD
 LXZw==
X-Gm-Message-State: AOAM530/04inE8D1PASGnMtBkbRJw/HXk38wK0syprIbn/opz2yGzOhD
 M2x1ZPpiDHpBpZKmtFi7GGhHbeE8kv+6kF8nw59kPTos/oaagnUm9TglYO0Si/oxE8ccGIz7lLV
 dhR0X1wu0YWxfy2A=
X-Received: by 2002:a05:600c:510d:: with SMTP id
 o13mr9820870wms.123.1628608729495; 
 Tue, 10 Aug 2021 08:18:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9wk6gM/7KWgNHyqxKD944X+q/9iCNjuHiokK3ZcgON+pHgMk9Svl2+lOj5OeDw8G4PrTvVg==
X-Received: by 2002:a05:600c:510d:: with SMTP id
 o13mr9820837wms.123.1628608729264; 
 Tue, 10 Aug 2021 08:18:49 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 x12sm23953286wrt.35.2021.08.10.08.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 08:18:48 -0700 (PDT)
Subject: Re: [PATCH v7 18/33] block/copy-before-write: cbw_init(): use options
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
 <20210804093813.20688-19-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <59360fa7-f5b0-1e98-d2ad-e11764e894d9@redhat.com>
Date: Tue, 10 Aug 2021 17:18:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804093813.20688-19-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
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

On 04.08.21 11:37, Vladimir Sementsov-Ogievskiy wrote:
> One more step closer to .bdrv_open(): use options instead of plain
> arguments. Move to bdrv_open_child() calls, native for drive open
> handlers.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/copy-before-write.c | 29 +++++++++++++++--------------
>   1 file changed, 15 insertions(+), 14 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


