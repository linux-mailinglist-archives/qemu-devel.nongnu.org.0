Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A674A283462
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 12:59:26 +0200 (CEST)
Received: from localhost ([::1]:45264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPODF-0000fx-O6
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 06:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kPO9Q-00046y-Q0
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 06:55:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kPO9O-0001zn-Iy
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 06:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601895325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yALnMSr1yJuue5E4AjGZKDmMg2aydLrPW9CxjD73UMw=;
 b=VU53fZrADP6BVPncsCYYu26Ejlv1XEoP2CTKb0Hbz2U+QYvvci0H9k+4SwloOf8+nKotpz
 i9JrdNzBlVeU/bnf1JLK+hbciWY0x5RTuRh+PYALvrNmnUlWPnNUzqgqRboyoFe23N4nxs
 5pr8VOGLOoKI1x/GkeOKoH/3Ek8EtlE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-uIq1M_HTMOC1le8a4VRyEA-1; Mon, 05 Oct 2020 06:55:24 -0400
X-MC-Unique: uIq1M_HTMOC1le8a4VRyEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A549918C89C1;
 Mon,  5 Oct 2020 10:55:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F2B85D9CC;
 Mon,  5 Oct 2020 10:55:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1A6C911329C1; Mon,  5 Oct 2020 12:55:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/5] qapi: Restrict machine (and migration) specific
 commands
References: <20201002133923.1716645-1-philmd@redhat.com>
 <87wo05aypg.fsf@dusky.pond.sub.org>
 <0c54aa06-372c-ab81-0974-34340adb7b55@redhat.com>
Date: Mon, 05 Oct 2020 12:55:14 +0200
In-Reply-To: <0c54aa06-372c-ab81-0974-34340adb7b55@redhat.com> (Paolo
 Bonzini's message of "Mon, 5 Oct 2020 10:46:02 +0200")
Message-ID: <877ds5djsd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 01:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 05/10/20 10:01, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> Reduce the machine code pulled into qemu-storage-daemon.
>> I'm leaving review to Eduardo and Marcel for PATCH 1-4, and to David and
>> Juan for PATCH 5.  David already ACKed.
>>=20
>> Can do the pull request.
>>=20
>
> If it counts, :) for patch 1-4:
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Generally these patches to remove code from user-mode emulators
> fall into the "if it builds it's fine" bucket, since I assume
> we want the "misc" subschema to be as small as possible.

Moving stuff out of qapi/misc.json is good as long as the new home makes
sense.  So, if it builds *and* the maintainers of the new home think it
makes sense to have it there, it's fine.

I don't think we should aim for eliminating every last bit of unused
generated code from every program.  We should aim for a sensible split
into sub-modules.  Unused generated code in a program can be a sign for
a less than sensible split.


