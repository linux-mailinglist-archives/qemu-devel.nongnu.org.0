Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27164292D9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 17:09:51 +0200 (CEST)
Received: from localhost ([::1]:44198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZww2-0007tS-O1
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 11:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZwuS-000742-8F
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:08:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZwuQ-00053k-3v
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633964888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D8LUXDPw0KBtsMrlqMqqJ11tiqljsydVmifj9urQIu0=;
 b=QSXvRgQRV8LROBNCZ60uV1raTY3aUQZkfSVfsTBrLv/k9GRteG5QEJwtKdqmhYATmJp2dF
 H+GWhAGKY8M0QC633MjKAJdEk9+vqMUgt2ymekXKXQGmIv5gKE/kQx7gjWtlRNRLt7Ho2r
 WYva+jbu16YosC8ygZyxIiv0U3MMcLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-ZwxOLlGvPZGXeRdTudxyYA-1; Mon, 11 Oct 2021 11:08:05 -0400
X-MC-Unique: ZwxOLlGvPZGXeRdTudxyYA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE62810B6CDA;
 Mon, 11 Oct 2021 15:07:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A38355F4FB;
 Mon, 11 Oct 2021 15:07:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E612F113865F; Mon, 11 Oct 2021 17:07:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 04/15] qom: Reduce use of error_propagate()
References: <20211008133442.141332-1-kwolf@redhat.com>
 <20211008133442.141332-5-kwolf@redhat.com>
Date: Mon, 11 Oct 2021 17:07:15 +0200
In-Reply-To: <20211008133442.141332-5-kwolf@redhat.com> (Kevin Wolf's message
 of "Fri, 8 Oct 2021 15:34:31 +0200")
Message-ID: <87ee8rr464.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: damien.hedde@greensocs.com, lvivier@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, libvir-list@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, vsementsov@virtuozzo.com,
 its@irrelevant.dk, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> ERRP_GUARD() makes debugging easier by making sure that &error_abort
> still fails at the real origin of the error instead of
> error_propagate().
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Yes, please!

Reviewed-by: Markus Armbruster <armbru@redhat.com>


