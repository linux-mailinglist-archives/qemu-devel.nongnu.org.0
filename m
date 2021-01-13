Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C5D2F4C3E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 14:32:42 +0100 (CET)
Received: from localhost ([::1]:56882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgGP-00037O-IC
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 08:32:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kzgBu-00017x-Dy
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:28:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kzgBr-00045n-Sl
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:28:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610544477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ht1YRl1iEbgJ9nslm28jdp9vHwv3cH5NJ4IwPeGSnsk=;
 b=TtPu3aOYSaoCseG2CKatogBJP2v2fAY7j2z+sccAMvNVBd/+jEaqE7NQRGmq3sQsw2LTPK
 LDagMm9NkpTHnTgv38CfOKuvFOu8m6UcDTAupN/7YLj+Aa1bLqPyCFdpC6K5GdPJwNb8PX
 vcU2gcnN8GSqeuNd+1ds2yKG24MK3FQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-ZIidf5MJNCmrg0NLVFM1RQ-1; Wed, 13 Jan 2021 08:27:54 -0500
X-MC-Unique: ZIidf5MJNCmrg0NLVFM1RQ-1
Received: by mail-wr1-f69.google.com with SMTP id u29so969119wru.6
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 05:27:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ht1YRl1iEbgJ9nslm28jdp9vHwv3cH5NJ4IwPeGSnsk=;
 b=Vrhk728dipvY3doDVy4zpjvREVG13cUXcvI21QyPilhRg1hosqdwI1rq85okCQ64xp
 4PVmS6Degb6LiRRd2nNjF8CpgBCCax0/vcA789cva9nxew02Nsss76IhMI4vcahAtYft
 1TT+StSULaG86qngQ/elryHjqA+KjbCDv/wJwKLAaIXillVnYMvxYPxoVFZkPa29YBbS
 GPoSeQEpy37dm0kUnf5Msj84binvmVedQh4EXQT8bL1Y+4axI9YSn4dAzrFs+BXLEOg1
 yDxBhewoFzKD4pNEl4/pS33kdRFa+o9UCdxOAPmhxvxwmhvUBfiMGkOPq2B9y5Xp8FZ5
 PcGw==
X-Gm-Message-State: AOAM532K53FuvNr84ar7poqZMtPeGf1DfhVbIEkWjZB614ZIURN/YPKG
 0IpXnCDVRTyb48Y2eIhBUEBdFr8x0Bc0i7Ye2lxY1b85x+ucifEXmXlowFrOOqjezuIs0s3qBFW
 fZ3dZTRn2UQ0ILdU=
X-Received: by 2002:a1c:6506:: with SMTP id z6mr2223214wmb.55.1610544473506;
 Wed, 13 Jan 2021 05:27:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLyaFmUB51OwVeg77ffhxrZXQ4x87jD3oXRzvMUuv7OExUMAMIJydP2mVwwtFvU8cFxHhOyw==
X-Received: by 2002:a1c:6506:: with SMTP id z6mr2223194wmb.55.1610544473275;
 Wed, 13 Jan 2021 05:27:53 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id i18sm3619420wrp.74.2021.01.13.05.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 05:27:52 -0800 (PST)
Date: Wed, 13 Jan 2021 08:27:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 19/45] memory: clamp cached translation in case it points
 to an MMIO region
Message-ID: <20210113072048-mutt-send-email-mst@kernel.org>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
 <20201215175445.1272776-20-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201215175445.1272776-20-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 15, 2020 at 12:54:19PM -0500, Paolo Bonzini wrote:
> In using the address_space_translate_internal API, address_space_cache_init
> forgot one piece of advice that can be found in the code for
> address_space_translate_internal:
> 
>     /* MMIO registers can be expected to perform full-width accesses based only
>      * on their address, without considering adjacent registers that could
>      * decode to completely different MemoryRegions.  When such registers
>      * exist (e.g. I/O ports 0xcf8 and 0xcf9 on most PC chipsets), MMIO
>      * regions overlap wildly.  For this reason we cannot clamp the accesses
>      * here.
>      *
>      * If the length is small (as is the case for address_space_ldl/stl),
>      * everything works fine.  If the incoming length is large, however,
>      * the caller really has to do the clamping through memory_access_size.
>      */
> 
> address_space_cache_init is exactly one such case where "the incoming length
> is large", therefore we need to clamp the resulting length---not to
> memory_access_size though, since we are not doing an access yet, but to
> the size of the resulting section.  This ensures that subsequent accesses
> to the cached MemoryRegionSection will be in range.
> 
> With this patch, the enclosed testcase notices that the used ring does
> not fit into the MSI-X table and prints a "qemu-system-x86_64: Cannot map used"
> error.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Cc: qemu-stable@nongnu.org

> ---
>  softmmu/physmem.c       | 10 ++++++++
>  tests/qtest/fuzz-test.c | 51 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 3027747c03..2cd1de4a2c 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -3255,6 +3255,7 @@ int64_t address_space_cache_init(MemoryRegionCache *cache,
>      AddressSpaceDispatch *d;
>      hwaddr l;
>      MemoryRegion *mr;
> +    Int128 diff;
>  
>      assert(len > 0);
>  
> @@ -3263,6 +3264,15 @@ int64_t address_space_cache_init(MemoryRegionCache *cache,
>      d = flatview_to_dispatch(cache->fv);
>      cache->mrs = *address_space_translate_internal(d, addr, &cache->xlat, &l, true);
>  
> +    /*
> +     * cache->xlat is now relative to cache->mrs.mr, not to the section itself.
> +     * Take that into account to compute how many bytes are there between
> +     * cache->xlat and the end of the section.
> +     */
> +    diff = int128_sub(cache->mrs.size,
> +		      int128_make64(cache->xlat - cache->mrs.offset_within_region));
> +    l = int128_get64(int128_min(diff, int128_make64(l)));
> +
>      mr = cache->mrs.mr;
>      memory_region_ref(mr);
>      if (memory_access_is_direct(mr, is_write)) {
> diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
> index 87b72307a5..cdb1100a0b 100644
> --- a/tests/qtest/fuzz-test.c
> +++ b/tests/qtest/fuzz-test.c
> @@ -48,6 +48,55 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
>      qtest_quit(s);
>  }
>  
> +/*
> + * Here a MemoryRegionCache pointed to an MMIO region but had a
> + * larger size than the underlying region.
> + */
> +static void test_mmio_oob_from_memory_region_cache(void)
> +{
> +    QTestState *s;
> +
> +    s = qtest_init("-M pc-q35-5.2 -display none -m 512M "
> +		   "-device virtio-scsi,num_queues=8,addr=03.0 ");
> +
> +    qtest_outl(s, 0xcf8, 0x80001811);
> +    qtest_outb(s, 0xcfc, 0x6e);
> +    qtest_outl(s, 0xcf8, 0x80001824);
> +    qtest_outl(s, 0xcf8, 0x80001813);
> +    qtest_outl(s, 0xcfc, 0xa080000);
> +    qtest_outl(s, 0xcf8, 0x80001802);
> +    qtest_outl(s, 0xcfc, 0x5a175a63);
> +    qtest_outb(s, 0x6e08, 0x9e);
> +    qtest_writeb(s, 0x9f003, 0xff);
> +    qtest_writeb(s, 0x9f004, 0x01);
> +    qtest_writeb(s, 0x9e012, 0x0e);
> +    qtest_writeb(s, 0x9e01b, 0x0e);
> +    qtest_writeb(s, 0x9f006, 0x01);
> +    qtest_writeb(s, 0x9f008, 0x01);
> +    qtest_writeb(s, 0x9f00a, 0x01);
> +    qtest_writeb(s, 0x9f00c, 0x01);
> +    qtest_writeb(s, 0x9f00e, 0x01);
> +    qtest_writeb(s, 0x9f010, 0x01);
> +    qtest_writeb(s, 0x9f012, 0x01);
> +    qtest_writeb(s, 0x9f014, 0x01);
> +    qtest_writeb(s, 0x9f016, 0x01);
> +    qtest_writeb(s, 0x9f018, 0x01);
> +    qtest_writeb(s, 0x9f01a, 0x01);
> +    qtest_writeb(s, 0x9f01c, 0x01);
> +    qtest_writeb(s, 0x9f01e, 0x01);
> +    qtest_writeb(s, 0x9f020, 0x01);
> +    qtest_writeb(s, 0x9f022, 0x01);
> +    qtest_writeb(s, 0x9f024, 0x01);
> +    qtest_writeb(s, 0x9f026, 0x01);
> +    qtest_writeb(s, 0x9f028, 0x01);
> +    qtest_writeb(s, 0x9f02a, 0x01);
> +    qtest_writeb(s, 0x9f02c, 0x01);
> +    qtest_writeb(s, 0x9f02e, 0x01);
> +    qtest_writeb(s, 0x9f030, 0x01);
> +    qtest_outb(s, 0x6e10, 0x00);
> +    qtest_quit(s);
> +}
> +
>  int main(int argc, char **argv)
>  {
>      const char *arch = qtest_get_arch();
> @@ -59,6 +108,8 @@ int main(int argc, char **argv)
>                         test_lp1878263_megasas_zero_iov_cnt);
>          qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
>                         test_lp1878642_pci_bus_get_irq_level_assert);
> +        qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
> +                       test_mmio_oob_from_memory_region_cache);
>      }
>  
>      return g_test_run();
> -- 
> 2.26.2
> 
> 
> 


