Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB20431871
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 14:06:15 +0200 (CEST)
Received: from localhost ([::1]:51940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcRPB-0005J6-Ta
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 08:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mcRMR-0003sF-MF
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:03:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mcRMP-0007vz-AH
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634558599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ASLb7X8cEkBAHNi4nty76dNipGhw5S6+35W81VNrVjE=;
 b=RrZ3pWGaLMvs7UxPNg7p/lyKV4UCgT10xiVxVqAM8kj2XMzgXX59iMX4hnSChH8QwkX4PP
 Z+zBKo8DMabwiOynKe1m6FPWM0zLqUVocEaI3HIJKM+NPBwa6QSMLzON0nV5tcToiHSTka
 Kt7ehhXsEJIKUSkCEXeh5Y9Gf3iFMEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-iEEOAqPVP5GSi6PXjnJ66A-1; Mon, 18 Oct 2021 08:03:16 -0400
X-MC-Unique: iEEOAqPVP5GSi6PXjnJ66A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 889DF42394;
 Mon, 18 Oct 2021 12:03:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB48F60D30;
 Mon, 18 Oct 2021 12:03:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 71C7711380A7; Mon, 18 Oct 2021 14:03:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PULL 37/40] monitor: Tidy up find_device_state()
References: <20211013090728.309365-1-pbonzini@redhat.com>
 <20211013090728.309365-38-pbonzini@redhat.com>
 <3d80dc6b-66bd-34f7-8285-48c0647d6238@de.ibm.com>
Date: Mon, 18 Oct 2021 14:03:12 +0200
In-Reply-To: <3d80dc6b-66bd-34f7-8285-48c0647d6238@de.ibm.com> (Christian
 Borntraeger's message of "Fri, 15 Oct 2021 13:08:50 +0200")
Message-ID: <87tuhe8rr3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Hanna Reitz <hreitz@redhat.com>,
 "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu block <qemu-block@nongnu.org>, qemu-devel@nongnu.org,
 qemu-s390x <qemu-s390x@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Christian Borntraeger <borntraeger@de.ibm.com> writes:

> Am 13.10.21 um 11:07 schrieb Paolo Bonzini:
>> From: Markus Armbruster <armbru@redhat.com>
>> Commit 6287d827d4 "monitor: allow device_del to accept QOM paths"
>> extended find_device_state() to accept QOM paths in addition to qdev
>> IDs.  This added a checked conversion to TYPE_DEVICE at the end, which
>> duplicates the check done for the qdev ID case earlier, except it sets
>> a *different* error: GenericError "ID is not a hotpluggable device"
>> when passed a QOM path, and DeviceNotFound "Device 'ID' not found"
>> when passed a qdev ID.  Fortunately, the latter won't happen as long
>> as we add only devices to /machine/peripheral/.
>> Earlier, commit b6cc36abb2 "qdev: device_del: Search for to be
>> unplugged device in 'peripheral' container" rewrote the lookup by qdev
>> ID to use QOM instead of qdev_find_recursive(), so it can handle
>> buss-less devices.  It does so by constructing an absolute QOM path.
>> Works, but object_resolve_path_component() is easier.  Switching to it
>> also gets rid of the unclean duplication described above.
>> While there, avoid converting to TYPE_DEVICE twice, first to check
>> whether it's possible, and then for real.
>
> This one broke qemu iotest 280 on s390:
>
>
> 280   fail       [13:06:19] [13:06:19]   0.3s   (last: 0.3s)  output mismatch (see 280.out.bad)
> --- /home/cborntra/REPOS/qemu/tests/qemu-iotests/280.out
> +++ 280.out.bad
> @@ -37,14 +37,14 @@
>  === Resume the VM and simulate a write request ===
>  {"execute": "cont", "arguments": {}}
>  {"return": {}}
> -{"return": ""}
> +{"return": "Error: Device 'vda/virtio-backend' not found\r\n"}
>
>  === Commit it to the backing file ===
>  {"execute": "block-commit", "arguments": {"auto-dismiss": false, "device": "top-fmt", "job-id": "job0", "top-node": "top-fmt"}}
>  {"return": {}}
>  {"execute": "job-complete", "arguments": {"id": "job0"}}
>  {"return": {}}
> -{"data": {"device": "job0", "len": 65536, "offset": 65536, "speed": 0, "type": "commit"}, "event": "BLOCK_JOB_READY", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
> -{"data": {"device": "job0", "len": 65536, "offset": 65536, "speed": 0, "type": "commit"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
> +{"data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}, "event": "BLOCK_JOB_READY", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
> +{"data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
>  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
>  {"return": {}}
> Failures: 280
> Failed 1 of 1 iotests

Reproduced.  I'll dig deeper.  Thanks!


