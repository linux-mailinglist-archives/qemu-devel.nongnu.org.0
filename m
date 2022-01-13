Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370AC48D46D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 10:45:56 +0100 (CET)
Received: from localhost ([::1]:54466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7wg3-0006hU-28
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 04:45:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n7we7-00061F-1w
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 04:43:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n7we4-0001P3-Hu
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 04:43:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642067027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ihK4Y/OPhFbyY89oTsYZJO/bs/KKtkLy4voGgbSetSw=;
 b=a9rVRAZ7W8DCSGlPevhEffU61fsOto9zA0mlBXy/ixI0kAmzWM1eLTPH5tBOPepV8jLiNf
 u75y+Pyc8wayHIuSKbjfc8A426seo0HiYSwv2d7P/Ge3dlSc2A8kPNe/uzreCxFWDkf4ls
 NnyhAbxs1du1kfT4nnn/SgJh4TyeuTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-tPcAQ67MMmWDcuYGmYgrGQ-1; Thu, 13 Jan 2022 04:43:44 -0500
X-MC-Unique: tPcAQ67MMmWDcuYGmYgrGQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2701C100CC84;
 Thu, 13 Jan 2022 09:43:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA38523085;
 Thu, 13 Jan 2022 09:43:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EF7811800091; Thu, 13 Jan 2022 10:43:40 +0100 (CET)
Date: Thu, 13 Jan 2022 10:43:40 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <volker.ruemelin@t-online.de>
Subject: Re: [PATCH 09/15] audio: revert tests for pcm_ops table
Message-ID: <20220113094340.zs6o73m46y4pkdg6@sirius.home.kraxel.org>
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
 <20220106092332.7223-9-volker.ruemelin@t-online.de>
MIME-Version: 1.0
In-Reply-To: <20220106092332.7223-9-volker.ruemelin@t-online.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 06, 2022 at 10:23:26AM +0100, Volker Rümelin wrote:
> From: Volker Rümelin <vr_qemu@t-online.de>
> 
> With previous commit every audio backend has a pcm_ops function
> table. It's no longer necessary to test if the table is
> available. This reverts commit cbaf25d1f5: "audio: fix
> wavcapture segfault"

You can just "git revert cbaf25d1f5" then, and append the reason
why you are reverting the commit to the commit message.

> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>  audio/audio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/audio/audio.c b/audio/audio.c
> index 55f885f8e9..c420a8bd1c 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -612,7 +612,7 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
>          total += isamp;
>      }
>  
> -    if (hw->pcm_ops && !hw->pcm_ops->volume_in) {
> +    if (!hw->pcm_ops->volume_in) {
>          mixeng_volume (sw->buf, ret, &sw->vol);
>      }
>  
> @@ -718,7 +718,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
>      if (swlim) {
>          sw->conv (sw->buf, buf, swlim);
>  
> -        if (sw->hw->pcm_ops && !sw->hw->pcm_ops->volume_out) {
> +        if (!sw->hw->pcm_ops->volume_out) {
>              mixeng_volume (sw->buf, swlim, &sw->vol);
>          }
>      }
> -- 
> 2.31.1
> 

-- 


