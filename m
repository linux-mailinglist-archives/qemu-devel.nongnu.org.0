Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9793CAE7A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 23:23:10 +0200 (CEST)
Received: from localhost ([::1]:41198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m48p2-000442-NT
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 17:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m48nP-0003Nu-Pn
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 17:21:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m48nN-0008Ey-0Z
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 17:21:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626384083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X4Va0Mi3YZYlFmB2D2NwhDU+92XCCfpPBxMI+mObbfw=;
 b=XVMZdNfSy7HIwZt89xGGbg0fYfotkLUHXqG0ZnKUt1AJ6utW8meqXwkZm2qf+nc1I7HRDO
 wgooH1gr4/BZIVJfMLMHhJrTUwGmWiour0SnTvuVfMaUhzYbI/DcImQV//GyMjzKiGzy9k
 d/ZY8poR8UafSLC/syImLBGXCmf89OU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-J4u92RJBNAmUO_IJ7prcUA-1; Thu, 15 Jul 2021 17:21:21 -0400
X-MC-Unique: J4u92RJBNAmUO_IJ7prcUA-1
Received: by mail-ed1-f71.google.com with SMTP id
 eg53-20020a05640228b5b02903ad3cc35040so2427585edb.11
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 14:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X4Va0Mi3YZYlFmB2D2NwhDU+92XCCfpPBxMI+mObbfw=;
 b=azrt+nxbEaxqdDxAoWmZydjU7ByZkeCdKv3YhCa8ISjfoO6Y+P/j5l8GnzpubTH9OF
 JiT2++llRbgfNDMJMhm/RCHoqvdI9mALMDG9r1TnGSU5p0d1NN2ZtmwChFAegk06FaCy
 mlzqhMnFwYjL7XiLShYaBoIrPSKDUgbXkgJlD6KV/UzSX/H8aazZycMor1WLvw5qGYg+
 BGc2pqQjIhDtnEjEaw/FGHiV5A1wXjqy1d84LVJwA/kFRdzrmTgRXBMUolo3WKqHysnI
 UgPB3JmqzJFaCryiz5clpXafGChRVvqOg0+h8eUlL787qU0dxJuXZxZOG9ENuXR39NEf
 jNRQ==
X-Gm-Message-State: AOAM531oSTEnGomr6jlq6PFM27jNxEd0vS9xSVXzuDcnhJALh7Qsmonp
 jMv14rCxsAhap+WL0hLwjuNIxgvFCC5G0bx6Ozf7Eesvl2BNIWqAO3UXoLhoipZLvB21n22l8PY
 Nibkn6Ce25d1hwbk=
X-Received: by 2002:a05:6402:14d4:: with SMTP id
 f20mr9919325edx.316.1626384080721; 
 Thu, 15 Jul 2021 14:21:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhXlzbXmrTJFzDuQX+eYp8IaAsk5HZnS+D1gvrm8b9PssGZiVLhrYJgDZBv9WWZYW+rfI/8A==
X-Received: by 2002:a05:6402:14d4:: with SMTP id
 f20mr9919305edx.316.1626384080526; 
 Thu, 15 Jul 2021 14:21:20 -0700 (PDT)
Received: from redhat.com ([2.55.29.175])
 by smtp.gmail.com with ESMTPSA id n16sm2219855ejc.121.2021.07.15.14.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 14:21:19 -0700 (PDT)
Date: Thu, 15 Jul 2021 17:21:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/23] pc,pci,virtio: lots of new features
Message-ID: <20210715172049-mutt-send-email-mst@kernel.org>
References: <20210713220946.212562-1-mst@redhat.com>
 <CAFEAcA_ykJOv0s_44VKWFa3ti9pVD_u_3_G1MpAFdLRZ9oPH5w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ykJOv0s_44VKWFa3ti9pVD_u_3_G1MpAFdLRZ9oPH5w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 09:31:21PM +0100, Peter Maydell wrote:
> On Tue, 13 Jul 2021 at 23:10, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The following changes since commit 708f50199b59476ec4b45ebcdf171550086d6292:
> >
> >   Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-07-09-v2' into staging (2021-07-13 14:32:20 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to cf171f90d5e41730ad3e0ce23f1990f34b7e63ef:
> >
> >   vhost-vsock: SOCK_SEQPACKET feature bit support (2021-07-13 16:59:12 -0400)
> >
> > ----------------------------------------------------------------
> > pc,pci,virtio: lots of new features
> >
> > Lots of last minute stuff.
> >
> > vhost-user-rng.
> > vhost-user-i2c.
> > vhost-vsock SOCK_SEQPACKET support.
> > IOMMU bypass.
> > ACPI based pci hotplug.
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> This seems to produce a new meson warning:
> 
> Configuring 50-qemu-gpu.json using configuration
> Configuring 50-qemu-virtiofsd.json using configuration
> Configuring 50-qemu-rng.json using configuration
> ../../tools/vhost-user-rng/meson.build:7: WARNING: The variable(s)
> 'libexecdir' in the input file
> 'tools/vhost-user-rng/50-qemu-rng.json.in' are not present in the
> given configuration data.
> Configuring 50-edk2-i386-secure.json using configuration
> Configuring 50-edk2-x86_64-secure.json using configuration
> Configuring 60-edk2-aarch64.json using configuration
> 
> (the build then seems to go on to complete OK).
> 
> -- PMM


I sent an email about a fix. Do you prefer PULLv2 then?


