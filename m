Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1783E3560
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 14:48:41 +0200 (CEST)
Received: from localhost ([::1]:46698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCLkm-0007w9-RF
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 08:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCLiM-00073g-NW
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:46:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCLiK-0004Qc-Vr
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628340368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wnh6k9VT15iLHjMvIdGq9Q4vFp6pMeNwMxElgbE0lVs=;
 b=BS1SMVZ71iGBhC6SwG7wdOmkrU9mcBgxaO7sYyTxcBSDiI/iMhbn4ZnZEgPbHL4kpw5lcB
 souDXqwl3SrgGbZ1RR2umHCvhUKAedXLfBTvq+2YVQfvsKXq9aSuTbKaV/uaG1qnOKYR2x
 l0m725tY1dxW4k8Gb098uMkIh+MM8a8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-gamOlpirOxSggPr52z8v5g-1; Sat, 07 Aug 2021 08:46:07 -0400
X-MC-Unique: gamOlpirOxSggPr52z8v5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A939E10066E6;
 Sat,  7 Aug 2021 12:46:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1204D5C1B4;
 Sat,  7 Aug 2021 12:45:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9F64C11380A0; Sat,  7 Aug 2021 14:45:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v6 4/6] qmp: add QMP command x-debug-virtio-queue-status
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-5-git-send-email-jonah.palmer@oracle.com>
Date: Sat, 07 Aug 2021 14:45:43 +0200
In-Reply-To: <1626086137-16292-5-git-send-email-jonah.palmer@oracle.com>
 (Jonah Palmer's message of "Mon, 12 Jul 2021 06:35:35 -0400")
Message-ID: <875ywhe83s.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, amit@kernel.org,
 michael.roth@amd.com, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jonah Palmer <jonah.palmer@oracle.com> writes:

> From: Laurent Vivier <lvivier@redhat.com>
>
> This new command shows internal status of a VirtQueue.
> (vrings and indexes).
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>

[...]

> diff --git a/qapi/virtio.json b/qapi/virtio.json
> index 78873cd..7007e0c 100644
> --- a/qapi/virtio.json
> +++ b/qapi/virtio.json
> @@ -406,3 +406,105 @@
>    'data': { 'path': 'str' },
>    'returns': 'VirtioStatus'
>  }
> +
> +##
> +# @VirtQueueStatus:
> +#
> +# Status of a VirtQueue
> +#
> +# @device-type: VirtIO device type
> +#
> +# @queue-index: VirtQueue queue_index
> +#
> +# @inuse: VirtQueue inuse
> +#
> +# @vring-num: VirtQueue vring.num
> +#
> +# @vring-num-default: VirtQueue vring.num_default
> +#
> +# @vring-align: VirtQueue vring.align
> +#
> +# @vring-desc: VirtQueue vring.desc
> +#
> +# @vring-avail: VirtQueue vring.avail
> +#
> +# @vring-used: VirtQueue vring.used
> +#
> +# @last-avail-idx: VirtQueue last_avail_idx
> +#
> +# @shadow-avail-idx: VirtQueue shadow_avail_idx
> +#
> +# @used-idx: VirtQueue used_idx
> +#
> +# @signalled-used: VirtQueue signalled_used
> +#
> +# @signalled-used-valid: VirtQueue signalled_used_valid
> +#
> +# Since: 6.1
> +#
> +##
> +
> +{ 'struct': 'VirtQueueStatus',
> +  'data': {
> +    'device-type': 'VirtioType',
> +    'queue-index': 'uint16',
> +    'inuse': 'uint32',
> +    'vring-num': 'int',
> +    'vring-num-default': 'int',
> +    'vring-align': 'int',
> +    'vring-desc': 'uint64',
> +    'vring-avail': 'uint64',
> +    'vring-used': 'uint64',
> +    'last-avail-idx': 'uint16',
> +    'shadow-avail-idx': 'uint16',
> +    'used-idx': 'uint16',
> +    'signalled-used': 'uint16',
> +    'signalled-used-valid': 'uint16'
> +  }
> +}

I can't check the member types like I did for VirtioStatus in PATCH 2
right now.  Please double-check them.

> +
> +##
> +# @x-debug-virtio-queue-status:
> +#
> +# Return the status of a given VirtQueue
> +#
> +# @path: QOBject path of the VirtIODevice
> +#
> +# @queue: queue number to examine
> +#
> +# Returns: Status of the VirtQueue
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "x-debug-virtio-queue-status",
> +#      "arguments": {
> +#          "path": "/machine/peripheral-anon/device[3]/virtio-backend",
> +#          "queue": 0
> +#      }
> +#   }
> +# <- { "return": {
> +#      "signalled-used": 373,
> +#      "inuse": 0,
> +#      "vring-align": 4096,
> +#      "vring-desc": 864411648,
> +#      "signalled-used-valid": 0,
> +#      "vring-num-default": 256,
> +#      "vring-avail": 864415744,
> +#      "queue-index": 0,
> +#      "last-avail-idx": 373,
> +#      "vring-used": 864416320,
> +#      "used-idx": 373,
> +#      "device-type": "virtio-net",
> +#      "shadow-avail-idx": 619,
> +#      "vring-num": 256
> +#      }
> +#    }
> +#
> +##
> +
> +{ 'command': 'x-debug-virtio-queue-status',
> +  'data': { 'path': 'str', 'queue': 'uint16' },
> +  'returns': 'VirtQueueStatus'
> +}


