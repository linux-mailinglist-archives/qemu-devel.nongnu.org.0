Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0295F5629
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 16:13:05 +0200 (CEST)
Received: from localhost ([::1]:37480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og58v-0006s1-9t
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 10:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og4bM-0001gU-3S
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 09:38:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og4bH-0006p3-Q8
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 09:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664977094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/0mKJFXEYoEDv0XzgGHSrE7UOnP4k/ZITlfG5wZF6sY=;
 b=iYmiJFu5gCIDRzZesMPTs3kBpo8N4pmZLp3i/DiOVjdQu7D7q0TJBo+QuQWhhhstYrsRqh
 VrVj4orpfUCXFltp9Iz3v2q2t16TfKJ5vMN6FsgM/H/oYUcrfOx0/qNL3g+vbSk2veIp5V
 C5NF9/md6KBRLQqVQaVDp63fH2xYZYc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121-SUWi9tpIMxeTW94AZGtFzA-1; Wed, 05 Oct 2022 09:38:13 -0400
X-MC-Unique: SUWi9tpIMxeTW94AZGtFzA-1
Received: by mail-wm1-f69.google.com with SMTP id
 y7-20020a05600c20c700b003bf90b54edbso328213wmm.1
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 06:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=/0mKJFXEYoEDv0XzgGHSrE7UOnP4k/ZITlfG5wZF6sY=;
 b=MT5ETtTCcocjOgN7S+NvECH4gYp7be1BveyRi9UWygbjiCAPtNV1dRZqS3YHCXxHDv
 JphjRodteIqDjL1JBY3lkX90h1Wov+MYxboDRflvK0A8KxsfYe7s/YaNflS+J9wBS/Rf
 qmoFAz+p8RW53R29RDMqMIdD23if3Hj8MfsjqDpGM1ut4EA/zXw2rN/p2e4ultPHgWTh
 wXNhro4nC2bcclroHgjKC19fxKg63CgqiYSCTI7UsRp9g8HC6qagUXpBn4fZQ+iGKMrw
 lIUZaNQgzvqS7SaGblG+UQaVZoPmR2Tm8eXH7tnO2RX90fWlK1VCJfXhqO/vVFZfznWf
 Quvw==
X-Gm-Message-State: ACrzQf16K6UY+jeZGlFgjFovmICeL2m1TzBIJXHgWO4sPXMem8G8S2Vw
 urZZGg84SXkCn0LyavhY5Ewi2UbV/gSFfx4ADjt0IqJXbnRmLGAwBfMVpjMWXw/MmfDTVStXbZ0
 nmau6Qpw8JHd0NT0=
X-Received: by 2002:a5d:5105:0:b0:22e:3ed0:13bf with SMTP id
 s5-20020a5d5105000000b0022e3ed013bfmr9029213wrt.645.1664977091988; 
 Wed, 05 Oct 2022 06:38:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5qYZDC8DUvFmle2A1zHKyxFy/gpYv6t3sfkEMQmkHt4SIe/me4YX/40oVjS/mrSq+4wG9WjQ==
X-Received: by 2002:a5d:5105:0:b0:22e:3ed0:13bf with SMTP id
 s5-20020a5d5105000000b0022e3ed013bfmr9029192wrt.645.1664977091732; 
 Wed, 05 Oct 2022 06:38:11 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 k25-20020adfd239000000b0022af865810esm14831228wrh.75.2022.10.05.06.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 06:38:11 -0700 (PDT)
Message-ID: <7c2e4538-38bf-38de-51eb-94b8d1ab6d5a@redhat.com>
Date: Wed, 5 Oct 2022 15:38:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v9 08/16] net: stream: add unix socket
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
References: <20220926195048.487915-1-lvivier@redhat.com>
 <20220926195048.487915-9-lvivier@redhat.com> <YzPlwbdw8uUbfyFL@yekko>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <YzPlwbdw8uUbfyFL@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.435, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/22 08:12, David Gibson wrote:
>> @@ -253,9 +253,27 @@ static void net_stream_accept(void *opaque)
>>       s->fd = fd;
>>       s->nc.link_down = false;
>>       net_stream_connect(s);
>> -    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
>> -             "connection from %s:%d",
>> -             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
>> +    switch (saddr.ss_family) {
>> +    case AF_INET: {
>> +        struct sockaddr_in *saddr_in = (struct sockaddr_in *)&saddr;
>> +
>> +        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
>> +                 "connection from %s:%d",
>> +                 inet_ntoa(saddr_in->sin_addr), ntohs(saddr_in->sin_port));
> So, here you print the address from which the connection has come -
> the remote address.
> 
>> +        break;
>> +    }
>> +    case AF_UNIX: {
>> +        struct sockaddr_un saddr_un;
>> +
>> +        len = sizeof(saddr_un);
>> +        getsockname(s->listen_fd, (struct sockaddr *)&saddr_un, &len);
>> +        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
>> +                 "connect from %s", saddr_un.sun_path);
> Here you print the bound address - the local address.  Does that make
> sense?  I mean, in almost every occasion the remote Unix socket will
> be anonymous, so it probably doesn't make sense to display that, but
> is the bound address actually a useful substitute?
> 
> Maybe it should just be "connect from Unix socket".
> 

I agree the needed information is "connected" and type "unix".

But I think more information we can put here can be useful for a debugging purpose.

Thanks,
Laurent


