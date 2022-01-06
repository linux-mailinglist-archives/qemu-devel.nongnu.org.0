Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3CF485F7B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 05:03:34 +0100 (CET)
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Jzw-0007pZ-Kr
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 23:03:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5JyY-0007AJ-4x
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 23:02:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5JyV-0007Fe-ET
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 23:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641441721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IzAVU1YrMkBKqVVtAjJUBRr/W+oCYw7UxV1xIFmeNkk=;
 b=bfs4wG8M2sZyJd2jZgYJekK5m95jrHhh2U6oc5cFdn5TOeU6ZDX2okTe7IgFGJJD+RSALt
 I7VheXLN3FQ0K4sYKbBgXqEMGuKpY4sqavhNo7Z3pgJ68a8+eHwxPq6pWavS+Hbflc2kiU
 Vw6seXVFkOnYr3S4zUsz7uGeFtW/xAQ=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-zIXe0naKPBOPZXbRgfdT1A-1; Wed, 05 Jan 2022 23:02:00 -0500
X-MC-Unique: zIXe0naKPBOPZXbRgfdT1A-1
Received: by mail-pg1-f200.google.com with SMTP id
 r1-20020a639b01000000b0034243da71caso819249pgd.7
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 20:02:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IzAVU1YrMkBKqVVtAjJUBRr/W+oCYw7UxV1xIFmeNkk=;
 b=2ibNgk51L42augXWoAGofIsAf8IkxBIDgqZPiF/12bsp8gLhoPH/A+NUkj/38gRWFC
 HuhwSycMODgggMJu4E/2mBE/hOdqJmTAvlcWzHD3W1rtg82hIMzpeR1+Y0UuA4dpYw2k
 ccZ0w9vjehCFii6o61ONdvCAJTf4aDpftnREv0TyPSpvLPL2TVHSmVVN7CDLszFQqRLq
 JnBWBIm52MH6QaqfDPjhwVcsA5EmSFUkSqcwuHRZpp0p8GVww/Bfi0xdxHlIQK1zI9bH
 0KWScU8H4O7nV9PrayUk5gWtVL8q6iAkoEITJ0hm/3Y8gxoSRcXWllIR+ZwBep2OVEZH
 ZoDg==
X-Gm-Message-State: AOAM532nKfqut67BF0hbLEk9MHSGhkYg8D0Rvt6HL3zAXpB5XKAXga1S
 RMNJcMk3B1xsG/GYISiLenLZuFwKgcKW7eSjycJOUPbkdA8JUnpB5uksHegp/rb9Tc1o7VhcswM
 VhGswLR+/XRuiy9c=
X-Received: by 2002:a17:902:7d81:b0:149:c926:7c2e with SMTP id
 a1-20020a1709027d8100b00149c9267c2emr7300480plm.27.1641441719713; 
 Wed, 05 Jan 2022 20:01:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziJJnFvto4v9UPYKzGK9523FcMobJXDjGd010bI9fJ8Gu9H7e/sWESDWsIPwRB6FD4L3y9sQ==
X-Received: by 2002:a17:902:7d81:b0:149:c926:7c2e with SMTP id
 a1-20020a1709027d8100b00149c9267c2emr7300465plm.27.1641441719429; 
 Wed, 05 Jan 2022 20:01:59 -0800 (PST)
Received: from [10.72.13.242] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id t136sm541770pfc.124.2022.01.05.20.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 20:01:58 -0800 (PST)
Message-ID: <053ecc0d-f9c1-28f4-5348-f8d2f13c037b@redhat.com>
Date: Thu, 6 Jan 2022 12:01:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH v2] net/tap: Set return code on failure
To: Patrick Venture <venture@google.com>, f4bug@amsat.org, pefoley@google.com
References: <20220105164500.3381822-1-venture@google.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220105164500.3381822-1-venture@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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


在 2022/1/6 上午12:45, Patrick Venture 写道:
> From: Peter Foley <pefoley@google.com>
>
> Match the other error handling in this function.
>
> Fixes: e7b347d0bf6 ("net: detect errors from probing vnet hdr flag for TAP devices")
>
> Reviewed-by: Patrick Venture <venture@google.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Peter Foley <pefoley@google.com>
> ---
> v2: Fixed commit titlewq and updated description.
> ---


Applied.

Thanks


>   net/tap.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/net/tap.c b/net/tap.c
> index f716be3e3f..c5cbeaa7a2 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -900,6 +900,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
>               if (i == 0) {
>                   vnet_hdr = tap_probe_vnet_hdr(fd, errp);
>                   if (vnet_hdr < 0) {
> +                    ret = -1;
>                       goto free_fail;
>                   }
>               } else if (vnet_hdr != tap_probe_vnet_hdr(fd, NULL)) {


