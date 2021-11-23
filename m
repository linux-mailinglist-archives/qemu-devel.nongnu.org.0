Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BE645A3EC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 14:39:16 +0100 (CET)
Received: from localhost ([::1]:48780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpW0x-0004nK-Ph
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 08:39:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpVvF-0008BV-ER
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:33:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpVv6-0001mZ-3e
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:33:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637674390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=amDK/iX0yCXjL98lI7490zPsQK8PCUmUReIz8siI5Ac=;
 b=JZjpGwM3Xv7pfo6AfgvbUrPQLYElYjAaQXCNcgOG0cmVKeUJycPPB1FphIjR+QLS3qWF+U
 s0Dem5FS6fLSaOwk2+LUA0zVrQz1+cJMsoRsb8uZcC8PhwtAqmSPT9lA36wakGY2W4G79O
 yv7RyJqQlJ21PuOdvVoYjcDYhnD5myg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-6Q4mR9YYOymQxU0A15O20w-1; Tue, 23 Nov 2021 08:33:06 -0500
X-MC-Unique: 6Q4mR9YYOymQxU0A15O20w-1
Received: by mail-wm1-f69.google.com with SMTP id
 p12-20020a05600c1d8c00b0033a22e48203so1538706wms.6
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 05:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=amDK/iX0yCXjL98lI7490zPsQK8PCUmUReIz8siI5Ac=;
 b=jjmhd2/sbipQMnPlpGAt1swdKYUmeOSG0xwqPJLP+tIOaKoq5M55D7p7z9QvbOKiW8
 xG1wgTs+n3chZCxkgi0OBU/+OBr1NYrJtUWuNy0EegzbJVFEswnPWGNkaQxmu1o8s4lB
 Z1WbcoBnTJS7rcpJnSFzD+wQbhekp1qyygxQGPDRI5PEz9r2wFCu2uiRAJMgOifZOkbE
 I0KkO3HhXL2qTa8y6jkn8M9YA7KkV3lLh9z3Bx5xyayVeb60mkCix4nnXQWJfUQs9d4y
 dKcnOtVvWnMH8GHkkYQ528NlgTclqbK779F/oAErtrrPaL98PBSl9d7tYnExiefNebIE
 oSng==
X-Gm-Message-State: AOAM53022y6G37kbWsELFuQUfeIkjFuSewoD15cGll2FAXNMoTxPGrof
 1S3pMChnYQzOa8VDorGk9+JRRULOwyEWMcD4e5HbDiAzdWu2z/V/bN9BKqi+AT2E4LHox8Q16ki
 /L5iSIr28UnFwUpk=
X-Received: by 2002:a5d:54cf:: with SMTP id x15mr2388767wrv.30.1637674385608; 
 Tue, 23 Nov 2021 05:33:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWoV8yLnT7YS7kXMz0VxMzSp+8146ihFymwJD41tasC5ANtmDHTq2qRSEOHtowE1IDq7Zk0w==
X-Received: by 2002:a5d:54cf:: with SMTP id x15mr2388729wrv.30.1637674385409; 
 Tue, 23 Nov 2021 05:33:05 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id k187sm2360027wme.0.2021.11.23.05.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 05:33:05 -0800 (PST)
Message-ID: <f01963c1-9445-1d0d-ae8e-6649d8397934@redhat.com>
Date: Tue, 23 Nov 2021 14:33:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 v3 1/2] hw/block/fdc: Kludge missing floppy drive
 to fix CVE-2021-20196
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211118120635.4043197-1-philmd@redhat.com>
 <20211118120635.4043197-2-philmd@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211118120635.4043197-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.515, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-stable@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.11.21 13:06, Philippe Mathieu-Daudé wrote:
> Guest might select another drive on the bus by setting the
> DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
> The current controller model doesn't expect a BlockBackend
> to be NULL. A simple way to fix CVE-2021-20196 is to create
> an empty BlockBackend when it is missing. All further
> accesses will be safely handled, and the controller state
> machines keep behaving correctly.
>
> Cc: qemu-stable@nongnu.org
> Fixes: CVE-2021-20196
> Reported-by: Gaoning Pan (Ant Security Light-Year Lab) <pgn@zju.edu.cn>
> BugLink: https://bugs.launchpad.net/qemu/+bug/1912780
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/338
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/block/fdc.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index d21b717b7d6..6f94b6a6daa 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -1161,7 +1161,19 @@ static FDrive *get_drv(FDCtrl *fdctrl, int unit)
>   
>   static FDrive *get_cur_drv(FDCtrl *fdctrl)
>   {
> -    return get_drv(fdctrl, fdctrl->cur_drv);
> +    FDrive *cur_drv = get_drv(fdctrl, fdctrl->cur_drv);
> +
> +    if (!cur_drv->blk) {
> +        /*
> +         * Kludge: empty drive line selected. Create an anonymous
> +         * BlockBackend to avoid NULL deref with various BlockBackend
> +         * API calls within this model (CVE-2021-20196).
> +         * Due to the controller QOM model limitations, we don't
> +         * attach the created to the controller device.
> +         */
> +        cur_drv->blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);

So to me this looks basically like a mini version of 
floppy_drive_realize(), and I was wondering what else we might want to 
use from that function.  fd_init() and fd_revalidate() look interesting, 
but it appears that fdctrl_realize_common() already did that for all 
drives so we should be good.

Then again, fd_revalidate() behaves differently for the initial drv->blk 
== NULL (drv->drive is set to TYPE_NONE, and last_sect and max_track are 
set to 0) and for then later !blk_is_inserted() (drv->drive not changed 
(so I guess it stays TYPE_NONE?), but last_sect and max_track are set to 
0xff).  Not sure if that’s a problem.  Probably not, given that I think 
drv->disk and drv->drive both stay TYPE_NONE.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

> +    }
> +    return cur_drv;
>   }
>   
>   /* Status A register : 0x00 (read-only) */


