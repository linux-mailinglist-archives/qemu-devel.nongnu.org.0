Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC854A0308
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 22:42:23 +0100 (CET)
Received: from localhost ([::1]:32894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDZ0g-00075Q-PV
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 16:42:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDYz3-0005Vf-Dk
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 16:40:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDYz0-0003W9-Pm
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 16:40:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643406037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iSniWemj/I4wt7NO+ro8t4rSZ3+VFToMSVBN8u6iyss=;
 b=RXt1SQUzkVPaOsS1xzXGFHO5Qdl8IrwsuDg/+oSF/HZQqhBH5Hi0Xh+8qXifai8DwpBCUQ
 ExERlCrWC/uY/Wto629LYCP1iNKVqkVWcc+j7ThDXBqHNncQiq78vATsAjK+x/M3Vl/mcc
 8NWZc1u1n9XTG6ZHUxy7vHGdin/iq2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-LAdnYaP9ME6X2eJJbKtRBw-1; Fri, 28 Jan 2022 16:40:34 -0500
X-MC-Unique: LAdnYaP9ME6X2eJJbKtRBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFBD3101F001;
 Fri, 28 Jan 2022 21:40:32 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C08955DB89;
 Fri, 28 Jan 2022 21:40:16 +0000 (UTC)
Date: Fri, 28 Jan 2022 15:40:14 -0600
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: Block alignment of qcow2 compress driver
Message-ID: <20220128214014.6kek62rhvaha3sm7@redhat.com>
References: <20220128110732.GA19514@redhat.com>
 <e07b998f-9a62-7587-0526-bf51eae54ed6@redhat.com>
 <20220128115619.GR1127@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220128115619.GR1127@redhat.com>
User-Agent: NeoMutt/20211029-256-77b59a
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, andrey.shinkevich@virtuozzo.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding libnbd list (libguestfs) in cc

On Fri, Jan 28, 2022 at 11:56:19AM +0000, Richard W.M. Jones wrote:
> 
> I hacked nbdcopy to ignore block alignment (the error actually comes
> from libnbd refusing to send the unaligned request, not from
> qemu-nbd), and indeed qemu-nbd accepts the unaligned request without
> complaint.

And only after I already replied to your other email, did I then see
your followup recommending to read this one instead ;)

The NBD spec says the client is non-complying when sending under-sized
requests.  If the server accepts it anyway (presumably with RMW
performance pessimizations, as qemu-nbd does), that's a QoI bonus.

> 
> Eric - maybe having some flag for nbdcopy to ignore unaligned requests
> when we know the server doesn't care (qemu-nbd) would work?

Yeah, that might make sense - a command-line option for stating "I
know the server has a nice QoI feature, and I don't mind the
performance pessimization".

Another thing to consider: the way the NBD spec is written, the rules
about a client sending unaligned requests being non-compliant only
applies to a client that requested block size information in the first
place.  If the client did not request block alignment information, the
server should honor anything at alignment of 512 or above (even if it
would prefer a larger minimum); performance may suffer, but this is
needed to cater to older clients that don't know how to request
alignments - and what's more, qemu-nbd specifically has code that
changes what it advertises if the client did not query (that is, an
advertisement of 64k is ONLY possible if the client requested
alignment details).

So maybe the question becomes whether libnbd needs a knob on whether
to request alignment information.  Libnbd commit 9e9c74755 (libnbd
v1.3.10) is where I added the code to unconditionally query for
alignment info.  Given that we now know of a case where NOT querying
causes qemu-nbd to behave differently in what it advertises, adding
such a knob to the API makes total sense, at which point, 'nbdcopy
--ignore-align' becomes a way to request that the client not request
alignment in the first place, rather than as a way to call
nbd_set_strict_mode() to turn off alignment checking.

Looks like I have some API work do propose in libnbd...

> 
> Rich.
> 
> --- a/copy/nbd-ops.c
> +++ b/copy/nbd-ops.c
> @@ -59,6 +59,10 @@ open_one_nbd_handle (struct rw_nbd *rwn)
>      exit (EXIT_FAILURE);
>    }
>  
> +  uint32_t sm = nbd_get_strict_mode (nbd);
> +  sm &= ~LIBNBD_STRICT_ALIGN;
> +  nbd_set_strict_mode (nbd, sm);
> +
>    nbd_set_debug (nbd, verbose);
>  
>    if (extents && rwn->d == READING &&
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


