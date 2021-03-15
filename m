Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B139533ADB3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:37:31 +0100 (CET)
Received: from localhost ([::1]:50228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLijC-00016U-6q
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lLihw-0000dq-8H
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 04:36:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lLihs-0002Fb-5N
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 04:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615797365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wK+h3iB8TZivvLSEPZDXx0o5F5Ft/X2AOCvhU1TbhjA=;
 b=WXiGNzsC3Go0yShThV82eOTD+E5rxcigFUC6REzCx1RBdBN1m9gMa0MAmd9dEh6W25lzVA
 cd5lNmXRlbXks5EYrMH29g5a3pojqFdw1AOAR8Wv7i+No5q/eBtECUmDTjfKeSaU50qn1V
 q4Y83AH1YRCVa+xFioSGW/weHt0aHP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-asL_zCGIP7-V-5ofe339aA-1; Mon, 15 Mar 2021 04:36:03 -0400
X-MC-Unique: asL_zCGIP7-V-5ofe339aA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7E0E8030D6
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 08:36:01 +0000 (UTC)
Received: from lws.brq.redhat.com (unknown [10.40.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A112F5D9CD;
 Mon, 15 Mar 2021 08:36:00 +0000 (UTC)
Date: Mon, 15 Mar 2021 09:35:57 +0100
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] Add missing initialization for g_autofree variables
Message-ID: <20210315083557.jkbkee4owqibkjkb@lws.brq.redhat.com>
References: <20210315080032.152210-1-mrezanin@redhat.com>
 <6ca4cc62-2313-e2db-1ad1-e7b9c4dfb829@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6ca4cc62-2313-e2db-1ad1-e7b9c4dfb829@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 09:08:01AM +0100, Thomas Huth wrote:
> On 15/03/2021 09.00, mrezanin@redhat.com wrote:
> > From: Miroslav Rezanina <mrezanin@redhat.com>
> > 
> > When declaring g_autofree variable without inicialization, compiler
> > will raise "may be used uninitialized in this function" warning due
> > to automatic free handling.
> > 
> > This is mentioned in docs/devel/style.rst (quote from section
> > "Automatic memory deallocation"):
> > 
> >    * Variables declared with g_auto* MUST always be initialized,
> >      otherwise the cleanup function will use uninitialized stack memory
> > 
> > Add inicialization to NULL for these declaration to prevent this
> > warning.
> > 
> > Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> > 
> > ---
> > * From v1:
> >    -- Removed fixes in hw/remote/memory.c and hw/remote/proxy.c
> >       fixed by patch sent by Zenghui Yu (multi-process: Initialize
> >       variables declared with g_auto*)
> > ---
> >   hw/s390x/s390-pci-vfio.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
> > index ead4f222d5..0ee7dc21f2 100644
> > --- a/hw/s390x/s390-pci-vfio.c
> > +++ b/hw/s390x/s390-pci-vfio.c
> > @@ -29,7 +29,7 @@
> >    */
> >   bool s390_pci_update_dma_avail(int fd, unsigned int *avail)
> >   {
> > -    g_autofree struct vfio_iommu_type1_info *info;
> > +    g_autofree struct vfio_iommu_type1_info *info = NULL;
> >       uint32_t argsz;
> >       assert(avail);
> 
> I'd maybe rather rework the functions like this:
> 
> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
> index ead4f222d5..1fe71fd93f 100644
> --- a/hw/s390x/s390-pci-vfio.c
> +++ b/hw/s390x/s390-pci-vfio.c
> @@ -29,14 +29,11 @@
>   */
>  bool s390_pci_update_dma_avail(int fd, unsigned int *avail)
>  {
> -    g_autofree struct vfio_iommu_type1_info *info;
> -    uint32_t argsz;
> +    uint32_t argsz = sizeof(struct vfio_iommu_type1_info);
> +    g_autofree struct vfio_iommu_type1_info *info = g_malloc0(argsz);
>      assert(avail);
> -    argsz = sizeof(struct vfio_iommu_type1_info);
> -    info = g_malloc0(argsz);
> -

Hi Thomas,

I thought about it but for some reason I miss-read the code and though
that avail is used for calculating argsz and didn't want to use it before
assert.

I'll send new version with this change.
>      /*
>       * If the specified argsz is not large enough to contain all capabilities
>       * it will be updated upon return from the ioctl.  Retry until we have
> 
> > @@ -230,7 +230,7 @@ static void s390_pci_read_pfip(S390PCIBusDevice *pbdev,
> >    */
> >   void s390_pci_get_clp_info(S390PCIBusDevice *pbdev)
> >   {
> > -    g_autofree struct vfio_device_info *info;
> > +    g_autofree struct vfio_device_info *info = NULL;
> >       VFIOPCIDevice *vfio_pci;
> >       uint32_t argsz;
> >       int fd;
> > 
> 
> Anyway,
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> 


