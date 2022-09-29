Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C615EFC50
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:52:36 +0200 (CEST)
Received: from localhost ([::1]:44698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxi7-0003d7-4T
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1odwDL-0005lm-0M
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:16:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1odwDH-0008Vi-Ej
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:16:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664468198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SK8jnl25GfBurW867juBk8Hvi+Y8sy3LVuiGjVel2EA=;
 b=F4Jv+4lt1BjkwBzSD/C2MEZ28gEhAcJeLaPT4XNwfnq0+1Cw+sfoKuIX37PRimghQovoEc
 TxOw7YtFDyx4yMfnFMnHW5wALwssxgPD2SrjwsMvXUrjkm+177aShXei6oKgJnCbjtQYk4
 pxXvhqSU+QgSaP9tok+6rPCAAQPYxg8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-tWxvPbKKOv-UAw5fd6zNXg-1; Thu, 29 Sep 2022 12:16:32 -0400
X-MC-Unique: tWxvPbKKOv-UAw5fd6zNXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5441868A2E;
 Thu, 29 Sep 2022 16:16:31 +0000 (UTC)
Received: from starship (unknown [10.40.193.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33A50140EBF4;
 Thu, 29 Sep 2022 16:16:30 +0000 (UTC)
Message-ID: <a2825beac032fd6a76838164d4e2753d30305897.camel@redhat.com>
Subject: Re: Commit 'iomap: add support for dma aligned direct-io' causes
 qemu/KVM boot failures
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Keith Busch <kbusch@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Christoph
 Hellwig <hch@lst.de>, qemu-devel@nongnu.org, kvm@vger.kernel.org
Date: Thu, 29 Sep 2022 19:16:29 +0300
In-Reply-To: <YzW+Mz12JT1BXoZA@kbusch-mbp.dhcp.thefacebook.com>
References: <fb869c88bd48ea9018e1cc349918aa7cdd524931.camel@redhat.com>
 <YzW+Mz12JT1BXoZA@kbusch-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2022-09-29 at 09:48 -0600, Keith Busch wrote:
> I am aware, and I've submitted the fix to qemu here:
> 
>   https://lists.nongnu.org/archive/html/qemu-block/2022-09/msg00398.html
> 


Thanks for quick response!

Question is though, isn't this an kernel ABI breakage?

(I myself don't care, I would be happy to patch my qemu), 

but I afraid that this will break *lots* of users that only updated the kernel
and not the qemu.

What do you think?

Best regards,
	Maxim Levitsky


