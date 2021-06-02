Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7389B398BF1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 16:10:59 +0200 (CEST)
Received: from localhost ([::1]:46788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRaE-0001hC-9H
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 10:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1loRZD-0000zr-AZ
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 10:09:55 -0400
Received: from relay64.bu.edu ([128.197.228.104]:42842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1loRZB-0005es-6G
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 10:09:54 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 152E8N4M023280
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 2 Jun 2021 10:08:29 -0400
Date: Wed, 2 Jun 2021 10:08:23 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PULL 15/23] virtio-gpu: Refactor virtio_gpu_set_scanout
Message-ID: <20210602140823.mwtilnjt3un7ooy7@mozz.bu.edu>
References: <20210527142340.1352791-1-kraxel@redhat.com>
 <20210527142340.1352791-16-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527142340.1352791-16-kraxel@redhat.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210527 1623, Gerd Hoffmann wrote:
> From: Vivek Kasireddy <vivek.kasireddy@intel.com>
> 
> Store the meta-data associated with a FB in a new object
> (struct virtio_gpu_framebuffer) and pass the object to set_scanout.
> Also move code in set_scanout into a do_set_scanout function.
> This will be helpful when adding set_scanout_blob API.
> 
> Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Message-Id: <20210526231429.1045476-7-vivek.kasireddy@intel.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---

Hi,
Recently OSS-Fuzz found a heap-overflow in virtio_gpu_disable_scanout. I
bisected it to this patch:
https://gitlab.com/qemu-project/qemu/-/issues/383
-Alex

