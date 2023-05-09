Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D13F6FCAD4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 18:11:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPux-0003xb-J4; Tue, 09 May 2023 12:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pwPut-0003x5-Cz
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:10:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pwPur-0002it-TU
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:10:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683648617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YpMRu0xED8rYS7uWeKuD8XzVTcNgVfqXcSv6XflUBaM=;
 b=g3W82XnnRRTECUHoHI1PxCGQajP2z5Z9oZhw/NB7sg321XdNYYDYyEhZ11OU0NswTNBaK5
 ClHDxYwM1k57qMkVylnYsMxipaeKBp4hDwJZ651I1rpTP03V4HdfgetHE5jzcZKgjEu+gY
 UQI8PitfPVXBVCJTmpI/2VKHuSfNmu0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-jBjFazhKOMuEjhFz5y06zQ-1; Tue, 09 May 2023 12:10:14 -0400
X-MC-Unique: jBjFazhKOMuEjhFz5y06zQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 781F13813F38
 for <qemu-devel@nongnu.org>; Tue,  9 May 2023 16:10:14 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36318492C13;
 Tue,  9 May 2023 16:10:14 +0000 (UTC)
Date: Tue, 9 May 2023 11:10:12 -0500
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com
Subject: Re: [PATCH 06/11] test-cutils: Add more coverage to qemu_strtosz
Message-ID: <vw3duyug4uol6vielnapvafc56oa3tug7wvat3pscmy42wmtae@63fnaekz424s>
References: <20230508200343.791450-1-eblake@redhat.com>
 <20230508200343.791450-7-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508200343.791450-7-eblake@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 08, 2023 at 03:03:38PM -0500, Eric Blake wrote:
> Add some more strings that the user might send our way.  In
> particular, some of these additions include FIXME comments showing
> where our parser doesn't quite behave the way we want.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  tests/unit/test-cutils.c | 226 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 215 insertions(+), 11 deletions(-)
> 

> @@ -2704,13 +2749,30 @@ static void test_qemu_strtosz_invalid(void)
> 
>      str = " \t ";
>      endptr = NULL;
> +    res = 0xbaadf00d;
>      err = qemu_strtosz(str, &endptr, &res);
>      g_assert_cmpint(err, ==, -EINVAL);
>      g_assert_cmphex(res, ==, 0xbaadf00d);
>      g_assert_true(endptr == str);
> 
> +    str = ".";
> +    endptr = NULL;
> +    res = 0xbaadf00d;
> +    err = qemu_strtosz(str, &endptr, &res);
> +    g_assert_cmpint(err, ==, -EINVAL);
> +    g_assert_cmphex(res, ==, 0xbaadf00d);
> +    g_assert(endptr == str);

Rebase botch.  I should be using g_assert_true() here in line with
earlier in the series.  I think I cleaned it up later in the series,
but shouldn't be churning on it that badly.  Looks like I get to send
a v2 to fix this and other things; I'll wait another day for other
reviews first.  (That's what I get for rearranging patches after the
fact for a nicer presentation order...)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


