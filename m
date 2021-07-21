Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330E23D10FB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:16:31 +0200 (CEST)
Received: from localhost ([::1]:55986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6D1S-0003gF-8N
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6Cxn-0008H2-3C
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:12:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6Cxi-0004AD-Ks
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626876757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=posOzCqJU7sK0i3yw5ldXkXgNW7rxwWon4FzRlrpIPw=;
 b=RejKN2AElRVetJUNpvZtxtJLT8q5oFp7XFfU4AKjIpenKQWZ7KRtfAClX6zD/djMRyzRrR
 PQyq+sbLGohH1jN7zQHEOQXg9TdXAbiBoDcRkjLxgDS5fzcMQQ8YI4M+S8ONFoykTw+UoP
 adjfzOKoGFA7xQUmFT1q7oGp4wiw/LE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-LXLEFGXNO-KcMW_BIETKLQ-1; Wed, 21 Jul 2021 10:12:35 -0400
X-MC-Unique: LXLEFGXNO-KcMW_BIETKLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA6DE760C9;
 Wed, 21 Jul 2021 14:12:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D251B5C1BB;
 Wed, 21 Jul 2021 14:12:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5897411326B9; Wed, 21 Jul 2021 16:12:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 07/16] vfio: Avoid error_propagate() after
 migrate_add_blocker()
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-8-armbru@redhat.com>
 <4770fb7e-f1ee-d1cd-cc66-1413ea5e1a12@redhat.com>
Date: Wed, 21 Jul 2021 16:12:29 +0200
In-Reply-To: <4770fb7e-f1ee-d1cd-cc66-1413ea5e1a12@redhat.com> (Paolo
 Bonzini's message of "Wed, 21 Jul 2021 11:26:15 +0200")
Message-ID: <87mtqfah82.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 20/07/21 14:53, Markus Armbruster wrote:
>> When migrate_add_blocker(blocker, &errp) is followed by
>
> Just a nit, &err.

Wll fix, thanks!

> Paolo
>
>> error_propagate(errp, err), we can often just as well do
>> migrate_add_blocker(..., errp).  This is the case in
>> vfio_migration_probe().


