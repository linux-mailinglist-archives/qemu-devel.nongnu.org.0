Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41134558AB6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:29:06 +0200 (CEST)
Received: from localhost ([::1]:44834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UNt-0005Ux-CC
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1o4ULb-00038k-Eo
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 17:26:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1o4ULY-0005SO-Jr
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 17:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656019600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=llQEdVzE2jybLpA7zD4KEh3xfXufP5rHEj7jziJhHiQ=;
 b=H0mXhlEyqRm3G4MCQm6seu10K2+r6uG02n7ZKdvGAGBP3ywp3rJfmbyMH14JV+IvQfwkyJ
 kKoOfcS+BOAzD1gily2QFniN9x8B0n+h4rZ8c4AfKQ1jiTYcuLuaJTcpY/3zoQ7ezbPy14
 +p1qDoU/KqffLPRElVNOuPXwtLqVRIM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-sgtCnaeIOLe6emHuBu5nyA-1; Thu, 23 Jun 2022 17:26:36 -0400
X-MC-Unique: sgtCnaeIOLe6emHuBu5nyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 602E6380670A;
 Thu, 23 Jun 2022 21:26:36 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BA452026D64;
 Thu, 23 Jun 2022 21:26:34 +0000 (UTC)
Date: Thu, 23 Jun 2022 16:26:33 -0500
From: Eric Blake <eblake@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Fam Zheng <fam@euphon.net>,
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v5 06/10] block: Make 'bytes' param of
 bdrv_co_{pread,pwrite,preadv,pwritev}() an int64_t
Message-ID: <20220623212633.e76bqsvdhg4qhza4@redhat.com>
References: <20220609152744.3891847-1-afaria@redhat.com>
 <20220609152744.3891847-7-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609152744.3891847-7-afaria@redhat.com>
User-Agent: NeoMutt/20220429-136-41baff
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 09, 2022 at 04:27:40PM +0100, Alberto Faria wrote:
> For consistency with other I/O functions, and in preparation to
> implement bdrv_{pread,pwrite}() using generated_co_wrapper.
> 
> unsigned int fits in int64_t, so all callers remain correct.
> 
> bdrv_check_request32() is called further down the stack and causes -EIO
> to be returned if 'bytes' is negative or greater than
> BDRV_REQUEST_MAX_BYTES, which in turns never exceeds SIZE_MAX.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>  block/coroutines.h           | 4 ++--
>  include/block/block_int-io.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


