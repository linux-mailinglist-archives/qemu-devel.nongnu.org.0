Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B936B2324B7
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 20:32:46 +0200 (CEST)
Received: from localhost ([::1]:58352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0qsf-0007Tv-RU
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 14:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1k0qrJ-0006ul-Kq
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 14:31:21 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46450
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1k0qrH-0005Jg-63
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 14:31:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596047477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VsOPqX9tIx8mW4BY1MvhwIwB2re4bK8E5gCRQjeh/C0=;
 b=McGO0CmohaoZWzc3W7EDgIwUO5wUEc+Hu2tE0p8dxeqV+zkJw1dTLI6dqJWhqdDrPTNDAU
 MLnTXy87dTzjWVFObOV6B3vSLoZk6pO6iLKSdgD8TC7+nRXlw+9zDJqzCTbU3PPTIUUx3P
 dHWL0EW+j2pCB8d1ar+ONGEo2fLWOU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-uFYSr-kVNh2A4AvYO0xaAg-1; Wed, 29 Jul 2020 14:31:16 -0400
X-MC-Unique: uFYSr-kVNh2A4AvYO0xaAg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A6D58A511F;
 Wed, 29 Jul 2020 18:31:14 +0000 (UTC)
Received: from starship (unknown [10.35.206.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B635972E5B;
 Wed, 29 Jul 2020 18:31:11 +0000 (UTC)
Message-ID: <d89a0ffd19977bc932003c6991270ab6d304c9d1.camel@redhat.com>
Subject: Re: [PATCH 07/16] hw/block/nvme: add request mapping helper
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Minwoo Im <minwoo.im.dev@gmail.com>, Klaus Jensen <its@irrelevant.dk>
Date: Wed, 29 Jul 2020 21:31:10 +0300
In-Reply-To: <20200729155245.GF14876@localhost.localdomain>
References: <20200720113748.322965-1-its@irrelevant.dk>
 <20200720113748.322965-8-its@irrelevant.dk>
 <20200729155245.GF14876@localhost.localdomain>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 09:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-07-30 at 00:52 +0900, Minwoo Im wrote:
> Klaus,
> 
> On 20-07-20 13:37:39, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> > 
> > Introduce the nvme_map helper to remove some noise in the main nvme_rw
> > function.
> > 
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  hw/block/nvme.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index f1e04608804b..68c33a11c144 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -413,6 +413,15 @@ static uint16_t nvme_dma_prp(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
> >      return status;
> >  }
> >  
> > +static uint16_t nvme_map(NvmeCtrl *n, NvmeCmd *cmd, size_t len,
> > +                         NvmeRequest *req)
> 
> Can we specify what is going to be mapped in this function? like
> nvme_map_dptr?
I also once complained about the name, and I do like this idea!

Best regards,
	Maxim Levitsky

> 
> Thanks,
> 



