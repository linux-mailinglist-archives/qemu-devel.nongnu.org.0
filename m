Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439CC38C559
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 13:00:58 +0200 (CEST)
Received: from localhost ([::1]:53378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk2tk-0002eS-Oa
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 07:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lk2sf-0001we-My
 for qemu-devel@nongnu.org; Fri, 21 May 2021 06:59:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lk2sc-0007c9-TH
 for qemu-devel@nongnu.org; Fri, 21 May 2021 06:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621594786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4K2zKeWIo1An5R61BzBvsDXf+06vN5RoZLO+v6fmZg=;
 b=PjbG5DnNdI5RF9NQt1bZSIDX9urZ/6a/k8nFgaKMzd295q3XxgXIgrIwFnCkmQG4Qrf7xt
 K/+4t8Lfq2mV80Q5UO+J8ocSDV3sjQ7F/mgvLL/VylTpElJXLkvAYoUh5DPGqcL4Hz+pTV
 gvHkSl/wcp+YWaVqelX6S1ooam+G1Lk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-bjNOZBRUMT-N7Az4XxBC6Q-1; Fri, 21 May 2021 06:59:42 -0400
X-MC-Unique: bjNOZBRUMT-N7Az4XxBC6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42936107ACCD;
 Fri, 21 May 2021 10:59:41 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-50.ams2.redhat.com [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4A30610B0;
 Fri, 21 May 2021 10:59:34 +0000 (UTC)
Date: Fri, 21 May 2021 12:59:32 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH 0/2] Fix SIGILL psw.addr reporting
Message-ID: <20210521125932.3921857e.cohuck@redhat.com>
In-Reply-To: <1e96b30913e36c289c9a8fd9a3d2564aea8e56da.camel@linux.ibm.com>
References: <20210521030146.2831663-1-iii@linux.ibm.com>
 <e2eb83ba-6937-741c-ea67-1bbd2346f9d5@redhat.com>
 <1e96b30913e36c289c9a8fd9a3d2564aea8e56da.camel@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 21 May 2021 12:45:30 +0200
Ilya Leoshkevich <iii@linux.ibm.com> wrote:

> On Fri, 2021-05-21 at 09:42 +0200, David Hildenbrand wrote:
> > On 21.05.21 05:01, Ilya Leoshkevich wrote:  
> > > qemu-s390x puts a wrong value into SIGILL's siginfo_t's psw.addr:
> > > it
> > > should be a pointer to the instruction following the illegal
> > > instruction, but at the moment it is a pointer to the illegal
> > > instruction itself. This breaks OpenJDK, which relies on this
> > > value.
> > > 
> > > Patch 1 fixes the issue, patch 2 adds a test.  
> > 
> > I assume that should fix
> > 
> > https://bugs.launchpad.net/qemu/+bug/1920913
> > 
> > right?  
> 
> Yes, I have this Buglink in the fix commit message.

Better add https://gitlab.com/qemu-project/qemu/-/issues/319 as the
Buglink :)

> I have to admit I did not test Java more extensively - there might be
> more things going on - but at least with this the SIGILL on startup is
> gone, and very simple programs work.
> 
> 


