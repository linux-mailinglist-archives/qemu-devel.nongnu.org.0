Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C5010B397
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 17:39:51 +0100 (CET)
Received: from localhost ([::1]:40260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ia0M2-0002US-JP
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 11:39:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60119)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ia0Iv-00010R-F1
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 11:36:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ia0Iu-0004pD-E0
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 11:36:37 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41102
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ia0Iu-0004oN-9d
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 11:36:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574872595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ns6bG00FeBlVjwhggyNLeklsajsLyZ+Sj3iMuQnkWG8=;
 b=YKdd06HS6n/zkvsntHnnWkdcmKtHBYgOHJ2u6FnR6XN1O1o//DEI7WFfjA+bl6lh96o3os
 gRtCG10oCph9eTycp48p/IQzNdwNOwyRGRrLwMWJFymnmHWy+/ebCBPVsTLZVROdM/0ORR
 jP86DGnAwQiWQivNUbHsdMefnU5tq0A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-3-Sv8Lj0MjOvnwNa6U-Q_A-1; Wed, 27 Nov 2019 11:36:34 -0500
Received: by mail-wr1-f72.google.com with SMTP id z10so12416277wrr.5
 for <qemu-devel@nongnu.org>; Wed, 27 Nov 2019 08:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ns6bG00FeBlVjwhggyNLeklsajsLyZ+Sj3iMuQnkWG8=;
 b=f5TIp0b7raFEzEeVMHjrlLN6lmEnlE+VjOO2IFd3iQW7oOKxtfFSfRJnfrA5+9xYN+
 sgWC5Wd01InIOG6AacINUshQ0sdzohLtEjxEqsCQJHsPqpwsyHC+ApHFkq2EZAyDwwxR
 350BnpPAFGq4LjsfOFBLNfEfvybZ+ZDthybj52eQjQJFplaBhWqee9fxGDkLEKSJeC4S
 RIR/zDZb/dn4Ec4eBDAKCzWwR3/D1m1oRSEikqMLYVmkWpPfJta+bUfdqm0H8KLd2zIW
 nu2x3/zsnzZsptx+VZPpzsXUwgfaRsM+jG/lmzsuBNXBOH70wd/b0ha43NRO2gJjobHr
 CQ6g==
X-Gm-Message-State: APjAAAWNHkGRkc/s672YYaMLVtZUSZvP+tEd2NZEKb1ADzp+HByPIk48
 iMUR9EniSgplIQobkpfzxgZpdPdyaQv1EYG7MZuifKf7dVamVAiReWSa+71WA/y1hoDBIWAbayI
 JGUFPQ4KcLHl1yVQ=
X-Received: by 2002:a1c:ed09:: with SMTP id l9mr5422981wmh.101.1574872593291; 
 Wed, 27 Nov 2019 08:36:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqwnCmySr1pjzc84CGG6QSzMtsx0XzTxiJQv+2bgHL0rEDAKxt+H/1RrljB2nh4ISuS8rLhn+w==
X-Received: by 2002:a1c:ed09:: with SMTP id l9mr5422954wmh.101.1574872592965; 
 Wed, 27 Nov 2019 08:36:32 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:459f:99a9:39f1:65ba?
 ([2001:b07:6468:f312:459f:99a9:39f1:65ba])
 by smtp.gmail.com with ESMTPSA id t12sm2007523wrs.96.2019.11.27.08.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 08:36:32 -0800 (PST)
Subject: Re: [RFC] exec: flush CPU TB cache when breakpoint address
 translation fails
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20191126222607.25653-1-jcmvbkbc@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <876396e7-7a6e-122f-3846-63d14c204691@redhat.com>
Date: Wed, 27 Nov 2019 17:36:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191126222607.25653-1-jcmvbkbc@gmail.com>
Content-Language: en-US
X-MC-Unique: 3-Sv8Lj0MjOvnwNa6U-Q_A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/11/19 23:26, Max Filippov wrote:
> When a breakpoint is inserted at location for which there's currently no
> virtual to physical translation no action is taken on CPU TB cache. If a
> TB for that virtual address already exists but is not visible ATM the
> breakpoint won't be hit next time an instruction at that address will be
> executed.
> 
> Flush entire CPU TB cache when a breakpoint is set for a virtual address
> that cannot be translated to physical address.
> 
> This change fixes the following workflow:
> - linux user application is running
> - a breakpoint is inserted from QEMU gdbstub for a user address that is
>   not currently present in the target CPU TLB
> - an instruction at that address is executed, but the external debugger
>   doesn't get control.

That's quite heavyweight, but perhaps since it's debugging we might as
well _always_ just flush the TB cache?

In any case, it deserves a comment in the code.

Paolo


