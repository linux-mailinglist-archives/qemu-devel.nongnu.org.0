Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9659363C74
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 09:27:33 +0200 (CEST)
Received: from localhost ([::1]:38936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYOJg-0001XH-PR
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 03:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lYOIP-0000zd-Pd
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 03:26:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lYOIL-0005Tu-Uv
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 03:26:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618817167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B+N9vtv9nBUx85xtxY7/cGjaHyAqLMPYKjQoQUv1KyA=;
 b=G5rhJz0nUqUQa+HwayKdSDdVvkTZs+XA3xw5vltQIhftWeoeWW3AjU++Fzk43zwn99LP1h
 L0iNSKBKi5k7mLMUGYVvjFVCA8tOg/REJZDF7F5IH7KSjdxrEWNi/iMEzpcfDguhLcLGwh
 TSJYrLwOxzG5SVYxId4J6l58TGEa68E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-r6zsgfsGPR-SoU5yRUbDbg-1; Mon, 19 Apr 2021 03:26:05 -0400
X-MC-Unique: r6zsgfsGPR-SoU5yRUbDbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D25471020C21
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:26:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A41D160C5B;
 Mon, 19 Apr 2021 07:26:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 25423113525D; Mon, 19 Apr 2021 09:26:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
References: <20210415154402.28424-1-vkuznets@redhat.com>
 <87sg3p1cf5.fsf@dusky.pond.sub.org>
Date: Mon, 19 Apr 2021 09:26:03 +0200
In-Reply-To: <87sg3p1cf5.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Sat, 17 Apr 2021 11:35:26 +0200")
Message-ID: <87fszmybuc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Vitaly Kuznetsov <vkuznets@redhat.com> writes:
>
>> When a migration blocker is added nothing is reported to the user,
>> inability to migrate such guest may come as a late surprise. As a bare
>> minimum, we can print a warning. To not pollute the output for those, who
>> have no intention to migrate their guests, introduce '--no-migration'
>> option which both block the migration and eliminates warning from
>
> Sure this justifies its own command line option?  Can we make it a
> parameter of an existing option?  We have too many options, and options
> starting "no-" are often awkward.

We already have

    -only-migratable     allow only migratable devices

which fails any migration blocker, not just devices.


