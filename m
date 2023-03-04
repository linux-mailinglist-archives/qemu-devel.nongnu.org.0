Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603316AAC4A
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 21:05:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYY6c-0008V4-9c; Sat, 04 Mar 2023 15:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pYY6U-0008Us-U1
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 15:03:39 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pYY6S-00084j-OQ
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 15:03:38 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4A83D4000B;
 Sat,  4 Mar 2023 23:03:22 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C20B8123;
 Sat,  4 Mar 2023 23:03:20 +0300 (MSK)
Message-ID: <456fa17c-71b6-8aec-c38c-d7fbc907e150@msgid.tls.msk.ru>
Date: Sat, 4 Mar 2023 23:03:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PULL 14/53] virtio-rng-pci: fix transitional migration compat
 for vectors
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
 <20230302082343.560446-15-mst@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230302082343.560446-15-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
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

02.03.2023 11:25, Michael S. Tsirkin wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> In bad9c5a516 ("virtio-rng-pci: fix migration compat for vectors") I
> fixed the virtio-rng-pci migration compatibility, but it was discovered
> that we also need to fix the other aliases of the device for the
> transitional cases.
> 
> Fixes: 9ea02e8f1 ('virtio-rng-pci: Allow setting nvectors, so we can use MSI-X')
> bz: https://bugzilla.redhat.com/show_bug.cgi?id=2162569
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Message-Id: <20230207174944.138255-1-dgilbert@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   hw/core/machine.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index f29e700ee4..1cf6822e06 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -47,6 +47,8 @@ const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
>   GlobalProperty hw_compat_7_1[] = {
>       { "virtio-device", "queue_reset", "false" },
>       { "virtio-rng-pci", "vectors", "0" },
> +    { "virtio-rng-pci-transitional", "vectors", "0" },
> +    { "virtio-rng-pci-non-transitional", "vectors", "0" },
>   };

If we consider this one for 7.2 stable, the previous change here, which
added "virtio-rng-pci" right before the lines being added, should also
be picked up, which is bad9c5a5166fd5e3a892b7b0477cf2f4bd3a959a:
  From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
  Date: Mon, 9 Jan 2023 10:58:09 +0000
  Subject: virtio-rng-pci: fix migration compat for vectors

Should the two both be included in -stable, or both omitted?

Thanks,

/mjt

