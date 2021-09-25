Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4949141803B
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 09:46:28 +0200 (CEST)
Received: from localhost ([::1]:52006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU2OB-0004gj-22
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 03:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mU2Lp-0003Lf-C4
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 03:44:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mU2Ln-0006nD-VO
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 03:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632555839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=etW9NLceLC3oxvU/BIZx9zIVK6B5y2sej+IbAWOrP3w=;
 b=Vc/lQUh0u/glW7g7mdLJQ/+3FVbe7RGC4uRcJJsyN4KDrtC3PAGAOQbwz4+pZl1S28Z4hF
 KkEUyjSYfxUg+DiDHgkLbC/qRI/i4VDNI1JyEbKawxBeoriKvOPgL5kOLlwDo/2xRtPVg0
 OD5bmW1S4ZrCi/2JzC6fssoaTV2JXb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-cAIq4MIBMtSHIy8e7kYfPg-1; Sat, 25 Sep 2021 03:43:58 -0400
X-MC-Unique: cAIq4MIBMtSHIy8e7kYfPg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 311FA1006AA2;
 Sat, 25 Sep 2021 07:43:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B105369320;
 Sat, 25 Sep 2021 07:43:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 33BC9113865F; Sat, 25 Sep 2021 09:43:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/2] qapi: Move RTC_CHANGE back out of target schema
References: <20210924140142.31398-1-peter.maydell@linaro.org>
Date: Sat, 25 Sep 2021 09:43:48 +0200
In-Reply-To: <20210924140142.31398-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Fri, 24 Sep 2021 15:01:40 +0100")
Message-ID: <87v92pksln.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> This patchset moves RTC_CHANGE back to misc.json, effectively
> reverting commit 183e4281a30962, which moved the RTC_CHANGE event to
> the target schema.  That change was an attempt to make the event
> target-specific to improve introspection, but the event isn't really
> target-specific: it's machine or device specific.  Putting RTC_CHANGE
> in the target schema with an ifdef list reduces maintainability (by
> adding an if: list with a long list of targets that needs to be
> manually updated as architectures are added or removed or as new
> devices gain the RTC_CHANGE functionality) and increases compile time
> (by preventing RTC devices which emit the event from being "compile
> once" rather than "compile once per target", because
> qapi-events-misc-target.h uses TARGET_* ifdefs, which are poisoned in
> "compile once" files.)
>
> Patch 2 fixes a minor documentation issue that I noticed while
> I was doing this -- we didn't document that the units used in
> the RTC_CHANGE event are seconds.

Series
Reviewed-by: Markus Armbruster <armbru@redhat.com>

An additional patch documenting that not all RTCs implement RTC_CHANGE
would be nice.  Listing them would be even nicer.

An additional patch adding @qom-path event argument would be nice.


