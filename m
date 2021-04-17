Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1238C362FC4
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 14:11:36 +0200 (CEST)
Received: from localhost ([::1]:49122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXjnS-000828-Lf
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 08:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXjmM-0007YN-P6
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 08:10:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXjmK-00041Q-76
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 08:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618661423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CDjfA2L1kB1EwmuLdopJ9PTmumhyP62x3ppOgN0Gl7I=;
 b=Us41cF7vTppIx5Cp0ZfgtTwsWJEMwTl5lwodoosp83iLlHXxQrzg9GrC+OxUTwtWmz6d8a
 R0mhKfPW7gGSIqKS//VR+yDXxPVk+A3F6lz8LBjeYzW+utLO7Ls8BEhGUokb0iNySGIQjf
 wPgJ7Ar/zlobmUcJRKWhZEP2jlNsjFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-2FTzPnB-MtuBsjjHwF9KpA-1; Sat, 17 Apr 2021 08:10:21 -0400
X-MC-Unique: 2FTzPnB-MtuBsjjHwF9KpA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B78E8030A1;
 Sat, 17 Apr 2021 12:10:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19D0760C0F;
 Sat, 17 Apr 2021 12:10:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 96FED113525D; Sat, 17 Apr 2021 14:10:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 4/8] qapi/error: Change assertion
References: <20210330171844.1197918-1-jsnow@redhat.com>
 <20210330171844.1197918-5-jsnow@redhat.com>
 <e760661b-0c3f-bb9b-0b4d-6c5ff77cfd70@redhat.com>
 <87blagghg5.fsf@dusky.pond.sub.org>
 <7436de5c-afda-160a-068d-18bed05a6a68@redhat.com>
 <87eefarbwl.fsf@dusky.pond.sub.org>
 <95994cdf-7e6b-6d76-578d-c7da27422cbc@redhat.com>
Date: Sat, 17 Apr 2021 14:10:18 +0200
In-Reply-To: <95994cdf-7e6b-6d76-578d-c7da27422cbc@redhat.com> (John Snow's
 message of "Fri, 16 Apr 2021 14:24:23 -0400")
Message-ID: <87mttxyuvp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

[...]

> (Random aside on patch submission process: I do dislike how when I
> change the topic of a commit, I lose out on git-backport-diff 
> functionality. I wish I had a persistent ID for commits that survived
> beyond title changes. Sometimes I debate scripting adding some kind of 
> Patch-GUID: <...> tag, but I don't know if that would look like
> undesirable clutter in the git log to everyone else. Maybe a "WAS: 
> old-topic-name-here" in the comment section would suffice well enough?)

Have you tried git-range-diff?


