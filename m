Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D624434E7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 18:53:36 +0100 (CET)
Received: from localhost ([::1]:41252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhxyZ-0004YG-5n
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 13:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhxxV-0003CI-I8
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:52:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhxxT-00068N-Fw
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635875546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BMamS7gJ5gQ0+cfP1XJh/T2aBbHKsN1Bj+Oid6LqpxY=;
 b=Ux326UW95FYft5PPFuoAKkRLioNGPMwUXtoYcKSnohPgVEOPO54SvrIdddnzmkJgU4hkTK
 s6EVBdxUR2B10jQF09f3Cso+OL25pMlougehA9Kk3BmSffvHqUwPDY0ip0nnqmsnby9GaX
 0GLUwXCGl/dLG3ttU7KNI7FrpAhdTPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-C5fKbMRCOuCOHWBle-Da1g-1; Tue, 02 Nov 2021 13:52:24 -0400
X-MC-Unique: C5fKbMRCOuCOHWBle-Da1g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF363100B700;
 Tue,  2 Nov 2021 17:52:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4792219D9F;
 Tue,  2 Nov 2021 17:52:02 +0000 (UTC)
Date: Tue, 2 Nov 2021 18:52:00 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] softmmu/qdev-monitor: fix use-after-free in qdev_set_id()
Message-ID: <YYF6wINW6RzhtmjJ@redhat.com>
References: <20211102163342.31162-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211102163342.31162-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.11.2021 um 17:33 hat Stefan Hajnoczi geschrieben:
> Reported by Coverity (CID 1465222).
> 
> Fixes: 4a1d937796de0fecd8b22d7dbebf87f38e8282fd ("softmmu/qdev-monitor: add error handling in qdev_set_id")
> Cc: Damien Hedde <damien.hedde@greensocs.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Oops, this is an embarrassing one. Sorry, my fault, not Damien's.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


