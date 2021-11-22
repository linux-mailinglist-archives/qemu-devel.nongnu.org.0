Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E24458E0B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 13:12:31 +0100 (CET)
Received: from localhost ([::1]:41812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp8BR-0003ay-9I
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 07:12:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mp89E-0002XZ-L3
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:10:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mp89B-0004HD-W1
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637583009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKv8jIyKXoc1j9Mhs+cajfyXl40q7rppWt1/IRAuwIQ=;
 b=iDhN2ilCxTdDO2986ZCAbTfNDMjOglth1dv4LN4KgQQBgFsQBjUalopwi6vghx2vMAKEIJ
 X0GZRGz/+nXaRoWGPp7qrI3Uq8usxyuK1xAMFRVq/hNXe7yUoXymbbkP7LSX2IEW2mQTPS
 /81h/nFl6PFFrdAisFluDBS28EGDH/A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-1KWSuE5UOKGH29GpZ-mWhA-1; Mon, 22 Nov 2021 07:10:08 -0500
X-MC-Unique: 1KWSuE5UOKGH29GpZ-mWhA-1
Received: by mail-wr1-f71.google.com with SMTP id
 d3-20020adfa343000000b0018ed6dd4629so3064254wrb.2
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 04:10:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rKv8jIyKXoc1j9Mhs+cajfyXl40q7rppWt1/IRAuwIQ=;
 b=ZRuksLPY71M2PhOk1uHROqNpgjq0MY9l3F1IJ0tBGhXtYEx4ej6EdkLaMc9L8z+nQy
 oFMWJb1i6P7BZI41wDP2vuU0AxuU+zPiGKjtaoWhTZ+X+AfXiPRQo9qDkaTD/jlXPYW5
 TWw7BCT1KQJK38++dDWdPQfaDtq6IRDVZKs5Lasokg/buYQ5tOxgON69Vf+jgUGsZ6RW
 YuCjV+OaH2v3CCIJnVaH4KxYJm3ovljTzLk2dSncc4pZ0P60Or9A9ooqhSX4xsgzAmWb
 UniJf0H5zlkr3pXxcXxb8dh0EWz2KldLmVghZz7MyAfAiMocnSiTyIV6ux48c3t5xsol
 4e/g==
X-Gm-Message-State: AOAM533Ruq67x+L2G7nhqpCyZqc+tBVZuqNO3PtMroXdjCTZZcpHvB5x
 EUAN92R+TtYOYIatesKv7YeXwLJYyFlHZXaSae7C3NBDRiioVg7xntrQG9LChKHhA0XlsAjuVpR
 aWtCUtlJxrCAcEhM=
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr24660344wmc.137.1637583006777; 
 Mon, 22 Nov 2021 04:10:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyW6t+ZRaktQ+ir7CXeH06astJgy0JNbtzauW2kDbzSf5XM6emtv1YiTHJRWeECA/OBX4VFpQ==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr24660306wmc.137.1637583006589; 
 Mon, 22 Nov 2021 04:10:06 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 138sm16464530wma.17.2021.11.22.04.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 04:10:06 -0800 (PST)
Message-ID: <17a034f7-de27-08a9-65b4-f0c1a551c0f3@redhat.com>
Date: Mon, 22 Nov 2021 13:10:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2?] ui/gtk: graphic_hw_gl_flushed after closing
 dmabuf->fence_fd
To: Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20211121172237.14937-1-dongwon.kim@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211121172237.14937-1-dongwon.kim@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/21 18:22, Dongwon Kim wrote:
> The dmabuf often becomes invalid right after unblocking pipeline
> and graphic_hw_gl_flushed in case a new scanout blob is submitted
> because the dmabuf associated with the current guest scanout is
> freed after swapping.
> 
> So both graphic_hw_gl_block and graphic_hw_gl_flushed should be
> executed after closing fence_fd for the current dmabuf.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>

If so:
Fixes: 65b847d284c ("ui: Create sync objects and fences only for blobs")

> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  ui/gtk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 7abe1a69d8..2a3a9db13f 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -589,11 +589,11 @@ void gd_hw_gl_flushed(void *vcon)
>      VirtualConsole *vc = vcon;
>      QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
>  
> -    graphic_hw_gl_block(vc->gfx.dcl.con, false);
> -    graphic_hw_gl_flushed(vc->gfx.dcl.con);
>      qemu_set_fd_handler(dmabuf->fence_fd, NULL, NULL, NULL);
>      close(dmabuf->fence_fd);
>      dmabuf->fence_fd = -1;
> +    graphic_hw_gl_block(vc->gfx.dcl.con, false);
> +    graphic_hw_gl_flushed(vc->gfx.dcl.con);
>  }
>  
>  /** DisplayState Callbacks (opengl version) **/
> 


