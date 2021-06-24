Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82E83B2C4E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:18:45 +0200 (CEST)
Received: from localhost ([::1]:55220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMRY-0000b9-OR
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lwMQT-0007bk-VW
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:17:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lwMQR-00051d-9r
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:17:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624529854;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8sk0kOmGEKo0yFq+dZW4uXTDG//aU68J0w0PxxqbtQU=;
 b=FvGnMclpyhknBlUuTWwAIKUonv7r8rO3Wy23S4+PYf1LR8V2dHfry1q+RRf25P52/UProG
 CXHmZsEvBcr+r/lzDYxkRntil6Z9ZO71PdYwLekWnFjqOOayM1yq/O78OKYSpkXr9DcbAn
 5mne6NpgyIg1lIb0kTP1ZHYPREevwLQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-VKmzT_O1Oj6G5dl1hXRrfQ-1; Thu, 24 Jun 2021 06:17:21 -0400
X-MC-Unique: VKmzT_O1Oj6G5dl1hXRrfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FA9C8C5EC7;
 Thu, 24 Jun 2021 10:17:19 +0000 (UTC)
Received: from redhat.com (ovpn-114-226.ams2.redhat.com [10.36.114.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CB3260C05;
 Thu, 24 Jun 2021 10:17:14 +0000 (UTC)
Date: Thu, 24 Jun 2021 11:17:12 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 9/9] hw/sd: Allow card size not power of 2 again
Message-ID: <YNRbqKamKiUlHewu@redhat.com>
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-10-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210623180021.898286-10-f4bug@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Tom Yan <tom.ty89@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 08:00:21PM +0200, Philippe Mathieu-Daudé wrote:
> In commit a9bcedd15a5 ("hw/sd/sdcard: Do not allow invalid SD card
> sizes") we tried to protect us from CVE-2020-13253 by only allowing
> card with power-of-2 sizes. However doing so we disrupted valid user
> cases. As a compromise, allow any card size, but warn only power of 2
> sizes are supported, still suggesting the user how to increase a
> card with 'qemu-img resize'.
> 
> Cc: Tom Yan <tom.ty89@gmail.com>
> Cc: Warner Losh <imp@bsdimp.com>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1910586
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 9c8dd11bad1..cab4aab1475 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -2131,23 +2131,16 @@ static void sd_realize(DeviceState *dev, Error **errp)
>          blk_size = blk_getlength(sd->blk);
>          if (blk_size > 0 && !is_power_of_2(blk_size)) {
>              int64_t blk_size_aligned = pow2ceil(blk_size);
> -            char *blk_size_str;
> +            g_autofree char *blk_size_s = size_to_str(blk_size);
> +            g_autofree char *blk_size_aligned_s = size_to_str(blk_size_aligned);
>  
> -            blk_size_str = size_to_str(blk_size);
> -            error_setg(errp, "Invalid SD card size: %s", blk_size_str);
> -            g_free(blk_size_str);
> -
> -            blk_size_str = size_to_str(blk_size_aligned);
> -            error_append_hint(errp,
> -                              "SD card size has to be a power of 2, e.g. %s.\n"
> -                              "You can resize disk images with"
> -                              " 'qemu-img resize <imagefile> <new-size>'\n"
> -                              "(note that this will lose data if you make the"
> -                              " image smaller than it currently is).\n",
> -                              blk_size_str);
> -            g_free(blk_size_str);
> -
> -            return;
> +            warn_report("SD card size is not a power of 2 (%s). It might work"
> +                        " but is not supported by QEMU. If possible, resize"
> +                        " your disk image to %s with:",
> +                        blk_size_s, blk_size_aligned_s);
> +            warn_report(" 'qemu-img resize <imagefile> <new-size>'");
> +            warn_report("(note that this will lose data if you make the"
> +                        " image smaller than it currently is).");

In what scenarios will non-power of 2 not work and what is the effect ?
Is it a QEMU bug or not ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


