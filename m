Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E9569CA82
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 13:11:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU516-0002Xv-Iv; Mon, 20 Feb 2023 07:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pU514-0002Wy-P7
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 07:11:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pU513-0001JH-6j
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 07:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676895092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FfPVSnkuXzq6Ck1l5Gc71e8XRaLybl60uBlNLn/yaJ4=;
 b=E/Dj6tGzV5wnu1Ff6ZIBnRXQGpgS93uRelpk/wvdjB252X2/EXmdHrZwbkLvbTm7WB9WRv
 eqkgpMNepDoQ76Cyh1njkEMQXEaCoej1vqPkCRWeh+it6r4gPkxeesCbgvPid3vs/k2IgT
 5BvtqUObh8RItZ3h0Il95oCl4b896fw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-227-qDg-9SOWPem86cSJOeBgtg-1; Mon, 20 Feb 2023 07:11:30 -0500
X-MC-Unique: qDg-9SOWPem86cSJOeBgtg-1
Received: by mail-wm1-f69.google.com with SMTP id
 l41-20020a05600c1d2900b003dc51c95c6aso232232wms.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 04:11:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FfPVSnkuXzq6Ck1l5Gc71e8XRaLybl60uBlNLn/yaJ4=;
 b=NjvOUkfDdgcHn4NAmQQPAG/BVypgZIeUKaePq7Uk+kWlRSOAZXP/g9YB8eiSWDoTO5
 6JqHJygr3o1NqAb66dWelAIBmXyIjm04jVgcjBpfsTFSvK1WZJxsanx+PRUe4G4H3OE9
 t4l+XLpwMrPBm6Sa6NacVsFJBOsJUfBWhEnPvN4TSIxkmLARvJjxDfZacZwLo4ZszzLQ
 BGFhZQClxcSJgtbMqI1BexTeu33Q6yLPgZm6mw4Rr9nLAfgd4ux45b41LaA9Tqvt5MCr
 8gXw8uX8KoM5TiYHUiqXyyu0Bb9BK/CGJvQiFLFrWWTrp0aQyNm6EvuSNb82JfUfno6f
 DPMg==
X-Gm-Message-State: AO0yUKUBS3ZtAfbH4ltpDypSPo8A2yl470PkmKxn0R3YgQzJ3Vo1kp7h
 kQBN/DX5AHYAzr/n4cvzuHk64K7LM6ATCA9HxVcV7Ta7vUTE7ggaHVBMUj86xEdB0LamNlQZ+K5
 s/udc2sEYYl3WEFU=
X-Received: by 2002:adf:f942:0:b0:2c6:e7ff:8f17 with SMTP id
 q2-20020adff942000000b002c6e7ff8f17mr2436542wrr.25.1676895089826; 
 Mon, 20 Feb 2023 04:11:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/fLBei1ww50gAoaFC1oqWSqg641kMBHMXBzcJq3ghMjDkdQNMn4POALbgRWZpF+ssUpS4qVQ==
X-Received: by 2002:adf:f942:0:b0:2c6:e7ff:8f17 with SMTP id
 q2-20020adff942000000b002c6e7ff8f17mr2436529wrr.25.1676895089626; 
 Mon, 20 Feb 2023 04:11:29 -0800 (PST)
Received: from redhat.com ([2.52.5.34]) by smtp.gmail.com with ESMTPSA id
 x15-20020adff64f000000b002c406b357cfsm2220417wrp.86.2023.02.20.04.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 04:11:29 -0800 (PST)
Date: Mon, 20 Feb 2023 07:11:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Yangming <yangming73@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "wangzhigang (O)" <wangzhigang17@huawei.com>,
 "zhangliang (AG)" <zhangliang5@huawei.com>, xiqi <xiqi2@huawei.com>
Subject: Re: Optimization for the virtio-balloon feature on the ARM platform
Message-ID: <20230220071054-mutt-send-email-mst@kernel.org>
References: <8c6d264163574d8b886afdd3e4b77a2d@huawei.com>
 <0a0e1f05073d44a38a35e270ca735819@huawei.com>
 <bbbd3382-f33c-1e8a-789b-dec1c4766730@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bbbd3382-f33c-1e8a-789b-dec1c4766730@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 20, 2023 at 10:15:37AM +0100, David Hildenbrand wrote:
> On 20.02.23 02:33, Yangming via wrote:
> > Dear QEMU maintainers,
> > 
> > I am writing to discuss a possible optimization for the virtio-balloon
> > feature on the ARM platform. The ‘virtio_balloon_set_config’ function is
> > called frequently during the balloon inflation process, and its
> > subfunction ‘get_current_ram_size’ needs to traverse the virtual
> > machine's memory modules in order to count the current virtual machine's
> > memory (i.e initial ram size + hotplugged memory). This can be very time
> > consuming on the ARM platform, as the ARM virtual machine has much more
> > complex memory modules than the x86 virtual machine.
> > 
> > Therefore, I suggest introducing a global variable, ‘total_ram_size’,
> > that would be updated only when the balloon is initialized and hotplug
> > memory has completed. This would increase the efficiency of balloon
> > inflation by more than 60% on the ARM platform.
> > 
> > The following code is part of the optimization for balloon:
> > 
> > --- a/qemu/hw/virtio/virtio-balloon.c
> > 
> > +++ b/qemu/hw/virtio/virtio-balloon.c
> > 
> > static void virtio_balloon_set_config(…)
> > 
> > …
> > 
> > -    ram_addr_t vm_ram_size = get_current_ram_size();
> > 
> > +   ram_addr_t vm_ram_size = total_ram_size;
> > 
> > …
> > 
> > I hope this suggestion could be considered or discussed by QEMU
> > developers. I would love to seeing this improvement added to QEMU in the
> > future.
> 
> I'd suggest keeping track of the plugged DIMM size inside
> ms->device_memory->dimm_size. We can update it from
> pc_dimm_plug/pc_dimm_unplug. We just have to make sure to exclude NVDIMMs.
> 
> We can then optimize get_current_ram_size() to return "ms->ram_size +
> ms->device_memory->dimm_size", of course taking care of ms->device_memory ==
> NULL on some machines.


And as any optimization, patches are welcome accompanied by
a measurement showing it's a net improvement.

> -- 
> Thanks,
> 
> David / dhildenb


