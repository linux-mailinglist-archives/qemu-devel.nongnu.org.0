Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4E3696D29
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 19:45:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS0HN-0006Uz-J5; Tue, 14 Feb 2023 13:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@stgolabs.net>) id 1pS0HJ-0006Ul-DP
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:43:45 -0500
Received: from dog.elm.relay.mailchannels.net ([23.83.212.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@stgolabs.net>) id 1pS0HG-0006Gs-U7
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:43:45 -0500
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 164278821C1;
 Tue, 14 Feb 2023 18:43:36 +0000 (UTC)
Received: from pdx1-sub0-mail-a221.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 7333D8821E9;
 Tue, 14 Feb 2023 18:43:35 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1676400215; a=rsa-sha256;
 cv=none;
 b=Y3yLXv0lddZ6sMNH/xFgh3EzlHduM//JnfIreN4gV9MMIoQHcX7NEu5DffM//LU/7izm7z
 2Zopn9V5zEXZONbzFlNfpoWF15mMTH50H6H+C1wzGKHjQW5EpH4rVB209ANFfaTXGJFat7
 BIGd/qMOhG9FknV1ayWd+ABgIzYl06UykM4lUyhTnfhL2I8dVzW+h95mcT87W/G6Az4iVJ
 Bm6zZPElcxl2AvfJmpITTOL+pbBvEpUmno1CHyy+GAhrZKbd96hSQb4xCczx/q4ISJnD/E
 T/1ZN4DBQ5Epg9MWfpHtfYNoRYRuEvD2cvjw3D1d8O2H9A5kWRqrGCUjGsdFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1676400215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=iQjhFESGKASNO0O7sxGSRCOcjSv2sTTqAFVvYDWmzZw=;
 b=I8cIeyCJG4Shd2KxBok4OAVY7/0tFtBR6CTf8WlQGz4ekyrjbtZLvme9B9sntcWHgxd7Aa
 vMwJnYFZcNCfbaQjPGC/sVtrUPiGTn1h0fXrLE4vUkOG4Qg2IUI1U8yn79DZJmf8N2GYxo
 ywFfCVYW2DUH3LmWwxclNx1QuSgVbrWTy2YnQ6R8XncNAyTcIw3hfHYqkQH/NXyDH9GfkD
 nM5FNBpxQUAsxsrKgXZPWe57ItYMAe8n5Z5bmXPQU0JKuR7I1ZB7icWBKcKFgD1EWpICnj
 g20qmLW0N+d11SDcEl08KfwlxAa7Tovx8nO7DvT1sSh5NYOFtDz4K9VKpLu20g==
ARC-Authentication-Results: i=1; rspamd-b9c55767f-626p9;
 auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Industry-Trade: 62a9de3c7b2a63ab_1676400215832_514669986
X-MC-Loop-Signature: 1676400215832:1443824501
X-MC-Ingress-Time: 1676400215832
Received: from pdx1-sub0-mail-a221.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.126.30.37 (trex/6.7.1); Tue, 14 Feb 2023 18:43:35 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: dave@stgolabs.net)
 by pdx1-sub0-mail-a221.dreamhost.com (Postfix) with ESMTPSA id 4PGVTf0vrqz9d; 
 Tue, 14 Feb 2023 10:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
 s=dreamhost; t=1676400215;
 bh=iQjhFESGKASNO0O7sxGSRCOcjSv2sTTqAFVvYDWmzZw=;
 h=Date:From:To:Cc:Subject:Content-Type;
 b=EDDH6di4kwthAfEiKhr9dLe5O/NqvfWnvufFlOeOISOtylMimQkevyq+z5m58w8BJ
 z0dgfe8gmMKmbV9wuBn6p7LgVyL/9WUJaYgrcdwA7fGu6Qr93bzl5oeONncsuCGQ14
 OZGXhSMvSZ/U5gIyEwWjUdOHhwalYgMZaAOvgw8YeEeK2e58fRPo/GBdEiEC7cPQJW
 19YLDhWIFgzHqRFQgrJI55HjqbNUlOK470gN0JX6KoRiehfJEaMwYEsab/ofsGSOmJ
 gNFvS6VKrfeZkiL2Ux9MbSEzLNMa4Q3w+ax+sx7WJNLkQl3SbvFzDr1sFV4SapqgBP
 NHhF7iDjsBH2g==
Date: Tue, 14 Feb 2023 10:15:40 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Michael Tsirkin <mst@redhat.com>,
 Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>,
 Philippe =?utf-8?B?TWF0aGlldS1EYXVkw6/Cv8K9?= <philmd@linaro.org>,
 Mike Maslenkin <mike.maslenkin@gmail.com>
Subject: Re: [PATCH 2/2] hw/cxl: Multi-Region CXL Type-3 Devices (Volatile
 and Persistent)
Message-ID: <20230214181540.6yurhcasg3sezh3e@offworld>
References: <20230131163847.23025-1-Jonathan.Cameron@huawei.com>
 <20230131163847.23025-3-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230131163847.23025-3-Jonathan.Cameron@huawei.com>
User-Agent: NeoMutt/20220429
Received-SPF: pass client-ip=23.83.212.48; envelope-from=dave@stgolabs.net;
 helo=dog.elm.relay.mailchannels.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 31 Jan 2023, Jonathan Cameron wrote:

>From: Gregory Price <gourry.memverge@gmail.com>
>
>This commit enables each CXL Type-3 device to contain one volatile
>memory region and one persistent region.
>
>Two new properties have been added to cxl-type3 device initialization:
>    [volatile-memdev] and [persistent-memdev]
>
>The existing [memdev] property has been deprecated and will default the
>memory region to a persistent memory region (although a user may assign
>the region to a ram or file backed region). It cannot be used in
>combination with the new [persistent-memdev] property.
>
>Partitioning volatile memory from persistent memory is not yet supported.
>
>Volatile memory is mapped at DPA(0x0), while Persistent memory is mapped
>at DPA(vmem->size), per CXL Spec 8.2.9.8.2.0 - Get Partition Info.
>
>Signed-off-by: Gregory Price <gregory.price@memverge.com>
>Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>

