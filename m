Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56E336CD08
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 22:47:31 +0200 (CEST)
Received: from localhost ([::1]:42516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbUcE-0002Yg-JR
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 16:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbUaU-0001fU-48
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 16:45:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbUaP-0003mk-M3
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 16:45:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619556334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a77rvEeG0v4olGBLE2EewwZ4PTlF58o0qSCHwg2eQ+Q=;
 b=h8SSnRfzBoCB3v6bwmGT6nof1E1CcLVsQcfBKJGh33NB31uSIZ6bI7TmeaoFnECP2p/rDI
 Cg7QkzrSnWRhWr/Wk2NeX+ax9Jy3LAlcQ6mIyWnme1MRh4OMUKY2U6irnTA1aJVOJcKjdN
 Kwasj25YfQv7l8zOd/HmpfGmOXjld00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-3KO_LxO-NOW8hQpq29o7Xw-1; Tue, 27 Apr 2021 16:45:32 -0400
X-MC-Unique: 3KO_LxO-NOW8hQpq29o7Xw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A719801AD9;
 Tue, 27 Apr 2021 20:45:31 +0000 (UTC)
Received: from localhost (ovpn-116-230.rdu2.redhat.com [10.10.116.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6AA250EDF;
 Tue, 27 Apr 2021 20:45:30 +0000 (UTC)
Date: Tue, 27 Apr 2021 16:45:30 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Subject: Re: [PATCH] vmbus: Don't make QOM property registration conditional
Message-ID: <20210427204530.yxfcmuzrzp7u723v@habkost.net>
References: <20201009200701.1830060-1-ehabkost@redhat.com>
 <4caca0ac-f3a0-bf45-c3d8-7b8c3ec18857@oracle.com>
 <20201009213336.GJ7303@habkost.net>
 <4de9310f-7627-7440-7fcb-23dc2a0f7441@oracle.com>
 <12b52998-d818-5d2a-691b-5bd9135a8042@oracle.com>
MIME-Version: 1.0
In-Reply-To: <12b52998-d818-5d2a-691b-5bd9135a8042@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Roman Kagan <rkagan@virtuozzo.com>,
 Jon Doron <arilou@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 25, 2021 at 02:21:38PM +0200, Maciej S. Szmigiero wrote:
> On 11.10.2020 01:30, Maciej S. Szmigiero wrote:
> > On 09.10.2020 23:33, Eduardo Habkost wrote:
> > > On Fri, Oct 09, 2020 at 11:05:47PM +0200, Maciej S. Szmigiero wrote:
> > > > On 09.10.2020 22:07, Eduardo Habkost wrote:
> > > > > Having properties registered conditionally makes QOM type
> > > > > introspection difficult.  Instead of skipping registration of the
> > > > > "instanceid" property, always register the property but validate
> > > > > its value against the instance id required by the class.
> > > > > 
> > > > > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > > > > ---
> > > > > Note: due to the lack of concrete vmbus-dev subclasses in the
> > > > > QEMU tree, this patch couldn't be tested.
> > > > 
> > > > Will test it tomorrow since I have a VMBus device implementation.
> > > 
> > > Thanks!
> > > 
> > 
> > Tested the patch with a hv-balloon device and is seems to work okay, so:
> > Acked-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> > 
> 
> I see this patch wasn't picked up - it still makes sense and applies
> cleanly to the current git, so I think it should be picked up.

I'm queueing it for 6.1, thanks for the reminder!

-- 
Eduardo


