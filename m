Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513254E5DD5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 05:29:16 +0100 (CET)
Received: from localhost ([::1]:40454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXF63-000537-0A
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 00:29:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nXF4w-0004Na-5g
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 00:28:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nXF4s-00087k-Jn
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 00:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648096080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BgJHsoBEbYP9Sk60StyXxDbi0rAYw+JaLNNTZeMmUPY=;
 b=dES7NTtu7CTiD8YI1gSm6Ub3N14m/1NXPcb4PRl2qd4nBQaNp3v6eU6zP9XLU14Ixql6Lt
 ZguCcdhJzivoOU1q0YXsEM7PIGWV4JgtKRGAeg3roJ7VcolDbwUya2CnOb3uMEa+GhK2Xo
 YkAkD/K9s5VzSi4rTEtEi8i6jHSozJQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-9Z2BVORmMxG4K1EH6iBKaw-1; Thu, 24 Mar 2022 00:27:59 -0400
X-MC-Unique: 9Z2BVORmMxG4K1EH6iBKaw-1
Received: by mail-lj1-f200.google.com with SMTP id
 v2-20020a2e9f42000000b00247e9c3f0e1so1356882ljk.1
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 21:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BgJHsoBEbYP9Sk60StyXxDbi0rAYw+JaLNNTZeMmUPY=;
 b=bC3mAO74RYLT+Jd210+oaI1xwy19Nk3OwRaxCdvvbz9qc2JKbuhEEMOTWwuvf0nsGD
 MWCuCMCiaN1g6ntXPoSJ3bmKwVABz3OV70yFUA5Hf5sImMwTafIJDDis+0eRK2SxBAUp
 OGvYkmfBzDyQNthG0wdpHDSS/qut1cFqu/tY2EQ8vkyd2enr509VWD4Cbw9kEXY6g/AW
 2plOUq4y6Jb0LzGlVi0E1OaWAMoj6CYokys9x3uUEaqhME7rETsXxAddTt8A+cpXiGvS
 8KGhxWhL5OBgQKnvPRnYcch/GWTN5OpCynoPJZafPKs62wKSJ8gHjgqOjEH583XDc8MY
 IanA==
X-Gm-Message-State: AOAM531ELc7GxEko6BcLmIBjm8YDRGU1GMcykJB8pU3rOj2bB9xDHicg
 uwGRvrvwLDnIcA+UKEiFTHFHk1BAXVhG+gYizH1jB4AxqN+Oej+Ny2efLJha4u2CfW5O+8zrX1k
 pzJvMi7ZMxzIZ+JVYJsUso+aC+RKFFAk=
X-Received: by 2002:a05:6512:108a:b0:448:756a:f5fb with SMTP id
 j10-20020a056512108a00b00448756af5fbmr2433380lfg.587.1648096077926; 
 Wed, 23 Mar 2022 21:27:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFl0csHR9s60y6LQlUeExxtnjB82AgXsaK4rDwHSMEoHO/JNt9HgaM+NHWD/hVEK+573ZDbCma6ZcpjqyAzWM=
X-Received: by 2002:a05:6512:108a:b0:448:756a:f5fb with SMTP id
 j10-20020a056512108a00b00448756af5fbmr2433367lfg.587.1648096077669; Wed, 23
 Mar 2022 21:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <155d85bb.2709.17fba1369b0.Coremail.leohou163@163.com>
In-Reply-To: <155d85bb.2709.17fba1369b0.Coremail.leohou163@163.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 24 Mar 2022 12:27:46 +0800
Message-ID: <CACGkMEvcVGvB2ZEes20cVBA1_8TWdDo1o-jPw07R4TOEXNi0kQ@mail.gmail.com>
Subject: Re: Address mapping for vIOMMU
To: leohou <leohou163@163.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 12:15 PM leohou <leohou163@163.com> wrote:
>
> hi all,
> When I use DPDK in guestOS  and  configering the VM with vIOMMU, I found that  sending the gVA to the hardware device , the hardware device can't  find the real data.
> But sending the gPA to the hardware device, the hardware device can  find the real data.
>
> Environment:
> OS: Linux version 5.4.0-104-generic (buildd@ubuntu) (gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)) #118-Ubuntu SMP Wed Mar 2 19:02:41 UTC 2022
> QEMU: QEMU emulator version 4.2.1 (Debian 1:4.2-3ubuntu6.21)
> Device: virtio-net
>
> Question:
> The vIOMMU doesn't work?
> I know virtio-net does not have DMA, so when virtio-net and DPDK are combined, IOMMU is not needed?

vIOMMU + virtio-net works for me like a charm.

DPDK supported vIOMMU long ago with virtio-net.

Make sure you vIOMMU is enabled in the guest (intel_iommu=on in guest
kernel command line, and enable_unsafe_noiommu_mode is *not* 1)

Thanks

>
>
>


