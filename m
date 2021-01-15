Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434B82F72E0
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 07:29:27 +0100 (CET)
Received: from localhost ([::1]:58318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Ibt-0004tx-Qw
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 01:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l0Ib5-0004VC-CS
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 01:28:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l0Ib1-0008Ir-Pi
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 01:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610692109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kdiiGxPqjZ3f3s1KT65DOK8vo9SQcE9bHtwAZNmn1Hk=;
 b=bg8S9Io3FoUO2gAChGLTBAplcppKhQKbvAlf5mrDjwmNzGjNy5qkbw8EdJV/GCEEaxQ+bK
 42gD2JazJal6RH7kog5SFNXwiE4dB0+dmIOkUHYY+CO1mW7oGewDo3k4v0rWhycmSpILdn
 ppB+QU8nw2u5Fmz+HTpEvoxZg7dCqPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-VkZQPULTP9iTrB8LJWjkSQ-1; Fri, 15 Jan 2021 01:28:25 -0500
X-MC-Unique: VkZQPULTP9iTrB8LJWjkSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BBB1180A086;
 Fri, 15 Jan 2021 06:28:24 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-108.ams2.redhat.com [10.36.112.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 096C26F99E;
 Fri, 15 Jan 2021 06:28:18 +0000 (UTC)
Subject: Re: [PATCH 04/23] sdlaudio: don't start playback in init routine
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
 <20210110100239.27588-4-vr_qemu@t-online.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2c949893-334a-3879-5983-8a28d94f6d5b@redhat.com>
Date: Fri, 15 Jan 2021 07:28:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20210110100239.27588-4-vr_qemu@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
> Every emulated audio device has a way to enable audio playback. Don't
> start playback until the guest enables the audio device. This patch
> keeps the SDL2 device pause state in sync with hw->enabled.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/sdlaudio.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
> index 431bfcfddd..68126a99ab 100644
> --- a/audio/sdlaudio.c
> +++ b/audio/sdlaudio.c
> @@ -312,7 +312,6 @@ static int sdl_init_out(HWVoiceOut *hw, struct audsettings *as,
>   
>       s->initialized = 1;
>       s->exit = 0;
> -    SDL_PauseAudio (0);
>       return 0;
>   }
>   
> 

Right, there is also the sdl_enable_out() function that enables audio when 
necessary.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>


