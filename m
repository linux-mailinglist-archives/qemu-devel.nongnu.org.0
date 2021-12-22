Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B61747D562
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 17:48:19 +0100 (CET)
Received: from localhost ([::1]:42762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n04mo-00053U-7D
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 11:48:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1n04ku-0003KK-9x
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 11:46:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1n04ks-0001m0-LR
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 11:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640191578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BFvs/A/vbgbdJX+dNVaV/6nUjS/GH1ktnrcf2TIh49s=;
 b=P88TrKEQf4lduyBeylzYsWTWEmEalw0RAsQf07RQ8FF0YuFiWWhufFOB5CI6sj/xInPux/
 xte3xBYzjWLzf2mhxCK69dgay4GAyTjLgBMyTF+VTPBXXqSZ4khcJUF9XHD54ne7DpdkWR
 BoK+sHi7lbmqbzRrzOuxFv/DYMYM6YY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-PJD_AwE2MLiNkgcOBtRLxw-1; Wed, 22 Dec 2021 11:46:15 -0500
X-MC-Unique: PJD_AwE2MLiNkgcOBtRLxw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D001764140;
 Wed, 22 Dec 2021 16:46:13 +0000 (UTC)
Received: from localhost (unknown [10.39.193.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55D357AD1D;
 Wed, 22 Dec 2021 16:46:13 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Nico Boehr <nrb@linux.ibm.com>, qemu-s390x@nongnu.org
Subject: Re: [PATCH qemu] s390x/css: fix PMCW invalid mask
In-Reply-To: <20211216131657.1057978-1-nrb@linux.ibm.com>
Organization: Red Hat GmbH
References: <20211216131657.1057978-1-nrb@linux.ibm.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Wed, 22 Dec 2021 17:46:11 +0100
Message-ID: <87h7b037vw.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, Nico Boehr <nrb@linux.ibm.com>, frankja@linux.ibm.com,
 pmorel@linux.ibm.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 16 2021, Nico Boehr <nrb@linux.ibm.com> wrote:

> Previously, we required bits 5, 6 and 7 to be zero (0x07 == 0b111). But,
> as per the principles of operation, bit 5 is ignored in MSCH and bits 0,
> 1, 6 and 7 need to be zero.
>
> As both PMCW_FLAGS_MASK_INVALID and ioinst_schib_valid() are only used
> by ioinst_handle_msch(), adjust the mask accordingly.
>
> Fixes: db1c8f53bfb1 ("s390: Channel I/O basic definitions.")
> Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
> Reviewed-by: Halil Pasic <pasic@linux.ibm.com>
> Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  include/hw/s390x/ioinst.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/s390x/ioinst.h b/include/hw/s390x/ioinst.h
> index 3771fff9d44d..ea8d0f244492 100644
> --- a/include/hw/s390x/ioinst.h
> +++ b/include/hw/s390x/ioinst.h
> @@ -107,7 +107,7 @@ QEMU_BUILD_BUG_MSG(sizeof(PMCW) != 28, "size of PMCW is wrong");
>  #define PMCW_FLAGS_MASK_MP 0x0004
>  #define PMCW_FLAGS_MASK_TF 0x0002
>  #define PMCW_FLAGS_MASK_DNV 0x0001
> -#define PMCW_FLAGS_MASK_INVALID 0x0700
> +#define PMCW_FLAGS_MASK_INVALID 0xc300

Removing bit 5 from this mask makes sense, at it is simply ignored.

I'm a bit confused about bits 0 and 1, however. They are _QF and _W,
respectively (just out of the context here), which are in the same class
as _DNV (i.e. characteristics of the subchannel that cannot be modified
via msch). Looking at the PoP, I don't see what is supposed to happen if
the program tries to modify the dnv bit (maybe I'm simply overlooking
it.) I would naively assume that the w bit should behave in the same way
(as it does for message subchannels what dnv does for I/O subchannels,
and the rest of the values are not meaningful if it is not set), and
probably also the qf bit (as it doesn't make sense for the program to
turn QDIO capabilities on and off.) The main question is whether trying
to modify these bits causes an error or is ignored. The PoP suggests an
error (no idea if the internal architecture agrees, it hopefully does);
what happens for dnv?

We support neither message subchannels nor QDIO in QEMU, so it's
probably not relevant right now; but it would still be good if we could
clarify the expected behaviour here :)

>  
>  #define PMCW_CHARS_MASK_ST 0x00e00000
>  #define PMCW_CHARS_MASK_MBFC 0x00000004


