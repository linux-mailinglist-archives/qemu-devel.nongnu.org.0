Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E916A8CF0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 00:23:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXsGd-0006bp-HA; Thu, 02 Mar 2023 18:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXsGb-0006QV-09
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 18:23:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXsGZ-0002mk-G4
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 18:23:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677799394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kDvFeZ1Oph7J+nzF/eJA0Ji1BrfAFQUAyS7DsB6ad8o=;
 b=i2nmtguXnTfNOxfLnvJqjlrK55G4aGjukyG+HVvkTT/AZnhr0Ve9nqyP0XLB0nbO244bHh
 e/qM+MfJXuYMrVrQMgL1cOOZ4HkO327cbfTexHvFaC9TBpl9FYV3CtQbG7t2jW5Hz+IsMD
 fMVjAcKoJvOFJ9JNNJQUQ8YxyrnqaZ8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-qE3m4d8IOWWzhoQ3fQcpcA-1; Thu, 02 Mar 2023 18:23:13 -0500
X-MC-Unique: qE3m4d8IOWWzhoQ3fQcpcA-1
Received: by mail-wr1-f69.google.com with SMTP id
 bx25-20020a5d5b19000000b002c7ce4ce3c3so86706wrb.13
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 15:23:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677799392;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kDvFeZ1Oph7J+nzF/eJA0Ji1BrfAFQUAyS7DsB6ad8o=;
 b=RO01rYDnQSoNKoqJO/TQQFxl68NjMVwUJOzlkSJp43pWE4CjyYFZSupx/XCQlCQNAW
 y9Mk+kVDa48R0GkcgPiDOGDxW4eX3bBAFloLpHPVS7/+vrsCiyrpjpMGWK2sDGdVK92k
 7YZ3yR6khcEVWQ0/uI9/Vl1w9OAQDxf1kdGmKhwbili72aQM6Idbf7qKLSPrHUnMZQoK
 UYNrqMUJ5BlC4CG+UBW4YNCINcQu7fJdLanoJxylDAuA8VY/dn9QYNPdCRIPvtKhjFy2
 7CYM/BbhMEcesPRh43KzIX9fceDcrwRSoRMBFgAB//nyjcgAmBGZ5hY2MhNSd/AB/aiI
 PUoQ==
X-Gm-Message-State: AO0yUKUxvdeCGxX0ZxqD5QqpWVrSsi2KoNw+3/E6N1GI66GvJ33IUIvx
 YTa5VKyijlNkyKVmmMVOXmCTtMbx3z40ed9+7f9Zgz3E9su0cAnZ6vFxeQu+2OuWE4ec/R4hhvS
 e1z17JVsmMgBhc/g=
X-Received: by 2002:adf:e703:0:b0:2c3:dd81:49ad with SMTP id
 c3-20020adfe703000000b002c3dd8149admr19393wrm.33.1677799392379; 
 Thu, 02 Mar 2023 15:23:12 -0800 (PST)
X-Google-Smtp-Source: AK7set9pfYlZ+nqbGeDRotyWozH/YEdBnuNqNxtiB9bntet/3gAjn6DwgsUT2K6xLpYQ6Ze3p9UsCA==
X-Received: by 2002:adf:e703:0:b0:2c3:dd81:49ad with SMTP id
 c3-20020adfe703000000b002c3dd8149admr19384wrm.33.1677799392061; 
 Thu, 02 Mar 2023 15:23:12 -0800 (PST)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 z26-20020a1c4c1a000000b003eb395a8280sm4311885wmf.37.2023.03.02.15.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 15:23:11 -0800 (PST)
Date: Thu, 2 Mar 2023 18:23:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/53] virtio,pc,pci: features, cleanups, fixes
Message-ID: <20230302182151-mutt-send-email-mst@kernel.org>
References: <20230302082343.560446-1-mst@redhat.com>
 <df86476e-deee-36ff-8f53-6743ef6f792a@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df86476e-deee-36ff-8f53-6743ef6f792a@msgid.tls.msk.ru>
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

On Thu, Mar 02, 2023 at 03:16:24PM +0300, Michael Tokarev wrote:
> 02.03.2023 11:24, Michael S. Tsirkin wrote:
> ..
> >    https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> It looks like this series contains quite a few changes which should be
> applied to -stable as well. Here are the ones which I think should be
> there, maybe others too:
> 
>  Julia Suvorova:
>         hw/smbios: fix field corruption in type 4 table
> 
>  Michael S. Tsirkin:
>         (Revert "x86: don't let decompressed kernel image clobber setup_data" -- not in 7.2)
>         Revert "x86: do not re-randomize RNG seed on snapshot load"
>         Revert "x86: re-initialize RNG seed when selecting kernel"
>         Revert "x86: reinitialize RNG seed on system reboot"
>         Revert "x86: use typedef for SetupData struct"
>         Revert "x86: return modified setup_data only if read as memory, not as file"
>         Revert "hw/i386: pass RNG seed via setup_data entry"
> 
>  Alex Bennée:
>         backends/vhost-user: remove the ioeventfd check

not this one I think, it's a feature not a bugfix.

>  Akihiko Odaki:
>         vhost-user-gpio: Configure vhost_dev when connecting
>         vhost-user-i2c: Back up vqs before cleaning up vhost_dev
>         vhost-user-rng: Back up vqs before cleaning up vhost_dev
>         hw/timer/hpet: Fix expiration time overflow
> 
>  Dr. David Alan Gilbert (1):
>         virtio-rng-pci: fix transitional migration compat for vectors
> 
> 
>  Eugenio Pérez:
>         vdpa: stop all svq on device deletion
> 
>  Carlos López:
>         vhost: avoid a potential use of an uninitialized variable in vhost_svq_poll()
>         libvhost-user: check for NULL when allocating a virtqueue element
> 
>  Yajun Wu:
>          chardev/char-socket: set s->listener = NULL in char_socket_finalize
> 
>  Jason Wang:
>         intel-iommu: fail MAP notifier without caching mode
>         intel-iommu: fail DEVIOTLB_UNMAP without dt mode


others ok

> 
> Does this make sense?
> 
> Thanks,
> 
> /mjt


