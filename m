Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7312FA04D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:49:10 +0100 (CET)
Received: from localhost ([::1]:51786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Ty1-0001zC-V5
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1TvQ-0000WF-1H
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:46:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1TvM-0007uD-JV
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:46:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610973978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjiUii55MIx9RbLfz7LYBNgpsPP7aru87pI58qPFgHU=;
 b=JdnPrZBix/L8kykqWJywkGezZIQ0d3DNyUlZqY2o3iK8t4WV4xSKmYLpum1M2wdBGfcCTl
 TtiziHsb90SsEL4HU6l9TJ2QZW7Tp9Bg2Z6vzOjPnwiI9siFE2WQylFgXOwWGplhzDpuOR
 LzX4FPBTOMhRibyHNHt1kdPFKrj3bjQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-ec8zeXI5Oc2I5O3q0ikXwQ-1; Mon, 18 Jan 2021 07:46:16 -0500
X-MC-Unique: ec8zeXI5Oc2I5O3q0ikXwQ-1
Received: by mail-wr1-f71.google.com with SMTP id o12so8158183wrq.13
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 04:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wjiUii55MIx9RbLfz7LYBNgpsPP7aru87pI58qPFgHU=;
 b=gyuBA8a1pNHZyVn+odXLLS3lkIRIpjp0I7p3GjHM6CgcewXtb2KATYwSrgLH8+irzS
 bPMNl1kp21CYyEDbOHpHY9CaPD6IuNDTjNDrH/prEID23gAtfGzdr0aIJpHPp9i1RBNJ
 wUGz37RiJwO9JCtFFpMBFZ4et0ZNeGJljbIYIPd8SRKJc9EkkzjlIb1bUbegv+3bOQkg
 EXtMrRcxecr0EV7+vveRSLdoHtrEqyAL0oSyuosu2qCJPNjDDvTVJnrnzljOSpM4eg1T
 NJzaAxDlaUeKB1LFZ0Qgeix9XdeV+A5YriYWe4Hu2TCyUqMAuMVLFFDfBaXKJwKggqHL
 3e+A==
X-Gm-Message-State: AOAM532JvekBl7FYWuEpWWrI0Bkd8ZxUpDdyCnz493j558b/Z+Wa+S66
 /h7MHKiCHkADZYtcBT5P+H0bPXk2fA/5gaUoQyItcusiy35onh5c/y52X7tjoBG8I3j/bqmEIUb
 H1ymJM9ITcX3Qo4E=
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr25274159wrx.34.1610973975616; 
 Mon, 18 Jan 2021 04:46:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGAt8CxYbqzcFNr+kbICghQB5/NMd6mVR6f7Fm/GNhrOAkc6iHbUy6M0eqeKjtuawIdfGiBg==
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr25274138wrx.34.1610973975394; 
 Mon, 18 Jan 2021 04:46:15 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r10sm10851138wmd.15.2021.01.18.04.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 04:46:14 -0800 (PST)
Subject: Re: [PATCH v2] ide: atapi: check logical block address and read size
 (CVE-2020-29443)
To: P J P <ppandit@redhat.com>
References: <20210118063229.442350-1-ppandit@redhat.com>
 <cdd8168a-3362-e038-8e7e-0a082a2f1917@redhat.com>
 <4q98o1s-r5r4-14s9-nnr4-4p2q16roqro@erqung.pbz>
 <7b7771b7-cdba-01a4-67a7-c9cb3e9e33ca@redhat.com>
 <s218282-33rp-63nn-q469-6s3227353nsq@erqung.pbz>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1d1f5a04-e5f5-29be-c5f5-f2d3ec67f6b7@redhat.com>
Date: Mon, 18 Jan 2021 13:46:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s218282-33rp-63nn-q469-6s3227353nsq@erqung.pbz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Wenxiang Qian <leonwxqian@gmail.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/01/21 13:29, P J P wrote:
> +-- On Mon, 18 Jan 2021, Paolo Bonzini wrote --+
> | s->nb_sectors is in units of 512B, so the limit would be 4TB.  The purpose
> | is to limit the lba and nb_sectors arguments (which are in 2048B units) of
> | ide_atapi_cmd_read_{dma,pio} to INT_MAX.
> 
> * If it's for IDE_CD type, does the patch below look okay?

Not an &, but rather a MIN.

There is also ide_resize_cb, so perhaps a new function 
ide_set_nb_sectors in hw/ide/core.c would be better.

> ===
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index b49e4cfbc6..034c84b350 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -1169,7 +1169,7 @@ static void ide_cd_change_cb(void *opaque, bool load,
> Error **errp)
>   
>       s->tray_open = !load;
>       blk_get_geometry(s->blk, &nb_sectors);
> -    s->nb_sectors = nb_sectors;
> +    s->nb_sectors = nb_sectors & (uint64_t)INT_MAX << 2;
>   
>       /*
>        * First indicate to the guest that a CD has been removed.  That's
> @@ -2530,6 +2530,7 @@ int ide_init_drive(IDEState *s, BlockBackend *blk,
> IDEDriveKind kind,
>       s->smart_errors = 0;
>       s->smart_selftest_count = 0;
>       if (kind == IDE_CD) {
> +        s->nb_sectors &= (uint64_t)INT_MAX << 2;
>           blk_set_dev_ops(blk, &ide_cd_block_ops, s);
>           blk_set_guest_block_size(blk, 2048);
> ===
> 
> * Isn't 4TB limit more for IDE_CD type? Maybe UINT32_MAX?

Yes it's a lot more than the practical limit but it doesn't hurt either 
to have INT_MAX << 2.  The point is to have a limit that makes sense as 
far as the atapi.c code is concerned, i.e. to ensure the size in 
2048-byte sectors fits an "int".

Paolo


