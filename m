Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD291400090
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:31:56 +0200 (CEST)
Received: from localhost ([::1]:59552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9IR-0007cA-PG
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8w5-0007Zr-3J
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vy-0001Rh-Ey
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1JB5dip2buCqpX3N0AQ5TDaM9b76l4vHw3eYvc0RPw=;
 b=KGjkbgyEI8qcnRLAzpscv8pZtZg889iTjj0HU1FDewwpW8EBqSOeRp8rHc+yFKLWJrom/+
 NuPIL8FDDphnULMG5fP4hdW664buVA73VBIDSqhs2a+vmBSZis2n78HX/H6ajy+EP03Zhu
 Ckcbo4iPBKk6FiKw9cjOdQou6Y2SnrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-wDxN793aOumBCOFppGcpfQ-1; Fri, 03 Sep 2021 09:08:40 -0400
X-MC-Unique: wDxN793aOumBCOFppGcpfQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA8641966322
 for <qemu-devel@nongnu.org>; Fri,  3 Sep 2021 13:08:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8281F6B544;
 Fri,  3 Sep 2021 13:08:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 82E9711326A2; Thu,  2 Sep 2021 16:57:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
References: <87h7fdg12w.fsf@dusky.pond.sub.org> <YSa7H3wGUHgccCrU@t490s>
 <YScPg0cYYGxxTz+b@xz-m1.local> <87y28oy6rm.fsf@dusky.pond.sub.org>
 <20210826133629.2ddd3b88@redhat.com> <YSean3PIkslbTHeU@t490s>
 <YS0rXQXwqKjhr4TA@t490s> <20210902102616.1b596104@redhat.com>
 <YTDVh9/MVAfCdkeu@t490s> <YTDXPB/t22lzRS/H@redhat.com>
 <YTDd31TI0fW83ND2@t490s>
Date: Thu, 02 Sep 2021 16:57:04 +0200
In-Reply-To: <YTDd31TI0fW83ND2@t490s> (Peter Xu's message of "Thu, 2 Sep 2021
 10:21:19 -0400")
Message-ID: <87ilzj81q7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> writes:

> Hi, Dan,
>
> On Thu, Sep 02, 2021 at 02:53:00PM +0100, Daniel P. Berrang=C3=A9 wrote:
>> The correct ordering of devices/backends is generally pretty obvious
>> for libvirt to determine. Most of the problems we've had related to
>> ordering are on the QEMU side, because the ARGV given to QEMU made
>> correct sense if parsed left-to-right, but QEMU didn't actually process
>> them in that order. We've patched QEMU to hack around its inability to
>> honour the CLI order repeatedly.
>
> Is there a pointer to the problem?

Just an example:

9ea18ed25a "vl: Fix -drive / -blockdev persistent reservation management
cda4aa9a5a "vl: Create block backends before setting machine properties"

>> Being completely self-ordering on the QEMU side using a topological
>> sort would be neat from a conceptual purity POV, but that is quite a
>> challenge to implement and I'm not convinced it is worth it, compared
>> to other problems we want to spend time on.
>
> I just noticed there can also be dependency between the buses; that canno=
t be
> fixed by ordering of classes indeed as either proposed in this series, or
> introduce a new priority.

--verbose?


