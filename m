Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFD64319C2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 14:46:24 +0200 (CEST)
Received: from localhost ([::1]:60748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcS23-0000pP-6w
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 08:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mcRyD-0006ck-BN
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:42:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mcRy9-0000aG-In
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634560939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RxdwJ2enbMozU0U9961nS+0phbvRR7U9PVcQPO9byus=;
 b=UA7clq6KmsyN2FfG7UqWLagYy3knA1T7Ep9vpM7J+q8PVwCawYO2sgRghO/PR2E/d1frYo
 Hs1qTk4GkHmVAEwv50murekaEsLxY2xuDko0btwfVk2F9L6Pi+CmTMfa6PorYjLc41gklR
 Nd2kEPJvR8XllE+OBZ5oZf0zGZPpAbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-E-y0LEDVOpCeFDPvGi8tng-1; Mon, 18 Oct 2021 08:42:18 -0400
X-MC-Unique: E-y0LEDVOpCeFDPvGi8tng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3786C9126D;
 Mon, 18 Oct 2021 12:42:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 625CB101F6D5;
 Mon, 18 Oct 2021 12:42:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AF4DD11380A7; Mon, 18 Oct 2021 14:42:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: regression on s390: was Re: [PULL 37/40] monitor: Tidy up
 find_device_state()
References: <20211013090728.309365-1-pbonzini@redhat.com>
 <20211013090728.309365-38-pbonzini@redhat.com>
 <3d80dc6b-66bd-34f7-8285-48c0647d6238@de.ibm.com>
 <c01b47a1-43e2-71b7-1cdd-9a1d0f685eb3@linaro.org>
 <056a0299-f6f8-9e59-8d2e-db7413210f75@de.ibm.com>
Date: Mon, 18 Oct 2021 14:42:00 +0200
In-Reply-To: <056a0299-f6f8-9e59-8d2e-db7413210f75@de.ibm.com> (Christian
 Borntraeger's message of "Mon, 18 Oct 2021 12:08:56 +0200")
Message-ID: <87czo28pyf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu block <qemu-block@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-s390x <qemu-s390x@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Christian Borntraeger <borntraeger@de.ibm.com> writes:

[...]

> The 2nd thing to do is to fix the regression. Does anyone have an idea what is broken?

I do: "device ID or QOM path" arguments where the device ID contains
'/'.  Undocumented feature, as far as I can tell.  I'll fix it anyway.
Affects device_del, qemu-io, and a number of other monitor commands
related to block devices.


