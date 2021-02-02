Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD5030C3E7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:35:55 +0100 (CET)
Received: from localhost ([::1]:57992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xic-0000sv-Vr
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:35:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6xUj-0001qn-Dv
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:21:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6xUg-0002ZZ-Tw
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:21:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612279289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/6zeKlic1XXhoTn6tyBVHVh99dqdSWp+A6RlFE0NQgU=;
 b=R4wwfCwW5Sa1EIWAMzOHTgOYBPFYBqsiS4l2T3b9qAIlwGeK/qjEpbEFe3jK2cj1aucQFK
 7cF8gQ9/Vx18jsHruHvPoOOwHZI6E+RhS9mN5SDaTZ7b4ExcscV+XK8fbgyn0sC9f2rPyd
 Aw5CEHbwdmYlKD9LfVa1PDm1vHy8fp4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-au6_5vsCO9O9ZYneknis4Q-1; Tue, 02 Feb 2021 10:21:26 -0500
X-MC-Unique: au6_5vsCO9O9ZYneknis4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48EB7CE662
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 15:21:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AE523828;
 Tue,  2 Feb 2021 15:21:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A4691113865F; Tue,  2 Feb 2021 16:21:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 3/4] migration: Fix cache_init()'s "Failed to
 allocate" error messages
References: <20210202141734.2488076-1-armbru@redhat.com>
 <20210202141734.2488076-4-armbru@redhat.com>
 <00a237bc-0d15-a27b-cd2f-e8dad4cccab3@redhat.com>
Date: Tue, 02 Feb 2021 16:21:23 +0100
In-Reply-To: <00a237bc-0d15-a27b-cd2f-e8dad4cccab3@redhat.com> (Eric Blake's
 message of "Tue, 2 Feb 2021 08:23:07 -0600")
Message-ID: <87wnvq4hsc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: quintela@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 2/2/21 8:17 AM, Markus Armbruster wrote:
>> cache_init() attempts to handle allocation failure..  The two error
>
> The double . looks odd.

Typo.  Perhaps the maintainer can take care of it.

>> messages are garbage, as untested error messages commonly are:
>> 
>>     Parameter 'cache size' expects Failed to allocate cache
>>     Parameter 'cache size' expects Failed to allocate page cache
>> 
>> Fix them to just
>> 
>>     Failed to allocate cache
>>     Failed to allocate page cache
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> ---
>>  migration/page_cache.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>> 


