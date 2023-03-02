Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DC26A81FC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:18:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhrZ-0002Fu-PX; Thu, 02 Mar 2023 07:16:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pXhrO-0002Ei-Ik
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:16:42 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pXhrJ-0004AM-Jq
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:16:31 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A30E24004A;
 Thu,  2 Mar 2023 15:16:26 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 4678D123;
 Thu,  2 Mar 2023 15:16:24 +0300 (MSK)
Message-ID: <df86476e-deee-36ff-8f53-6743ef6f792a@msgid.tls.msk.ru>
Date: Thu, 2 Mar 2023 15:16:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PULL 00/53] virtio,pc,pci: features, cleanups, fixes
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20230302082343.560446-1-mst@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

02.03.2023 11:24, Michael S. Tsirkin wrote:
..
>    https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

It looks like this series contains quite a few changes which should be
applied to -stable as well. Here are the ones which I think should be
there, maybe others too:

  Julia Suvorova:
         hw/smbios: fix field corruption in type 4 table

  Michael S. Tsirkin:
         (Revert "x86: don't let decompressed kernel image clobber setup_data" -- not in 7.2)
         Revert "x86: do not re-randomize RNG seed on snapshot load"
         Revert "x86: re-initialize RNG seed when selecting kernel"
         Revert "x86: reinitialize RNG seed on system reboot"
         Revert "x86: use typedef for SetupData struct"
         Revert "x86: return modified setup_data only if read as memory, not as file"
         Revert "hw/i386: pass RNG seed via setup_data entry"

  Alex Bennée:
         backends/vhost-user: remove the ioeventfd check

  Akihiko Odaki:
         vhost-user-gpio: Configure vhost_dev when connecting
         vhost-user-i2c: Back up vqs before cleaning up vhost_dev
         vhost-user-rng: Back up vqs before cleaning up vhost_dev
         hw/timer/hpet: Fix expiration time overflow

  Dr. David Alan Gilbert (1):
         virtio-rng-pci: fix transitional migration compat for vectors


  Eugenio Pérez:
         vdpa: stop all svq on device deletion

  Carlos López:
         vhost: avoid a potential use of an uninitialized variable in vhost_svq_poll()
         libvhost-user: check for NULL when allocating a virtqueue element

  Yajun Wu:
          chardev/char-socket: set s->listener = NULL in char_socket_finalize

  Jason Wang:
         intel-iommu: fail MAP notifier without caching mode
         intel-iommu: fail DEVIOTLB_UNMAP without dt mode


Does this make sense?

Thanks,

/mjt

