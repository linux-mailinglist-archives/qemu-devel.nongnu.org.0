Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681AB47B0E6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:09:02 +0100 (CET)
Received: from localhost ([::1]:51154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLDh-0002nO-1j
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:09:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mzJuY-0002E2-KD
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 09:45:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mzJuA-0003rS-Pn
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 09:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640011458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGmzx8sxYpx6aBkWKe6qtyuiz2vTeI428AERJ7G021A=;
 b=h9DHCMJpuMXdiH39yv2z5/tJUYKqAAJVRUwbFMcE0IO3yG0sXaah5RIVMdFwNvZCeiHHqS
 /agFpG7n8xxidK8+Kbq5VlSCiIg2tp4G/XVuzwctAQ0Kee2yRhro8tjErOt5oHa4QTznWC
 g9Hn0xiI7btIJq3CdVhLvkwUbaGQ3vI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-ZsB-pHhSPJWJ5CZkg4hxmg-1; Mon, 20 Dec 2021 08:32:54 -0500
X-MC-Unique: ZsB-pHhSPJWJ5CZkg4hxmg-1
Received: by mail-qt1-f197.google.com with SMTP id
 u14-20020a05622a198e00b002b2f35a6dcfso8225077qtc.21
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 05:32:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zGmzx8sxYpx6aBkWKe6qtyuiz2vTeI428AERJ7G021A=;
 b=msT/9CvXmB6nstLk9CBZuza+TcnowiqJYhHYABwxt0G6yLY25fbOG9o95O5QGy0iwS
 F6VbZSSMrMTgw5IqCaPqUk5iPEGQX0Kh+xX92y0fW8I4j0BsYz7rKVRk/OsCk285fqKw
 Yzsnt+ihzn8vAHVW6p9xGct/T6yNKvKuoIAC283nulzqk1Yxts20rSz1WGCiBFfTW20n
 ttvbUriuXsydONkt6bh9+ffw3j7tJQoqpeh1KSv6cRz4FztMWg7AjRtWc1wNH5seihaf
 UHnLYUC+7wGe5YbY+KJJN6Z5RQX0GjtTABP4oKqOIcfk6oqPI/in8MvYkWBXCV/stPAA
 ESlQ==
X-Gm-Message-State: AOAM5305joJsp0zfjXvlfAlYn1qs3oR+9UNOfXS9SdUF88TI7t6xrNVf
 yAj/yjs87u3R7nwu1QqyPQ/f1VFpCQdKSNyeycQmQmdz2hJrc1ZwAzN7mrCg8lBNxlMTj/hflL0
 tdqG6ype6JjcT9Vk=
X-Received: by 2002:ac8:45d2:: with SMTP id e18mr12249867qto.112.1640007173615; 
 Mon, 20 Dec 2021 05:32:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxou41ADODlXJZWDsBm6Dy+nATdUVxpovTnNNZlG7deD0WKcujsh5Oe898a5LatPOOyUE6psA==
X-Received: by 2002:ac8:45d2:: with SMTP id e18mr12249839qto.112.1640007173338; 
 Mon, 20 Dec 2021 05:32:53 -0800 (PST)
Received: from [192.168.100.42] ([82.142.30.186])
 by smtp.gmail.com with ESMTPSA id s2sm14517395qtw.22.2021.12.20.05.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 05:32:52 -0800 (PST)
Message-ID: <0a54bcaf-3977-3162-bdf6-0091b6db9cf1@redhat.com>
Date: Mon, 20 Dec 2021 14:32:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Warnings during the virtio-net-failover test
To: Thomas Huth <thuth@redhat.com>
References: <fcbae7f4-ff58-bb5d-fd5d-8b0145a6ee21@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <fcbae7f4-ff58-bb5d-fd5d-8b0145a6ee21@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/12/2021 11:16, Thomas Huth wrote:
>
>  Hi Laurent,
>
> today I noticed that there are quite a bunch of warnings during the virtio-net-failover 
> test:
>
> $ QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/virtio-net-failover
> /x86_64/failover-virtio-net/hotplug_1: qemu-system-x86_64: warning: Primary device not 
> found
> Virtio-net failover will not work. Make sure primary device has parameter 
> failover_pair_id=standby0
> OK
> /x86_64/failover-virtio-net/hotplug_1_reverse: OK
> /x86_64/failover-virtio-net/hotplug_2: qemu-system-x86_64: warning: Primary device not 
> found
> Virtio-net failover will not work. Make sure primary device has parameter 
> failover_pair_id=standby0
> OK
> [...]
> /x86_64/failover-virtio-net/migrate/out: qemu-system-x86_64: warning: Primary device not 
> found
> Virtio-net failover will not work. Make sure primary device has parameter 
> failover_pair_id=standby0
> OK
> /x86_64/failover-virtio-net/migrate/in: OK
> /x86_64/failover-virtio-net/migrate/abort/wait-unplug: qemu-system-x86_64: warning: 
> Primary device not found
> Virtio-net failover will not work. Make sure primary device has parameter 
> failover_pair_id=standby0
> OK
> /x86_64/failover-virtio-net/migrate/abort/active: qemu-system-x86_64: warning: Primary 
> device not found
> Virtio-net failover will not work. Make sure primary device has parameter 
> failover_pair_id=standby0
> OK
> /x86_64/failover-virtio-net/multi/out: OK
> /x86_64/failover-virtio-net/multi/in: OK
>
> I assume they are false positives? If so, could you please come up with a patch to 
> silence them, since they are quite confusing...?
>
In fact they are the results of the test itself as we try to plug the standby device first.

They are produced by a error_setg(), but as the caller is not attached to a user interface 
the errp is used with warn_report_err().

In the end it uses error_vprintf() that seems that could be silence using 
QTEST_SILENT_ERRORS environment variable.

I'm going to write a patch using that.

Thanks,

Laurent




