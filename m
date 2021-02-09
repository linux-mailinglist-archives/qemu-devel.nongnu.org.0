Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7061315653
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:51:58 +0100 (CET)
Received: from localhost ([::1]:52962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Y7B-0001rN-Ty
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9Y4s-0000ZZ-BB
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:49:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9Y4i-0005ZD-Vy
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612896563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H6glpsbOgThO+Wrhbt/QldaBcj8fDTuq3FEH9KcunSQ=;
 b=FpMdaHNFQZ6NNqqo14Ym8TS2CZEzH4jNGsEzjAG3LMCoY3sKFy1ZzGSJkwic4gpjIjlGTe
 rcP4vZ8vpHUiFYWd0WEFeZlOPlGak4NwrVgObwmRkUEX8Z8v3VsfOa4m9fSlewcj+juxWH
 7P1UYVKUgOKwgCyYLWVjiKwCzaSb2Ng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-bkc6HXzzNsOmWeh6KRXLLg-1; Tue, 09 Feb 2021 13:49:20 -0500
X-MC-Unique: bkc6HXzzNsOmWeh6KRXLLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86336195D561;
 Tue,  9 Feb 2021 18:49:19 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 335F96A8E5;
 Tue,  9 Feb 2021 18:49:19 +0000 (UTC)
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210209182745.501662-1-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH] iotests: Fix unsupported_imgopts for refcount_bits
Message-ID: <e1bdf41c-eddb-214f-1f4a-9fbfc477b73f@redhat.com>
Date: Tue, 9 Feb 2021 12:49:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209182745.501662-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 12:27 PM, Max Reitz wrote:
> Many _unsupported_imgopts lines for refcount_bits values use something
> like "refcount_bits=1[^0-9]" to forbid everything but "refcount_bits=1"
> (e.g. "refcount_bits=16" is allowed).
> 
> That does not work when $IMGOPTS does not have any entry past the
> refcount_bits option, which now became apparent with the "check" script
> rewrite.
> 
> Use \b instead of [^0-9] to check for a word boundary, which is what we
> really want.

\b is a Linux-ism (that is, glibc supports it, but BSD libc does not).

https://mail-index.netbsd.org/tech-userlevel/2012/12/02/msg006954.html


> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
> Reproducible with:
> $ ./check -qcow2 -o refcount_bits=1
> (The tests touched here should be skipped)
> 
> I don't know whether \b is portable.  I hope it is.
> (This is why I CC-ed you, Eric.)

No, it's not portable.  \> and [[:>:]] are other spellings for the same
task, equally non-portable.

> 
> Then again, it appears that nobody ever runs the iotests with
> refcount_bits=1 but me, and I do that on Linux.  So even if it isn't
> portable, it shouldn't be an issue in practice... O:)

What exactly is failing?  Is it merely a case of our python script
running the regex against "${unsupported_imgopts}" instead of
"${unsupported_imgsopts} " with an added trailing space to guarantee
that we have something to match against?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


