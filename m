Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BAB3215D1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 13:10:58 +0100 (CET)
Received: from localhost ([::1]:46042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEA3F-00021V-Ip
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 07:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lE9wn-0004Lr-Ol
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 07:04:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lE9wh-0003Ng-LU
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 07:04:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613995447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pTALdb+XyTM6asu2D4ffugcTsy2nyxxKm3NrHb1p4jo=;
 b=cVhTfDeIpAIyclPMO9dvpdIhDTwJnCHI/TPZUFv2vCXNKz7pWNWMr0KvtXTnbJqWynYlyS
 i2PFLaDNTEDxUbfoHmfJZX2Jb0Oy3eY76Atb/BZ2mserfu/9pRMaATPjv25bYJdzWQH4B5
 KnQj67PMn/yB7k/8nFjsojeHBXYPhHQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-BZFjPLlOOO-90_fCM7GB0w-1; Mon, 22 Feb 2021 07:04:05 -0500
X-MC-Unique: BZFjPLlOOO-90_fCM7GB0w-1
Received: by mail-ed1-f71.google.com with SMTP id m16so6823672edd.21
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 04:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pTALdb+XyTM6asu2D4ffugcTsy2nyxxKm3NrHb1p4jo=;
 b=m3yWcgx9XO2DBSndkuwR+gOX+t2ksIsTD5R43d9whSUMzGO11GiSpIVc9I+xr1umGv
 HVADkGmBH2vhn9pzwHzmTwStt6JEMhfxq6/cWBFEpLeoaKF/EScqF/3YG+SCIoYyIAe0
 XlSUjBDNB7Pi0K1FHSZFcD37iO5iJ0tf0Oe3Ru9b1B4J3tXKyzayxDJzi4Nj3HGxZ0aR
 Vua15XmppluXqTrJ1vWb/xl1pDQ8S763TLDMwcB3lAPD/92+m1t5dSLxNYmGjrOyivot
 bWkaSlDeTLhhfeA3z4WKhPrlWbrpW7HimCc5fY4qty5uTJoAnxRAKDG0xSZhgVQcHxI+
 30uw==
X-Gm-Message-State: AOAM5312yPqbUYqQGQU4GQ3DATcK4DdBAT6fHYWsa8/SMxllxs169UrA
 iS3eAWQ7NjzlYXtmudw/z37J7xdTsAdsQ1e6Spg9R4fVwXcjBjB03BVP+0Bkq4HJYakVLRp9NES
 IbHcXUNAgV98+7nk=
X-Received: by 2002:a17:906:1d0f:: with SMTP id
 n15mr20721232ejh.553.1613995444661; 
 Mon, 22 Feb 2021 04:04:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyV7mvnHnhGNeLLYT/ZmBBKQzrgx3WrBTuMQQbixNLtGfoqvgIVvPfr2wUY75OPrjVZi04uDw==
X-Received: by 2002:a17:906:1d0f:: with SMTP id
 n15mr20721196ejh.553.1613995444463; 
 Mon, 22 Feb 2021 04:04:04 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d3sm12124707edk.82.2021.02.22.04.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 04:04:03 -0800 (PST)
Subject: Re: [PATCH v2 01/22] block: add eMMC block device type
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Vincent Palatin <vpalatin@chromium.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Luc Michel <luc.michel@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613982039-13861-2-git-send-email-sai.pavan.boddu@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3c229241-fdc5-a445-d96e-ca16a5c0106b@redhat.com>
Date: Mon, 22 Feb 2021 13:04:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1613982039-13861-2-git-send-email-sai.pavan.boddu@xilinx.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: saipava@xilinx.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 9:20 AM, Sai Pavan Boddu wrote:
> From: Vincent Palatin <vpalatin@chromium.org>
> 
> Add new block device type.
> 
> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> [SPB: Rebased over 5.1 version]
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/sysemu/blockdev.h | 1 +
>  blockdev.c                | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
> index 3b5fcda..eefae9f 100644
> --- a/include/sysemu/blockdev.h
> +++ b/include/sysemu/blockdev.h
> @@ -24,6 +24,7 @@ typedef enum {
>       */
>      IF_NONE = 0,
>      IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_XEN,
> +    IF_EMMC,
>      IF_COUNT
>  } BlockInterfaceType;
>  
> diff --git a/blockdev.c b/blockdev.c
> index cd438e6..390d43c 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -83,6 +83,7 @@ static const char *const if_name[IF_COUNT] = {
>      [IF_SD] = "sd",
>      [IF_VIRTIO] = "virtio",
>      [IF_XEN] = "xen",
> +    [IF_EMMC] = "emmc",
>  };

We don't need to introduce support for the legacy -drive magic.

-device should be enough for this device, right?


