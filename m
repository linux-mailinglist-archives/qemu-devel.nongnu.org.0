Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE31844601A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 08:28:08 +0100 (CET)
Received: from localhost ([::1]:55942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mitdv-0007hH-Lf
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 03:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mitd1-0006xN-5s
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 03:27:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mitcz-0007Am-Hy
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 03:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636097228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZhhZBE/WQKO0r/s1e5r+jiN5DxeO5RR2xW+rjc7CTQQ=;
 b=G3awdpx4rqDkNKbNFcR9TmPyfPi9LCMUv1Pl07Ld5JomCh2yH/F3hbkGqXDj9q90Xh/+6y
 jVWHGOhesu2O4bWgWRPBIqea712lrzDIeug/7j2mgr+rKyn8ZTN4qX0SIwkZlDQXRwYebE
 eOo9vWfqF9egUfmp6gLSRvccZxLF1HQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-jGw_g7lLNfyQTrUCLSF70g-1; Fri, 05 Nov 2021 03:27:05 -0400
X-MC-Unique: jGw_g7lLNfyQTrUCLSF70g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 472381006AA3;
 Fri,  5 Nov 2021 07:27:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BAD65F4EC;
 Fri,  5 Nov 2021 07:26:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C410511380A7; Fri,  5 Nov 2021 08:26:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v8 0/8] hmp, qmp: Add commands to introspect virtio devices
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
 <YXk+JvPuOglFoerz@redhat.com>
Date: Fri, 05 Nov 2021 08:26:32 +0100
In-Reply-To: <YXk+JvPuOglFoerz@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 27 Oct 2021 12:55:18 +0100")
Message-ID: <87bl2z5ahj.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com,
 Jonah Palmer <jonah.palmer@oracle.com>, lvivier@redhat.com, thuth@redhat.com,
 michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Oct 27, 2021 at 07:41:41AM -0400, Jonah Palmer wrote:
>> This series introduces new QMP/HMP commands to dump the status of a
>> virtio device at different levels.
>>=20
>> [Jonah: Rebasing previous patchset from Oct. 5 (v7). Original patches
>>  are from Laurent Vivier from May 2020.
>>=20
>>  Rebase from v7 to v8 includes an additional assert to make sure
>>  we're not returning NULL in virtio_id_to_name(). Rebase also
>>  includes minor additions/edits to qapi/virtio.json.]
>>=20
>> 1. Main command
>>=20
>> HMP Only:
>>=20
>>     virtio [subcommand]
>>=20
>>     Example:
>>=20
>>         List all sub-commands:
>>=20
>>         (qemu) virtio
>>         virtio query  -- List all available virtio devices
>>         virtio status path -- Display status of a given virtio device
>>         virtio queue-status path queue -- Display status of a given virt=
io queue
>>         virtio vhost-queue-status path queue -- Display status of a give=
n vhost queue
>>         virtio queue-element path queue [index] -- Display element of a =
given virtio queue
>
> I don't see a compelling reason why these are setup as sub-commands
> under a new "virtio" top level. This HMP approach and the QMP 'x-debug-qu=
ery'
> naming just feels needlessly different from the current QEMU practices.
>
> IMHO they should just be "info" subcommands for HMP. ie
>
>          info virtio  -- List all available virtio devices
>          info virtio-status path -- Display status of a given virtio devi=
ce
>          info virtio-queue-status path queue -- Display status of a given=
 virtio queue
>          info virtio-vhost-queue-status path queue -- Display status of a=
 given vhost queue
>          info virtio-queue-element path queue [index] -- Display element =
of a given virtio queue

I agree with Dan (but I'm not the maintainer).

> While the corresponding QMP commands ought to be
>
>          x-query-virtio
>          x-query-virtio-status
>          x-query-virtio-queue-status
>          x-query-virtio-vhost-queue-status
>          x-query-virtio-queue-element

I agree with Dan (and I am the maintainer).

The x- is not strictly required anymore (see commit a3c45b3e62 'qapi:
New special feature flag "unstable"').  I lean towards keeping it here,
because we don't plan to stabilize these commands.


