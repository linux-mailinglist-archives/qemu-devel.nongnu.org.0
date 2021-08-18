Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4903F079C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 17:13:49 +0200 (CEST)
Received: from localhost ([::1]:60850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGNGF-0000iR-Oj
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 11:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGNEl-0008RZ-A4
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 11:12:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGNEh-0003bn-9d
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 11:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629299528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xj5ZZ/h2kqueDcLQteP4Tnbpnmj+7blsQRM6T5zQzYY=;
 b=Sk48JorwSSG2qp0+iG0v28kgkjaSXkPMKOAYoDS6ZX5lDJkbXLlBDNx/Y+qAO5Ygk0aUSm
 BVhomMagrIqmJHpSgUjc8T7IODOHhDWE/UpSdtD7DMNaYmlkN+ONFBSJjthrZ465BYxBor
 T6EDKr/COhe4UXCR7nDbe6TnFkNtwuA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-1WAFIYSINJy2BdkK1P89vQ-1; Wed, 18 Aug 2021 11:12:07 -0400
X-MC-Unique: 1WAFIYSINJy2BdkK1P89vQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 z1-20020adfdf810000b0290154f7f8c412so687349wrl.21
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 08:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xj5ZZ/h2kqueDcLQteP4Tnbpnmj+7blsQRM6T5zQzYY=;
 b=NeaFUTOX6dkXVri0TkbsridB+SLHQ/NR8Zzv13eBw3fCpKkjGyukfdQgKyhmFipL1x
 dHRwTAJI9wIH47nCoPvZ+qzvdvJ83uD/mdvNtWDP7Kr7eTQVTfVWaqrUHj17LMAK5GOG
 KGsR8Z2jMe8PMjdMamOqcN+qY5C6PZfskGbgg4UhhzQvnQ5f8yNo1Z1iUlJMJaAGcT7K
 fVkKMHvTrLtZ1VnbwZBfxsCW2QItfqq50TJYu2oK9WSvg2CNXl6K0YddeO95f7PXG03P
 rjwW1m8ChW9cDmJus4dsrVkeHmU+T5mr4B12IVlvpZeaUj++Ob448a8IxS81L4J/OxLi
 s3XA==
X-Gm-Message-State: AOAM5315CEReaKQmCxGrElJOqWAixYwKGnixCfbdI7Nd7J8tbSAuruAN
 QjYMoWpczFO4v9RIYLlCCWl2oZ8pY7564gA3ALadOFNSVztOnAj9gZ0dxZ6MeE2qVJr6HbXooS8
 iJ64U0t6c4FfZbzA=
X-Received: by 2002:a05:6000:1012:: with SMTP id
 a18mr10996569wrx.426.1629299526533; 
 Wed, 18 Aug 2021 08:12:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKK6uWtFiBjOo0SczaP3WPWYznEcyrzZVXHKUwjPZE/hH5FYLUfG259scDBJlVL+S2Z+Eo/w==
X-Received: by 2002:a05:6000:1012:: with SMTP id
 a18mr10996534wrx.426.1629299526298; 
 Wed, 18 Aug 2021 08:12:06 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f17sm102716wmq.17.2021.08.18.08.12.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 08:12:05 -0700 (PDT)
Subject: Re: [PATCH 1/1] uas: add stream number sanity checks.
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210818120505.1258262-1-kraxel@redhat.com>
 <20210818120505.1258262-2-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ff6d199d-6c2a-8dce-a0c0-f30af90ee082@redhat.com>
Date: Wed, 18 Aug 2021 17:12:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818120505.1258262-2-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Chen Zhe <chenzhe@huawei.com>, Tan Jingguo <tanjingguo@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 2:05 PM, Gerd Hoffmann wrote:
> The device uses the guest-supplied stream number unchecked, which can
> lead to guest-triggered out-of-band access to the UASDevice->data3 and
> UASDevice->status3 fields.  Add the missing checks.
> 
> Fixes: CVE-2021-3713

Reported-by: Chen Zhe <chenzhe@huawei.com>
Reported-by: Tan Jingguo <tanjingguo@huawei.com>

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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
>  }

Thanks for tackling this, I was looking but thought it was too
late for 6.1. Beside your obvious checks, I'd also modify
usb_uas_alloc_status() to feel safer, by checking 'tag'.
Eventually returning NULL and adapt the call sites? Anyway
this can wait 6.2, so for this patch:

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


