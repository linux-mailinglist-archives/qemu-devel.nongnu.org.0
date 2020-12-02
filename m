Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583EB2CC05C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:11:21 +0100 (CET)
Received: from localhost ([::1]:58038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkTmq-00058e-C8
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kkTkZ-0004E8-Nx
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:08:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kkTkV-0001ES-Uv
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:08:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606921734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5oiSz1FdiEWfPYpW62KUTCkBHrY94l2TzLzwg++G0Us=;
 b=h05I9RBMUnk+YgiduNbIKbjfUWyJt1oSVWPcpzXsm2I+fJvSLwwDaG+99AVoROayOYSMQH
 JNgeWu9lV7utfjVxXMRXCqZhh1kSX97dSBlN5OxoXVuWFEtFBV8Z5giKp9Ndl9sUUzd4mn
 jkAonWKgK2B3D2h94KzmIcuIHP3N/kc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-xSqLMpSHOnqq2yaK1Nba_Q-1; Wed, 02 Dec 2020 10:08:51 -0500
X-MC-Unique: xSqLMpSHOnqq2yaK1Nba_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1EB5858189
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 15:08:49 +0000 (UTC)
Received: from work-vm (unknown [10.33.36.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1715060C17;
 Wed,  2 Dec 2020 15:08:48 +0000 (UTC)
Date: Wed, 2 Dec 2020 15:08:46 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 24/29] migration, vl: start migration via
 qmp_migrate_incoming
Message-ID: <20201202150846.GG3226@work-vm>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-25-pbonzini@redhat.com>
 <20201120163408.7740a92f@redhat.com>
 <0562d6fa-b619-7dc3-ef94-242a39436cfa@redhat.com>
 <20201202131037.GF3226@work-vm>
 <3a14b300-9288-bfb8-57cd-653ebfd76e66@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3a14b300-9288-bfb8-57cd-653ebfd76e66@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> On 02/12/20 14:10, Dr. David Alan Gilbert wrote:
> > I'm more worried about how this stops a repeated 'migrate incoming'
> > or a 'migrate_incoming' that's issued following a qemu that's been
> > started with -incoming tcp:... but which a socket hasn't yet connected
> > to.
> 
> Good question, fortunately it is simply handled answer:
> 
> void qmp_migrate_incoming(const char *uri, Error **errp)
> {
>     Error *local_err = NULL;
>     static bool once = true;
> 
>     if (!once) {
>         error_setg(errp, "The incoming migration has already been started");
>         return;
>     }
>     if (!runstate_check(RUN_STATE_INMIGRATE)) {
>         error_setg(errp, "'-incoming' was not specified on the command
> line");
>         return;
>     }
> 
>     qemu_start_incoming_migration(uri, &local_err);
> 
>     if (local_err) {
>         error_propagate(errp, local_err);
>         return;
>     }
> 
>     once = false;
> }
> 
> This patch can simplify things because every incoming migrations (no matter
> if '-incoming defer' or '-incoming tcp:...') goes through the
> qmp_migrate_incoming function above.

Yeh I think that's OK.

Dave

> Paolo
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


