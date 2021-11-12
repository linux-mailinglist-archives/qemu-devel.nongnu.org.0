Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B9B44E5E3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 13:02:41 +0100 (CET)
Received: from localhost ([::1]:57262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlVGS-00078X-4u
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 07:02:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mlVF5-00060p-45
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 07:01:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mlVF3-0004dS-EQ
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 07:01:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636718472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wTEyPlvdf60rLi3spfcsTgfafm6bE8M9avU8DjZOC/o=;
 b=fBL7MUwJGm1nPRLzqtjQm5AyRhrToCjo7LUUQrbzszmRiG2yVotHOlNCDPcu9iLskonr6f
 uPKSGOafWcz8dA41bhOfavDs/GxOnVfA5Xuowi8S7wyg86RKqmac4WF+GCaOk01JecngcG
 eClQS39JrPUuCkBYOIVPSIB7oiGrNkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-ZyZZhNm_O7yMvFqn07D3SA-1; Fri, 12 Nov 2021 07:01:11 -0500
X-MC-Unique: ZyZZhNm_O7yMvFqn07D3SA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D59E018A0728
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 12:01:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9FD960862;
 Fri, 12 Nov 2021 12:01:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 80A1411380A7; Fri, 12 Nov 2021 13:01:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v5 4/6] migration: Add zerocopy parameter for QMP/HMP
 for Linux
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-5-leobras@redhat.com>
 <87pmr5vdmm.fsf@secure.mitica>
Date: Fri, 12 Nov 2021 13:01:02 +0100
In-Reply-To: <87pmr5vdmm.fsf@secure.mitica> (Juan Quintela's message of "Fri, 
 12 Nov 2021 12:04:33 +0100")
Message-ID: <8735o1h9c1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eric Blake <eblake@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Juan Quintela <quintela@redhat.com> writes:

> Leonardo Bras <leobras@redhat.com> wrote:
>> Add property that allows zerocopy migration of memory pages,
>> and also includes a helper function migrate_use_zerocopy() to check
>> if it's enabled.
>>
>> No code is introduced to actually do the migration, but it allow
>> future implementations to enable/disable this feature.
>>
>> On non-Linux builds this parameter is compiled-out.
>>
>> Signed-off-by: Leonardo Bras <leobras@redhat.com>
>
> Hi
>
>> +# @zerocopy: Controls behavior on sending memory pages on migration.
>> +#            When true, enables a zerocopy mechanism for sending memory
>> +#            pages, if host supports it.
>> +#            Defaults to false. (Since 6.2)
>> +#
>
> This needs to be changed to next release, but not big deal.

Rename to zero-copy while there.  QAPI/QMP strongly prefer separating
words with dashes.  "zerocopy" is not a word, "zero" and "copy" are.

[...]


