Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED246F806A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 11:52:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pus6H-0000KB-QH; Fri, 05 May 2023 05:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pus68-0000Je-KX
 for qemu-devel@nongnu.org; Fri, 05 May 2023 05:51:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pus65-0007bC-2P
 for qemu-devel@nongnu.org; Fri, 05 May 2023 05:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683280286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nn2u+egEixpcAPvr0ymi8ZGRq+ingt8sJXHMzAUsrvU=;
 b=V3u7rH/3thm/FChIlmsGERw63rSWFopU+JQh9A1o0M0WFfBDy2V9QR3tZfZNFEXcpwEr2l
 Smxq4p0YCMLLgYCacR8RzrgIxuNWgBbJ8ubteCwmr8wk8tE+KdtQ5HHRzyvsib3Jztek00
 EoVvkb5TQN+7KFtaC4f85UwNZqicsFQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-_l3eq2XFMUirU35iKqTbJQ-1; Fri, 05 May 2023 05:51:17 -0400
X-MC-Unique: _l3eq2XFMUirU35iKqTbJQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50be1a285dcso1501470a12.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 02:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683280276; x=1685872276;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nn2u+egEixpcAPvr0ymi8ZGRq+ingt8sJXHMzAUsrvU=;
 b=KD8EYNA4lJL1etTXt5z5I8gktQ+dJtIOmiJB0GTyh9rbDqvEBs9KeCPNng2z0oaEXU
 nN8K6SKc1WyMWj4VvhMDUnPmUjp4ZgK6gJql1nqlFp0tHrt8lF2B7bwFGlvbaEFbp/I6
 vS6KAN7sIyaZLgoZvLIfhQCXRvDUg+IQskFFj4F8eTD6oXow6mIEf7vJk26Z8d5HajX+
 ayFKE40s5WV05YDxBmnx5L8JZVxLnLbBV3C+Cbs3zjT377cAR/je86m5iueS0Hw8dLkn
 qvyoHIgmWj50jFhMnaYI4A8JwWM8pL+ke2S5YLT9f2uNTPybcW+PIoMqRNYFMPM6A3/h
 jCIQ==
X-Gm-Message-State: AC+VfDy4DIlCNiCkiWVMIc34oobA66hXA6yNLQBBmf728ynqXvHaUzRB
 3KJsx6iTYhPE6eCaycm8zkiFmADYZ19NMvZRdZut5tQpZIhrr3/JKZYkWkBoGwsy7pRxzV6CgfI
 iQ9+anWJ0DBB03MI=
X-Received: by 2002:a17:906:4fcf:b0:94e:1764:b09b with SMTP id
 i15-20020a1709064fcf00b0094e1764b09bmr705572ejw.45.1683280276448; 
 Fri, 05 May 2023 02:51:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4t9EIxIlQnLeEeIqg0OPCb8kYJRH6s4jJpZ2C2QP2NRvgqQgfnNzkPImIjNUDoH4LGYiAJHQ==
X-Received: by 2002:a17:906:4fcf:b0:94e:1764:b09b with SMTP id
 i15-20020a1709064fcf00b0094e1764b09bmr705559ejw.45.1683280275922; 
 Fri, 05 May 2023 02:51:15 -0700 (PDT)
Received: from ?IPV6:2003:cf:d738:349d:9681:f818:3410:5693?
 (p200300cfd738349d9681f81834105693.dip0.t-ipconnect.de.
 [2003:cf:d738:349d:9681:f818:3410:5693])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a056402061800b0050bd245d39esm2784069edv.6.2023.05.05.02.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 02:51:15 -0700 (PDT)
Message-ID: <71e47e3e-880d-38d8-c1b0-3287c60365e4@redhat.com>
Date: Fri, 5 May 2023 11:51:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/4] vhost-user-fs: Internal migration
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, German Maglione
 <gmaglione@redhat.com>, Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Eugenio Perez Martin <eperezma@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <e8cc4521-50a1-2e38-1fb3-8cfa7b0c967e@redhat.com>
 <CAJSP0QUFFYWwD5+8+1q41sNErJVNbkfnQ3VtB4z-HZUV8S0=zw@mail.gmail.com>
 <dfec96a1-84c3-3639-6f09-204c2d12244a@redhat.com>
In-Reply-To: <dfec96a1-84c3-3639-6f09-204c2d12244a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

(By the way, thanks for the explanations :))

On 05.05.23 11:03, Hanna Czenczek wrote:
> On 04.05.23 23:14, Stefan Hajnoczi wrote:

[...]

>> I think it's better to change QEMU's vhost code
>> to leave stateful devices suspended (but not reset) across
>> vhost_dev_stop() -> vhost_dev_start(), maybe by introducing
>> vhost_dev_suspend() and vhost_dev_resume(). Have you thought about
>> this aspect?
>
> Yes and no; I mean, I haven’t in detail, but I thought this is what’s 
> meant by suspending instead of resetting when the VM is stopped.

So, now looking at vhost_dev_stop(), one problem I can see is that 
depending on the back-end, different operations it does will do 
different things.

It tries to stop the whole device via vhost_ops->vhost_dev_start(), 
which for vDPA will suspend the device, but for vhost-user will reset it 
(if F_STATUS is there).

It disables all vrings, which doesn’t mean stopping, but may be 
necessary, too.  (I haven’t yet really understood the use of disabled 
vrings, I heard that virtio-net would have a need for it.)

It then also stops all vrings, though, so that’s OK.  And because this 
will always do GET_VRING_BASE, this is actually always the same 
regardless of transport.

Finally (for this purpose), it resets the device status via 
vhost_ops->vhost_reset_status().  This is only implemented on vDPA, and 
this is what resets the device there.


So vhost-user resets the device in .vhost_dev_start, but vDPA only does 
so in .vhost_reset_status.  It would seem better to me if vhost-user 
would also reset the device only in .vhost_reset_status, not in 
.vhost_dev_start.  .vhost_dev_start seems precisely like the place to 
run SUSPEND/RESUME.

Another question I have (but this is basically what I wrote in my last 
email) is why we even call .vhost_reset_status here.  If the device 
and/or all of the vrings are already stopped, why do we need to reset 
it?  Naïvely, I had assumed we only really need to reset the device if 
the guest changes, so that a new guest driver sees a freshly initialized 
device.

Hanna


