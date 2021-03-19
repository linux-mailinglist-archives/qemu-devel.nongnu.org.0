Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFCE3418ED
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 10:57:25 +0100 (CET)
Received: from localhost ([::1]:54200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNBsi-0000vk-6Q
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 05:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNBqR-0000Gp-Fg
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:55:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNBqP-0006SW-19
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:55:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616147698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=se2s0NJAMuTQv12+p971FKb8mqkaQmxbtGRs3ruVda4=;
 b=aMpfvyjy8nt5JHQo0k1SaeayHAO2XSyCWxk6SqLYpJyT67RQ1A/SjFZlhv8DhP8Xa/LLnC
 CEcy+9NnVY1/yaU2DJSA7UDiAGjXiFHyiomoW3o+1m58GOd5SO/L/xsugC0MJQFTSra9q7
 QTc4QdubY6eOQzfz56eTe6/FQWK+2XY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-XQj1UfDsOq2TeVmxSaMjow-1; Fri, 19 Mar 2021 05:54:57 -0400
X-MC-Unique: XQj1UfDsOq2TeVmxSaMjow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95AE3100747F;
 Fri, 19 Mar 2021 09:54:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A3285D9C6;
 Fri, 19 Mar 2021 09:54:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B395611386A7; Fri, 19 Mar 2021 10:54:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/2] floppy: add a regression test for CVE-2020-25741
References: <20200827113806.1850687-1-ppandit@redhat.com>
 <20210319050906.14875-1-alxndr@bu.edu>
 <87lfajsn7w.fsf@dusky.pond.sub.org>
 <5a572879-02d6-d525-627c-892bd3903c25@redhat.com>
Date: Fri, 19 Mar 2021 10:54:53 +0100
In-Reply-To: <5a572879-02d6-d525-627c-892bd3903c25@redhat.com> (Paolo
 Bonzini's message of "Fri, 19 Mar 2021 10:26:52 +0100")
Message-ID: <87v99nmpsi.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, Li Qiang <liq3ea@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 19/03/21 06:53, Markus Armbruster wrote:
>> I guess this is a reproducer.  Please also describe actual and expected
>> result.  Same for PATCH 2.
>
> Isn't it in the patch itself?

A commit message should tell me what the patch is trying to accomplish.

This commit message's title tells me it's a test for a CVE.  Okay.  The
body additionally gives me the reproducer.  To be useful, a reproducer
needs to come with actual and expected result.  Yes, I can find those in
the patch.  But I could find the reproducer there, too.  If you're nice
enough to save me the trouble of digging through the patch for the
reproducer (thanks), please consider saving me the trouble digging for
the information I need to make use of it (thanks again).  That's all :)

[...]


