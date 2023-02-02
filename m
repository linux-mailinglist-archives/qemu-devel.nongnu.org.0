Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E263687B26
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:01:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXL7-0004SV-5D; Thu, 02 Feb 2023 06:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXL5-0004SL-7U
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:01:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXL3-00081i-Eb
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675335668;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=486Cv5PeLMDAQpBRCAukIew0Jn8P7mkBGEldZLosbFY=;
 b=WRDL1JkAwyheOzxuCQWduIG03G+MKRrTJdALIs27TmpMLX2aCbhN/6X2zkzjrSXUk7G2Yk
 XRew3oOmHx7U2mA3K1LxmFjIwxF3VXy85tPTzKIu6WVLz5s7Y+5dOtee67ndvqty8IUmDl
 D9EXttc7d7igDwHU/TvM4Fdu4I2dJIE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-149-tTCiP4oANf23eLgFqZPBAA-1; Thu, 02 Feb 2023 06:01:07 -0500
X-MC-Unique: tTCiP4oANf23eLgFqZPBAA-1
Received: by mail-wr1-f71.google.com with SMTP id
 u10-20020a5d6daa000000b002bfc2f61048so168863wrs.23
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=486Cv5PeLMDAQpBRCAukIew0Jn8P7mkBGEldZLosbFY=;
 b=tkXLvL1TuLTA1d6TQoCDacNT94j1lI9lpE2XOq2MdgEO137UOeWmm1wshd1e+4EO5a
 JPGPCGM2D5RK83me9PtKfvVP0IO5lGXe7w6aGp0ItdiP2dcbw8mT3QF3wyy6R0T7bJsi
 5JUuPGSVX99qC5zDkWTdG8eipserdZq6XDj7tpE14/PZ1BLliCYbV3ng6gtk6laPxPsa
 BcO198QOlzLqDF3WFWN5u6S5ZxhOIpxa3VDYj0DXwqzfTizGVfCEfVnaBN3vT7jCXy0y
 LBU6YtA480C+p/LVdGWF2bbyZZiH5rk8fevarL/fjHDtSitylO/DEJpvIoZPaw/NxdS/
 e/FA==
X-Gm-Message-State: AO0yUKXm+n2dhWmX/a/U7JpgKx99EvC16zWvRvh8ov/HSL/xJdkhujV+
 vvDTv1xcTiwayG5RKw+ODnfzE9/R/QORV5F2Aki9pOGK45ZryCA87MVi6yb4tMXEfsSogHUsPcM
 Tjdj0xy4Kw80x9bk=
X-Received: by 2002:a05:600c:3b9d:b0:3df:de27:4191 with SMTP id
 n29-20020a05600c3b9d00b003dfde274191mr1327016wms.16.1675335666568; 
 Thu, 02 Feb 2023 03:01:06 -0800 (PST)
X-Google-Smtp-Source: AK7set9NZwSXIJL2mSmED+VHdEACnkAfYOAnmiJB2u/WI7N6QkIl6mNKbkhMjHxdrnr0pGpp8Faj8g==
X-Received: by 2002:a05:600c:3b9d:b0:3df:de27:4191 with SMTP id
 n29-20020a05600c3b9d00b003dfde274191mr1326984wms.16.1675335666234; 
 Thu, 02 Feb 2023 03:01:06 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 p30-20020a1c545e000000b003dc433355aasm4675010wmi.18.2023.02.02.03.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:01:05 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  pbonzini@redhat.com,
 peterx@redhat.com,  david@redhat.com,  philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [RFC v5 3/3] migration: reduce time of loading non-iterable
 vmstate
In-Reply-To: <20230117115511.3215273-4-xuchuangxclwt@bytedance.com> (Chuang
 Xu's message of "Tue, 17 Jan 2023 19:55:11 +0800")
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
 <20230117115511.3215273-4-xuchuangxclwt@bytedance.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 12:01:04 +0100
Message-ID: <87mt5ws55b.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Chuang Xu <xuchuangxclwt@bytedance.com> wrote:
> The duration of loading non-iterable vmstate accounts for a significant
> portion of downtime (starting with the timestamp of source qemu stop and
> ending with the timestamp of target qemu start). Most of the time is spent
> committing memory region changes repeatedly.
>
> This patch packs all the changes to memory region during the period of
> loading non-iterable vmstate in a single memory transaction. With the
> increase of devices, this patch will greatly improve the performance.
>
> Here are the test1 results:
> test info:
> - Host
>   - Intel(R) Xeon(R) Platinum 8260 CPU
>   - NVIDIA Mellanox ConnectX-5
> - VM
>   - 32 CPUs 128GB RAM VM
>   - 8 16-queue vhost-net device
>   - 16 4-queue vhost-user-blk device.
>
> 	time of loading non-iterable vmstate     downtime
> before		about 150 ms			  740+ ms
> after		about 30 ms			  630+ ms
>
> In test2, we keep the number of the device the same as test1, reduce the
> number of queues per device:
>
> Here are the test2 results:
> test info:
> - Host
>   - Intel(R) Xeon(R) Platinum 8260 CPU
>   - NVIDIA Mellanox ConnectX-5
> - VM
>   - 32 CPUs 128GB RAM VM
>   - 8 1-queue vhost-net device
>   - 16 1-queue vhost-user-blk device.
>
> 	time of loading non-iterable vmstate     downtime
> before		about 90 ms			 about 250 ms
>
> after		about 25 ms			 about 160 ms
>
> In test3, we keep the number of queues per device the same as test1, reduce
> the number of devices:
>
> Here are the test3 results:
> test info:
> - Host
>   - Intel(R) Xeon(R) Platinum 8260 CPU
>   - NVIDIA Mellanox ConnectX-5
> - VM
>   - 32 CPUs 128GB RAM VM
>   - 1 16-queue vhost-net device
>   - 1 4-queue vhost-user-blk device.
>
> 	time of loading non-iterable vmstate     downtime
> before		about 20 ms			 about 70 ms
> after		about 11 ms			 about 60 ms
>
> As we can see from the test results above, both the number of queues and
> the number of devices have a great impact on the time of loading non-iterable
> vmstate. The growth of the number of devices and queues will lead to more
> mr commits, and the time consumption caused by the flatview reconstruction
> will also increase.
>
> Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

And BTW, nice load times improvements.


