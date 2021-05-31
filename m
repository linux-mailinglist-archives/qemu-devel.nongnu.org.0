Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0578E3966B4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 19:16:32 +0200 (CEST)
Received: from localhost ([::1]:53506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnlWh-0005Im-1K
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 13:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnlRQ-0006qL-L9
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:11:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnlRH-0007vv-Tk
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622481054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QpeTrXQ6sx/Wgg4wnUYCfUJmDWpCz2pWRRW8MiE3E78=;
 b=CWdaUaSmjsVANZOXLtKwicZcuX9PF7O6CnJxYO+M86YKLxESbXMxHUurY5j8RT2hwojpQr
 yNCcKa968fM0mXLs7Cn6CktAkiC04oGg5g+ec6bUgghUm2vwTIJ8lMBbVlRQzjksAGDscW
 ugcjOX9/at/Rx6afSf9E6zFwajmnT1Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-iustxAFfODGRJ75f2101dA-1; Mon, 31 May 2021 13:10:52 -0400
X-MC-Unique: iustxAFfODGRJ75f2101dA-1
Received: by mail-ed1-f69.google.com with SMTP id
 j13-20020aa7de8d0000b029038fc8e57037so5031364edv.0
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 10:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QpeTrXQ6sx/Wgg4wnUYCfUJmDWpCz2pWRRW8MiE3E78=;
 b=eSlh5pbQ/qZyTfwmViyw3EH+BNufQXvmTgfL0H6vGcWdEhP998C+IQWzu8zpCzyvJ3
 8RSgzj/mxNred3QWR/+RKWrFfq/LdvDjgWeT8yEW8q2d+bl0H50wOdsZrE1E/VniHxWR
 mgqOB6ALyWO2Y2Xp5ad2ne3hfz6V9jaRPHyy3KJPEyDPybRkP4uBJSkFboehsxffGPNf
 eE64ing/j+yYzh39zrAUoGkb3EG7azcc5OC/DXyXMUuGyZVp1mh1GE8W8FSFJr19tHEU
 dfpUTiYe8XchhGfWuU3Tr5zLrafheGPcA0KOCvl1xa/WNDk7lsvVySQLmCS9EXEv1SlU
 2HBg==
X-Gm-Message-State: AOAM530B8qdr+6NngLq8dAfeRixObyN67J4cvvts8yOCfXhjSZOosapV
 suSSU9B6+Aq/TIVMkJK3LS1G3s0+pyMxOlgtlLs+BKYxVVXXvPaXrvuiMNxtCD0NzfisexPGtha
 BjJYRqi5I8wXBahA=
X-Received: by 2002:a05:6402:2681:: with SMTP id
 w1mr26490243edd.223.1622481051707; 
 Mon, 31 May 2021 10:10:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywvOxEVk5CLuQoJuC4SI1h1j3Xw0fQwDsDor0HywLzlMHxC3HVKkQV5UjTd7NQTAxJeND1Hg==
X-Received: by 2002:a05:6402:2681:: with SMTP id
 w1mr26490200edd.223.1622481051435; 
 Mon, 31 May 2021 10:10:51 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id y1sm339640ejl.7.2021.05.31.10.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 10:10:51 -0700 (PDT)
Subject: Re: [PATCH v2 19/33] block/copy-before-write: initialize block-copy
 bitmap
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-20-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <917bccb5-ff37-e8e4-6bc6-9c2bfd6a657f@redhat.com>
Date: Mon, 31 May 2021 19:10:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-20-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
> We are going to publish copy-before-write filter to be used in separate
> of backup. Future step would support bitmap for the filter. But let's
> start from full set bitmap.
>
> We have to modify backup, as bitmap is first initialized by
> copy-before-write filter, and then backup modifies it.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/backup.c            | 16 +++++++---------
>   block/copy-before-write.c |  4 ++++
>   2 files changed, 11 insertions(+), 9 deletions(-)
>

Reviewed-by: Max Reitz <mreitz@redhat.com>


