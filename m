Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCA2443F75
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 10:35:32 +0100 (CET)
Received: from localhost ([::1]:51278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miCg7-0006ad-JD
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 05:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miCej-0005rG-AW
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 05:34:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miCef-0005YN-CU
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 05:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635932040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w3IZoDyovYRNCDoKn8q99xvXenBFOOazuwFAdpiJVOY=;
 b=Mwty0t4gg1Kh5VzmgKjQvT8mINvChVJamV2Jye3PleByglH6KS9s7D6QANXE033ymiXOjY
 vJOQgUeqOwtiqV/tZ6ljaxOCdg4pG0KfSEAoImVs8MotP6+CGcJrGIKy6+wgjJnUW/ocOZ
 71WXKzDdRVNQTNXxts9ATF3gPXsBKUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-SCsPsyRhMbO7eFBqct2mfA-1; Wed, 03 Nov 2021 05:33:51 -0400
X-MC-Unique: SCsPsyRhMbO7eFBqct2mfA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E989113967BD;
 Wed,  3 Nov 2021 09:33:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4D975C1C5;
 Wed,  3 Nov 2021 09:33:42 +0000 (UTC)
Date: Wed, 3 Nov 2021 10:33:41 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] qdev-monitor: Fix use after free on duplicate device ID
 error
Message-ID: <YYJXddA/gDbtR0Zf@redhat.com>
References: <20211103073848.1459138-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211103073848.1459138-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: damien.hedde@greensocs.com, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.11.2021 um 08:38 hat Markus Armbruster geschrieben:
> Fixes: 4a1d937796de0fecd8b22d7dbebf87f38e8282fd
> Reported-by: Coverity CID 1465223
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Stefan already sent a patch yesterday:

https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00759.html
Message-Id: <20211102163342.31162-1-stefanha@redhat.com>

Kevin


