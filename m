Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6674446F4C6
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 21:19:12 +0100 (CET)
Received: from localhost ([::1]:52526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvPsk-000064-WA
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 15:19:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1mvPqb-00075o-Lf
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 15:16:58 -0500
Received: from [2607:f8b0:4864:20::331] (port=35345
 helo=mail-ot1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1mvPqa-0001vA-0F
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 15:16:57 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso7467371otr.2
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 12:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=t/vUw2aLrU3Ohvz+dgBomF4qsHupZSMAZmL3w/htTtE=;
 b=AVfOG9e3DuYEMK7zkKSBC88srcVl74yUSdw0s/Sj7TUdJ/ZojxvA/oylrYq1PXdhnI
 cbx/4ANK4Ld93igMr3pi74sqZN/DRWGdYGy7yS5XAAvroEF0YdoNW6D9yh2Ckp48QMdb
 LXKfKRMTA7qWWs6X2atF30vRLs0/+X8VI71au1JESwfX67I1e9FwtTlrItx+EgqTD9us
 bC0UIXTJPiSO+kpGeMkw6mMCrZhpz5NWDuMLuPoEq4KsBDNKF+ilfjyRvXElh5GGnQ+S
 kAGfJdV/09w4EGo6fMZAx5wp2+r8hv27qJC4po5HIyC+fogGAfuAU6AghAaI+VHRim5j
 DLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=t/vUw2aLrU3Ohvz+dgBomF4qsHupZSMAZmL3w/htTtE=;
 b=S2IBjR9pvOKEDK3WlM9zZxJXynvrIGEt+4Y/3l5BfMrUydl0FnxWte1YyYlCe7OkPN
 X0sX1FvGB4egU9UYa0eNGTA/Sq4SLZdszdvfBP6/3rrbWY+NaMIMBnl29G1r6oSbGu5D
 KCSwRKiZqaixU4q2Ni9PEe/NUylx4wROqh+Oj03F4+esLtpma1QLk1j7anmkA3hf3Gst
 Uv65JFTK2fcnBKzW78Zsep254TAb8unlixzUosVy23Lgt+bTt5WPAPWzQobPDUSeEHe6
 gDTtQvloEq/dd+gUbQo9myhle0TXgrTqVg7OYBC9E35SOONqpQfPKWXFVVGHwhtxL6UZ
 2XVg==
X-Gm-Message-State: AOAM532ksjb1hMIjTUgbrOYHQDJR1ZbR281ZlKEFyXoh8R3CR8inFb+C
 pogrqg4jRtJFX5rUL6uql50=
X-Google-Smtp-Source: ABdhPJx/fkDY6CaEH0TFlTy9RpDXcbuIiCiXlZ1fWENPNAPZx3UvRIc3yFJplsCnJS5yqKARk1uQxA==
X-Received: by 2002:a9d:2c6:: with SMTP id 64mr7553273otl.0.1639081014347;
 Thu, 09 Dec 2021 12:16:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f9sm144098oto.56.2021.12.09.12.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 12:16:53 -0800 (PST)
Date: Thu, 9 Dec 2021 12:16:52 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/1] uas: add stream number sanity checks.
Message-ID: <20211209201652.GA2342043@roeck-us.net>
References: <20210818120505.1258262-1-kraxel@redhat.com>
 <20210818120505.1258262-2-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210818120505.1258262-2-kraxel@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::331
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, Aug 18, 2021 at 02:05:05PM +0200, Gerd Hoffmann wrote:
> The device uses the guest-supplied stream number unchecked, which can
> lead to guest-triggered out-of-band access to the UASDevice->data3 and
> UASDevice->status3 fields.  Add the missing checks.
> 
> Fixes: CVE-2021-3713
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reported-by: Chen Zhe <chenzhe@huawei.com>
> Reported-by: Tan Jingguo <tanjingguo@huawei.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/usb/dev-uas.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
> index 263056231c79..f6309a5ebfdc 100644
> --- a/hw/usb/dev-uas.c
> +++ b/hw/usb/dev-uas.c
> @@ -840,6 +840,9 @@ static void usb_uas_handle_data(USBDevice *dev, USBPacket *p)
>          }
>          break;
>      case UAS_PIPE_ID_STATUS:
> +        if (p->stream > UAS_MAX_STREAMS) {
> +            goto err_stream;
> +        }
>          if (p->stream) {
>              QTAILQ_FOREACH(st, &uas->results, next) {
>                  if (st->stream == p->stream) {
> @@ -867,6 +870,9 @@ static void usb_uas_handle_data(USBDevice *dev, USBPacket *p)
>          break;
>      case UAS_PIPE_ID_DATA_IN:
>      case UAS_PIPE_ID_DATA_OUT:
> +        if (p->stream > UAS_MAX_STREAMS) {
> +            goto err_stream;
> +        }
>          if (p->stream) {
>              req = usb_uas_find_request(uas, p->stream);
>          } else {
> @@ -902,6 +908,11 @@ static void usb_uas_handle_data(USBDevice *dev, USBPacket *p)
>          p->status = USB_RET_STALL;
>          break;
>      }
> +
> +err_stream:
> +    error_report("%s: invalid stream %d", __func__, p->stream);
> +    p->status = USB_RET_STALL;
> +    return;

How is this supposed to work ? It results in messages such as the following.

qemu-system-sparc64: usb_uas_handle_data: invalid stream 1
qemu-system-sparc64: usb_uas_handle_data: invalid stream 1

It also sets the status unconditionally to USB_RET_STALL,
and UAS is simply broken after this patch is applied because
the error handling code is executed literally for each call
of usb_uas_handle_data().

Guenter

