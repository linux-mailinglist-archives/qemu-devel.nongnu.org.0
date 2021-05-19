Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C1E389443
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:59:03 +0200 (CEST)
Received: from localhost ([::1]:44416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPXC-0003xN-Mq
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljPGg-0006IO-VP
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:41:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljPGf-00013b-Ca
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621442516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e3W9ePNNIy+/ZCKzTZSWtaXpoa6TPZk1kadVZgOr5cs=;
 b=IXjIcTN5w5uKyUplq4kecPP9fq34qPserVeJ8NvxEhFkdI2TZsdpmDWbc2gFCQx1Rjohin
 9ANghjMF+ehY8dFpBsAgO0VEzYokKZHft2ARPKuiazZ7E4k9u8V7NNmdUIixoohqGpHVm5
 fnWcY4LG1qiiMKcztcvJa8gr3Jp1U4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-LGKEX8lqN1SNy-Y48D0vBA-1; Wed, 19 May 2021 12:41:53 -0400
X-MC-Unique: LGKEX8lqN1SNy-Y48D0vBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A57A101371C;
 Wed, 19 May 2021 16:41:52 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-58.ams2.redhat.com [10.36.115.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5337A60C03;
 Wed, 19 May 2021 16:41:51 +0000 (UTC)
Date: Wed, 19 May 2021 18:41:49 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/3] vl: plug -object back into -readconfig
Message-ID: <YKU/zY2hjRC+ZsUC@merkur.fritz.box>
References: <20210518154014.2999326-1-pbonzini@redhat.com>
 <20210518154059.3002446-3-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210518154059.3002446-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: qemu-stable@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.05.2021 um 17:40 hat Paolo Bonzini geschrieben:
> Commit bc2f4fcb1d ("qom: move user_creatable_add_opts logic to vl.c
> and QAPIfy it", 2021-03-19) switched the creation of objects from
> qemu_opts_foreach to a bespoke QTAILQ in preparation for supporting JSON
> syntax in -object.
> 
> Unfortunately in doing so it lost support for [object] stanzas in
> configuration files and also for "-set object.ID.KEY=VAL".  The latter
> is hard to re-establish and probably best solved by deprecating -set.
> This patch uses the infrastructure introduced by the previous two
> patches in order to parse QOM objects correctly from configuration
> files.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


