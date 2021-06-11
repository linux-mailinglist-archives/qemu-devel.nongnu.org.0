Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7B13A4162
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 13:41:40 +0200 (CEST)
Received: from localhost ([::1]:44288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrfXf-0003Z8-A7
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 07:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrfW3-0002pd-HO
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:39:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrfV3-00027j-5w
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:39:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623411535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c9FBqWtNLXqAjIcOrNoT4I5ncGaq10HrgmqCYzLvDbU=;
 b=ZvY+NenoMvhZaw9Fag0ZV1JV8y32N5usSKH8cHtyNVfsMF4JDyIqh2bXSUxOxepJ8o0P2f
 lsDr88N3V2EgsbJrj8IKTPlAQAmIoK0wkHNOndl3SEf0B8rOVzSKXgjRLEPPQ4QfxjTTCi
 XBBTxMLFrM7JLpy+eL2dzO8xXSLvbZw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-uP137vQdMWC8jD3McSWkrw-1; Fri, 11 Jun 2021 07:38:54 -0400
X-MC-Unique: uP137vQdMWC8jD3McSWkrw-1
Received: by mail-wm1-f71.google.com with SMTP id
 u17-20020a05600c19d1b02901af4c4deac5so4334411wmq.7
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 04:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c9FBqWtNLXqAjIcOrNoT4I5ncGaq10HrgmqCYzLvDbU=;
 b=n3Aq7vyfsFyNpJeaWn9EelKwuRbGBsYGF8ZvBteRuTpOx/oZrqsBW2jU8MvvhaE/lb
 Gjkdoq4b8CB53quFcY5y/WLeq+myl4kQpsb2jQFOZAhqxFaE8RtrXkx3Th7GM67aguQS
 Ib3lFqO91gLgqLzzEk/WkNAtVvjaLx29fXoXIJfomqQNasvK0wHT/KUfiL/Y0MmoM5Mr
 L+7sQtOB/sL3oZ49vk4s930JNed3+VEMoN4fY7JbRi7Jw4NGV3nYV6ZxJvjvZOr3UBeI
 yCR+5YpLekrj8TZEkhEIEgRUQ9k3060RDNO5s4WRjb6Hdlnmmml/7ctKHMb3e3hhn/fn
 xmIQ==
X-Gm-Message-State: AOAM530Djdeq3WJnFBX9CdRT2orxj+mCWHmN2pBUs05CKOsSbrnK/yZ+
 hFsoK3y09biGYoCbovjIi/ISw8tpEOwkQPrmbYxRjs4maFkzH1UvGFW5jPRFLvrV7HfcZ7D3ahN
 81ETzmQCRxGL3c9Y=
X-Received: by 2002:adf:cd87:: with SMTP id q7mr3563345wrj.370.1623411533538; 
 Fri, 11 Jun 2021 04:38:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4Zb2GnVqG7RAgunN+5xujJ6KTK6BJ6sdPp2BmOndfZfKCVt0jP2wIszwiG8IExWOfumMNbg==
X-Received: by 2002:adf:cd87:: with SMTP id q7mr3563324wrj.370.1623411533337; 
 Fri, 11 Jun 2021 04:38:53 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 89sm7119148wrq.14.2021.06.11.04.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 04:38:52 -0700 (PDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 fam@euphon.net, laurent@vivier.eu, hpoussin@reactos.org
References: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
 <20210519100803.10293-5-mark.cave-ayland@ilande.co.uk>
 <09e11569-b61e-db90-efe8-7f2f3c3d4cad@redhat.com>
 <3a4aa5ea-2e71-0f32-5d25-f34a90167019@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 4/5] esp: revert 75ef849696 "esp: correctly fill bus id
 with requested lun"
Message-ID: <792a6be1-0738-dab1-564e-939567f0d38b@redhat.com>
Date: Fri, 11 Jun 2021 13:38:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3a4aa5ea-2e71-0f32-5d25-f34a90167019@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/21 17:31, Mark Cave-Ayland wrote:
> Due to the absence of the IDENTIFY byte in the S case I'm guessing from 
> the patch that the LUN is in encoded in buf[1] (the top bits being 
> "Reserved" according to my copy of the specification).

They used to be the LUN many years ago.

>   static void s_without_satn_pdma_cb(ESPState *s)
>   {
> +    uint8_t busid;
> +
>       if (!esp_get_tc(s) && !fifo8_is_empty(&s->cmdfifo)) {
>           s->cmdfifo_cdb_offset = 0;
>           s->do_cmd = 0;
> -        do_busid_cmd(s, 0);
> +        busid = s->cmdfifo.data[1] >> 5;
> +        do_busid_cmd(s, busid);
>       }
>   }

Considering how obsolete the LUN-in-CDB case is (and now that I actually 
understand that the first byte is a message-phase byte), it is probably 
be more correct to keep the previous busid: with no message phase, the 
previously-selected LUN would be addressed.  I can send a patch for 
this, but it's orthogonal to this one so I queued it as well.

Paolo


