Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B2C40A969
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 10:37:11 +0200 (CEST)
Received: from localhost ([::1]:48508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ3wE-0002xN-4T
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 04:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ3v2-00026M-WB
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:35:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ3v0-0001fE-BC
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631608553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zYcUGWcpaZm65DFXlMgKJTORnW5toSXU6YMU/ynIPng=;
 b=ML5c9APas4cfESjK0ie2bc0MoV9sLjqq5i5oTAdQ/E8Z1Su6SjXmv5cLyKqpBJPV30xkjf
 4AxogTygWaPQ8Iqg3kSlaIN3h18G4xpNco376m6haZLmtEe7McT1il44v57Io6zoCMSIob
 NkiElUEFEwX8gRfblwqeD18j0iw73BQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-v7DQBaebNIW8J2dvGUMxVQ-1; Tue, 14 Sep 2021 04:35:50 -0400
X-MC-Unique: v7DQBaebNIW8J2dvGUMxVQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 y23-20020a05600c365700b003015b277f98so444783wmq.2
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 01:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zYcUGWcpaZm65DFXlMgKJTORnW5toSXU6YMU/ynIPng=;
 b=2MBnu2NppZ+LkaLe1js56MTpReLxldhDyhKTCVDSQ6nn0GP1TK1CR6R141+rmEJDR7
 kLiq+UWTn1nGCFgrXwh7mN6OaFz9lAfnRv8i1htgfZ9QzIr21fIAJecvpZXaIErsrYSC
 8U/o+RCpDXp+CnyOaVqFxIyeHdPy3Wl8/GutUVSv2UCmSTza25jA9jJTRhjFtlIeCAPU
 6FREdrnjbAdyXAN4xTHBKDWcPILCY/a8tKr7SUlQApcHk9b7+OZ/GUZKZGt3i2eiXB4T
 x0SqQ94H+JP5ewOV8t9yltGfR6IZpxbPeCTPatDCxht4thXTRCz3aPKuax13goff0L34
 +PFw==
X-Gm-Message-State: AOAM533Pv/LCG2jskscH4+9SLpguBYTCcelSzh6s7DHHjqE8Zp52k6cc
 nUrPDyrYwR0pWvdaDb4mfRIZUsMIvW5MqOYv4wZ6tNQL3jC5TEEZNbBib3xaCVHQdN01O/+TJQG
 0KUfuPnfRnt6jbPI=
X-Received: by 2002:adf:f890:: with SMTP id u16mr10827430wrp.388.1631608549384; 
 Tue, 14 Sep 2021 01:35:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLFlS7J7CpZXib1jZZfzxBQUemP6UdUe51VVUoo8fpa889xOZg2CZCxW8zBUuxlgrv+OeJCw==
X-Received: by 2002:adf:f890:: with SMTP id u16mr10827410wrp.388.1631608549182; 
 Tue, 14 Sep 2021 01:35:49 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id k19sm432645wmr.21.2021.09.14.01.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 01:35:48 -0700 (PDT)
Subject: Re: [PATCH v3 05/10] qcow2-refcount: fix_l2_entry_by_zero(): also
 zero L2 entry bitmap
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
 <20210524142031.142109-6-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <672266a2-bc5b-69a7-c0e3-5a3cd5219267@redhat.com>
Date: Tue, 14 Sep 2021 10:35:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210524142031.142109-6-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, ktkhai@virtuozzo.com, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.05.21 16:20, Vladimir Sementsov-Ogievskiy wrote:
> We'll reuse the function to fix wrong L2 entry bitmap. Support it now.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>   block/qcow2-refcount.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


