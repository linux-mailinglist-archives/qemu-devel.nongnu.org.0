Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F85B3964DE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 18:12:25 +0200 (CEST)
Received: from localhost ([::1]:50490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnkWZ-00039F-8g
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 12:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnkTB-0000Cd-Lx
 for qemu-devel@nongnu.org; Mon, 31 May 2021 12:08:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnkT8-00032Z-KH
 for qemu-devel@nongnu.org; Mon, 31 May 2021 12:08:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622477325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y5eDOYNYOClEMrQLgcCMib489cMcLv8YA4rlVy+EzBo=;
 b=fAzl8VInY9lOgXDjzwcVuDBz5J/LCk0NluWjrO/18Zxf/oAgBw57MkF0ByNH1VQxcXpg6X
 eYP1Vfp7ydZPY7KyllOJnjIY0S0lrfrvgXNhRSLJnklasxMa7DeeFMSf2sQy87FqB4GVZ7
 bzzV3ltY3JpOj5Jxm1xtX5xf4ko7kQ8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-DDECWHqHMuybFgUQmoDzXQ-1; Mon, 31 May 2021 12:08:43 -0400
X-MC-Unique: DDECWHqHMuybFgUQmoDzXQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 h18-20020a1709063992b02903d59b32b039so2584860eje.12
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 09:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Y5eDOYNYOClEMrQLgcCMib489cMcLv8YA4rlVy+EzBo=;
 b=unXvKrmVteIfruRhR2wSfGl9yyH8Q6hLZ2QHSozsg6fEBDeNWjSHvj/QT5YU4HK6+9
 gc90RKaH3t9l8MakhGIbW6lC0C3Esuk0woU03FxWHTmrKZCRbltHCQr74M2hLfqXK48J
 CYby9Qyf7CbljeCyCTHu0jUKv5/PaLGiIiMw2Nz7rT/9gtC6qn4uNFtipxEHLvY/e7Pw
 Bi41EjSUywinietlB1VtZsa/A0VwbOgg8ecvwRZmJuaK/J2awmlP/C+d+v4vAGDbH+Gn
 e82O81oCbxcFurWOpU3M+TwPydED1HRAaaYhCMLRSYzMzZ6lLd9pbUCoaAp1R0ENhoWj
 x81g==
X-Gm-Message-State: AOAM530RtYkc18mUHtVli2wBXzYAeOMjTDakZd2WoHJ48oEHPoaMAPlW
 ho7Cd3JiHK0/htTRhQNzVBycgsmeeDHjQHIMzebixoyW0BFoyDCOfdlWfb2EXy3Bkae59kFEPC5
 xcXd+/6mH4lTg1Hs=
X-Received: by 2002:a50:fd13:: with SMTP id i19mr1556102eds.280.1622477322418; 
 Mon, 31 May 2021 09:08:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFKOh64LlrC7IBsea3YnSJJZk2DKZDtuDnW+T2+uT4qgQl5OHlzhPHGE4YIg7aSVY0pTwioQ==
X-Received: by 2002:a50:fd13:: with SMTP id i19mr1556077eds.280.1622477322246; 
 Mon, 31 May 2021 09:08:42 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 p5sm6056679ejm.115.2021.05.31.09.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 09:08:41 -0700 (PDT)
Subject: Re: [PATCH v2 07/33] block: rename backup-top to copy-before-write
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-8-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <9c3ea19e-6203-d07b-7b99-9361d9ee9218@redhat.com>
Date: Mon, 31 May 2021 18:08:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-8-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
> We are going to convert backup_top to full featured public filter,
> which can be used in separate of backup job. Start from renaming from
> "how it used" to "what it does".
>
> While updating comments in 283 iotest, drop and rephrase also things
> about ".active", as this field is now dropped, and filter doesn't have
> "inactive" mode.
>
> Note that this change may be considered as incompatible interface
> change, as backup-top filter format name was visible through
> query-block and query-named-block-nodes.
>
> Still, consider the following reasoning:
>
> 1. backup-top was never documented, so if someone depends on format
>     name (for driver that can't be used other than it is automatically
>     inserted on backup job start), it's a kind of "undocumented feature
>     use". So I think we are free to change it.
>
> 2. There is a hope, that there is no such users: it's a lot more native
>     to give a good node-name to backup-top filter if need to operate
>     with it somehow, and don't touch format name.
>
> 3. Another "incompatible" change in further commit would be moving
>     copy-before-write filter from using backing child to file child. And
>     this is even more reasonable than renaming: for now all public
>     filters are file-child based.
>
> So, it's a risky change, but risk seems small and good interface worth
> it.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/{backup-top.h => copy-before-write.h} |  28 +++---
>   block/backup.c                              |  22 ++---
>   block/{backup-top.c => copy-before-write.c} | 100 ++++++++++----------
>   MAINTAINERS                                 |   4 +-
>   block/meson.build                           |   2 +-
>   tests/qemu-iotests/283                      |  35 +++----
>   tests/qemu-iotests/283.out                  |   4 +-
>   7 files changed, 95 insertions(+), 100 deletions(-)
>   rename block/{backup-top.h => copy-before-write.h} (56%)
>   rename block/{backup-top.c => copy-before-write.c} (62%)

Reviewed-by: Max Reitz <mreitz@redhat.com>


