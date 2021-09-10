Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B91406D77
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 16:18:02 +0200 (CEST)
Received: from localhost ([::1]:34774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOhLu-0003yC-1g
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 10:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mOhJv-0002O6-IF
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:15:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mOhJs-0006CK-6Z
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:15:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631283354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C1TYLeqwSZlGsALX69rrMqPKYkLAIy3oMHlsMpZJxL4=;
 b=b546ORiQsweftsmiIn/qa8ifM9i1OeKUwUl/o/QJxr6erQgpS9hoZufGRnn2E1HhINnL/C
 /2X40sjFTpg/bUC8Mv6skXsJuAuOzVWSlS4PpxN7eisPJx36FlJ78J7KHWgmeNh47qOjjJ
 oCwepw2Vvvi6cYepnNAsNq2mPzqy8Ic=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-kvZ3lTEVNDC3HF9kUg3G5g-1; Fri, 10 Sep 2021 10:15:53 -0400
X-MC-Unique: kvZ3lTEVNDC3HF9kUg3G5g-1
Received: by mail-wr1-f69.google.com with SMTP id
 b8-20020a5d5508000000b001574e8e9237so560727wrv.16
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 07:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=C1TYLeqwSZlGsALX69rrMqPKYkLAIy3oMHlsMpZJxL4=;
 b=BDHDg+NFfjql3toUjh6ycTCTzKusI2JRTEHfqBPyf2GomLMRyV/tzJPZK/tWaZSbTq
 01bp4hNV0mBnE27aoxgCcdjj87AD0/Bm79vZZjCg1kWkRiwq1EB2GzpJuAKREzjsua56
 1Ok0cy6KyQfvlU6KgeohiPXL/7ndJK1Jtgrt2D65nFolE5Aggv3PO6MtppGiEW+6+0BG
 WINrupuo8om+LtakV3L59Uwndhi/YmCoSm1L6i3JvtfStvZZTiqGCtBP4XUUtJDHPmlI
 Niz0LK9jyfOgLRsZpQeClz4vIohdANH/ok8woz+vVbKPeih8COWZg6TGXlR9a9VZOVsG
 O+6w==
X-Gm-Message-State: AOAM533ryN+WyKOEW2WpGYsGabNoMFjtHwGZez1tWKBhyplrFHAm69rm
 0ba1UAYBNCfTlwfVg4kHGs6WfWMZMUADdbQpUJ7yTVWIbhlPBeUvrcLubPROOcqictj1ZXdSO56
 E4+7rlvY9o4c+/3g=
X-Received: by 2002:adf:fd03:: with SMTP id e3mr10075780wrr.46.1631283352074; 
 Fri, 10 Sep 2021 07:15:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyG5RQAuzv4oWy1+JcLvDvK2pTPx444MAwxz2MhQExbIu2zRdu8BwmaWyCLxezyLLCKHrOig==
X-Received: by 2002:adf:fd03:: with SMTP id e3mr10075747wrr.46.1631283351851; 
 Fri, 10 Sep 2021 07:15:51 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id g9sm1550580wmg.21.2021.09.10.07.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 07:15:51 -0700 (PDT)
Subject: Re: [PATCH 2/2] block: bdrv_inactivate_recurse(): check for
 permissions and fix crash
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210910110100.31976-1-vsementsov@virtuozzo.com>
 <20210910110100.31976-3-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <2aafb525-8656-5cad-face-70af76813630@redhat.com>
Date: Fri, 10 Sep 2021 16:15:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210910110100.31976-3-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.09.21 13:01, Vladimir Sementsov-Ogievskiy wrote:
> We must not inactivate child when parent has write permissions on
> it.
>
> Calling .bdrv_inactivate() doesn't help: actually only qcow2 has this
> handler and it is used to flush caches, not for permission
> manipulations.

I guess we could ask whether block jobs should implement 
.bdrv_inactivate() to cancel themselves, but I believe it’s indeed 
better to have the migration fail and thus force the user to manually 
cancel the job (should that be what they want).

> So, let's simply check cumulative parent permissions before
> inactivating the node.
>
> This commit fixes a crash when we do migration during backup: prior to
> the commit nothing prevents all nodes inactivation at migration finish
> and following backup write to the target crashes on assertion
> "assert(!(bs->open_flags & BDRV_O_INACTIVE));" in
> bdrv_co_write_req_prepare().
>
> After the commit, we rely on the fact that copy-before-write filter
> keeps write permission on target node to be able to write to it. So
> inactivation fails and migration fails as expected.
>
> Corresponding test now passes, so, enable it.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block.c                                        | 8 ++++++++
>   tests/qemu-iotests/tests/migrate-during-backup | 2 +-
>   2 files changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


