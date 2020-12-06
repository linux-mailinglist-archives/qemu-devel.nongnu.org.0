Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5920A2D039F
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 12:48:13 +0100 (CET)
Received: from localhost ([::1]:37786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klsWR-0006NX-Qt
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 06:48:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klsRG-0003k4-SB
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 06:42:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klsRE-0004Oz-AR
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 06:42:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607254966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l+RRbpmFlfac/SzWPDUAkyoj5c34HRozw+UOgcejjYk=;
 b=CnKGzLEA+Ok3UV3zqPN20BQ6odCyQ5ROX7dSozbtsidJowcyDhXZSVAnakA6oidik0qOFD
 QwxR+B8yjqRhF2jv2mwrVp0IL2wWdL7kLOT1cCwh/ZAoO8cspF++Xofe/P5h5jo28tnKbA
 qoqXqXPbknzZxfUpkrrbicUmnbVxkUU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-KzoMDCK9N9qFcNTIrMPo2A-1; Sun, 06 Dec 2020 06:42:44 -0500
X-MC-Unique: KzoMDCK9N9qFcNTIrMPo2A-1
Received: by mail-ed1-f70.google.com with SMTP id l33so1004425ede.1
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 03:42:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GeNv/cSD9s12rnOJ8fx5ljri4YpUa8F6LSl9cZHSjCY=;
 b=Qa4wxQQZRpyzJBXrBbc3EnyMP7icoOnYH8dBi9iiWtFjmR/7J63jOfDWLpRfkRB2fH
 2OfN3Va+HDTEoCEGzvOu3ybBs5xTrWgNWvjH5kTifU+qYU1WxqxolKtqRv2SVPzLTBbb
 So3p1UaDVOniGVfiV/Eq4EJ+HW9oiEqwW4HkJz7Kd6+YxTjTnZyyojWXamCB2V7jwIC1
 iDSOItak2phwtgv/8BgHo/Cz5lieCpfvoPlSoFxe1BpLICmwWR4o/XSJ8Dsh0FxyhQIG
 XhIf5MmbnYXxQt6VfefLcCutA5HsUUJyGiXYwb/xje6qCoOjZt6/mLMeHc0FODARVWG4
 pCkg==
X-Gm-Message-State: AOAM533ID2CgMXvufHsgSeA5bM0sK/5zMzRWS2OdMHWK1QaAuSTpC70L
 lKJkuqwlCIFJ1lh/wm8esutolMyDeGqAYVVtD+fHoodP/dTNTEENuy5c4VLeRH0hYpTJNMldl2d
 uilFekmimQu4nJgE=
X-Received: by 2002:a17:906:6b82:: with SMTP id
 l2mr14726764ejr.241.1607254963116; 
 Sun, 06 Dec 2020 03:42:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwe3K5w6dIWQKCjntX/ZEb9ErUqQDFWFHxQw9Cejj1V7RSkDNTS7LUvBGyz6jtMNrQ4zknF9Q==
X-Received: by 2002:a17:906:6b82:: with SMTP id
 l2mr14726754ejr.241.1607254962893; 
 Sun, 06 Dec 2020 03:42:42 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id r24sm570243edc.21.2020.12.06.03.42.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Dec 2020 03:42:42 -0800 (PST)
Subject: Re: [PATCH 1/1] ui/gtk: Launching GTK UI with OpenGL on causes the
 refreshrate update to not run
To: Nikola Pavlica <pavlica.nikola@gmail.com>, qemu-devel@nongnu.org
References: <55ZWKQ.X7E8ESP709H31@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7f71dd8d-fe2f-f8f5-ac34-9a49ac4771b6@redhat.com>
Date: Sun, 6 Dec 2020 12:42:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <55ZWKQ.X7E8ESP709H31@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Nikola,

On 12/6/20 11:43 AM, Nikola Pavlica wrote:
> I've discussed this issue back January and September. But it still
> occurs on my machine, despite the two patches. This time, the issue is
> that the UI refresh rate doesn't get updated when I launch QEMU with
> gl=on. My fix for this issue is to move the code for updating the
> refresh rate above the code that checks for OpenGL.
> 
> Or because OpenGL is meant to be called back with the "render" callback,
> should we instead add the refresh 
> rate checking code there?

This is not my area, but I think you are right, the the refresh rate
should be updated in the "render" callback.

To speed things you can send another patch, and Gerd will pick the
correct/best one :)

> Anyway, regardless of method, I'm happy with any solution that just
> fixes the issue.
> Signed-off-by: Nikola Pavlica (pavlica.nikola@gmail.com)---
> diff --git a/ui/gtk.c b/ui/gtk.c
> index a752aa22be..74287edde8 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -776,18 +776,6 @@ static gboolean gd_draw_event(GtkWidget *widget,
> cairo_t *cr, void *opaque)
>      int fbw, fbh;
>      int refresh_rate_millihz;
>  
> -#if defined(CONFIG_OPENGL)
> -    if (vc->gfx.gls) {
> -        if (gtk_use_gl_area) {
> -            /* invoke render callback please */
> -            return FALSE;
> -        } else {
> -            gd_egl_draw(vc);
> -            return TRUE;
> -        }
> -    }
> -#endif
> -
>      if (!gtk_widget_get_realized(widget)) {
>          return FALSE;
>      }
> @@ -801,6 +789,18 @@ static gboolean gd_draw_event(GtkWidget *widget,
> cairo_t *cr, void *opaque)
>          vc->gfx.dcl.update_interval = MILLISEC_PER_SEC /
> refresh_rate_millihz;
>      }
>  
> +#if defined(CONFIG_OPENGL)
> +    if (vc->gfx.gls) {
> +        if (gtk_use_gl_area) {
> +            /* invoke render callback please */
> +            return FALSE;
> +        } else {
> +            gd_egl_draw(vc);
> +            return TRUE;
> +        }
> +    }
> +#endif
> +
>      fbw = surface_width(vc->gfx.ds);
>      fbh = surface_height(vc->gfx.ds);
> -- 
> 2.21.1


