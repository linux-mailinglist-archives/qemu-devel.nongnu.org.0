Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E12258BFC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 11:48:14 +0200 (CEST)
Received: from localhost ([::1]:46638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD2ti-0007l4-0z
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 05:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kD2fK-00023h-I5
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 05:33:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52071
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kD2fI-00015V-8x
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 05:33:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598952798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gdB7Mjs89u9mYomjkCKGspyFBidvgOuv4GI7WW+HVE0=;
 b=cPh+uwI2B5kIZ1Sb7kEsyTCKN3H6HUGMufbZDukE6HULUZ3V8zAoDruTZmbAPpdDIX2+Eo
 LSbuFSOBRj4mjIolUqMUlcElVuOxqMa/qYlfr7g0SlI/yaBajhFcotBstAAPs142fWnuCO
 d7ZybwfxuIjEojsAM7uCkH6XftSSrug=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-6wMf2geFNr6C6Hb-Lo1b_w-1; Tue, 01 Sep 2020 05:33:17 -0400
X-MC-Unique: 6wMf2geFNr6C6Hb-Lo1b_w-1
Received: by mail-wr1-f71.google.com with SMTP id f18so335942wrv.19
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 02:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=gdB7Mjs89u9mYomjkCKGspyFBidvgOuv4GI7WW+HVE0=;
 b=Y/yrh+C7eisTOy7rzJTOolTYJ0fZwIaEeRDaQs7nHAggmfm+JYQZUdkGsSvtX33ikl
 5nZWtlUk+6xj5LqNEZWzfaCgcL9uW2w9733uLUN/ilREftPp/sNhTOxhek+I1y7Uqce7
 tX/8lPPeff8NGnpEYdhQnAi7yxu4klgcnRjWV97GKXhZCANrn0B9f5PHfMvIc6I/ZAWH
 MieKi8n+l6L2OCqy3n/mxv5eJW0BhtrDTUILU27oPSE7vaHj/yg9eAUIDF06p1c2Eh3p
 tdAXrl1QlvlkJ8D1A6wAvfyXSd32Vxb3u2U1MyOGgvqMzPZSPPUdGQH3ukxE49tf9oW3
 lbkw==
X-Gm-Message-State: AOAM530xZN68JTfnlnuwDo8beuitO8/bglo4YCorBXh1rgYRWk0cfy2G
 jGJVvhv9tMn6dn6K6/QvEf3E7Yk7A8MYrhBaj802TqefmiKLlzbqXp1/l9QFc9hNxPAikqAyaQc
 XvWc1S4RHcAEtgdo=
X-Received: by 2002:adf:f382:: with SMTP id m2mr829381wro.327.1598952796121;
 Tue, 01 Sep 2020 02:33:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+VGqIoOAREZflvHY7T8a4MCDvEIzLRwqTCVanXZ7rsV5MER6dMfFS+ejXRdTU9YHn8NGCTQ==
X-Received: by 2002:adf:f382:: with SMTP id m2mr829361wro.327.1598952795891;
 Tue, 01 Sep 2020 02:33:15 -0700 (PDT)
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id j7sm1527012wrs.11.2020.09.01.02.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 02:33:15 -0700 (PDT)
Subject: Re: [PATCH] usb: call usb_packet_cleanup on usb_packet_map failure
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200901052723.15492-1-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <e1eed3b4-89d0-c5ba-8ae1-de9076ffbd01@redhat.com>
Date: Tue, 1 Sep 2020 11:33:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200901052723.15492-1-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 00:57:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.13, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/20 7:27 AM, Gerd Hoffmann wrote:

Reported-by: Prasad J Pandit <pjp@fedoraproject.org>

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/usb/hcd-ehci.c | 2 ++
>  hw/usb/hcd-xhci.c | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index 2b995443fbfd..67847a9cf5f1 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -1373,6 +1373,7 @@ static int ehci_execute(EHCIPacket *p, const char *action)
>          usb_packet_setup(&p->packet, p->pid, ep, 0, p->qtdaddr, spd,
>                           (p->qtd.token & QTD_TOKEN_IOC) != 0);
>          if (usb_packet_map(&p->packet, &p->sgl)) {
> +            usb_packet_cleanup(&p->packet);
>              qemu_sglist_destroy(&p->sgl);
>              return -1;
>          }
> @@ -1456,6 +1457,7 @@ static int ehci_process_itd(EHCIState *ehci,
>                  usb_packet_setup(&ehci->ipacket, pid, ep, 0, addr, false,
>                                   (itd->transact[i] & ITD_XACT_IOC) != 0);
>                  if (usb_packet_map(&ehci->ipacket, &ehci->isgl)) {
> +                    usb_packet_cleanup(&ehci->ipacket);
>                      qemu_sglist_destroy(&ehci->isgl);
>                      return -1;
>                  }
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index 46a2186d912a..9b156048920d 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -1616,6 +1616,7 @@ static int xhci_setup_packet(XHCITransfer *xfer)
>      usb_packet_setup(&xfer->packet, dir, ep, xfer->streamid,
>                       xfer->trbs[0].addr, false, xfer->int_req);
>      if (usb_packet_map(&xfer->packet, &xfer->sgl)) {
> +        usb_packet_cleanup(&xfer->packet);
>          qemu_sglist_destroy(&xfer->sgl);
>          return -1;
>      }
> 


