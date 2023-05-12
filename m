Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4051B70077D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:12:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxRcp-0005uZ-Gx; Fri, 12 May 2023 08:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxRcm-0005ty-TI
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:11:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxRcl-00057r-5C
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683893506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7reO6L9PPe3cT9EM0vc7fydxYVmSyfBNaLgPVXWcfuw=;
 b=UKY+5FEiTQMJmwPAnSEFJHOXF7vlmg32yvhipKc8CSlAxFhU64yLHyOHq2VyZ8+lf8a6/m
 L9v5laqQrJWWFOOuxZK9dzEzIlYZ/cIEFnmgHJgPxXn9d8aUn0L/IW08C7TFm2mK0Wyp62
 aRreP/34SA8uLZxElKJOgQR37lYCrBI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-94rE4q_YPGyNWcboyQvvrA-1; Fri, 12 May 2023 08:11:43 -0400
X-MC-Unique: 94rE4q_YPGyNWcboyQvvrA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68E0A29AA2F5;
 Fri, 12 May 2023 12:11:43 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73A222026D16;
 Fri, 12 May 2023 12:11:42 +0000 (UTC)
Date: Fri, 12 May 2023 07:11:40 -0500
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com, armbru@redhat.com, richard.henderson@linaro.org
Subject: Re: [PATCH v2 01/19] test-cutils: Avoid g_assert in unit tests
Message-ID: <mwnt5y5lfzfpsad7ifsb445oxeek57eitb2dicq5g5uqgpy6zj@n73mraqedqux>
References: <20230512021033.1378730-1-eblake@redhat.com>
 <20230512021033.1378730-2-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512021033.1378730-2-eblake@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

On Thu, May 11, 2023 at 09:10:15PM -0500, Eric Blake wrote:
> glib documentation[1] is clear: g_assert() should be avoided in unit
> tests because it is ineffective if G_DISABLE_ASSERT is defined; unit
> tests should stick to constructs based on g_assert_true() instead.
> Note that since commit 262a69f428, we intentionally state that you
> cannot define G_DISABLE_ASSERT that while building qemu; but our code

s/that //

> can be copied to other projects without that restriction, so we should
> be consistent.
> 
> For most of the replacements in this patch, using g_assert_cmpstr()
> would be a regression in quality - although it would helpfully display
> the string contents of both pointers on test failure, here, we really
> do care about pointer equality, not just string content equality.  But
> when a NULL pointer is expected, g_assert_null works fine.
> 
> [1] https://libsoup.org/glib/glib-Testing.html#g-assert
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>  tests/unit/test-cutils.c | 324 +++++++++++++++++++--------------------
>  1 file changed, 162 insertions(+), 162 deletions(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


