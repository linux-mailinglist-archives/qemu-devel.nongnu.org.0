Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F200F417690
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:08:10 +0200 (CEST)
Received: from localhost ([::1]:50486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTls1-00048E-J1
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mTloI-0000Kg-HJ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:04:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mTloG-0001vl-Ab
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632492255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UkvJrZCnBAjuwr1K+/LflFTdcaq7kGVWU4rMC6gIzzs=;
 b=P2Ar2QqMZfcEfkDgfSZ6/Lu7kjgUC6ZB9pHsgwzqFytj/HvOvSNgJfPwmUk9y2oWhF4gyf
 y5znqBbhcaIEPEO0m5vA+L/yeARVFL8tpKpjiNbjiY1vaMwY3Jdd1yVX5rG2meKlD2v+pk
 u+O4X5q2D6LMUGzawMl2u4u5Se9bPpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-Dmt4ylftNJ-aziab6xmbWA-1; Fri, 24 Sep 2021 10:04:13 -0400
X-MC-Unique: Dmt4ylftNJ-aziab6xmbWA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B9621084685;
 Fri, 24 Sep 2021 14:04:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A96169320;
 Fri, 24 Sep 2021 14:04:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EE7C5113865F; Fri, 24 Sep 2021 16:04:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 01/11] qom: Reduce use of error_propagate()
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-2-kwolf@redhat.com>
Date: Fri, 24 Sep 2021 16:04:10 +0200
In-Reply-To: <20210924090427.9218-2-kwolf@redhat.com> (Kevin Wolf's message of
 "Fri, 24 Sep 2021 11:04:17 +0200")
Message-ID: <875yuqoysl.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> ERRP_GUARD() makes debugging easier by making sure that &error_abort
> still fails at the real origin of the error instead of
> error_propagate().
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Yes.

The code you patch uses error_propagate() to work around functions not
returning distinct error values.  error.h's big comment recommends such
return values, but recommendations don't update code, patches do.

Until then, ERRP_GUARD() is clearly a better crutch than
error_propagate().

Reviewed-by: Markus Armbruster <armbru@redhat.com>


