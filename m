Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FB2542E24
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 12:44:10 +0200 (CEST)
Received: from localhost ([::1]:41818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nytAW-0002aY-4S
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 06:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyt7E-0007ww-GY
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 06:40:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyt7A-0001Yg-Hc
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 06:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654684839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0yrUFq2Ctap6NzhZFUU+6VGG8bAe1aO80+Og9/WrdIk=;
 b=gxfS5v0GavflVsgAhJHqvz1YgAKEYdB3EJkcrlNIlJ94Dq5pEQAQ25cmHe0g5/INtRf9Q1
 vLa1u1p0cyXDJBtnP0VOUcq/k8H744Mg0qPWh+WueoN0bvA/MbHS4hgBQX6DMGpDtSjXNT
 SkfDIf8mTpViwo5pdBfC23vWF86kzg4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-1TMbGSJLOkKEGwL_EW7ozQ-1; Wed, 08 Jun 2022 06:40:38 -0400
X-MC-Unique: 1TMbGSJLOkKEGwL_EW7ozQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o2-20020a05600c510200b0039747b0216fso14249344wms.0
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 03:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0yrUFq2Ctap6NzhZFUU+6VGG8bAe1aO80+Og9/WrdIk=;
 b=Vcqx7GQpi0g66G1tXzD4WjdQd4MDqRGnHsOd6sPV/lxBkFgm8a0nAPP2EETnUTAPWc
 HmbfGWWTwBPPvCl/wtUcuH03Yx8Lyc1TkxLlFko3j69GiET+PZrqnEu7wHYlSfBlZ/G4
 wGhwfhomrLTruRLMaJDpQATbI17JuOQok8aY7V25EZP31iaFW9A9FbNIC8k631GpHOxZ
 5owkiE0vj3x7pOnh0kQ7OXEjhrKH3yB+d9yV99DbsCB2gypnthwLmbK+ToIRxtDGUna8
 ZPcus/DSCWr2xPrV/tmHIZKWy1b4gVB5qv6lBdC2+bhtlzgFal3L6rGuB67vZU5FjttT
 hbIQ==
X-Gm-Message-State: AOAM531yjuOl7WGhsDNGvQtbayCPH5pPGEH+y1sgR52kqwpX29TGwPL8
 RhiWqKRFxYDULX0uD8gcoO5mWIXZgebF1ebe6A6udnu3xEhaDBBypjvlbmzi0DHOHYNMeUoIX7x
 wjtbb6ab4Vi9xe9E=
X-Received: by 2002:a05:600c:4e10:b0:39c:58a8:f828 with SMTP id
 b16-20020a05600c4e1000b0039c58a8f828mr9666436wmq.44.1654684837044; 
 Wed, 08 Jun 2022 03:40:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF2Z3EiR15WPmIgtEdVE4kWhb51j+ZVBiR/MmLcWpmmtRI3zqwuFUkotuTBsW/e1WXPOdzAQ==
X-Received: by 2002:a05:600c:4e10:b0:39c:58a8:f828 with SMTP id
 b16-20020a05600c4e1000b0039c58a8f828mr9666411wmq.44.1654684836767; 
 Wed, 08 Jun 2022 03:40:36 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a056000054800b002137b2a233fsm21841683wrf.36.2022.06.08.03.40.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 03:40:36 -0700 (PDT)
Message-ID: <89c5d0b1-a8fd-040f-d538-b4a2b2fec7b2@redhat.com>
Date: Wed, 8 Jun 2022 12:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 17/45] block: drop bdrv_remove_filter_or_cow_child
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-18-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-18-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> Drop this simple wrapper used only in one place. We have too many graph
> modifying functions even without it.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block.c | 15 +--------------
>   1 file changed, 1 insertion(+), 14 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


