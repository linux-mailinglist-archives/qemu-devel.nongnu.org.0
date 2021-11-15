Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FF1451868
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 23:57:15 +0100 (CET)
Received: from localhost ([::1]:37010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmkuY-0007eG-Sz
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 17:57:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkpK-0001Fu-8w
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:51:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkpG-0004mL-AS
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:51:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637016703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3LUU1b99Uo6aTvIFuJ9xKIsbLlxBwOQhWYhSW38BwGQ=;
 b=fwy5jBBzgvLr7xcBDUWU/NsS1Xn58XVHKMz6EchqHFrxy3cARGcSCj5aOPZlcLdoWmJrxY
 7aYsrZ0phAbq9JVz9nCkGd1NNetq+aSBNrHGMxDZfpGlxF6deZWBFh9mKzFOFycZwudrps
 LSWGrqt6l11TgHKqApVy0hwL9nMD2tk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-Lg4t452mPjiiaSrJwMUdhA-1; Mon, 15 Nov 2021 17:51:42 -0500
X-MC-Unique: Lg4t452mPjiiaSrJwMUdhA-1
Received: by mail-wm1-f72.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so253196wma.3
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 14:51:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3LUU1b99Uo6aTvIFuJ9xKIsbLlxBwOQhWYhSW38BwGQ=;
 b=eLqy0yBlaQA2Z5xOYBgLNGwwvN/cvMlttHM3zyhxHIb3AfbBogG//fthrcNXUz3z8V
 lWlqxcIZH0qXt3P0Shq0AVf8OxAHtYcEhaFe0GKRBUIoXgkDnLDGaSxoo+snD3avktb1
 nsqb58CUs9DLr2MMWyQyWlDAERY7upfPOevSxs1b9DAnwt4VrnRLkAaiu+TbWP/MWBCm
 K9k3AoR1KsdvSCW14GQKo+VNzLl/QlxiVCA48Vr7y/KrvirvwUH7ZlUCp65ffZmiQuE0
 sqEV8aCUnT2/Fzp8LVGyxEJ3zgRoObE9BOZNl99uAmsmT11VXYnu8U1sANQNOmaKm941
 uQgQ==
X-Gm-Message-State: AOAM532imNSOvPH2Y3FmcCLlbu5qePYa/pfXcNthsZ++iAUvLePxAe11
 OSOiBeh6lrsPlQtTrItSVknhU9sY1zoq5thKacKwSixpigk54ctTkYR6qpMkTm3ZggA/i5D8u2j
 8JbMbxiC1QLQPe54=
X-Received: by 2002:a1c:cc09:: with SMTP id h9mr2352845wmb.191.1637016701413; 
 Mon, 15 Nov 2021 14:51:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwB6W+8IERZg4KQlwka6KF+57G4TViXWlexqy8r0gbfXZ6/LAHxpI5qyLbepbp02KzX+1J+Ug==
X-Received: by 2002:a1c:cc09:: with SMTP id h9mr2352828wmb.191.1637016701285; 
 Mon, 15 Nov 2021 14:51:41 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m20sm645900wmq.11.2021.11.15.14.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 14:51:40 -0800 (PST)
Message-ID: <92906f12-1cbf-5c73-5f6a-3dde6e86341f@redhat.com>
Date: Mon, 15 Nov 2021 23:51:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH for 6.2] nbd/server: Silence clang sanitizer warning
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20211115223943.626416-1-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211115223943.626416-1-eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 23:39, Eric Blake wrote:
> clang's sanitizer is picky: memset(NULL, x, 0) is technically
> undefined behavior, even though no sane implementation of memset()
> deferences the NULL.  Caught by the nbd-qemu-allocation iotest.
> 
> The alternative to checking before each memset is to instead force an
> allocation of 1 element instead of g_new0(type, 0)'s behavior of
> returning NULL for a 0-length array.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 3b1f244c59 (nbd: Allow export of multiple bitmaps for one device)
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  nbd/server.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


