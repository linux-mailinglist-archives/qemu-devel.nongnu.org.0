Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5312A3D96F4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 22:43:01 +0200 (CEST)
Received: from localhost ([::1]:60814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8qOK-0005fz-D5
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 16:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m8qN7-0004JF-Rm
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:41:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m8qN5-0001n3-1R
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627504902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=akknP60QakeLGifJMV55QmFBWWFY1qMunDfj9WyFqn4=;
 b=AJZXrFnDy2dtBc+nX4IosDF2EMEH1BaX8hVxYKzVnfMEjgjafSne6S+sYHtYhtd8zzKLLq
 keYb8LiJBoYtAo7onKhfb72AU8QL5AdbBSQnVLxujUY4m75v8odr3sjzlligJLTnn6hjDd
 pS7lJyFjGEDQoXphv53XErb//nrIVQA=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-IHUY8_hFMe6hcJHhwog3rw-1; Wed, 28 Jul 2021 16:41:39 -0400
X-MC-Unique: IHUY8_hFMe6hcJHhwog3rw-1
Received: by mail-io1-f70.google.com with SMTP id
 e7-20020a0566020447b029050017e563a6so2456171iov.4
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 13:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=akknP60QakeLGifJMV55QmFBWWFY1qMunDfj9WyFqn4=;
 b=mHcXMDbYSwQkIkRKNeYxPS3ziaJDRkWJqMlSo5Wm21B1pd37MtLs1pN6QKBs0Nzacc
 ndCbWFFs9rEbSwzTSOUIzh0YCNI8SFDnojkBozf7WegiRhhw9u/rDmOO+m4hWeb7Dgxv
 zCFPcsilY1dUdK3msEpr0UJxsvP+LLm9SIbBlWZVq6Hdfs4hfOftWHRHmzXKD3+YG48j
 Yox4GVwjHQSeU6LkJhDWymtREJsx5+znpauWL2AHnyzhFaHAPv2ore6x34ovhSH585V3
 XTPOnwJe9qfPUSmt8ZKJ3Ec69NBO5jns+6cYt7I80ZjYknEInceSM880B5Qk5MyGay5Y
 w0Cw==
X-Gm-Message-State: AOAM532Qqq0CY/IFyzfrP0IZMGZ6As3r7jl8YWRsv35wkzkP82aFCD49
 76iL5ICUG5enizIVrcILoZRtlP7+9PJ6fmuShXt+9C8f+LrBtabP/UQrJnWGN+L++yKUkKNj40a
 5ds1nRpsQqr6O7wA=
X-Received: by 2002:a6b:b5ce:: with SMTP id e197mr1024574iof.123.1627504898566; 
 Wed, 28 Jul 2021 13:41:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFY8aAUmM058VQt6ivuV8wjW5wySB8XCqHwDx8clluhrjEert/JeAMexbZkqqeyayKQEdGHw==
X-Received: by 2002:a6b:b5ce:: with SMTP id e197mr1024543iof.123.1627504898432; 
 Wed, 28 Jul 2021 13:41:38 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id i7sm577915ilk.7.2021.07.28.13.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 13:41:38 -0700 (PDT)
Date: Wed, 28 Jul 2021 22:41:35 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v3 09/11] machine: Make smp_parse generic enough
 for all arches
Message-ID: <20210728204135.ddge53fb5heybc26@gator>
References: <20210728034848.75228-1-wangyanan55@huawei.com>
 <20210728034848.75228-10-wangyanan55@huawei.com>
 <20210728203854.algjktwccs2t663w@gator>
MIME-Version: 1.0
In-Reply-To: <20210728203854.algjktwccs2t663w@gator>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 28, 2021 at 10:38:57PM +0200, Andrew Jones wrote:
> On Wed, Jul 28, 2021 at 11:48:46AM +0800, Yanan Wang wrote:
> > @@ -248,6 +256,7 @@ struct MachineClass {
> >      bool numa_mem_supported;
> >      bool auto_enable_numa;
> >      bool smp_prefer_sockets;
> > +    SMPCompatProps smp_props;
> >      const char *default_ram_id;
> >  
> >      HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
> > -- 
> > 2.19.1
> >
> 
> What about putting smp_prefer_sockets in SMPCompatProps too (as
> prefer_sockets)?

Ah, I see patch 11/11 does that.

Thanks,
drew

> 
> Otherwise
> 
> Reviewed-by: Andrew Jones <drjones@redhat.com>


