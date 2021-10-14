Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD5842D3D4
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 09:37:46 +0200 (CEST)
Received: from localhost ([::1]:47228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mavJB-00027X-EU
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 03:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mavHq-0001Qf-PL
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 03:36:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mavHm-0002AE-Nl
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 03:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634196974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Piype2GMG0Nsk8rkuDe45/JVYJPnxI0kyONR50MXd8U=;
 b=INvU4eWBLbmm7snRmQqDVPtjkcnsDYFypwSFxyNNwbveCJJWy0zovStEdUXirdeK6foDcr
 WMFLenIg3c6mW6SXrf4Xtvj7grZGhDpl8MLA+vKSzkdzCwDsRJeUqibnJ0WHRVqF1O4Ydo
 lXjUSYRb3PHWkd5htqgEJO7SEIXq5Tg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-VoPsrABSPW-OQOeUjFhGMw-1; Thu, 14 Oct 2021 03:36:11 -0400
X-MC-Unique: VoPsrABSPW-OQOeUjFhGMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22CFA19057A0;
 Thu, 14 Oct 2021 07:36:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E89D1002D74;
 Thu, 14 Oct 2021 07:36:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A772511380A2; Thu, 14 Oct 2021 07:40:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH] monitor/qmp: fix race with clients disconnecting early
References: <20210823101115.2015354-1-s.reiter@proxmox.com>
 <87r1eh4j0f.fsf@dusky.pond.sub.org>
 <87r1eguxgi.fsf@dusky.pond.sub.org>
 <91f2fb28-fd4d-f7ad-13d1-61c7ba16ae3c@proxmox.com>
 <87eea9wrcf.fsf@dusky.pond.sub.org>
 <871r67b0yr.fsf@dusky.pond.sub.org>
 <87v922bnk1.fsf@dusky.pond.sub.org>
 <bc5f180d-3161-59c0-2ded-0808a150dec7@proxmox.com>
Date: Thu, 14 Oct 2021 07:40:26 +0200
In-Reply-To: <bc5f180d-3161-59c0-2ded-0808a150dec7@proxmox.com> (Stefan
 Reiter's message of "Wed, 13 Oct 2021 17:44:31 +0200")
Message-ID: <87k0igkvud.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Reiter <s.reiter@proxmox.com> writes:

> On 10/12/21 11:27 AM, Markus Armbruster wrote:
>> Stefan, any thoughts on this?
>> 
>
> Sorry, I didn't get to work on implementing this. Idea 3 does seem very
> reasonable, though I suppose the question is what all should go into the
> per-session state, and also how it is passed down.

Let's start with the state you have shown to be problematic.  To decide
what else to move from monitor state to session state, we'll want to
review monitor state one by one.  Can be done in review of patches
creating the session state.

Most users need the current session state.  So have struct MonitorQMP
hold a pointer to it.

To execute an in-band command in the main thread, we need the command's
session state.  I'd try adding a pointer to QMPRequest.

Then use reference counting to keep the session alive until all its
commands are processed.

Makes sense?

> We did roll out my initial patch to our users in the meantime and got
> some positive feedback (that specific error disappeared), however another
> one (reported at the same time) still exists, so I was trying to diagnose
> - it might also turn out to be monitor related and resolved by the more
> thorough fix proposed here, but unsure.

That would be lovely.

Thanks!


