Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC37A2330B0
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 13:03:37 +0200 (CEST)
Received: from localhost ([::1]:47822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k16LY-00020Z-U1
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 07:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1k16Ka-0001V0-NN
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 07:02:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22615
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1k16KY-0001fG-Dj
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 07:02:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596106953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWxA0v4AtYty3dB7iZsjZF+a5XtgIzslXrzcmMdy5+M=;
 b=RpmPpcr7JPmxnsI+O3WVxQrvGOMBdOFb8hqzDz/OAUqcr1mjSMidJbRJJwkmb6BHIi7Vl0
 M/hVvo6h6nBv3+EqkIlcVnH9NcFoxypCpXAJnjgMtjOW3tPmbDuWsf+3Q+JP3o4bRk6DXm
 pFEDUKH/iuusC3LIXUeAIrw3yiG73j0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-vWpCgNT0NCOOCo_QHfQaBQ-1; Thu, 30 Jul 2020 07:02:29 -0400
X-MC-Unique: vWpCgNT0NCOOCo_QHfQaBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89B8457;
 Thu, 30 Jul 2020 11:02:27 +0000 (UTC)
Received: from starship (unknown [10.35.206.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BEE087B07;
 Thu, 30 Jul 2020 11:02:24 +0000 (UTC)
Message-ID: <1e40f18a915d1e052468773e603f12a68ca12b44.camel@redhat.com>
Subject: Re: [PATCH v2 14/16] hw/block/nvme: consolidate qsg/iov clearing
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Minwoo Im <minwoo.im.dev@gmail.com>, Klaus Jensen <its@irrelevant.dk>
Date: Thu, 30 Jul 2020 14:02:23 +0300
In-Reply-To: <20200730103117.5f7pd6cv3vgqh2mx@localhost.localdomain>
References: <20200729220638.344477-1-its@irrelevant.dk>
 <20200729220638.344477-15-its@irrelevant.dk>
 <20200730103117.5f7pd6cv3vgqh2mx@localhost.localdomain>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 03:59:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-07-30 at 19:31 +0900, Minwoo Im wrote:
> On 20-07-30 00:06:36, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> > 
> > Always destroy the request qsg/iov at the end of request use.
> > 
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/block/nvme.c | 52 ++++++++++++++++++++-----------------------------
> >  1 file changed, 21 insertions(+), 31 deletions(-)
> > 
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 3d7275eae369..045dd55376a5 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -217,6 +217,17 @@ static void nvme_req_clear(NvmeRequest *req)
> >      memset(&req->cqe, 0x0, sizeof(req->cqe));
> >  }
> >  
> > +static void nvme_req_exit(NvmeRequest *req)
> > +{
> > +    if (req->qsg.sg) {
> > +        qemu_sglist_destroy(&req->qsg);
> > +    }
> > +
> > +    if (req->iov.iov) {
> > +        qemu_iovec_destroy(&req->iov);
> > +    }
> > +}
> > +
> 
> Klaus,
> 
> What is differences between 'clear' and 'exit' from the request
> perspective?
> 
> Thanks,
> 
In my personal opinion, I don't think the name matters that much here.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


