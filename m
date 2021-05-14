Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2697380E5F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:45:02 +0200 (CEST)
Received: from localhost ([::1]:51454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhavt-00021b-UG
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhabz-0007S4-4x
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:24:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhabt-0007A8-VQ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621009460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GBNsBmEnSeLcwvZ4fYqY3TeNNuL1oXEFOfsExyfi7pk=;
 b=LhU3Glf12LSwLFx7uZ8QQq5HqEVIoJo9ggVF3RWn7LUb37zfRvE42uRUvUYMSQ2aBXOBut
 WCeMZ7sKIC7PfR0AwVe8EIOO4eksgRQ9RHqxmUDIrCNW8bozGcEaTRLyrbQ410duA7iVpb
 JkJkE1j8AUcAT2BvH/rhkZhb3d0eFdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-GrThUNTlNIu0Mb5hL3sWiQ-1; Fri, 14 May 2021 12:24:18 -0400
X-MC-Unique: GrThUNTlNIu0Mb5hL3sWiQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4138A800D55;
 Fri, 14 May 2021 16:24:17 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-116.ams2.redhat.com [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 008C861156;
 Fri, 14 May 2021 16:24:12 +0000 (UTC)
Date: Fri, 14 May 2021 18:24:11 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/6] vhost-user-blk: Error handling fixes during
 initialistion
Message-ID: <YJ6kKzBxComwpJ+G@merkur.fritz.box>
References: <20210429171316.162022-1-kwolf@redhat.com>
 <20210514082025-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210514082025-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: den-plotnikov@yandex-team.ru, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.05.2021 um 14:20 hat Michael S. Tsirkin geschrieben:
> On Thu, Apr 29, 2021 at 07:13:10PM +0200, Kevin Wolf wrote:
> > vhost-user-blk neglects for several properties to check whether the
> > configured value is even compatible with the backend. This results
> > sometimes in crashes because of buggy error handling code, and sometimes
> > in devices that are presented differently to the guest than the backend
> > would expect and that don't work properly therefore.
> > 
> > This series fixes some of these bugs.
> 
> OK so where is this going? Kevin you said you will merge?
> If so
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Thanks, Michael. I've applied it to my block tree and am preparing a
pull request now.

Kevin


