Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8742E476EFF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:39:32 +0100 (CET)
Received: from localhost ([::1]:33318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoAd-00084o-DR
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:39:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mxo8p-0007Eh-4w
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:37:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mxo8m-000784-DV
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:37:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639651054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/xtYGoi/6QZ2BwebEA5o/6ca0wUXkctBNwtEjbtDenM=;
 b=huOOx86Kptb7SAcdJQPKO0kQly7HCCOwrzm27vFpdkmqshsLgO5TIahPWCr1WEI4TgBCH5
 nFGAwAOSRFG65DNtPNcgtNzXsBOycwMbO13C88PaaY6hyLdqqUXLYC7BUwmlXfzuT1YK11
 I24ZzJyP6/coMXktssDXJmJZ37CpNbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-PswgWc6_NYqdGxSD9mlwWQ-1; Thu, 16 Dec 2021 05:37:33 -0500
X-MC-Unique: PswgWc6_NYqdGxSD9mlwWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 456F4802C8F;
 Thu, 16 Dec 2021 10:37:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2EFF92A7F;
 Thu, 16 Dec 2021 10:37:05 +0000 (UTC)
Date: Thu, 16 Dec 2021 11:37:04 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [RFC PATCH 0/6] Removal of Aiocontext lock and usage of subtree
 drains in aborted transactions
Message-ID: <YbsW0C2N8xUd3Lsk@redhat.com>
References: <20211213104014.69858-1-eesposit@redhat.com>
 <YbdeS/q3L1mBmEyT@stefanha-x1.localdomain>
 <5fe9120f-04d7-0cfa-36b0-33c9f1680809@redhat.com>
 <3b8029b1-8c24-4495-4433-a4dd19d3b28b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3b8029b1-8c24-4495-4433-a4dd19d3b28b@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.12.2021 um 13:34 hat Hanna Reitz geschrieben:
> On 14.12.21 19:10, Emanuele Giuseppe Esposito wrote:
> > 
> > 
> > On 13/12/2021 15:52, Stefan Hajnoczi wrote:
> > > Off-topic: I don't understand the difference between the effects of
> > > bdrv_drained_begin() and bdrv_subtree_drained_begin(). Both call
> > > aio_disable_external(aio_context) and aio_poll(). bdrv_drained_begin()
> > > only polls parents and itself, while bdrv_subtree_drained_begin() also
> > > polls children. But why does that distinction matter? I wouldn't know
> > > when to use one over the other.
> > 
> > Good point. Now I am wondering the same, so it would be great if anyone
> > could clarify it.
> 
> As far as I understand, bdrv_drained_begin() is used to drain and stop
> requests on a single BDS, whereas bdrv_subtree_drained_begin() drains the
> BDS and all of its children.  So when you don’t care about lingering
> requests in child nodes, then bdrv_drained_begin() suffices.

Right. This is different in practice when a child node has multiple
parents. Usually, when you want to quiesce one parent, the other parent
can keep using the child without being in the way.

For example, two qcow2 overlays based on a single template:

    vda             vdb
     |               |
     v               v
   qcow2           qcow2
(vda.qcow2)     (vdb.qcow2)
     |               |
     +-----+   +-----+
           |   |
           v   v
           qcow2
      (template.qcow2)

If you drain vdb.qcow2 because you want to safely modify something in
its BlockDriverState, there is nothing that should stop vda.qcow2 from
processing requests.

If you're not sure which one to use, bdrv_drained_begin() is what you
want. If you want bdrv_subtree_drained_begin(), you'll know. (It's
currently only used by reopen and by drop_intermediates, which both
operate on more than one node.)

Kevin


