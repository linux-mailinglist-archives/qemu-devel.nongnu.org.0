Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334BE6EF92F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 19:20:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prioa-0001k0-VC; Wed, 26 Apr 2023 13:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1prioU-0001is-Lb
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:20:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1prioS-0007hj-Aj
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682529614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4+j+3mR83+Lc+omK9h5X3QZqL+dgWshqZnoHyNReBew=;
 b=afpvz4OrQr62757+Z+9wtwGp+I+PoL24Jntck5rgKbnk7ZsfLMjO/whX0sZm+zAJpfJLv8
 P/ArvvnBuPbhMajuHS4BsQQEhsQXLheTlqyRkgctwAWL8MY8BK4FPlRyoGpOI0VF636cPy
 UrM6cRv8ZPJ8/y3o/8rII6oORYaPP4c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-iFalyfFQNXy4rrOx0qpxSg-1; Wed, 26 Apr 2023 13:20:12 -0400
X-MC-Unique: iFalyfFQNXy4rrOx0qpxSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AA7418A6461;
 Wed, 26 Apr 2023 17:20:12 +0000 (UTC)
Received: from pinwheel (unknown [10.39.192.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15AF32027043;
 Wed, 26 Apr 2023 17:20:10 +0000 (UTC)
Date: Wed, 26 Apr 2023 19:20:08 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, mst@redhat.com,
 anisinha@redhat.com, jusual@redhat.com
Subject: Re: [PATCH v4] acpi: pcihp: allow repeating hot-unplug requests
Message-ID: <ZEldKCEgmDA7Hmdx@pinwheel>
References: <20230418090449.2155757-1-imammedo@redhat.com>
 <eaff7481-48ab-14f4-330b-e2d84dd72855@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eaff7481-48ab-14f4-330b-e2d84dd72855@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Apr 26, 2023 at 07:40:02PM +0300, Michael Tokarev wrote:
> 18.04.2023 12:04, Igor Mammedov wrote:
> > with Q35 using ACPI PCI hotplug by default, user's request to unplug
> > device is ignored when it's issued before guest OS has been booted.
> > And any additional attempt to request device hot-unplug afterwards
> > results in following error:
> > 
> >    "Device XYZ is already in the process of unplug"
> > 
> > arguably it can be considered as a regression introduced by [2],
> > before which it was possible to issue unplug request multiple
> > times.
> 
> Stable-8.0 material?

FWIW, I'd say, yes. This fix is useful for stable releases.  As this
solves a real problem for upper-management tools.

I have tested this fix; and it works.  I'll post my testing notes /
reproducer in a follow-up email.  In short, I followed the
reproducer steps from here[1].

[1] https://gitlab.com/libvirt/libvirt/-/issues/309


-- 
/kashyap


