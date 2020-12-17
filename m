Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1392DCCD5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 08:13:36 +0100 (CET)
Received: from localhost ([::1]:54060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpnTi-0002LS-Jw
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 02:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpnQe-0001fc-Ol
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 02:10:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpnQc-0006LL-0A
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 02:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608189019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2IfY95yWWMjbyQAPJcp9ThBtxc3qCAWihhoNbjITY/E=;
 b=glfkMq0gxyuGgW+61gz24iloS2JCt88D0ODNYz0EyEP925ZmwZ6fuMDF4t0rnzOiZBNFAb
 6qSx9VmQ2YFssoxFGVsz7JgpFT9N582Hvw4/IlyqxBxarRNLgFM6ICCAuG54Fzdd+tYZBT
 V/UoB/LKMEDqoFWiWxMUlayLP6PiOfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-rsJQLsHHOr-ZjzUBc6cTow-1; Thu, 17 Dec 2020 02:10:18 -0500
X-MC-Unique: rsJQLsHHOr-ZjzUBc6cTow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1DCD15722;
 Thu, 17 Dec 2020 07:10:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6E1C10013C0;
 Thu, 17 Dec 2020 07:10:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3C67311329A5; Thu, 17 Dec 2020 08:10:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 16/20] migration: Replace migration's JSON writer by the
 general one
References: <20201211171152.146877-1-armbru@redhat.com>
 <20201211171152.146877-17-armbru@redhat.com>
 <20201216194615.GG3008@work-vm>
Date: Thu, 17 Dec 2020 08:10:15 +0100
In-Reply-To: <20201216194615.GG3008@work-vm> (David Alan Gilbert's message of
 "Wed, 16 Dec 2020 19:46:15 +0000")
Message-ID: <873604nc14.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com, agraf@csgraf.de,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> Commit 8118f0950f "migration: Append JSON description of migration
>> stream" needs a JSON writer.  The existing qobject_to_json() wasn't a
>> good fit, because it requires building a QObject to convert.  Instead,
>> migration got its very own JSON writer, in commit 190c882ce2 "QJSON:
>> Add JSON writer".  It tacitly limits numbers to int64_t, and strings
>> contents to characters that don't need escaping, unlike
>> qobject_to_json().
>> 
>> The previous commit factored the JSON writer out of qobject_to_json().
>> Replace migration's JSON writer by it.
>> 
>> Cc: Juan Quintela <quintela@redhat.com>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> (Copying in Alex)
>
> This looks OK to me, so:
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> but, can I just check, have you checked scripts/analyze-migration.py is
> still happy with the output?

Good point.  I just did, following instructions in
docs/devel/migration.rst.  It prints stuff and succeeds.  Anything else
you'd like me to try?


