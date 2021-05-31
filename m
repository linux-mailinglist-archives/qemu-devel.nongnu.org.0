Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211DF39667E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 19:07:46 +0200 (CEST)
Received: from localhost ([::1]:35074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnlOD-00016c-5R
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 13:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnlKg-0006UI-JG
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:04:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnlKc-0004jZ-Oa
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622480642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rz+26zXvyIRyKqOPeme/9z6+kCYE/NzyRjjueiOUrp8=;
 b=FSAxsBxp+XsUxENlRgy21FY6C0nNUatX5LhBuK2BBt+gSfkOiCznfzZMifMkze51k1lxck
 gwcEZsvzPiQw6YeV/4NpQ85/XmP7fDZuj2EHnFJjKJVP4jnuroN+l10yQ8OaLu/hFCcTab
 VSbqDl6+mZVysd9VsWVX1h3BKD3PzmQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-WKtSPIPNO3iy0UHxeENMDQ-1; Mon, 31 May 2021 13:04:00 -0400
X-MC-Unique: WKtSPIPNO3iy0UHxeENMDQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 i3-20020aa7dd030000b029038ce772ffe4so6501421edv.12
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 10:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Rz+26zXvyIRyKqOPeme/9z6+kCYE/NzyRjjueiOUrp8=;
 b=QGf6O9TWp6BGN4jXuirNRyqLg53fT1ERTRCcZLF4PGVkn+b6EbMzJ4eMEMW1Ah3US+
 FCmnewc1Mpxe72bQYobVrpl6gWN5HWZMpc5K6KhSii7C2yL2jGrHgdlY1M4gb1h3uVy9
 qz+wKKaRN10+2U08QTHmAu076j6VeG1QxpWtwveSv88fpIlrfGb+BRwGlaOMUHX+0/ZA
 tSQiKsmiB8vgLYuieWlLc2pxXIBGBntDb72YnkIcutvBvvpzL/WLbHcE2VABv3V1BDdO
 STbvgavdfxixhTRlqHM2Lh0knFH5XQoGTaXjKP0PdHw3to3FuA7SNtrYn5HlM280A5jD
 kkFA==
X-Gm-Message-State: AOAM532znZuqnvCMIUOPTlfMqi8b14poxe/Lm/XUuRKrb4zBolM2F4xY
 2o15GGCFIZs6a/vKg7viAw1/fT3nj/I881Dsv15wM1pEkbK16GzFbBYZVuN0yKzpedfHudpIMVo
 nMxaWSf2NdBfyWTE=
X-Received: by 2002:a17:906:3b92:: with SMTP id
 u18mr23854846ejf.450.1622480639018; 
 Mon, 31 May 2021 10:03:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyj6YB6B+z5DT8aNoDUOHEB1Y5IaRbtTupfTuxqs82+lNdGvv1h9KsO2AtKevrWnslchNbFCg==
X-Received: by 2002:a17:906:3b92:: with SMTP id
 u18mr23854801ejf.450.1622480638689; 
 Mon, 31 May 2021 10:03:58 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 d24sm1612967edp.7.2021.05.31.10.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 10:03:58 -0700 (PDT)
Subject: Re: [PATCH v2 18/33] block/copy-before-write: cbw_init(): use options
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-19-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <7bee0d37-73a5-707c-9a22-57bfebabb0ac@redhat.com>
Date: Mon, 31 May 2021 19:03:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-19-vsementsov@virtuozzo.com>
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
> One more step closer to .bdrv_open(): use options instead of plain
> arguments. Move to bdrv_open_child() calls, native for drive open
> handlers.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/copy-before-write.c | 40 +++++++++++++++++++++++++--------------
>   1 file changed, 26 insertions(+), 14 deletions(-)
>

Reviewed-by: Max Reitz <mreitz@redhat.com>


