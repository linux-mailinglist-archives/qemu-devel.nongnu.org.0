Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C14F4AE231
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 20:25:11 +0100 (CET)
Received: from localhost ([::1]:56976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHW6v-0002p4-Ig
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 14:25:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nHUMj-00017s-OZ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:33:21 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:44620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nHUMf-0005PB-T9
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:33:21 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD070210E1;
 Tue,  8 Feb 2022 17:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644341583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7a4HuI04CGgU38otTE5EIS5T8LY02s1xXRJuGnDEjdM=;
 b=HZQrBXZwHbh1v1lF07/GRMArA9jcQoYxmig1+Gkorv9VcGzQ7wK34ruzlisG9l0yRUFT4G
 XbWve0eRYHsKvf6eAu4o9nQxCVpqNrXZobYTzFVy7ZMZBNZbza8UfaJSDGjTwwN3EyACLH
 v6jff3ZOruzumdiEwsNt/25JraK5ddo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644341583;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7a4HuI04CGgU38otTE5EIS5T8LY02s1xXRJuGnDEjdM=;
 b=Z5pIhGmFNIrsec+5rUMZMeem2lKtL/l2wPO3RkUQPai6vuIuXE/bZoPLkEUVTdlotVfkye
 +Uut0pXxLDl6+jBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81AD313CF5;
 Tue,  8 Feb 2022 17:33:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yCJgHU+pAmLmZgAAMHmgww
 (envelope-from <lizhang@suse.de>); Tue, 08 Feb 2022 17:33:03 +0000
Subject: Re: [PATCH] audio/dbus: Fix building with modules enabled on macOS
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203165859.41066-1-f4bug@amsat.org>
From: Li Zhang <lizhang@suse.de>
Message-ID: <a6d0f418-5f2c-7e1d-b0e8-e588a610333b@suse.de>
Date: Tue, 8 Feb 2022 18:33:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220203165859.41066-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 5:58 PM, Philippe Mathieu-Daudé via wrote:
> When configuring QEMU with --enable-modules we get on macOS:
> 
>    --- stderr ---
>    Dependency ui-dbus cannot be satisfied
> 
> ui-dbus depends on pixman and opengl, so add these dependencies
> to audio-dbus.
> 
> Fixes: 739362d420 ("audio: add "dbus" audio backend")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   audio/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/audio/meson.build b/audio/meson.build
> index 0ac3791d0b..d9b295514f 100644
> --- a/audio/meson.build
> +++ b/audio/meson.build
> @@ -28,7 +28,7 @@ endforeach
>   
>   if dbus_display
>       module_ss = ss.source_set()
> -    module_ss.add(when: gio, if_true: files('dbusaudio.c'))
> +    module_ss.add(when: [gio, pixman, opengl, 'CONFIG_GIO'], if_true: files('dbusaudio.c'))
>       audio_modules += {'dbus': module_ss}
>   endif
>   
> 

I got the same problem when building master branch on my Linux server.
This patch looks good to me and it fixes my problem.

Reviewed-by: Li Zhang <lizhang@suse.de>


Thanks
Li Zhang

