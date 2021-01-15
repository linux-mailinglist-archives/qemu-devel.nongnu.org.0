Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8082F72ED
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 07:32:45 +0100 (CET)
Received: from localhost ([::1]:32984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0If6-0006FQ-IU
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 01:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l0Idy-0005YW-RI
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 01:31:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l0Idx-0001PE-4r
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 01:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610692292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wA/xziN7s06f1d9c6Tcw/vKZSEh9w6RcCMw19+YSr8A=;
 b=hm0uKGvLzs615KcyNwRMYkFgz2ZwvhFK4Hium3wAkuUH6C2ieeIG1TBZE+7D36D8tvzSrb
 GU/TB8oHCxO+a0p58EHAycHm1WKYa17Uo3aSVxRNDYwwftFXNrcw4dbsgE6N2DQaqO95EE
 BM8avnJtKG0e1LRMfadXHJCNXKXjGLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-d6B1W9RQPPW-_om0VpVH6w-1; Fri, 15 Jan 2021 01:31:30 -0500
X-MC-Unique: d6B1W9RQPPW-_om0VpVH6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 157A3801F97;
 Fri, 15 Jan 2021 06:31:29 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-108.ams2.redhat.com [10.36.112.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED5EA6F7E5;
 Fri, 15 Jan 2021 06:31:24 +0000 (UTC)
Subject: Re: [PATCH 05/23] sdlaudio: always clear the sample buffer
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
 <20210110100239.27588-5-vr_qemu@t-online.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <cc350dfe-19c6-32e4-8a2a-acb49c0a9868@redhat.com>
Date: Fri, 15 Jan 2021 07:31:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20210110100239.27588-5-vr_qemu@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/01/2021 11.02, Volker Rümelin wrote:
> Always fill the remaining audio callback buffer with silence.
> SDL 2.0 doesn't initialize the audio callback buffer. This was
> an incompatible change compared to SDL 1.2. For reference read
> the SDL 1.2 to 2.0 migration guide.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/sdlaudio.c | 33 ++++++++++++++++-----------------
>   1 file changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
> index 68126a99ab..79eed23849 100644
> --- a/audio/sdlaudio.c
> +++ b/audio/sdlaudio.c
> @@ -211,27 +211,26 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
>       SDLAudioState *s = &glob_sdl;
>       HWVoiceOut *hw = &sdl->hw;
>   
> -    if (s->exit) {
> -        return;
> -    }
> +    if (!s->exit) {
>   
> -    /* dolog("callback: len=%d avail=%zu\n", len, hw->pending_emul); */
> +        /* dolog("callback: len=%d avail=%zu\n", len, hw->pending_emul); */
>   
> -    while (hw->pending_emul && len) {
> -        size_t write_len;
> -        ssize_t start = ((ssize_t) hw->pos_emul) - hw->pending_emul;
> -        if (start < 0) {
> -            start += hw->size_emul;
> -        }
> -        assert(start >= 0 && start < hw->size_emul);
> +        while (hw->pending_emul && len) {
> +            size_t write_len;
> +            ssize_t start = (ssize_t)hw->pos_emul - hw->pending_emul;
> +            if (start < 0) {
> +                start += hw->size_emul;
> +            }
> +            assert(start >= 0 && start < hw->size_emul);
>   
> -        write_len = MIN(MIN(hw->pending_emul, len),
> -                        hw->size_emul - start);
> +            write_len = MIN(MIN(hw->pending_emul, len),
> +                            hw->size_emul - start);
>   
> -        memcpy(buf, hw->buf_emul + start, write_len);
> -        hw->pending_emul -= write_len;
> -        len -= write_len;
> -        buf += write_len;
> +            memcpy(buf, hw->buf_emul + start, write_len);
> +            hw->pending_emul -= write_len;
> +            len -= write_len;
> +            buf += write_len;
> +        }
>       }
>   
>       /* clear remaining buffer that we couldn't fill with data */
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


