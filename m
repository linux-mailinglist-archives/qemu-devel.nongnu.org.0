Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E014477149
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 13:04:19 +0100 (CET)
Received: from localhost ([::1]:48928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxpUg-00043O-0A
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 07:04:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mxpRG-000352-73
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:00:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mxpR3-000436-WD
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:00:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639656033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=193y8l17E6ts7z288W7ZeP7aPodFlQ4NP71M6enigMc=;
 b=SkI/IiUe9e1rQfSP4AtFSWZYt06wMWpFxYw/tP5/kvsb3d80LCSeFhB4Qcdkt4vSB2UWCR
 1LTwRXxlaLQROQNF0TcKM51yz0LovEKvr6N6CnQRGw9ce/qfvTyydLgeKplwQLu5ZOsXoK
 nFxax1SzmLx61Q9LBM8NQQffLqu1Y6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-upoABLgMMcWlJg39Bm_lig-1; Thu, 16 Dec 2021 07:00:30 -0500
X-MC-Unique: upoABLgMMcWlJg39Bm_lig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73C07101796A;
 Thu, 16 Dec 2021 12:00:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C69A97EA23;
 Thu, 16 Dec 2021 12:00:27 +0000 (UTC)
Date: Thu, 16 Dec 2021 13:00:26 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v3 0/3] block: minor refactoring in preparation to the
 block layer API split
Message-ID: <YbsqWsHdSHmq2r9w@redhat.com>
References: <20211215121140.456939-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215121140.456939-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.12.2021 um 13:11 hat Emanuele Giuseppe Esposito geschrieben:
> These patches are taken from my old patches and feedback of
> my series "block layer: split block APIs in global state and I/O".
> 
> The reason for a separate series is that the original one is
> already too long, and these patches are just refactoring the code,
> mainly deleting or moving functions in blockdev.h and block_int.h.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Thanks, applied to the block branch.

Kevin


