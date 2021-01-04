Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B6F2E9B1C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 17:33:42 +0100 (CET)
Received: from localhost ([::1]:58162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwSnd-0001K2-6m
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 11:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwSky-0000J6-WB
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 11:30:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwSkv-0003UR-Fz
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 11:30:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609777849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxOk+fGO/nWkmP5hb+Dwuv1UJevJr3sRFQ0aTzKul6k=;
 b=QPZ0WrHONWEjJZV+IIKQfawazsE0EsLjUlH8hapxSxgzMLSK7NEoS/3X43XkPeb0PWDM7l
 cG14YVeupCiKdQ/fCPrgLNu4GgTvase3MfY7gTODmJsBOEVvNi7bsk4IYW2JMq8hQHohpf
 c7cUU3e2uuFsLATp9g5cAVpLvu5OEbQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-JcJBvA8RPvKy9Afg4yO4YA-1; Mon, 04 Jan 2021 11:30:47 -0500
X-MC-Unique: JcJBvA8RPvKy9Afg4yO4YA-1
Received: by mail-wr1-f70.google.com with SMTP id r11so13466661wrs.23
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 08:30:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UxOk+fGO/nWkmP5hb+Dwuv1UJevJr3sRFQ0aTzKul6k=;
 b=NZMrke5337hMBM2jXOWWcri+XfAW7tRdeTNnUZN7cx7qHHYrF4cARxndKlenmlRzGT
 BxupN/sIi/1rAY7mzb+LfZAvP/OjaMGjMpGYXz6f6oWYsWV/UmxlIPSfNlSZPnwVPXba
 /HmMUdNBhPE1ZwfJtIRLmG9msUNwzMOXu6ujMFImwRBMr1Y7UtGmu3wUVAdjRp5AeLKW
 sHphzQdaoJr2S8yBO3tyEFXFKPDlG9AURsklJDrxqhSTZN2R8q/u7zLIs/CtK+ZB9yk+
 kkHGme7QtxPk7lmkDCPidSQVdusSE0Xx+43bReBqA5mCa+Uv96xEpka25vRI8pY/dTyW
 +pGA==
X-Gm-Message-State: AOAM532mgV8qjYG91CZ0nJqElrni2sY0Z3GL4JLRyjhvPo4dBjcgU2dw
 NDiorUaT4OQYdY27lO4WM07yaBsCGc0UMQ3BqxveCX5yr+slV5uGe8/NALsBxxXKURizDkrM7cb
 i1LDaLIvo3y+jMVs=
X-Received: by 2002:a1c:6056:: with SMTP id u83mr26791553wmb.90.1609777845481; 
 Mon, 04 Jan 2021 08:30:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9jiLGAITvg8frAwKIF2/PXY9C23Ql9gQ3+QDfEdxtVuYXosnvx4O0MaB8VkmT753HUvXy3w==
X-Received: by 2002:a1c:6056:: with SMTP id u83mr26791538wmb.90.1609777845246; 
 Mon, 04 Jan 2021 08:30:45 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id c7sm103442099wro.16.2021.01.04.08.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 08:30:44 -0800 (PST)
Subject: Re: [PATCH] monitor/qmp-cmds.c: Don't include ui/vnc.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210104161200.15068-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <94abce4f-0cfc-2b3a-c571-ccdbfd0c501c@redhat.com>
Date: Mon, 4 Jan 2021 17:30:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104161200.15068-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/21 5:12 PM, Peter Maydell wrote:
> The qmp-cmds.c file currently includes ui/vnc.h, which (being located
> in the ui/ directory rather than include) is really supposed to be
> for use only by the ui subsystem.

That makes me remember yet another cleanup series I started few months
ago to remove -I$(srcdir) from $CFLAGS. Now that Meson is in, I might
eventually refresh it.

> In fact the function prototypes we
> need (vnc_display_password(), etc) are all declared in
> include/ui/console.h, so we can switch to including that instead.
> 
> (ui/vnc.h includes include/ui/console.h, so this change strictly
> reduces the quantity of headers qmp-cmds.c pulls in.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
> Spotted while trying to reduce the number of source files that
> indirectly include <gnutls.h>...
> ---
>  monitor/qmp-cmds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 34f7e75b7bf..c95e5001d72 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -23,7 +23,7 @@
>  #include "qemu/uuid.h"
>  #include "chardev/char.h"
>  #include "ui/qemu-spice.h"
> -#include "ui/vnc.h"
> +#include "ui/console.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/runstate-action.h"
> 


