Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F155654C34
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 06:28:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8aaU-0002XX-6a; Fri, 23 Dec 2022 00:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8aaS-0002XN-P0
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 00:27:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8aaQ-0000eY-Uh
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 00:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671773233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vDsQoRkOyah5PTp5fdGZ4KZm5TdzBTKRsuaU13w7wuM=;
 b=BXLp7EKJDcg+e9+ZC6uN27OSb01xXHB/T8SqtmUAqOUrlV0Sy4wvIUXulGcl6/NaV0CJp/
 HtfyeXsGtw7l++DjAp3rfqRYpxO/cNqG9d/LS/fs1/lkNy1yGUWIwOEQrXOivZWsUWa3ks
 2DXBchhCkj4JRu2/D0sBwaO2Fv4zae8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-KmXldXtQNMmvj5ukV-n2vg-1; Fri, 23 Dec 2022 00:27:09 -0500
X-MC-Unique: KmXldXtQNMmvj5ukV-n2vg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBECF1875041;
 Fri, 23 Dec 2022 05:27:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 922F6492B00;
 Fri, 23 Dec 2022 05:27:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 714FD21E691D; Fri, 23 Dec 2022 06:27:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>,  qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com,  jonathan.cameron@huawei.com, philmd@linaro.org
Subject: Re: [PATCH v2 0/7] include/hw/pci include/hw/cxl: Clean up includes
References: <20221222100330.380143-1-armbru@redhat.com>
 <B98EF322-5449-4942-8718-D3504B863B96@gmail.com>
 <87edsremti.fsf@pond.sub.org>
 <20221222142149-mutt-send-email-mst@kernel.org>
Date: Fri, 23 Dec 2022 06:27:07 +0100
In-Reply-To: <20221222142149-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Thu, 22 Dec 2022 14:22:39 -0500")
Message-ID: <87k02i7kr8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Thu, Dec 22, 2022 at 11:48:25AM +0100, Markus Armbruster wrote:
>> Bernhard Beschow <shentey@gmail.com> writes:
>> 
>> > Am 22. Dezember 2022 10:03:23 UTC schrieb Markus Armbruster <armbru@redhat.com>:
>> >>Back in 2016, we discussed[1] rules for headers, and these were
>> >>generally liked:
>> >>
>> >>1. Have a carefully curated header that's included everywhere first.  We
>> >>   got that already thanks to Peter: osdep.h.
>> >>
>> >>2. Headers should normally include everything they need beyond osdep.h.
>> >>   If exceptions are needed for some reason, they must be documented in
>> >>   the header.  If all that's needed from a header is typedefs, put
>> >>   those into qemu/typedefs.h instead of including the header.
>> >>
>> >>3. Cyclic inclusion is forbidden.
>> >
>> > Sounds like these -- useful and sane -- rules belong in QEMU's coding style. What about putting them there for easy reference?
>> 
>> Makes sense.  I'll see what I can do.  Thanks!
>
> It would be even better if there was e.g. a make target
> pulling in each header and making sure it's self consistent and
> no circularity. We could run it e.g. in CI.

Yes, that would be nice, but the problem I've been unable to crack is
deciding whether a header is supposed to compile target-independently or
not.  In my manual testing, I use trial and error: if it fails to
compile target-independently, compile for all targets.  This is s-l-o-w.

The other problem, of course, is coding it up in Meson.  I haven't even
tried.


