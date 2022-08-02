Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D440587A41
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:03:26 +0200 (CEST)
Received: from localhost ([::1]:47062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIokH-0007qb-MK
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIofO-0001lA-TQ
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:58:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIofM-0005Sr-UL
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:58:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659434300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IK7X5JjhWCMtKFN2IQFAWilATObW8IvMNdvfNxvL2RQ=;
 b=Z3E/IE/nTlOgNGdDdff6wvavmTlQIiNB/QOO9u6bGT3i/UAy5L+wreEdS+iONOtAV5EXse
 Q9rcd4SKRQ8OcD/m9dw0hW/uj6gcyUXPf0O+3PCzYY6D8XxOW7MwC4mc6BOvtAolh3T7yo
 TqAOodIxOtmzhOjoVMZu7fimOuWbs0E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-Z5hG_ukDNKqZMzTCZpT1GA-1; Tue, 02 Aug 2022 05:58:19 -0400
X-MC-Unique: Z5hG_ukDNKqZMzTCZpT1GA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A88A338149A8;
 Tue,  2 Aug 2022 09:58:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E9D518EA8;
 Tue,  2 Aug 2022 09:58:17 +0000 (UTC)
Date: Tue, 2 Aug 2022 11:58:16 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Cole Robinson <crobinso@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] qemu-iotests: Discard stderr when probing devices
Message-ID: <Yuj1OGbZUCYNJups@redhat.com>
References: <a535c532fb5a9a607f4e3e187cf386e3eaadf892.1654441037.git.crobinso@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a535c532fb5a9a607f4e3e187cf386e3eaadf892.1654441037.git.crobinso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 05.06.2022 um 16:57 hat Cole Robinson geschrieben:
> ./configure --enable-modules --enable-smartcard \
>     --target-list=x86_64-softmmu,s390x-softmmu
> make
> cd build
> QEMU_PROG=`pwd`/s390x-softmmu/qemu-system-s390x \
>     ../tests/check-block.sh qcow2
> ...
> --- /home/crobinso/src/qemu/tests/qemu-iotests/127.out
> +++ /home/crobinso/src/qemu/build/tests/qemu-iotests/scratch/127.out.bad
> @@ -1,4 +1,18 @@
>  QA output created by 127
> +Failed to open module: /home/crobinso/src/qemu/build/hw-usb-smartcard.so: undefined symbol: ccid_card_ccid_attach
> ...
> --- /home/crobinso/src/qemu/tests/qemu-iotests/267.out
> +++ /home/crobinso/src/qemu/build/tests/qemu-iotests/scratch/267.out.bad
> @@ -1,4 +1,11 @@
>  QA output created by 267
> +Failed to open module: /home/crobinso/src/qemu/build/hw-usb-smartcard.so: undefined symbol: ccid_card_ccid_attach
> 
> The stderr spew is its own known issue, but seems like iotests should
> be discarding stderr in this case.
> 
> Signed-off-by: Cole Robinson <crobinso@redhat.com>

Oops, that took a while on my side... Thanks, applied to the block
branch.

By the way, putting diffs in the commit message is a great way to
confuse 'git am'. :-) Indenting your test scenario fixed it for me.

Kevin


