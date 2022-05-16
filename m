Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75468528F5A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 22:07:33 +0200 (CEST)
Received: from localhost ([::1]:36638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqh07-0004jK-Vb
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 16:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqgyX-00040b-R1
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:05:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqgyV-0007ap-53
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652731549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PLGqUv93YzlK/4mVLB5A8sOB/EgvP2uT+HpSmP6dHhk=;
 b=WMqgBApG+H2BdBKOVvh8h1xVvcIam0Jo4BZeWRu1VVQxnET3tIdtnhQ/JpWZQ7J6asPV22
 zG6tHk8ivGLhM9yfwB3W3M6d9JpN9lUiCDttRhwlW9aYdFl5+GYeDk73baQlirWGn9ZXKu
 1sNCZxQKibEd0fei9/ZWVVVnp8zdG6g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-eRp84jbuMeG2imfEbRbAMA-1; Mon, 16 May 2022 16:05:48 -0400
X-MC-Unique: eRp84jbuMeG2imfEbRbAMA-1
Received: by mail-ed1-f70.google.com with SMTP id
 c17-20020a056402159100b0042ab2e56743so2340882edv.10
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PLGqUv93YzlK/4mVLB5A8sOB/EgvP2uT+HpSmP6dHhk=;
 b=YA1KhrhlgsW8y2Rr5uWm3h8Y8iP5eC3I91m0PtTJMYlDyDWKnbqD3r7nRcy2+WlScq
 njqfm1NnUf+q5A5FF7VfiLaEkkZFWQ2hripmpOUS2YmW4llRWntp00/4D9JgZRERQYbI
 w8zJpTe6Ld1a65u+y7ibbTwGSB8xZvXTNetoKLimYi+PhnwPgK8hIp8ZMaU1LTzeJBTD
 JjstJLS1lHoGmz++g9KOqMORcBU/gZP6TKIQ5hdykRTgjVzHCgBug8L4oQ9OTqzhcJUu
 ofdHOm0nHw4soG6JE0+0uDh62jJ6SBgDhDRDDe2620yhUbT81LmTJSZFQJiprJ26yudr
 ZrkQ==
X-Gm-Message-State: AOAM533lRMu3nOMaxs3AIm9PanpeF7ep6kmL3qEqNRAflzKEFa4tP9yW
 KYg5Acj5d4ooDEUzPJ6Ur5fMMNRR8sdzJGGRTO3idmvPTqJ5Ia+1HWUgDFcFpajjhLuZD4DIB6l
 EDSwTc0A54rWDGCE=
X-Received: by 2002:a17:906:6a0d:b0:6fe:180b:7935 with SMTP id
 qw13-20020a1709066a0d00b006fe180b7935mr12124965ejc.717.1652731546779; 
 Mon, 16 May 2022 13:05:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXktr4ctBPnOoeJeDnLyXjLm58g5Mdo9lDGr/b+fKiFTf1V89vh6AIOzahaUihelyPmGh4Fg==
X-Received: by 2002:a17:906:6a0d:b0:6fe:180b:7935 with SMTP id
 qw13-20020a1709066a0d00b006fe180b7935mr12124944ejc.717.1652731546566; 
 Mon, 16 May 2022 13:05:46 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 f10-20020a50fe0a000000b0042aaecf8707sm2524341edt.70.2022.05.16.13.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:05:46 -0700 (PDT)
Date: Mon, 16 May 2022 16:05:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/91] virtio,pc,pci: fixes,cleanups,features
Message-ID: <20220516160455-mutt-send-email-mst@kernel.org>
References: <20220516095448.507876-1-mst@redhat.com>
 <e8cb0309-3a0f-7493-59ea-e0ac1b54c41c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8cb0309-3a0f-7493-59ea-e0ac1b54c41c@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 16, 2022 at 12:01:55PM -0700, Richard Henderson wrote:
> On 5/16/22 03:35, Michael S. Tsirkin wrote:
> > The following changes since commit 9de5f2b40860c5f8295e73fea9922df6f0b8d89a:
> > 
> >    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-05-12 10:52:15 -0700)
> > 
> > are available in the Git repository at:
> > 
> >    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > 
> > for you to fetch changes up to baebc5a4ab3ceef940887e3cc2f1d0e48cee53dc:
> > 
> >    virtio-net: don't handle mq request in userspace handler for vhost-vdpa (2022-05-16 04:38:40 -0400)
> > 
> > ----------------------------------------------------------------
> > virtio,pc,pci: fixes,cleanups,features
> > 
> > most of CXL support
> > virtio introspection commands
> > fixes, cleanups all over the place
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Fails to build:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2463276202
> https://gitlab.com/qemu-project/qemu/-/jobs/2463276291
> 
> libqemu-ppc64-softmmu.fa.p/hw_virtio_virtio.c.o: In function `qmp_decode_features':
> /builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4167: undefined reference to `gpu_map'
> /builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4167: undefined reference to `gpu_map'
> 


Woa, weird. It certainly builds for me. Will research.

> 
> r~


