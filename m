Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC9D2B16E8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 09:03:28 +0100 (CET)
Received: from localhost ([::1]:39512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdU3K-0001SS-Qa
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 03:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdU1I-0000iO-CF
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 03:01:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdU1F-00059x-JG
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 03:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605254475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zaOkEEYordvdVGbdCccvw96xn/xRu3TKDHvGFTh2huw=;
 b=QZRjDFSVJqmOJmATl1dVuYtZGMJoSf/dkFkIQ7JlfDt0T1/+OZKsqBl3XIp5+m01ThIiC1
 qzE2iSWQtEPOuN41zMqIG+1M51tOaLgS3l5e75mvEwuVoDM3nSwU9BjApVHamP4w4q+N4V
 RWe2nbYreMI0kHuJcl0nna8Pz/qaxzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-DNbVT0fmNGioHDwwYW9eYA-1; Fri, 13 Nov 2020 03:01:13 -0500
X-MC-Unique: DNbVT0fmNGioHDwwYW9eYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0F1685C715
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 08:01:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A28AE5D9D5;
 Fri, 13 Nov 2020 08:01:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1777311386A0; Fri, 13 Nov 2020 09:01:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/2] char: Skip CLI aliases in query-chardev-backends
References: <20201111130834.33985-1-kwolf@redhat.com>
 <20201111130834.33985-2-kwolf@redhat.com>
 <877dqrkmr5.fsf@dusky.pond.sub.org>
 <20201112105800.GB14604@merkur.fritz.box>
Date: Fri, 13 Nov 2020 09:01:05 +0100
In-Reply-To: <20201112105800.GB14604@merkur.fritz.box> (Kevin Wolf's message
 of "Thu, 12 Nov 2020 11:58:00 +0100")
Message-ID: <878sb5k7ni.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 12.11.2020 um 09:22 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > The aliases "tty" and "parport" are only valid on the command line, QMP
>> > commands like chardev-add don't know them. query-chardev-backends should
>> > describe QMP and therefore not include them in the list of available
>> > backends.
>> >
>> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> 
>> I'd call that a bug.
>
> Which is why I'm fixing it, separate from the deprecation.

Thank you :)

>> In the light of PATCH 2, I propose to put that one first (with the
>> help_string_append() hunk dropped), then remove the aliases from CLI
>> help, too, like this: [...]
>
> Going one step back without thinking in solutions immediately, what
> you're suggesting is that deprecated options should become undocumented
> instead of just annotated as deprecated?

"Should become" is open to debate.  "Have become" is a fact:

    3478eae990 "qemu-options: Deprecate -nodefconfig", 2017-10-09
    80f52a6694 "Deprecate -M command line options", 2011-07-23

and more.

I don't see the why *help* output should mention deprecated options.
It's distracting.  Tell me how to use this thing, not how I could use
it, but really shouldn't.

Mentioning them in the reference manual may have value.

Covering them in deprecated.rst is of course mandatory.


