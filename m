Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2986C1A349C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Apr 2020 15:07:33 +0200 (CEST)
Received: from localhost ([::1]:48950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMWu2-0000Ev-L5
	for lists+qemu-devel@lfdr.de; Thu, 09 Apr 2020 09:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jMWqK-0007Bw-IP
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 09:03:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jMWqE-0000Ng-0y
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 09:03:38 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50881
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jMWqD-0000NP-Td
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 09:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586437413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xKwwnY8BOMLlvxxb5ZZ2wXk8sMbUptNEaD/VKSV4cTI=;
 b=QbexyC98FE08zyzkD+Z1Y5JpaN1nxCQPuDTTq8p09rFSXv61yW+NYA263HEMv4Z4OInFhb
 ecp5yNxjSozhHbaZPnWyq1q9e2W2DVAst5jSda7yx9Ztlznq6z4ayT1XSRZvtSVohHTp58
 ioVep39s98s+KsY5J/iGUfzngNUHESU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-eBkRrUxvP9WfuffKdKLUEA-1; Thu, 09 Apr 2020 09:03:30 -0400
X-MC-Unique: eBkRrUxvP9WfuffKdKLUEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 099A018A8CBE;
 Thu,  9 Apr 2020 13:03:30 +0000 (UTC)
Received: from localhost (unknown [10.40.208.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53B5A5C28F;
 Thu,  9 Apr 2020 13:03:19 +0000 (UTC)
Date: Thu, 9 Apr 2020 15:03:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH for-5.0 0/2] fix qemu crash with memory-backend-*
 prealloc=yes
Message-ID: <20200409150317.4de3a753@redhat.com>
In-Reply-To: <20200325094423.24293-1-imammedo@redhat.com>
References: <20200325094423.24293-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: lvivier@redhat.com, pbonzini@redhat.com, thuth@redhat.com,
 ehabkost@redhat.com, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Mar 2020 05:44:21 -0400
Igor Mammedov <imammedo@redhat.com> wrote:

> Igor Mammedov (2):
>   hostmem: set default prealloc_threads to valid value
>   tests: numa: test one backend with prealloc enabled
> 
>  backends/hostmem.c      | 1 +
>  tests/qtest/numa-test.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 

it looks like it's fallen through cracks.

Peter, Paolo

Could you pick it up for 5.0, pls?


