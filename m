Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ED449C948
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 13:08:23 +0100 (CET)
Received: from localhost ([::1]:38806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCh65-0003kk-Vy
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 07:08:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nCgvc-0001NR-Cw
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 06:57:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nCgvZ-0006fP-7J
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 06:57:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643198247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QieI1GrM8bnJcyjx/AN1vTAgwrCwsq4GElPEBu/JKpg=;
 b=KbI7CA3pEIGTh6guZytfExIj5O/58/OaMhwIkW0lDXiKpDaIMqFMMaqYseJBjyrZTxEoiN
 P98OlKga+aJR4z6Dr9ArH3STQ2wBGYpDipBEMarmcgKDD+3TXuWCWwSHwAB48COdrayCYy
 Y1rJgQHa6tF5X5HVSavnpATkKmjwfTc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-SwB-SVADMY-wxFDMA0fUxg-1; Wed, 26 Jan 2022 06:57:26 -0500
X-MC-Unique: SwB-SVADMY-wxFDMA0fUxg-1
Received: by mail-wm1-f71.google.com with SMTP id
 o194-20020a1ca5cb000000b00350b177fb22so1699747wme.3
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 03:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QieI1GrM8bnJcyjx/AN1vTAgwrCwsq4GElPEBu/JKpg=;
 b=PlOirfIqFeoqaRKnu8lExgqNYSygMl/Z8hMVJsid6HGeRDqqT7k/3usPSXoAdii1vm
 HS0LJFYDD8gBfbTMTH9w+yj1Hvo75cL6rnfFJD+zLt5gIynBbeZe2AjhhuOocYlwurDv
 Oq81o+ku8GtfFvaIFZZxjRZHLFw1fmoiICtyeMTe4Ve/Uo0RMRufEAyZdVhDQjQs1GnQ
 q3Oe2RmBey+fLguRfPdGjw8zlaPcP8XseO4qxx9UMJNNxnh+TzguJK6MlGu+6Vbq3Iwo
 Agy2yddkrzf8a0vx9U0EA+KImKfnAJEJPUzrPesEmPx5pV+oTrTCvLsM3tGGZDmETrA/
 gUdw==
X-Gm-Message-State: AOAM530aZJTFt/Se3aPbP1x/SPkp/xcKgSd39+77xG06OV0Yx+bCzPNo
 NilS5FAlQSUeuQuMR/8z4J+qdvgWxwbM6ArfMhmktm7+XK7zJPXYkauw/+JOWpfBttk4bNeOpZz
 QBWgY7iEOlS3b46M=
X-Received: by 2002:a1c:2b07:: with SMTP id r7mr7170320wmr.27.1643198245630;
 Wed, 26 Jan 2022 03:57:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXskQy5iKFP9oabPGet4qbUa+/xL1PXjXNo+Pxq1ZG05nzhV5H/qHjpMZvBp1qwW/w6JK8Qg==
X-Received: by 2002:a1c:2b07:: with SMTP id r7mr7170279wmr.27.1643198245342;
 Wed, 26 Jan 2022 03:57:25 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id u3sm9665219wrs.55.2022.01.26.03.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 03:57:24 -0800 (PST)
Message-ID: <e7542897-3853-8cd4-3244-3deeaf2aee6b@redhat.com>
Date: Wed, 26 Jan 2022 12:57:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v6 20/33] block: rename bdrv_invalidate_cache_all,
 blk_invalidate_cache and test_sync_op_invalidate_cache
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-21-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220121170544.2049944-21-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.01.22 18:05, Emanuele Giuseppe Esposito wrote:
> Following the bdrv_activate renaming, change also the name
> of the respective callers.
>
> bdrv_invalidate_cache_all -> bdrv_activate_all
> blk_invalidate_cache -> blk_activate
> test_sync_op_invalidate_cache -> test_sync_op_activate
>
> No functional change intended.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c                            |  2 +-
>   block/block-backend.c              |  2 +-
>   hw/block/pflash_cfi01.c            |  2 +-
>   hw/nvram/spapr_nvram.c             |  2 +-
>   include/block/block-global-state.h |  2 +-
>   include/sysemu/block-backend-io.h  |  2 +-
>   migration/block.c                  |  2 +-
>   migration/migration.c              | 10 +++++-----
>   migration/savevm.c                 |  4 ++--
>   monitor/qmp-cmds.c                 |  2 +-
>   tests/unit/test-block-iothread.c   |  6 +++---
>   11 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


