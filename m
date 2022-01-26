Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7932049D09A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 18:22:38 +0100 (CET)
Received: from localhost ([::1]:56790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCm0D-0004v2-9f
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 12:22:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nClkI-0006In-Qu; Wed, 26 Jan 2022 12:06:11 -0500
Received: from [2604:1380:4641:c500::1] (port=59592 helo=dfw.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nCljh-0000Ot-Tm; Wed, 26 Jan 2022 12:05:36 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C305461AD8;
 Wed, 26 Jan 2022 17:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9280DC340E3;
 Wed, 26 Jan 2022 17:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643216728;
 bh=U+8pSjYq073PnO0eTNU5cN6jRBsInWtEm3hl2Tw/sCM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NmoDznJc22Usu2TH2gSku5owA+0Ep+9PbruJEGi50QRQGOwR8Eus1GaDgrTXYsPpj
 W/ezqcI7WdukA3fr7kIMV5eIUg/I+5uBlpfe1WOqkhMzIXVtSOQIxhF4JuioFVrw5w
 mtWv5q1UW6/8dKm40y6EmoYgYH58JuwakC8XE2icDp11Euosy/1bgWHjvzpDI917Uv
 1p83H4q8AZbotD9JfdIWJlwmOikZ0jXwN7Jtilge6ZbbvxJ1j6f8EJrdrDRD84HWMQ
 zFPi4SdOGzOEUXFSrscdiwhdyZenDz5Y0KZ0FlQJD57n8LzsyJJz/iDSx0uV8yGm6z
 Yp956C/KUJtaQ==
Date: Wed, 26 Jan 2022 09:05:25 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH for-7.0 2/4] hw/nvme: add zone attribute get/set helpers
Message-ID: <20220126170525.GB1885300@dhcp-10-100-145-180.wdc.com>
References: <20211125073735.248403-1-its@irrelevant.dk>
 <20211125073735.248403-3-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125073735.248403-3-its@irrelevant.dk>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4641:c500::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=kbusch@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 25, 2021 at 08:37:33AM +0100, Klaus Jensen wrote:
> @@ -295,7 +295,7 @@ static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
>      case NVME_ZONE_STATE_READ_ONLY:
>          break;
>      default:
> -        zone->d.za = 0;
> +        NVME_ZA_CLEAR_ALL(zone->d.za);
>      }
>  }
>  
> @@ -3356,7 +3356,7 @@ static uint16_t nvme_set_zd_ext(NvmeNamespace *ns, NvmeZone *zone)
>              return status;
>          }
>          nvme_aor_inc_active(ns);
> -        zone->d.za |= NVME_ZA_ZD_EXT_VALID;
> +        NVME_ZA_SET(zone->d.za, NVME_ZA_ZD_EXT_VALID);
>          nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
>          return NVME_SUCCESS;
>      }
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 2ee227760265..2b8b906466ab 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -1407,6 +1407,10 @@ enum NvmeZoneAttr {
>      NVME_ZA_ZD_EXT_VALID             = 1 << 7,
>  };
>  
> +#define NVME_ZA_SET(za, attrs)   ((za) |= (attrs))
> +#define NVME_ZA_CLEAR(za, attrs) ((za) &= ~(attrs))
> +#define NVME_ZA_CLEAR_ALL(za)    ((za) = 0x0)

This doesn't really look any more helpful than open coding it. I think
it would appear better to take a "struct NvmeZone" type parameter
instead, and use inline functions instead of macro.

