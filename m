Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E55219E1D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 12:44:58 +0200 (CEST)
Received: from localhost ([::1]:59344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtU2z-0002Fs-5a
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 06:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jtU2H-0001r3-IU
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 06:44:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43854
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jtU2F-00020E-UF
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 06:44:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594291451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yis14YisU5x4HNb8WFQH7xcJgGklH8B3Hss5/8/NyoY=;
 b=irFcnii/YmxnJPknaKGXPc0Tw+6DX5+Afofj4ENzvEKhXTDdp89tOjD2BjT5maDH26iv/m
 u6Wo4Hu9uApraANILIvDZPR5yqi2lJKkPtgsOwF8jxQpNrHVp+mtIvctO7kO3p6knWFDIW
 enEr7PgjumH35ZXtWiCbO4/qDIXEf3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-rwqsfE9GNL6Yk9uTwYiDMw-1; Thu, 09 Jul 2020 06:44:07 -0400
X-MC-Unique: rwqsfE9GNL6Yk9uTwYiDMw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C1691DE1;
 Thu,  9 Jul 2020 10:44:05 +0000 (UTC)
Received: from starship (unknown [10.35.206.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3695060F8D;
 Thu,  9 Jul 2020 10:44:00 +0000 (UTC)
Message-ID: <394d6c7d7ca6008152593e7b592f19a41baf1fee.camel@redhat.com>
Subject: Re: [PATCH v2 7/7] virtio-scsi: use scsi_device_get
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 09 Jul 2020 13:43:58 +0300
In-Reply-To: <20200527155010.GM29137@stefanha-x1.localdomain>
References: <20200511160951.8733-1-mlevitsk@redhat.com>
 <20200511160951.8733-8-mlevitsk@redhat.com>
 <20200527155010.GM29137@stefanha-x1.localdomain>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 01:47:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 "Daniel P. =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2020-05-27 at 16:50 +0100, Stefan Hajnoczi wrote:
> On Mon, May 11, 2020 at 07:09:51PM +0300, Maxim Levitsky wrote:
> > This will help us to avoid the scsi device disappearing
> > after we took a reference to it.
> > 
> > It doesn't by itself forbid case when we try to access
> > an unrealized device
> > 
> > Suggested-by: Stefan Hajnoczi <stefanha@gmail.com>
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  hw/scsi/virtio-scsi.c | 23 +++++++++++++++--------
> >  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> I'm not very familiar with the SCSI emulation code, but this looks
> correct. My understanding of what this patch does:
> 
> This patch keeps SCSIDevice alive between scsi_device_find() and
> scsi_req_new(). Previously no SCSIDevice ref was taken so the device
> could have been freed before scsi_req_new() had a chance to take a ref.
Yep, I also verified now that this is what happens.

> 
> The TMF case is similar: the SCSIDevice ref must be held during
> virtio_scsi_do_tmf(). We don't need to worry about the async cancel
> notifiers because the request being canceled already holds a ref.
This code I understand less to be honest, but in the worst case,
the patch shoudn't make it worse.

Best regards,
	Maxim Levitsky




