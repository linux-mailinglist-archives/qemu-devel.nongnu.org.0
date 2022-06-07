Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051CE53FE3F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 14:03:21 +0200 (CEST)
Received: from localhost ([::1]:42236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyXvc-0004nU-0x
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 08:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyWvv-0004zA-Pi
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:59:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyWvt-0004WT-Js
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654599572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/F6GjeesRA1xUn5WaHfNpTSIPiXpbv9XaKfpOmFAD8=;
 b=a5YLbv1y89VIsMQUIU17CojCkmZv7ycuFTJHWuXD9xib67/haTvPsfET+lDsirGVrvfy6F
 mF/MjLol6tA45TNfXp+84gmBJDSgooksmDqbLaoSUFdCIHFaFnzqTgnpCfvqpsq2skvvHa
 AMFOogUMOIoLXNulzBWTU0x+cBV2rHo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-BUfQ9VaRNY2zjPwSm3Vgog-1; Tue, 07 Jun 2022 06:59:31 -0400
X-MC-Unique: BUfQ9VaRNY2zjPwSm3Vgog-1
Received: by mail-wm1-f72.google.com with SMTP id
 n18-20020a05600c3b9200b0039746f3d9faso5644526wms.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 03:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a/F6GjeesRA1xUn5WaHfNpTSIPiXpbv9XaKfpOmFAD8=;
 b=EIxcdjtFGamNAyykxdr/xcaINr/gGRV3ArzTNenPJhI/rm8acebFxqzA98VT1TsJb1
 S2pM4nSWlhHE67qmKizwUa13xMqWLHa/RQOaQDSJrPhCTzvRKx28WVZtoyW0Dmx+B0Ey
 661Vvajih3S5pmg22OWsBiO7X/DYwJ6x9voKs5Ok+UYxov77xRRscT8ni86djUvuLiT0
 K9okkFP51VNmzMgoL6ox8bBuk4hWR8ZEUdC+26mRwY6VZbCHMquugmB43auXjRzr7nYV
 aYIhKHttWdiDwEYeuyrwYsU8nxedmlCTgU6YLCbpGmyFgwWatzmu17rpFbxuVIM9ars5
 40dw==
X-Gm-Message-State: AOAM5324wT0PQ8/A6WS/lszeDEoPsCxGoRS6PNiZH99g97aV8eytFp8T
 YYLSMn6aSVPZSlKPmEwPwdpedpWLlueZYzzY4LwKB43mcJx1p+ds8/5AW+meFXUohpCjjJwFEE5
 5V9aFfcySXOy615o=
X-Received: by 2002:a5d:5887:0:b0:213:b5d2:4887 with SMTP id
 n7-20020a5d5887000000b00213b5d24887mr23792126wrf.312.1654599565726; 
 Tue, 07 Jun 2022 03:59:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyViQuky3tt3tRBXiypkmgAZDabJ4TSP4uz8TqxHlcyEN+1HfkIJDmQUGhfcKqUIcRAHgIMFA==
X-Received: by 2002:a5d:5887:0:b0:213:b5d2:4887 with SMTP id
 n7-20020a5d5887000000b00213b5d24887mr23792102wrf.312.1654599565471; 
 Tue, 07 Jun 2022 03:59:25 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a5d6d47000000b0020e5e906e47sm17461688wri.75.2022.06.07.03.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 03:59:25 -0700 (PDT)
Message-ID: <839f1e9b-a6ee-d9ea-e0b0-ade9d125612a@redhat.com>
Date: Tue, 7 Jun 2022 12:59:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 05/45] tests-bdrv-drain: bdrv_replace_test driver:
 declare supports_backing
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, Eric Blake <eblake@redhat.com>,
 Nikita Lapshin <nikita.lapshin@virtuozzo.com>
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-6-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-6-vsementsov@openvz.org>
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
> We do add COW child to the node.  In future we are going to forbid
> adding COW child to the node that doesn't support backing. So, fix it
> here now.
>
> Don't worry about setting bs->backing itself: it further commit we'll

s/it/in/

> update the block-layer to automatically set/unset this field in generic
> code.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   tests/unit/test-bdrv-drain.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


