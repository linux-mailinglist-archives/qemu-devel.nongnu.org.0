Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121023CA0D7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 16:40:45 +0200 (CEST)
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m42Xb-0005yX-Tq
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 10:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m42Vi-00040V-PA
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 10:38:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m42Vf-00033a-2U
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 10:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626359920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BJP3LU/uceK0YdlIG0R6Sqlwmqns3KQB+kLH68jTQnk=;
 b=I3C8H7IGVRMN+Jh5Ki84SDp0rra6Z0u+C1gXB6IoVHIbDhhvyn47D+gel89rZibM2tpaGR
 M0+Jz3Ct42nMpNDMIDHPGcQhwMNcxougxJOC5mftWDOkS4vZ/BVj/M3rcZd61cvEjJlOEC
 G6BX1S2rotU8jJxLKYsdTbkbYPyIFvA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-yIpQjHeyN0GP_kTC8jmaxQ-1; Thu, 15 Jul 2021 10:38:39 -0400
X-MC-Unique: yIpQjHeyN0GP_kTC8jmaxQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 y6-20020a7bc1860000b0290227b53c7cefso1887681wmi.1
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 07:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BJP3LU/uceK0YdlIG0R6Sqlwmqns3KQB+kLH68jTQnk=;
 b=m0DHn0/TPYR0vOPHVg86z2guTVjbtWKCwg8yW+2VGwYPI8itmIIpQP0FRflq4JTCCo
 3Mfdr17aQDdJaerjAuIBfIfelIH0H7YbbyJSXPjHi4pcWAH2RuNhy9FUR4zop35BiKqa
 L+mwwzHWw34SZC39pbKP9K+AJCTeWxQbRnobBLiTPVFcQkb7v4lEvNdatHXr3mMJyJUK
 NMj9W2I0tR3/RE+3MRpYSIltj0uK8VQQqtFRTJ+NwnlrPXcBUR7gNJoTT546ITuwV7ym
 Xm5EhPInIONkNNtvQwGFCrnMrZrx8U4XaHYTnRocQH/65x/sm+2kb7JITERHNlDl0Ha7
 iV4g==
X-Gm-Message-State: AOAM531/ri5xfjRwl21MdxtzPIIWOlqgVtV+Cv9ed9NE2fKbiHFBJae2
 Chr52JSwHIXEI8ZkJ0keLIDIm+96qwEqF9TzPyDC93GMWuKoDOapfc3zgxgHHmeEOENXOME0eKN
 gpzMXLYjF4DOIVFU=
X-Received: by 2002:a1c:7701:: with SMTP id t1mr5047597wmi.139.1626359917855; 
 Thu, 15 Jul 2021 07:38:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPkJfT7ctBPeN0vxWgUfWWyyLEJ7qaNpnZrsBnBz8B+BuOQN5oCIPi1ZSlc2VJKyeCJwJvdg==
X-Received: by 2002:a1c:7701:: with SMTP id t1mr5047572wmi.139.1626359917593; 
 Thu, 15 Jul 2021 07:38:37 -0700 (PDT)
Received: from redhat.com (bzq-79-181-144-59.red.bezeqint.net. [79.181.144.59])
 by smtp.gmail.com with ESMTPSA id f7sm6725482wru.11.2021.07.15.07.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 07:38:36 -0700 (PDT)
Date: Thu, 15 Jul 2021 10:38:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PULL 00/23] pc,pci,virtio: lots of new features
Message-ID: <20210715103657-mutt-send-email-mst@kernel.org>
References: <20210713220946.212562-1-mst@redhat.com>
 <CAFEAcA_ykJOv0s_44VKWFa3ti9pVD_u_3_G1MpAFdLRZ9oPH5w@mail.gmail.com>
 <CAC_L=vVJ-fLkJeKYnvx9HZivZ5mm79WtQ9OVHnNke+3smdXTYw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAC_L=vVJ-fLkJeKYnvx9HZivZ5mm79WtQ9OVHnNke+3smdXTYw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 15, 2021 at 11:54:17AM +0300, Marcel Apfelbaum wrote:
> Hi, 
> 
> On Wed, Jul 14, 2021 at 11:33 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> 
>     On Tue, 13 Jul 2021 at 23:10, Michael S. Tsirkin <mst@redhat.com> wrote:
>     >
>     > The following changes since commit
>     708f50199b59476ec4b45ebcdf171550086d6292:
>     >
>     >   Merge remote-tracking branch 'remotes/ericb/tags/
>     pull-nbd-2021-07-09-v2' into staging (2021-07-13 14:32:20 +0100)
>     >
>     > are available in the Git repository at:
>     >
>     >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>     >
>     > for you to fetch changes up to cf171f90d5e41730ad3e0ce23f1990f34b7e63ef:
>     >
>     >   vhost-vsock: SOCK_SEQPACKET feature bit support (2021-07-13 16:59:12
>     -0400)
>     >
>     > ----------------------------------------------------------------
>     > pc,pci,virtio: lots of new features
>     >
>     > Lots of last minute stuff.
>     >
>     > vhost-user-rng.
>     > vhost-user-i2c.
>     > vhost-vsock SOCK_SEQPACKET support.
>     > IOMMU bypass.
>     > ACPI based pci hotplug.
>     >
>     > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
>     This seems to produce a new meson warning:
> 
>     Configuring 50-qemu-gpu.json using configuration
>     Configuring 50-qemu-virtiofsd.json using configuration
>     Configuring 50-qemu-rng.json using configuration
>     ../../tools/vhost-user-rng/meson.build:7: WARNING: The variable(s)
>     'libexecdir' in the input file
>     'tools/vhost-user-rng/50-qemu-rng.json.in' are not present in the
>     given configuration data.
>     Configuring 50-edk2-i386-secure.json using configuration
>     Configuring 50-edk2-x86_64-secure.json using configuration
>     Configuring 60-edk2-aarch64.json using configuration
> 
>     (the build then seems to go on to complete OK).
> 
> 
> /cc Mathieu
> 
> The below patch solved the warning for me:
> 
> diff --git a/tools/vhost-user-rng/meson.build b/tools/vhost-user-rng/
> meson.build
> index 4dc386daf3..2192a65ca6 100644
> --- a/tools/vhost-user-rng/meson.build
> +++ b/tools/vhost-user-rng/meson.build
> @@ -6,5 +6,5 @@ executable('vhost-user-rng', files(
>  
>  configure_file(input: '50-qemu-rng.json.in',
>                 output: '50-qemu-rng.json',
> -               configuration: config_host,
> +               configuration: { 'libexecdir' : get_option('prefix') /
> get_option('libexecdir') },
>                 install_dir: qemu_datadir / 'vhost-user')
> 
> 
> Thanks,
> Marcel


Thanks Marcel!

Yes this matches what virtiofsd does. Just a cut and paste error then.
I applied this and repushed. Peter do you want to pick up the new tag?
Or we can get the fix in the next pull it's up to you.

for_upstream at commit ca381cf34b020be4cf8f7166f7e15392b849fc25

-- 
MST


