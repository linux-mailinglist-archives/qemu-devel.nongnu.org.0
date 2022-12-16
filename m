Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABDE64EAAD
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:32:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68wK-0002BQ-9f; Fri, 16 Dec 2022 06:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p68w3-00029Z-M8
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:31:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p68w1-00081N-Cz
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:31:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671190283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HKecd3BkniS5tSOVpucgsEN0eod436UWHOyduM3O8Eg=;
 b=WHzNcHboUMSFuasOtiQ8c8pst7PfCBScXJNGJxldtMMDbwQrUOHKHJ66PYWSxOLwXt/oKW
 7xogehODXV/nHGXSJAtHh43hjDyX32Z7ggXunt5t3g+5g7/Z71qXsF+e8gwAJMMNLZW3Z+
 rZTpM4h+Frb0CzIZCFB9GvSuUp6sPiA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-15-B39v4rpDNg6zMbEqnqBZaQ-1; Fri, 16 Dec 2022 06:31:22 -0500
X-MC-Unique: B39v4rpDNg6zMbEqnqBZaQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 oo9-20020a056214450900b004cfdcb99fa5so1301380qvb.13
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 03:31:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HKecd3BkniS5tSOVpucgsEN0eod436UWHOyduM3O8Eg=;
 b=7HojGBFQipbFyh2u8w1/BoFHQHxRZADd5Ck1mhvWvMP6ex2Pj79pQnBXbvXuNoFp5X
 mhIKz4ydRg96Fg0DzfEXUOGqB0vc1nyYOWyZzMHrx7uz9tEExj7eTCVx6d5kBv98kLcF
 XX3tEbqsinkr4NeqlIOrSnNtBkUIc9+onkqnK1DvcgNFmGjLtMAdYKzqUQ3W+lTea/6I
 AIYRVoOeJyJ631csfuvUkVryQFA9rWJH8kPE+Ih6NA3c2APb30mKapouW0KccbNz4xFj
 GtJ29kkaylsPn+IMsudA2aKjnzqO7JZjucau+8h58Y66dAaYVQB/gYg+IL7dkBQQeD+7
 cjBQ==
X-Gm-Message-State: AFqh2kppX+Oe2LBW6wnQuMgm+0uBa9A3om7DKNa1KlzttMFHnIsUsbF2
 vtn4uLGabV+sUjnKc5qnumMgNFw5WVsCCjD26yvhcNTd+4NN5a5/uOAU3SVR7VoB5qRrUjdb75P
 R2GSPrXNKQ5jgrYU=
X-Received: by 2002:ac8:668d:0:b0:3a9:1ada:930f with SMTP id
 d13-20020ac8668d000000b003a91ada930fmr8405469qtp.23.1671190281387; 
 Fri, 16 Dec 2022 03:31:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu4mlOF4Nhb8RfjrBJ7jy6KBjpye7yssf+Xqgegp5KtejS6tw1qKLSuDhS/I0jJ9MDd1OGbyQ==
X-Received: by 2002:ac8:668d:0:b0:3a9:1ada:930f with SMTP id
 d13-20020ac8668d000000b003a91ada930fmr8405433qtp.23.1671190280884; 
 Fri, 16 Dec 2022 03:31:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 124-20020a370582000000b006fae7e6204bsm1245282qkf.108.2022.12.16.03.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 03:31:20 -0800 (PST)
Message-ID: <960a864e-77d9-1a4e-89af-61c4a391d663@redhat.com>
Date: Fri, 16 Dec 2022 12:31:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 00/24] vfio-user client
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <cover.1667542066.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/9/22 00:13, John Johnson wrote:
> 
> Hello,
> 
> This is the 6th revision of the vfio-user client implementation.
> It is the first patch series (the previous revisions were RFCs)
> 
> First of all, thank you for your time reviewing the RFC versions.
> 
> The vfio-user framework consists of 3 parts:
>   1) The VFIO user protocol specification.
>   2) A client - the VFIO device in QEMU that encapsulates VFIO messages
>      and sends them to the server.
>   3) A server - a remote process that emulates a device.
> 
> This patchset implements parts 1 and 2.
> 
> The libvfio-user project (https://github.com/nutanix/libvfio-user)
> can be used by a remote process to handle the protocol to implement the third part.
> We also have upstreamed a patch series that implement a server using QEMU.
> 

Thanks for this contribution,


This is a large and complex framework which looks quite mature. QEMU
would need implementations of remote devices under contrib/, provided
as examples for the QEMU crowd. These are important to show possible
use cases and also, they could possibly be run for non regression tests
done by maintainers and distros. e1000e is quite popular, it would
be a good target. It could be a simpler device to start with, but we
would need to cover the basic features, INTx, MSI, DMA, etc. when time
permits. There are samples under libvfio-user and I wonder how we
could leverage them.

Unit tests under /tests would be (really) good to have. These would be
run by CI. Yes, this is a lot of work :/ but very important for QEMU
stability.

The "socket" name property is not the preferred way in QEMU to define
a remote peer to contact. Is there a possibility to use the chardev
interface in some simple way ? I am thinking about the command line
interface and the integration with libvirt.

More code should be isolated under the *user.c file, even if that
means exporting definitions of routines which are local today. I don't
think the #ifdef CONFIG_VIO_USER in the vfio files are something we
will want to merge.

Some renaming to be done, like Kern -> Kernel, etc. nothing major.

I am not convinced that the macros hiding the VFIO backend IO ops are
useful. I even recall some places where the vfio-user implemented
handler could be called directly without calling the top routine first.
Anyhow, it would be better to be explicit, the macros don't add much.

There is a lot of code duplication for the IOMMU support. Did you
consider implementing a VFIOGroup class to share the common behaviour ?
May be too early, but this is certainly something to keep in mind.

The msg recycling feature looks nice but isn't it an optimization ?

More globally speaking, for what kind of crazy setup this feature could
help us with ? I was wondering if you had tried to implement a remote
device or bridge in another QEMU process, for instance.

Thanks,

C.



> Contributors:
> 
> John G Johnson <john.g.johnson@oracle.com>
> John Levon <john.levon@nutanix.com>
> Thanos Makatos <thanos.makatos@nutanix.com>
> Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Jagannathan Raman <jag.raman@oracle.com>
> 
> John Johnson (23):
>    vfio-user: add VFIO base abstract class
>    vfio-user: add container IO ops vector
>    vfio-user: add region cache
>    vfio-user: add device IO ops vector
>    vfio-user: Define type vfio_user_pci_dev_info
>    vfio-user: connect vfio proxy to remote server
>    vfio-user: define socket receive functions
>    vfio-user: define socket send functions
>    vfio-user: get device info
>    vfio-user: get region info
>    vfio-user: region read/write
>    vfio-user: pci_user_realize PCI setup
>    vfio-user: get and set IRQs
>    vfio-user: forward msix BAR accesses to server
>    vfio-user: proxy container connect/disconnect
>    vfio-user: dma map/unmap operations
>    vfio-user: add dma_unmap_all
>    vfio-user: secure DMA support
>    vfio-user: dma read/write operations
>    vfio-user: pci reset
>    vfio-user: add 'x-msg-timeout' option that specifies msg wait times
>    vfio-user: add coalesced posted writes
>    vfio-user: add trace points
> 
> Thanos Makatos (1):
>    vfio-user: introduce vfio-user protocol specification
> 
>   MAINTAINERS                    |   11 +
>   docs/devel/index-internals.rst |    1 +
>   docs/devel/vfio-user.rst       | 1522 ++++++++++++++++++++++++++++++++
>   hw/vfio/Kconfig                |   10 +
>   hw/vfio/ap.c                   |    1 +
>   hw/vfio/ccw.c                  |    7 +-
>   hw/vfio/common.c               |  648 ++++++++++++--
>   hw/vfio/igd.c                  |   23 +-
>   hw/vfio/meson.build            |    1 +
>   hw/vfio/migration.c            |    2 -
>   hw/vfio/pci-quirks.c           |   19 +-
>   hw/vfio/pci.c                  |  926 ++++++++++++++-----
>   hw/vfio/pci.h                  |   29 +-
>   hw/vfio/platform.c             |    2 +
>   hw/vfio/trace-events           |   15 +
>   hw/vfio/user-protocol.h        |  244 +++++
>   hw/vfio/user.c                 | 1904 ++++++++++++++++++++++++++++++++++++++++
>   hw/vfio/user.h                 |  112 +++
>   include/hw/vfio/vfio-common.h  |   82 ++
>   19 files changed, 5230 insertions(+), 329 deletions(-)
>   create mode 100644 docs/devel/vfio-user.rst
>   create mode 100644 hw/vfio/user-protocol.h
>   create mode 100644 hw/vfio/user.c
>   create mode 100644 hw/vfio/user.h
> 


