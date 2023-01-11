Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50E166633D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 20:05:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFgOm-0002pg-Iq; Wed, 11 Jan 2023 14:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFgOa-0002pT-WE
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 14:04:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFgOZ-0008Gr-Ag
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 14:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673463858;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=kew7Udu+8Xpl7T9ISKZdb4IbDk/nx+F7dQTocKBFIMQ=;
 b=d5o+JDvusMmImy31gObYKEibkgNRssrsHig6T04e8ilP5SrY7LJhdAu3+6Lpytu9cc8T6R
 Z2a8E/r0DhmnvWEYJpA1xadL7TNo+sfqykrEQ7KYrry0ncmb2t875LqfbgOw1wGDwTpJMY
 Ku+nGpnHvYZ5Yng/Gly+1vbKFpDsVjc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-5vSd1wmcM2qZfPoSLgGnYA-1; Wed, 11 Jan 2023 14:04:17 -0500
X-MC-Unique: 5vSd1wmcM2qZfPoSLgGnYA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28C67811E6E;
 Wed, 11 Jan 2023 19:04:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11479492C18;
 Wed, 11 Jan 2023 19:04:13 +0000 (UTC)
Date: Wed, 11 Jan 2023 19:04:11 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Jiang Jiacheng <jiangjiacheng@huawei.com>, jdenemar@redhat.com,
 qemu-devel@nongnu.org, quintela@redhat.com, yubihong@huawei.com,
 xiexiangyou@huawei.com, zhengchuan@huawei.com, linyilu@huawei.com
Subject: Re: [RESEND PATCH 2/2] migration: report multiFd related thread pid
 to libvirt
Message-ID: <Y78IK7KuJ4zalm2p@redhat.com>
References: <20230109121235.2666476-1-jiangjiacheng@huawei.com>
 <20230109121235.2666476-3-jiangjiacheng@huawei.com>
 <Y78HZb0AG55Yp/i/@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y78HZb0AG55Yp/i/@work-vm>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Jan 11, 2023 at 07:00:53PM +0000, Dr. David Alan Gilbert wrote:
> * Jiang Jiacheng via (qemu-devel@nongnu.org) wrote:
> > From: Zheng Chuan <zhengchuan@huawei.com>
> > 
> > Report multiFd related thread pid to libvirt in order to
> > pin multiFd thread to different cpu.
> 
> With multifd you may well want to pin different multifd threads
> to different cores; so you need to include the 'id' and 'name' fields of
> the multifd thread in the event.

Are the 'id' / 'name' fields considered stable API for QEMU ?

IIRC, the mgmt app merely requests the number of multifd threads
and doesn't assign any identifying names/ids to them, unlike
iothreads where the mgmt app gives an explicit 'id'.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


