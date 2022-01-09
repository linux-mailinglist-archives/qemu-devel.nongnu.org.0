Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8E6488957
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 13:22:39 +0100 (CET)
Received: from localhost ([::1]:37162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6XDZ-0005ll-Sk
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 07:22:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6XBJ-0004xg-Kh
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 07:20:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6XBF-0005o7-C8
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 07:20:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641730811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ywEVpIYkA8ApnIMb13uX6WhE34/CLcuP/mSiyIxTQI=;
 b=Gz+Aa1TH97Hi0M4AgIyYD0bWPzx2M3a7zqCh/n3xQ5rsyqwkI0UUR+E8wDqsZCcWPJxBO5
 pm7cmCOVt128vyZWcH/l9QeuE4TbXoBEl+cQ88cFwHuD4dzfxv2P5xR4pmLYP1VaqX7CGD
 owh8Pw92Of5mxjYxg9cYrQMVD3OE220=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-vHzo4EJfOf2hyjy4icG9AQ-1; Sun, 09 Jan 2022 07:20:10 -0500
X-MC-Unique: vHzo4EJfOf2hyjy4icG9AQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 m16-20020a056402431000b003fb60bbe0e2so5281175edc.3
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 04:20:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1ywEVpIYkA8ApnIMb13uX6WhE34/CLcuP/mSiyIxTQI=;
 b=JQ6a9ZYdvY+nOaZo+coO+r5ORMfv1PyrLkDB2ZO+YCPo7j8vvTO5YABe+Xtt2Eta4F
 imfQclZQvNTNQq6FcRswhCUYCA0oEAX5eIOacaFLRYZFYv66ISlWEriDFrgTMiCsfpdO
 l3H6bqHJzEmQ+LJ7z7K94N5dzQG8zF4dOmr3dAwmBpyBxAuFVjNeBqxHjAJO8WaTLxAe
 WKQy2IQJqxhMd9blfagmBetTRCUDITWRb9l5Kt7bwRramwBi9lFuHARbuJcO/vKwI0Qc
 NvAHQSPpmlWCbLzA9OYv+HXAs0pzf15jmGsDP2tqdofskt3mfTsBtlPMa2jEyhZKPkiL
 GVvg==
X-Gm-Message-State: AOAM531+vh6+JGsYEEtBj5F3X6a1yTK8DcCq5j0iLQfILANW4K7z903/
 bzsIOfqa8zmxbCI27TRRdINdU1+oBtla06Iy5mKW5EH4ZGFRLArbecTuLx2585unCCAzgO+bKow
 gHDpOgmbh5A52gIU=
X-Received: by 2002:a17:907:7fa1:: with SMTP id
 qk33mr13584799ejc.95.1641730808821; 
 Sun, 09 Jan 2022 04:20:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwy4psrs3JsQXE3dtS6fBTc5GiStuyr0g1L5V0eY3nGcU6XNbMnzVq5IRR/SKIffo2yQ79qDw==
X-Received: by 2002:a17:907:7fa1:: with SMTP id
 qk33mr13584779ejc.95.1641730808469; 
 Sun, 09 Jan 2022 04:20:08 -0800 (PST)
Received: from ?IPV6:2003:cb:c727:9100:ccc4:124c:ad98:2c81?
 (p200300cbc7279100ccc4124cad982c81.dip0.t-ipconnect.de.
 [2003:cb:c727:9100:ccc4:124c:ad98:2c81])
 by smtp.gmail.com with ESMTPSA id j9sm1335619ejg.64.2022.01.09.04.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 04:20:08 -0800 (PST)
Message-ID: <1b61d8e9-3926-6050-0065-ee303f312edf@redhat.com>
Date: Sun, 9 Jan 2022 13:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PULL v2 00/55] virtio,pci,pc: features,fixes,cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220107102526.39238-1-mst@redhat.com>
 <3f660c72-de9d-66e1-aed4-e9a5cda00f12@linaro.org>
 <20220107193109-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220107193109-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.01.22 01:34, Michael S. Tsirkin wrote:
> On Fri, Jan 07, 2022 at 11:38:21AM -0800, Richard Henderson wrote:
>> On 1/7/22 3:03 AM, Michael S. Tsirkin wrote:
>>> Changes from v1:
>>> - mingw build fixes
>>> - added TPM patches which got acks meanwhile
>>>
>>> Big changes that were tagged originally but did not make the cut:
>>> - SRIOV/nvme (not sure they are my tree material anyway)
>>> - ACPI ERST (some coding style violations)
>>>
>>> The following changes since commit 7d4ae4d4978079d564d3b6354c90a949130409fe:
>>>
>>>    Merge tag 'pull-request-2022-01-05' of https://gitlab.com/thuth/qemu into staging (2022-01-05 08:47:18 -0800)
>>>
>>> are available in the Git repository at:
>>>
>>>    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>>>
>>> for you to fetch changes up to f1aaf12842f344237d0654352e324a5ab7c70196:
>>>
>>>    tests: acpi: Add updated TPM related tables (2022-01-07 05:23:59 -0500)
>>>
>>> ----------------------------------------------------------------
>>> virtio,pci,pc: features,fixes,cleanups
>>>
>>> New virtio mem options.
>>> A vhost-user cleanup.
>>> Control over smbios entry point type.
>>> Config interrupt support for vdpa.
>>> Fixes, cleanups all over the place.
>>>
>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>
>>> ----------------------------------------------------------------
>>> Andy Pei (1):
>>>        hw/vhost-user-blk: turn on VIRTIO_BLK_F_SIZE_MAX feature for virtio blk device
>>>
>>> Ani Sinha (2):
>>>        MAINTAINERS: Add a separate entry for acpi/VIOT tables
>>>        acpihp: simplify acpi_pcihp_disable_root_bus
>>>
>>> Cindy Lu (10):
>>>        virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
>>>        virtio-pci: decouple notifier from interrupt process
>>>        virtio-pci: decouple the single vector from the interrupt process
>>>        vhost: introduce new VhostOps vhost_set_config_call
>>>        vhost-vdpa: add support for config interrupt
>>>        virtio: add support for configure interrupt
>>>        vhost: add support for configure interrupt
>>>        virtio-net: add support for configure interrupt
>>>        virtio-mmio: add support for configure interrupt
>>>        virtio-pci: add support for configure interrupt
>>>
>>> Daniil Tatianin (3):
>>>        hw/scsi/vhost-scsi: don't leak vqs on error
>>>        hw/scsi/vhost-scsi: don't double close vhostfd on error
>>>        virtio/vhost-vsock: don't double close vhostfd, remove redundant cleanup
>>>
>>> David Hildenbrand (12):
>>>        virtio-mem: Don't skip alignment checks when warning about block size
>>>        util/oslib-posix: Let touch_all_pages() return an error
>>>        util/oslib-posix: Support MADV_POPULATE_WRITE for os_mem_prealloc()
>>>        util/oslib-posix: Introduce and use MemsetContext for touch_all_pages()
>>>        util/oslib-posix: Don't create too many threads with small memory or little pages
>>>        util/oslib-posix: Avoid creating a single thread with MADV_POPULATE_WRITE
>>>        util/oslib-posix: Support concurrent os_mem_prealloc() invocation
>>>        util/oslib-posix: Forward SIGBUS to MCE handler under Linux
>>>        virtio-mem: Support "prealloc=on" option
>>>        linux-headers: sync VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
>>>        virtio-mem: Support VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
>>>        virtio-mem: Set "unplugged-inaccessible=auto" for the 7.0 machine on x86
>>>
>>> Eduardo Habkost (3):
>>>        smbios: Rename SMBIOS_ENTRY_POINT_* enums
>>>        hw/smbios: Use qapi for SmbiosEntryPointType
>>>        hw/i386: expose a "smbios-entry-point-type" PC machine property
>>>
>>> Frederic Barrat (2):
>>>        pci: Export the pci_intx() function
>>>        pcie_aer: Don't trigger a LSI if none are defined
>>>
>>> Igor Mammedov (4):
>>>        acpi: fix QEMU crash when started with SLIC table
>>>        tests: acpi: whitelist expected blobs before changing them
>>>        tests: acpi: add SLIC table test
>>>        tests: acpi: SLIC: update expected blobs
>>>
>>> Jason Wang (1):
>>>        intel-iommu: correctly check passthrough during translation
>>>
>>> Laurent Vivier (1):
>>>        trace-events,pci: unify trace events format
>>>
>>> Michael S. Tsirkin (1):
>>>        acpi: validate hotplug selector on access
>>>
>>> Roman Kagan (9):
>>>        vhost-user-blk: reconnect on any error during realize
>>>        chardev/char-socket: tcp_chr_recv: don't clobber errno
>>>        chardev/char-socket: tcp_chr_sync_read: don't clobber errno
>>>        vhost-backend: avoid overflow on memslots_limit
>>>        vhost-backend: stick to -errno error return convention
>>>        vhost-vdpa: stick to -errno error return convention
>>>        vhost-user: stick to -errno error return convention
>>>        vhost: stick to -errno error return convention
>>>        vhost-user-blk: propagate error return from generic vhost
>>>
>>> Stefan Berger (3):
>>>        tests: acpi: prepare for updated TPM related tables
>>>        acpi: tpm: Add missing device identification objects
>>>        tests: acpi: Add updated TPM related tables
>>>
>>> Stefan Hajnoczi (1):
>>>        virtio: signal after wrapping packed used_idx
>>>
>>> Thomas Huth (2):
>>>        hw/i386/pc: Add missing property descriptions
>>>        docs: reSTify virtio-balloon-stats documentation and move to docs/interop
>>>
>>>   qapi/machine.json                                  |  12 +
>>>   hw/virtio/virtio-pci.h                             |   4 +-
>>>   include/hw/firmware/smbios.h                       |  10 +-
>>>   include/hw/i386/pc.h                               |   4 +
>>>   include/hw/pci/pci.h                               |   5 +
>>>   include/hw/virtio/vhost-backend.h                  |   3 +
>>>   include/hw/virtio/vhost.h                          |   4 +
>>>   include/hw/virtio/virtio-mem.h                     |  12 +
>>>   include/hw/virtio/virtio.h                         |   7 +
>>>   include/net/vhost_net.h                            |   2 +
>>>   include/qemu/osdep.h                               |   7 +
>>>   include/standard-headers/linux/virtio_mem.h        |   9 +-
>>>   chardev/char-socket.c                              |  17 +-
>>>   hw/acpi/core.c                                     |   4 +-
>>>   hw/acpi/pcihp.c                                    |  12 +-
>>>   hw/arm/virt-acpi-build.c                           |   1 +
>>>   hw/arm/virt.c                                      |   2 +-
>>>   hw/block/vhost-user-blk.c                          |   5 +-
>>>   hw/display/vhost-user-gpu.c                        |   6 +
>>>   hw/i386/acpi-build.c                               |   9 +
>>>   hw/i386/intel_iommu.c                              |  38 +-
>>>   hw/i386/pc.c                                       |  38 +-
>>>   hw/i386/pc_piix.c                                  |   2 +-
>>>   hw/i386/pc_q35.c                                   |   2 +-
>>>   hw/net/vhost_net-stub.c                            |   9 +
>>>   hw/net/vhost_net.c                                 |   9 +
>>>   hw/net/virtio-net.c                                |  10 +-
>>>   hw/pci/pci.c                                       |   9 +-
>>>   hw/pci/pci_host.c                                  |   6 +-
>>>   hw/pci/pcie_aer.c                                  |   4 +-
>>>   hw/scsi/vhost-scsi.c                               |  15 +-
>>>   hw/smbios/smbios.c                                 |   8 +-
>>>   hw/virtio/vhost-backend.c                          |   4 +-
>>>   hw/virtio/vhost-user-fs.c                          |   6 +
>>>   hw/virtio/vhost-user.c                             | 401 ++++++++++++---------
>>>   hw/virtio/vhost-vdpa.c                             |  44 ++-
>>>   hw/virtio/vhost-vsock-common.c                     |   6 +
>>>   hw/virtio/vhost-vsock.c                            |  11 +-
>>>   hw/virtio/vhost.c                                  | 174 ++++++---
>>>   hw/virtio/virtio-crypto.c                          |   6 +
>>>   hw/virtio/virtio-mem.c                             | 105 +++++-
>>>   hw/virtio/virtio-mmio.c                            |  27 ++
>>>   hw/virtio/virtio-pci.c                             | 281 ++++++++++-----
>>>   hw/virtio/virtio.c                                 |  30 ++
>>>   softmmu/cpus.c                                     |   4 +
>>>   tests/qtest/bios-tables-test.c                     |  15 +
>>>   util/oslib-posix.c                                 | 234 +++++++++---
>>>   MAINTAINERS                                        |   8 +
>>>   docs/interop/index.rst                             |   1 +
>>>   .../virtio-balloon-stats.rst}                      |  58 +--
>>>   hw/pci/trace-events                                |   8 +-
>>>   hw/virtio/trace-events                             |   1 +
>>>   tests/data/acpi/q35/DSDT.tis.tpm12                 | Bin 8894 -> 8900 bytes
>>>   tests/data/acpi/q35/DSDT.tis.tpm2                  | Bin 8894 -> 8921 bytes
>>>   tests/data/acpi/q35/FACP.slic                      | Bin 0 -> 244 bytes
>>>   tests/data/acpi/q35/SLIC.slic                      | Bin 0 -> 36 bytes
>>>   56 files changed, 1209 insertions(+), 500 deletions(-)
>>>   rename docs/{virtio-balloon-stats.txt => interop/virtio-balloon-stats.rst} (66%)
>>>   create mode 100644 tests/data/acpi/q35/FACP.slic
>>>   create mode 100644 tests/data/acpi/q35/SLIC.slic
>>
>> This fails everywhere.
>>
>> https://gitlab.com/qemu-project/qemu/-/pipelines/443660857
>>
>>
>> r~
> 
> Oops. It's weird, I was sure I tested it. Trying for the last time
> before I start dropping the offending patches and let confributors
> figure it out.
> 

Thanks for fixing up, I could have sworn I compiled this under mingw myself.

(Maybe CC me next time on the cover letter, then I can jump in right
away, thanks!)

-- 
Thanks,

David / dhildenb


