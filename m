Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A734939B9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 12:40:16 +0100 (CET)
Received: from localhost ([::1]:56894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA9K3-0001RG-AT
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 06:40:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nA9A2-0001Vs-ST
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:29:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nA9A0-0004As-2Z
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642591785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9GZGwu+uoagPd2ruG5+1BLavrqWVPGoUt7enSH3lXE8=;
 b=aKmgMIcpa2Zu3udZIzuzJoIJjveiLOU0BsGKoHw89xMKAjB/Koh/OS2gq7jTjTsXGyni7u
 qH9TbVS+d5LqnpOc6J3tSaCCb2mDIWBJEjtvayY0u1YytHDoSgBYRE0m+3B8m1+Ozc6+bS
 5hWZjHBfAuaCF5O3FBbjkhQ/6rjUr6c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-rKx4lJ4QPcu_oO-GG6LZqA-1; Wed, 19 Jan 2022 06:29:43 -0500
X-MC-Unique: rKx4lJ4QPcu_oO-GG6LZqA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j6-20020a05600c1c0600b0034c02775da7so1106147wms.3
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 03:29:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9GZGwu+uoagPd2ruG5+1BLavrqWVPGoUt7enSH3lXE8=;
 b=Gkk1vwHzqFcyaNjbgRf09VeXCen/IXWMHQTh7/uAvL2BQ0zD+jOfF0fUrbx/yUJYEA
 rs7NuZSuYKncVPh/Md7Jtf7qsX2LaQ4a5IOAmcgQuu52WAzRIpUNwqa7rLUU5I1sCrye
 zqp2tyzIK0bTTEGFSj6Z9HAviL6ShffKyDnVu92fZksqVSH8cXdQPtIIU82B/NYw4m2H
 2bak3rzpBpoYxSpi6qQxSSuI7cKGYXiKcbgwY/yjQRRIZipe/Xu6oeQKMIiI2ZP9myow
 d163PaQqo6G42Xe0Q9Ihk3JtucX7zY+c6o5fs6Xeo8fqqbN8G6uqqiv4leCxjePtu7wO
 pCkQ==
X-Gm-Message-State: AOAM532aNtL+gRKjdvu5V7nwEAXX+crUdi0LTdegaJGyz0YPsMpHm7nt
 HKwtXd2QE6A97rBGsLG8ZJGtZxOo1NkMXwPQY+3Jb4C1q0A7fDT1gQ1tYEcx6XC5kcsAmI/68Be
 eHgNH6ndaDjcNPGY=
X-Received: by 2002:a5d:4301:: with SMTP id h1mr27267246wrq.511.1642591782768; 
 Wed, 19 Jan 2022 03:29:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNmPcx3PUMJAYc/kgj9rOaeCqks7Iyr5wNfsZNivHaET+VK+h9FX3wRveNoYzOMm4RO4uI8A==
X-Received: by 2002:a5d:4301:: with SMTP id h1mr27267229wrq.511.1642591782578; 
 Wed, 19 Jan 2022 03:29:42 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id bk17sm18580186wrb.105.2022.01.19.03.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 03:29:42 -0800 (PST)
Message-ID: <ac3505a8-9073-fd42-dd9c-cae41e730481@redhat.com>
Date: Wed, 19 Jan 2022 12:29:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] ide: Explicitly poll for BHs on cancel
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
References: <20220105111337.10366-1-hreitz@redhat.com>
 <b09405a0-6968-1fb3-60ce-8d91e64c3673@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <b09405a0-6968-1fb3-60ce-8d91e64c3673@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.01.22 12:11, Paolo Bonzini wrote:
> On 1/5/22 12:13, Hanna Reitz wrote:
>> - assert(s->bus->dma->aiocb == NULL);
>> +
>> +        /*
>> +         * Wait for potentially still-scheduled BHs, like 
>> ide_trim_bh_cb()
>> +         * (blk_drain() will only poll if there are in-flight 
>> requests on the
>> +         * BlockBackend, which there may not necessarily be, e.g. 
>> when the
>> +         * guest has issued a zero-length TRIM request)
>> +         */
>> +        while (s->bus->dma->aiocb) {
>> +            bool progress = aio_poll(qemu_get_aio_context(), true);
>> +            assert(progress);
>> +        }
>
>
> I think the right way to do this is to do  blk_inc_in_flight before 
> scheduling the bottom half and blk_dec_in_flight in the BH callback. 
> See virtio_blk_dma_restart_cb for an example.

Oh, yes, that sounds better.  Thanks!

Hanna


