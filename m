Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5581766B9C6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:04:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLPS-0002PT-SV; Mon, 16 Jan 2023 04:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHLP6-0002Nf-Pv
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:03:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHLP1-0000SB-Se
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:03:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673859814;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5kiTbgPy2ypzSCZsWcvRxUdpeFJJgsBBBz9ZUxOK4+g=;
 b=hD01tpCWkgSYpMaq222ZCQJNBq6z7Q/gKfMQFEBppBCNHtvCVeQjI26rut6Mezm6hp53ZN
 8SDCYZZO9towN1IA8vbabgowg4LVomF2YrCBFsEKMsHCz0EDmp97wEDM1B5sUN9Aa9J9dn
 CFOS/pmPYpSjZsISwCcKOJHc2PDK80g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-iqk9a3hfNHO2qV6f6iY1PQ-1; Mon, 16 Jan 2023 04:03:33 -0500
X-MC-Unique: iqk9a3hfNHO2qV6f6iY1PQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D74403814588;
 Mon, 16 Jan 2023 09:03:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C2312026D68;
 Mon, 16 Jan 2023 09:03:29 +0000 (UTC)
Date: Mon, 16 Jan 2023 09:03:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 08/11] audio/audio_template: use g_new0() to replace
 audio_calloc()
Message-ID: <Y8US3so1QkIOwucD@redhat.com>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-8-vr_qemu@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221218171539.11193-8-vr_qemu@t-online.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Dec 18, 2022 at 06:15:36PM +0100, Volker Rümelin wrote:
> Replace audio_calloc() with the equivalent g_new0().
> 
> With a n_structs argument >= 1, g_new0() never returns NULL.
> Also remove the unnecessary NULL checks.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>  audio/audio_template.h | 23 ++++++-----------------
>  1 file changed, 6 insertions(+), 17 deletions(-)
> 
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index 5f51ef26b2..9c600448fb 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -129,12 +129,7 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
>          return -1;
>      }
>  
> -    sw->buf = audio_calloc(__func__, samples, sizeof(struct st_sample));
> -    if (!sw->buf) {
> -        dolog ("Could not allocate buffer for `%s' (%d samples)\n",
> -               SW_NAME (sw), samples);
> -        return -1;
> -    }
> +    sw->buf = g_new0(st_sample, samples);

"samples" is a signed integer, and audio_calloc would check for
it being negative and raise an error. It would also check for
samples being zero. I think we still need both these checks,
as a negative value of samples when cast to size_t would be a
huge size.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


