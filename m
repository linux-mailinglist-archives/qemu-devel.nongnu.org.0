Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C0A6FB972
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 23:21:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw8IC-0005Nw-VM; Mon, 08 May 2023 17:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw8I9-0005NX-LZ
 for qemu-devel@nongnu.org; Mon, 08 May 2023 17:21:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw8I6-0007O4-Rb
 for qemu-devel@nongnu.org; Mon, 08 May 2023 17:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683580865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2cuuWEa/yKthh6ygjVaQ3++pTZ7S3JDOp/QD5YsWVAs=;
 b=H8PSxkWog46hx0jII3kHgS84kA3sPl9C4BPsUqzkEvEEvewcHrmTHOkEeeb3Y+on1smiVm
 4JQEpeXA63gF/HdLbsZ4dw80l+TlrM+wh7VyjgK4Nd1tlWzhlP8HbIfNbYocWx8GpknrWu
 IDhrcL7RXqqfBocAaU3WGLAR6BtRskU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-wLpXucpdPzCOE3ppi9-kWA-1; Mon, 08 May 2023 17:21:04 -0400
X-MC-Unique: wLpXucpdPzCOE3ppi9-kWA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CA67185A790
 for <qemu-devel@nongnu.org>; Mon,  8 May 2023 21:21:04 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99680492B07;
 Mon,  8 May 2023 21:21:03 +0000 (UTC)
Date: Mon, 8 May 2023 16:21:01 -0500
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com
Subject: Re: [PATCH 11/11] cutils: Improve qemu_strtosz handling of fractions
Message-ID: <c5zvwoqisxl4mfypycfc55vqcmlkpqnclyujq2zckdzvlrtytz@dlpk6lgor5ap>
References: <20230508200343.791450-1-eblake@redhat.com>
 <20230508200343.791450-12-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508200343.791450-12-eblake@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, May 08, 2023 at 03:03:43PM -0500, Eric Blake wrote:
> We have several limitations and bugs worth fixing; they are
> inter-related enough that it is not worth splitting this patch into
> smaller pieces:
> 
> * ".5k" should work to specify 512, just as "0.5k" does
> * "1.9999k" and "1." + "9"*50 + "k" should both produce the same
>   result of 2048 after rounding
> * "1." + "0"*350 + "1B" should not be treated the same as "1.0B";
>   underflow in the fraction should not be lost
> * "7.99e99" and "7.99e999" look similar, but our code was doing a
>   read-out-of-bounds on the latter because it was not expecting ERANGE
>   due to overflow. While we document that scientific notation is not
>   supported, and the previous patch actually fixed
>   qemu_strtod_finite() to no longer return ERANGE overflows, it is
>   easier to pre-filter than to try and determine after the fact if
>   strtod() consumed more than we wanted.  Note that this is a
>   low-level semantic change (when endptr is not NULL, we can now
>   successfully parse with a scale of 'E' and then report trailing
>   junk, instead of failing outright with EINVAL); but an earlier
>   commit already argued that this is not a high-level semantic change
>   since the only caller passing in a non-NULL endptr also checks that
>   the tail is whitespace-only.
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1629

Also,

Fixes: cf923b78 ("utils: Improve qemu_strtosz() to have 64 bits of precision", 6.0.0)
Fixes: 7625a1ed ("utils: Use fixed-point arithmetic in qemu_strtosz", 6.0.0)

> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  tests/unit/test-cutils.c | 51 +++++++++++------------
>  util/cutils.c            | 89 ++++++++++++++++++++++++++++------------
>  2 files changed, 88 insertions(+), 52 deletions(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


