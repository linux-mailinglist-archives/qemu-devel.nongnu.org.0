Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE323F2AB9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 13:06:35 +0200 (CEST)
Received: from localhost ([::1]:52786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH2M6-00030Z-Uw
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 07:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mH2JY-0000UD-1d
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 07:03:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mH2JW-0000lA-It
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 07:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629457433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRWUW47iR8kF2vUfVfxbxomZmMCG/GAvUYEee9Am/KU=;
 b=Us/WxU2x06IoXiYsvzfYJ3/qZPVREYZhI+Llq4dbj8nkARE8f2RsAuW8yPARgLY3p1dl3w
 x4820gn3l1JkScyKMBcr2cjapmoebSCow4xaa5QDdZZkx51j3fDjSUVVV2lmgdpJSFTRP0
 J1svcaSdBtJyq+nTGT8XAK8cZCVwDP4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-3xgMDndROMSRu0oKl66Jhg-1; Fri, 20 Aug 2021 07:03:52 -0400
X-MC-Unique: 3xgMDndROMSRu0oKl66Jhg-1
Received: by mail-wm1-f71.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso455738wma.9
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 04:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WRWUW47iR8kF2vUfVfxbxomZmMCG/GAvUYEee9Am/KU=;
 b=Gbn5DjYhFiawBgGqfr4HXkTZO/ZPvmt8DUN3rM7C6VOdqtbukug6Pf8Ur/pp+Ll2Am
 8bKcy5iXU+V2pLPgnsTKrUg03iaeqJdq5XmT4FDJDJcW7AslB5eRYGObEN1uCq2WLWRZ
 yWQ2EdaVn/OSVmNDkfjnjtF2UTjuYu4I1ZCfLM4TCWch1MygcwXm3RCcNguGs2v2U2EN
 SaM2PaDn5B9gnvTYWzx9j24moVOs0TPmY7nTDAolayuMmKh+/qyWN9QfpSfjnnX8SYq6
 tfkk2VWThDXxm1lyGwKQeyU+mDmAegipAfexUvxybtobVgT/SsKmYbA8KaZlT84QMZ9T
 +LkA==
X-Gm-Message-State: AOAM533/xmsRoRK5fyEWU5uybw1SjEzRpFa6LKTd5Iv5HnMQrOZihNpV
 vngtMFf+215YIXb018gwAtWj5ThiONjrFpwoUkHR4WjYTPq7cjoJMZa0qXqQBVzhd4fcWjPZ7nM
 sWhOHH2eLh5ODzdI=
X-Received: by 2002:a05:600c:1c08:: with SMTP id
 j8mr3261280wms.138.1629457426621; 
 Fri, 20 Aug 2021 04:03:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrtXr537bE9rp8fMivJRI62sSfYEWyMuSBQEMzn/0Z/4UgNfZWD/PUoGAwTpW37pETMCUZkw==
X-Received: by 2002:a05:600c:1c08:: with SMTP id
 j8mr3261161wms.138.1629457425413; 
 Fri, 20 Aug 2021 04:03:45 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 q22sm10133961wmj.32.2021.08.20.04.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 04:03:44 -0700 (PDT)
Subject: Re: [PATCH 2/3] qcow2: refactor handle_dependencies() loop body
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210724133846.64614-1-vsementsov@virtuozzo.com>
 <20210724133846.64614-3-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <74b2b0d1-62fe-e853-ada2-a4f0c598448d@redhat.com>
Date: Fri, 20 Aug 2021 13:03:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210724133846.64614-3-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.07.21 15:38, Vladimir Sementsov-Ogievskiy wrote:
> No logic change, just prepare for the following commit.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/qcow2-cluster.c | 49 ++++++++++++++++++++++++-------------------
>   1 file changed, 28 insertions(+), 21 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


