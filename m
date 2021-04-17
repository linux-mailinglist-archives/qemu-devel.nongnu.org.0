Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F49362EE6
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 11:34:23 +0200 (CEST)
Received: from localhost ([::1]:58954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXhLK-0007Re-CF
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 05:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXhKY-0006lH-1l
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 05:33:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXhKV-0007h4-33
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 05:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618652008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3kj3aQKLVf70vf8aJunUMqWYUcRyxlLuBMzdb7jYS2U=;
 b=dywGrQXIOhv3lVOpRNR+VCkzl21z4Ukdoo4ltITN8UOHICV1kUdGnstb4NqXA9EnSIGeEp
 CueMvLdTPzz3eD9YrOr2eFhgjshmSvfPH5LxwYp7rjSbANoAmJdlBzFMFcEvxq/eSrYxNH
 MtS3JRFCP3sdg1g1CcuyKjCOphEAabU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-jQOEpacGOfqlrD8Tz84Iyg-1; Sat, 17 Apr 2021 05:33:27 -0400
X-MC-Unique: jQOEpacGOfqlrD8Tz84Iyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6359583DD20
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 09:33:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F7DB60C13;
 Sat, 17 Apr 2021 09:33:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 92DBD113525D; Sat, 17 Apr 2021 11:33:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
References: <20210415154402.28424-1-vkuznets@redhat.com>
 <YHhj/bo883jJ9ocy@redhat.com> <YHh3trxdMQ85NRTh@work-vm>
 <874kg68z07.fsf@vitty.brq.redhat.com>
 <20210416162801.zluqlbvyipoanedw@habkost.net>
Date: Sat, 17 Apr 2021 11:33:24 +0200
In-Reply-To: <20210416162801.zluqlbvyipoanedw@habkost.net> (Eduardo Habkost's
 message of "Fri, 16 Apr 2021 12:28:01 -0400")
Message-ID: <87tuo51cij.fsf@dusky.pond.sub.org>
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
Cc: "Daniel P. =?utf-8?Q?Berrang?= =?utf-8?Q?=C3=A9?=" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

[...]
> I would make live migration policy an enum, just to make sure
> we are explicit about the requirements:
>
> - UNKNOWN: this is the current state in QEMU 6.0, where we don't
>   really know what the user expects.
>   This can be the default on existing versioned machine types,
>   just for compatibility.
>   I suggest making this print warnings for every migration
>   blocker (like this patch does).
>   I suggest deprecating this behavior as soon as we can.
>
> - PREFERRED: try to make the VM migratable when possible, but
>   don't print a warning or error out if migration is blocked.
>   This seems to be the behavior expected by libvirt today.
>
> - NOT_NEEDED: live migration is not needed, and QEMU is free to
>   enable features that block live migration or change guest ABI.
>   We can probably make this the default on machine types that
>   never supported live migration.
>
> - REQUIRED: live migration is required, and adding a migration
>   blocker would be a fatal error.

To be precise: would be an error.  During initial configuration, the
error is fatal, i.e. exit(1).  In a QMP command, it's not; only the
command fails.

>   This is already implemented by --only-migratable.
>   I suggest making this the default on versioned machine types
>   after a few releases, and after deprecating UNKNOWN.

Makes sense to me (but of course we can still quibble about the names).


