Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB6F54D55
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 13:15:40 +0200 (CEST)
Received: from localhost ([::1]:58894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfjQA-0002ZX-UQ
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 07:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50065)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hfjOu-00026J-DI
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 07:14:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hfjOt-0001xA-EI
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 07:14:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54800)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hfjOt-0001v7-7B
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 07:14:11 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6E2B122386D
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 11:14:09 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E551E5D71B;
 Tue, 25 Jun 2019 11:14:06 +0000 (UTC)
Date: Tue, 25 Jun 2019 13:14:05 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190625131405.0f2fa709@redhat.com>
In-Reply-To: <20190621064615.20099-2-mst@redhat.com>
References: <20190621064615.20099-1-mst@redhat.com>
 <20190621064615.20099-2-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 25 Jun 2019 11:14:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/3] pcie: don't skip multi-mask events
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 21 Jun 2019 02:46:46 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> If we are trying to set multiple bits at once, testing that just one of
> them is already set gives a false positive. As a result we won't
> interrupt guest if e.g. presence detection change and attention button
> press are both set. This happens with multi-function device removal.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/pci/pcie.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 88c30ff74c..b22527000d 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -383,7 +383,7 @@ static void pcie_cap_slot_event(PCIDevice *dev, PCIExpressHotPlugEvent event)
>  {
>      /* Minor optimization: if nothing changed - no event is needed. */
>      if (pci_word_test_and_set_mask(dev->config + dev->exp.exp_cap +
> -                                   PCI_EXP_SLTSTA, event)) {
> +                                   PCI_EXP_SLTSTA, event) == event) {
>          return;
>      }
>      hotplug_event_notify(dev);


