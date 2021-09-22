Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEB4414841
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 13:57:58 +0200 (CEST)
Received: from localhost ([::1]:48414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT0sv-0006CD-NG
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 07:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mT0rw-0005My-Mp
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 07:56:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mT0rs-0003W8-VM
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 07:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632311810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nia9fum0x+rofU9L3I4VLHCSy69E7+hqzEv3NZJZW4U=;
 b=LGY98bkdcqCYAwElNSU08oeDAJxdC3oushztLICqrOSddeKI0BelXiKIgIP0QTHzEF3oWK
 nhNgNka8EIRc8uxKfjBmDkgv/+m53oTVFsy+yGOm7sqE3gRB7bOQXtdEqaEoeFa4Nv9JQV
 L0ctzOgWTCYxLMBsB4ewld/WEAjvcFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-mBc6Ltz3OzCnyRcNxQXwtw-1; Wed, 22 Sep 2021 07:56:49 -0400
X-MC-Unique: mBc6Ltz3OzCnyRcNxQXwtw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 987E8BBF16;
 Wed, 22 Sep 2021 11:56:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BA335D9DD;
 Wed, 22 Sep 2021 11:56:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 08D62113865F; Wed, 22 Sep 2021 13:56:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: david@gibson.dropbear.id.au
Subject: Re: [PATCH v7 0/7] DEVICE_UNPLUG_GUEST_ERROR QAPI event
References: <20210825004835.472919-1-danielhb413@gmail.com>
Date: Wed, 22 Sep 2021 13:56:47 +0200
In-Reply-To: <20210825004835.472919-1-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Tue, 24 Aug 2021 21:48:28 -0300")
Message-ID: <874kac258g.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: armbru@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not yet merged.  David, would you like to do the pull request?


