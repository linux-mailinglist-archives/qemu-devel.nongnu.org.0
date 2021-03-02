Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18265329691
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 08:02:53 +0100 (CET)
Received: from localhost ([::1]:37200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGz3U-0005gF-4g
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 02:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGz0f-0004P7-Do
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 01:59:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGz0d-0007yh-U4
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 01:59:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614668395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hrI4HONUyMLzqEC9i7lAUw9esnasU6RSkjf3DgLTfC0=;
 b=gM67IDDVIEo4bQzAJn7hVixuAicKhKZH9eTo13elCRTIKQLbYYtPnyFbeNNn6aIvf1NDWi
 JEEkNB6NzS3MBk+mDjfLo4fB0ThPX3XD9aPpbDcrL1NHkrNOPfEMTcfpbHHbKyGjEMkx4P
 /TYOo2HE8Y5/kItw7X1NeTGH9fR8NJk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-odxwLYOwPKG3y9L6OFKi_A-1; Tue, 02 Mar 2021 01:59:53 -0500
X-MC-Unique: odxwLYOwPKG3y9L6OFKi_A-1
Received: by mail-ej1-f72.google.com with SMTP id jo6so5925315ejb.13
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 22:59:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hrI4HONUyMLzqEC9i7lAUw9esnasU6RSkjf3DgLTfC0=;
 b=VSuX0rtAS0oA9FAu29MtcL5XgLBkW4GsTSUY08f464bTz6H0Hs72Z8ehiCpVI+VpgN
 N/xtw7G6QNKjqThOfRE6Dz2h6PqXe93KWxrgAj/1DFJsgWn0HLwe10drCf194xBWdxec
 m9PG1L9AgbYmsiER14CQqJnoR2gch/JsUVQoo7ZQFfcmSRb439v2OVMSDQyhsQ0h5JED
 PT9cD1DxPLfvaWGCMUshD74tIvlAoRNz3wHVSLK0F3AQQFmwBwQXcrsnp5kqPHB8VezK
 2BEOZWbWwEAdeUha4n7b9kSHbzF+a1XWgvWKIKe/05xJ1lW0zwI7HbG0kiUof8iYqusI
 PuAQ==
X-Gm-Message-State: AOAM530unGHMtA7Bru16u94dX7eo2iTVlBacxf6404tEQOztg4/sO7ZL
 sPQbybjHlGWYnbo7qGMvaMtR6oj7yrP85WvPeSjPYCvN6lo4wLrTrlE89cDrUED5qI/j3lM2Ood
 RpTgu2+alVo98xJI=
X-Received: by 2002:a17:906:128e:: with SMTP id
 k14mr19108954ejb.427.1614668391631; 
 Mon, 01 Mar 2021 22:59:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEkbEeZSy2iRn2HITU7rP5LBWNuJCwc9HkbS3dh93BgCIlnKo+ywfZ+yp0+aynQc9wgeCeCw==
X-Received: by 2002:a17:906:128e:: with SMTP id
 k14mr19108942ejb.427.1614668391481; 
 Mon, 01 Mar 2021 22:59:51 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r24sm10849329edw.11.2021.03.01.22.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 22:59:51 -0800 (PST)
Subject: Re: [PATCH V3 09/10] cadence_gem: switch to use qemu_receive_packet()
 for loopback
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210302055500.51954-1-jasowang@redhat.com>
 <20210302055500.51954-11-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b63de52b-6e6c-b3e8-87f7-8b9e11848681@redhat.com>
Date: Tue, 2 Mar 2021 07:59:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302055500.51954-11-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: alxndr@bu.edu, qemu-security@nongnu.org, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 6:54 AM, Jason Wang wrote:
> From: Alexander Bulekov <alxndr@bu.edu>
> 
> This patch switches to use qemu_receive_packet() which can detect
> reentrancy and return early.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  hw/net/cadence_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 7a534691f1..6032395388 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1275,7 +1275,7 @@ static void gem_transmit(CadenceGEMState *s)
>                  /* Send the packet somewhere */
>                  if (s->phy_loop || (s->regs[GEM_NWCTRL] &
>                                      GEM_NWCTRL_LOCALLOOP)) {
> -                    gem_receive(qemu_get_queue(s->nic), s->tx_packet,
> +                    qemu_receive_packet(qemu_get_queue(s->nic), s->tx_packet,
>                                  total_bytes);

Indent now off, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>                  } else {
>                      qemu_send_packet(qemu_get_queue(s->nic), s->tx_packet,
> 


