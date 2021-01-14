Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB442F5F8A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 12:13:49 +0100 (CET)
Received: from localhost ([::1]:36850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l00ZY-0007aN-NX
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 06:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l00Xo-0006Hh-QX
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:12:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l00Xm-0008JQ-Vt
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610622718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDPST5mNl23EtDwkv/I6qinNrb5SHIgTOOoQahv0jZ8=;
 b=Ls3+DT0gwU1Pmx7n71Jwv8Hn7jWpnWCTeEZ58/L5vOfLk34loxxrM74HZS3M8pL9h/PJj3
 qtawwSZMoJTu63gzRF3f+uRYwkwleagt8UkKFT1WOQuK7WH2w3Oxmp444bbVAMZGccL5V+
 fhkpY5D8X7pLUZYvFZkdywn0gwZfokA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-uXe1rSJ6PN-ZtYWe2jpVEg-1; Thu, 14 Jan 2021 06:11:56 -0500
X-MC-Unique: uXe1rSJ6PN-ZtYWe2jpVEg-1
Received: by mail-wr1-f70.google.com with SMTP id m20so2457074wrh.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 03:11:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vDPST5mNl23EtDwkv/I6qinNrb5SHIgTOOoQahv0jZ8=;
 b=DtNVcpW3n5FPI+9AXqNJzD8ZruclZSBaKvW7ZnbmgJLJljjjWXeg/q7f1+5RWu0OW6
 8yXuZlo560WLljy3eKqmhOpfG+0DsAkLeKn2nuiiYTgirbxUn410dcB8OYYHcOplXQAZ
 H+DDlc/yf5f0Qy7E/8QGqCrMSwc8QaXRJdz2Aos4PbFpHjm/nW68CYBNEnNv068/tlpZ
 2imlZBHHFafW9s6kjxYOasLATsZ8WD+5OxI7UW+2aKLV5eEE1geX2wJdMYhpEAVPYwyQ
 6FCyzXxWlrR7/34Cs61bfEk2IUYh+aTYO/+q8duuYEHlr6tjhClp3oA5C2dJwlxREk9U
 Npdg==
X-Gm-Message-State: AOAM532weNuML4JyjhpsyAmolmBTzrjvS0KoshGjsIx0QKG6lF+9g83P
 ri559tfe4BKPn9kwOG/PXdSnZUD16WJ4QdIc9a/xO4eYaizqzoztAea6cd2cmr70wwjekU50T5t
 L82cE3SWbZQmiXgQ=
X-Received: by 2002:a7b:ce02:: with SMTP id m2mr3325898wmc.111.1610622715117; 
 Thu, 14 Jan 2021 03:11:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0Z+Dz2BbR4mkQCWxfvwX7OXqMjzC/scc4QY/oJ8N8AIbfLGz/9GDMK67GFGLjlMBrExex3w==
X-Received: by 2002:a7b:ce02:: with SMTP id m2mr3325875wmc.111.1610622714833; 
 Thu, 14 Jan 2021 03:11:54 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g1sm8725368wrq.30.2021.01.14.03.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 03:11:54 -0800 (PST)
Subject: Re: [PATCH 1/3] ui/gtk: don't try to redefine SI prefixes
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <d5f2e3c5-b6d0-db4e-70c2-9de47fd8fefd@t-online.de>
 <20201213165724.13418-1-vr_qemu@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a5f9e021-ef72-6d1c-18c1-f21d449b7b3c@redhat.com>
Date: Thu, 14 Jan 2021 12:11:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201213165724.13418-1-vr_qemu@t-online.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>, Nikola Pavlica <pavlica.nikola@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/20 5:57 PM, Volker Rümelin wrote:
> Redefining SI prefixes is always wrong. 1s has per definition
> 1000ms. Remove the misnamed named constant and replace it with
> a comment explaining the frequency to period conversion in two
> simple steps. Now you can cancel out the unit mHz in the comment
> with the implicit unit mHz in refresh_rate_millihz and see why
> the implicit unit ms for update_interval remains.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>  include/ui/gtk.h | 2 --
>  ui/gtk.c         | 3 ++-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/include/ui/gtk.h b/include/ui/gtk.h
> index eaeb450f91..80851fb4c7 100644
> --- a/include/ui/gtk.h
> +++ b/include/ui/gtk.h
> @@ -24,8 +24,6 @@
>  #include "ui/egl-context.h"
>  #endif
>  
> -#define MILLISEC_PER_SEC 1000000

Indeed this is MICROSEC_PER_SEC.

> -
>  typedef struct GtkDisplayState GtkDisplayState;
>  
>  typedef struct VirtualGfxConsole {
> diff --git a/ui/gtk.c b/ui/gtk.c
> index a752aa22be..86b386a20d 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -798,7 +798,8 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
>      refresh_rate_millihz = gd_refresh_rate_millihz(vc->window ?
>                                                     vc->window : s->window);
>      if (refresh_rate_millihz) {
> -        vc->gfx.dcl.update_interval = MILLISEC_PER_SEC / refresh_rate_millihz;
> +        /* T = 1 / f = 1 [s*Hz] / f = 1000*1000 [ms*mHz] / f */
> +        vc->gfx.dcl.update_interval = 1000 * 1000 / refresh_rate_millihz;
>      }
>  
>      fbw = surface_width(vc->gfx.ds);
> 


