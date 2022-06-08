Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC5C542F65
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 13:45:27 +0200 (CEST)
Received: from localhost ([::1]:39510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyu7q-0001NA-1m
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 07:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nytuL-0003xm-G9
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 07:31:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nytuG-000361-B3
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 07:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654687872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MSw1/AqMzgc6KUTiCUwkjsUznGE7dw/sBQdDGqcjOi8=;
 b=GSfhxMODhc6zf6J4O8hU+m+dg1UnI2vo10WAu9MmRWYChwf6Zia0SJkDqUyXvri2AxyZDy
 +6m5R3WPppZra1dgDBbg5fsWrxRPaGOh4tN46kyozMCAN5G9uIIH9ligm4tAFzWJAIW2g+
 urfW1CoyQfNi5asRe9wR2dQUCVFESqM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-GJWdKfFyM56LXJ7j3om7JA-1; Wed, 08 Jun 2022 07:31:11 -0400
X-MC-Unique: GJWdKfFyM56LXJ7j3om7JA-1
Received: by mail-ej1-f71.google.com with SMTP id
 l2-20020a170906078200b006fed42bfeacso9275940ejc.16
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 04:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MSw1/AqMzgc6KUTiCUwkjsUznGE7dw/sBQdDGqcjOi8=;
 b=6SBup567wOn4nLTs59WQc4NitonhP8cGL9qWVXtrLmM/Xf3qpaHSlAfYxFsSCfcvzw
 H5cIzvq/sXwFZlWfPGgvP8uaE3UQjd8VCN7NEft1BYaC7UvacshbG/KR/n4hwvN7oGcj
 bpBBv6jkNMaNrA0VT8IYRbKOawqc73xReZ9vf8+hkq/1oQsus6jjzdahcudSBTViYrMO
 fmegBfjYz+iKh3iVs50lgrEuwmpeJQrng5+BTlXqze/lxH3O3bI26vAX87CzMjGgdblY
 8AxnnPyNm0U6I+R5+B2Ag5oDfsVSl9I8nofqhwQqng2Sz53nzJLezicNFCFiLYEG+DLG
 lHcw==
X-Gm-Message-State: AOAM530+GQdEyTvWEpAJcCWrJfOhYqbKiB9ja/Be0wQVoyo3O8rf62/I
 89vwrCPEJ+xcMmxYbbvl1wn0YDzp1dxXfqvbVnzHc4LWIxuTQ6FPLg3ZZa+NmRC98gTnfy4+Iln
 BJZ0oJmnxuAqX/Jg=
X-Received: by 2002:a17:907:a064:b0:711:c819:3cbf with SMTP id
 ia4-20020a170907a06400b00711c8193cbfmr16758718ejc.460.1654687869924; 
 Wed, 08 Jun 2022 04:31:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyjgWSGjhJw9Nx1CJZFGpPO9VxHgAbq5VPSu0PwZLD1K4xVmSL/T6Ol8vwAUryPQgNxipYqg==
X-Received: by 2002:a17:907:a064:b0:711:c819:3cbf with SMTP id
 ia4-20020a170907a06400b00711c8193cbfmr16758698ejc.460.1654687869704; 
 Wed, 08 Jun 2022 04:31:09 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 u2-20020aa7d982000000b0042ab4e20543sm12030097eds.48.2022.06.08.04.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 04:31:09 -0700 (PDT)
Message-ID: <2543860d-c98f-47a8-0160-83913f87c94b@redhat.com>
Date: Wed, 8 Jun 2022 13:31:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 20/45] block: make permission update functions public
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-21-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-21-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
> We'll need them in further commits in blockdev.c for new transaction
> block-graph modifying API.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block.c                            | 7 +++----
>   include/block/block-global-state.h | 4 ++++
>   2 files changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


