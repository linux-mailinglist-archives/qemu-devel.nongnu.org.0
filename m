Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78151F677
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 10:18:34 +0200 (CEST)
Received: from localhost ([::1]:49586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnybB-0000Q4-85
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 04:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nnyQP-0005FT-Kn
 for qemu-devel@nongnu.org; Mon, 09 May 2022 04:07:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nnyQA-00060c-RQ
 for qemu-devel@nongnu.org; Mon, 09 May 2022 04:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652083620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bNJVV2BvV0z18tDD+hPBCCqT3jXop18+06KmUsi5hHc=;
 b=QLY/Qo5XaUExmBIS/TIGzQaML7VswglBoRdlEpxFQUCi+FYScHtxAFIsR2Vl9J18P9H4Ev
 i/Rj7Nv7kwvOB5WK1I6tO7suVgBKLUbjv0kDCrU3RiziXrnrFMVQuL6fuid4cTbiN2zjoM
 N0sJ/V/RIqgdyjH6Ck6bRcUkYPruRFk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-_NAh_152MVC4z6CukWI_tA-1; Mon, 09 May 2022 04:06:57 -0400
X-MC-Unique: _NAh_152MVC4z6CukWI_tA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7DD2100BACC;
 Mon,  9 May 2022 08:06:56 +0000 (UTC)
Received: from localhost (unknown [10.39.193.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 551254010E4D;
 Mon,  9 May 2022 08:06:52 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>
Cc: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand
 <david@redhat.com>, Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] s390x: kvm: Honor storage keys during emulation
In-Reply-To: <20220506153956.2217601-1-scgl@linux.ibm.com>
Organization: Red Hat GmbH
References: <20220506153956.2217601-1-scgl@linux.ibm.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Mon, 09 May 2022 10:06:49 +0200
Message-ID: <87o8073zae.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 06 2022, Janis Schoetterl-Glausch <scgl@linux.ibm.com> wrote:

> Make use of the storage key support of the MEMOP ioctl, if available,
> in order to support storage key checking during emulation.
>
> I did not update all the headers, since that broke the build,
> not sure what the best way of dealing with that is.

Yeah, the vfio change is expected to break the build; the fix should be
easy (simple rename), and the code affected is deprecated anyway (there
hasn't been any upstream implementation that actually exposed the
interfaces). I think we should do that in a single commit to preserve
bisectability; I have not seen any patches posted yet to actually use
the new vfio migration interface, so a simple compile fixup should be
all that is needed.

>
> Janis Schoetterl-Glausch (2):
>   Pull in MEMOP changes in linux-headers
>   target/s390x: kvm: Honor storage keys during emulation
>
>  linux-headers/linux/kvm.h | 11 +++++++++--
>  target/s390x/kvm/kvm.c    |  9 +++++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)
>
>
> base-commit: 31abf61c4929a91275fe32f1fafe6e6b3e840b2a
> -- 
> 2.32.0


