Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AD140F7FC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 14:39:14 +0200 (CEST)
Received: from localhost ([::1]:47698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRD97-0006fS-R0
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 08:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRD6l-000589-RU
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 08:36:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRD6h-0004UB-HU
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 08:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631882200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CaoOzV3ClwXcIjBUc4Qk1fBprm3Qyt/HQEFXy1KxM+k=;
 b=WQvmoxByiVCjDNxsb7YqSqXHpJYqu6xpWgfq7tcp5kqwMANlLkHHOrLbeNQgAZrO8BvCpX
 AkQJK4U0SU7jsv1vdk9fVR3wEGVVrPKIBVm+JwAjH2QRHDy5IxEIKEH3NT0QpGwrQNTK+E
 ydUkBFkBFkZhqjImYkkLMQf9RuYN3AU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-6loau_M5OuCrkym5z0uELg-1; Fri, 17 Sep 2021 08:36:37 -0400
X-MC-Unique: 6loau_M5OuCrkym5z0uELg-1
Received: by mail-wm1-f69.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so3681007wml.5
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 05:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CaoOzV3ClwXcIjBUc4Qk1fBprm3Qyt/HQEFXy1KxM+k=;
 b=aK9SpD/wKm7faikv5qJE/rAVfs0fL7q6sXLXWuVshVPTzowqyHRMUi3bVMBH4g/IF8
 a9Tt1J85mzdLjbHJCIJPdwnSkkfTF6orU7lxa4yHkZBMyPhMAaSrGPKhePMxJQ8XA9cP
 V+f82slY1byLrBXRbaUZV5WAi5KPpq82PFkeS8aNUQgWyY+AnyN1ACi2EVFTv7Bmg+Ek
 EAEbQj2KIRngThwByjhHyFs4VlHLN4W8Lczpt1woubEEiGejZoUCnF5Ch+72cCxga/I9
 yFAYdjYICXyoE7lY/InJyCqQlnvY/kQoi2qKRZLIR7uj0y+9NbXdGCijE14U+zocUSKa
 ntAQ==
X-Gm-Message-State: AOAM532td/nGF3UXWRX5KWg2oXFc890Lr/BTb+AlQQe0YBRWMpw3M+LH
 oU1gOA2COl80szz1ceJfBaty5vESqxx7ORzqvPeRsspPQobQIzx+6Z4sFP8e1qWLjIDcNLjcG0I
 lfbB10Y+2xMZWRGw=
X-Received: by 2002:adf:e806:: with SMTP id o6mr11422339wrm.239.1631882196532; 
 Fri, 17 Sep 2021 05:36:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaMPFccj/Fal440q8Vwjfz+tKhrsWrg8tfX8YMYBQ8nJA6V7A0EL2DGetlDwZJoS5VwZVI6g==
X-Received: by 2002:adf:e806:: with SMTP id o6mr11422322wrm.239.1631882196314; 
 Fri, 17 Sep 2021 05:36:36 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id h15sm6403208wrc.19.2021.09.17.05.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 05:36:36 -0700 (PDT)
Subject: Re: [PATCH 03/15] python/aqmp: Return cleared events from
 EventListener.clear()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-4-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <19e00805-83cc-f0bf-beea-1ac6ca0472d8@redhat.com>
Date: Fri, 17 Sep 2021 14:36:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917054047.2042843-4-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.09.21 07:40, John Snow wrote:
> This serves two purposes:
>
> (1) It is now possible to discern whether or not clear() removed any
> event(s) from the queue with absolute certainty, and
>
> (2) It is now very easy to get a List of all pending events in one
> chunk, which is useful for the sync bridge.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/aqmp/events.py | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

Not sure if `clear` is an ideal name then, but `drain` sounds like 
something that would block, and `drop` is really much different from 
`clear`.  Also, doesn’t matter, having Collection.delete return the 
deleted element is a common thing in any language’s standard library, so 
why not have `clear` do the same.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


