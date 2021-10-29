Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722A643FD4E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 15:26:13 +0200 (CEST)
Received: from localhost ([::1]:42150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgRtc-0005pI-35
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 09:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mgRr9-0003wv-BU
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 09:23:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mgRr5-00045P-JG
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 09:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635513813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ymZIPVWB7rlLQhIE0bXPQD+Oi072OSnFOlPU3BTE1cw=;
 b=CVmbNxD8EwCDRs0bVaHW/wu7EIdH82Q64hnROlgIvyAv3IgpUv7Dbsr1sKYaLLERt9SczN
 /b3KjhG/AnZ2Y4ZiuY+Q8lMHNKh/m28NdIzEuH8v9tI99Y0tZHAXiLyjIqjo1N8Eyx1maH
 QzvU1eGcoutwAJN8fw9j0ZZrrc9WNCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-KUfv1dAJO7OrKHh6EnPBqA-1; Fri, 29 Oct 2021 09:23:30 -0400
X-MC-Unique: KUfv1dAJO7OrKHh6EnPBqA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05074BBEE6;
 Fri, 29 Oct 2021 13:23:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0333260C13;
 Fri, 29 Oct 2021 13:22:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8DECE11380A7; Fri, 29 Oct 2021 15:22:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 5/9] qapi: Generalize struct member policy checking
References: <20211028102520.747396-1-armbru@redhat.com>
 <20211028102520.747396-6-armbru@redhat.com>
 <87tuh0t8n2.fsf@secure.mitica>
Date: Fri, 29 Oct 2021 15:22:52 +0200
In-Reply-To: <87tuh0t8n2.fsf@secure.mitica> (Juan Quintela's message of "Fri, 
 29 Oct 2021 12:42:09 +0200")
Message-ID: <87zgqsdkyb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, kchamart@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, philmd@redhat.com,
 mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Juan Quintela <quintela@redhat.com> writes:

> Markus Armbruster <armbru@redhat.com> wrote:
>> The generated visitor functions call visit_deprecated_accept() and
>> visit_deprecated() when visiting a struct member with special feature
>> flag 'deprecated'.  This makes the feature flag visible to the actual
>> visitors.  I want to make feature flag 'unstable' visible there as
>> well, so I can add policy for it.
>>
>> To let me make it visible, replace these functions by
>> visit_policy_reject() and visit_policy_skip(), which take the member's
>> special features as an argument.  Note that the new functions have the
>> opposite sense, i.e. the return value flips.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> Reversing accept/reject make things "interesting" for a review point of view.

Sorry about that.

>> + * @special_features is the member's special features encoded as a
>> + * bitset of QapiSpecialFeature.
>
> Just to nitty pick, if you rename the variable to features, does the
> sentece is clearer?

Not to me, I'm afraid...

Thanks!


