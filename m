Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFDD700D46
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 18:46:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxVtF-0005cb-5Y; Fri, 12 May 2023 12:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxVtC-0005cS-Pm
 for qemu-devel@nongnu.org; Fri, 12 May 2023 12:45:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxVtB-0005r5-2M
 for qemu-devel@nongnu.org; Fri, 12 May 2023 12:45:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683909903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qpchDY7Y+Iu7IMfmf9h9Pfm0FYbFA9AZA5k7HXJ7C+o=;
 b=OvFEZ1Mwu9ug8uYW8H7Vp1syQxgppOMMXV1dzmfoA1TF0/8iGbjrU8Uv7d6RmdXmh3Mh+r
 4zZV9E+mRoWQlkuGbORkxZBh6E7Y+14JtAkQ+I3UuvQ9rRlSO5djVI2X36lKI7rKbp4fXV
 yNTNge6y5feenULzLUYA3bdr7h9fVAg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-_zbyuSTHNZS6i_babfEzpQ-1; Fri, 12 May 2023 12:44:59 -0400
X-MC-Unique: _zbyuSTHNZS6i_babfEzpQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C50688CC43;
 Fri, 12 May 2023 16:44:59 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A13322166B26;
 Fri, 12 May 2023 16:44:58 +0000 (UTC)
Date: Fri, 12 May 2023 11:44:57 -0500
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com, armbru@redhat.com, richard.henderson@linaro.org
Subject: Re: [PATCH v2 08/19] cutils: Allow NULL endptr in parse_uint()
Message-ID: <usqxoetv45jseplj772vje7us234z77fnm7qsogn6767szewxj@g3s6rkm6ub76>
References: <20230512021033.1378730-1-eblake@redhat.com>
 <20230512021033.1378730-9-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512021033.1378730-9-eblake@redhat.com>
User-Agent: NeoMutt/20230512
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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


On Thu, May 11, 2023 at 09:10:22PM -0500, Eric Blake wrote:
> 
> All the qemu_strto*() functions permit a NULL endptr, just like their
> libc counterparts, leaving parse_uint() as the oddball that caused
> SEGFAULT on NULL and required the user to call parse_uint_full()
> instead.  Relax things for consistency, even though the testsuite is
> the only impacted caller.  Add one more unit test to ensure even
> parse_uint_full(NULL, 0, &value) works.  This also fixes our code to
> uniformly favor EINVAL over ERANGE when both apply.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  tests/unit/test-cutils.c | 18 ++++++++++++++++--
>  util/cutils.c            | 34 ++++++++++++----------------------
>  2 files changed, 28 insertions(+), 24 deletions(-)

> 
> @@ -788,28 +793,13 @@ out:
>   * @base: integer base, between 2 and 36 inclusive, or 0
>   * @value: Destination for parsed integer value
>   *
> - * Parse unsigned integer from entire string
> + * Parse unsigned integer from entire string, rejecting any trailing slop.
>   *
> - * Have the same behavior of parse_uint(), but with an additional
> - * check for additional data after the parsed number. If extra
> - * characters are present after a non-overflowing parsed number, the
> - * function will return -EINVAL, and *@v will be set to 0.
> + * Shorthand for parse_uint(s, NULL, base, value).

I'm just now noticing that I also had a nice side effect of removing
the reference to *@v when the parameter is actually named value.

>   */
>  int parse_uint_full(const char *s, int base, uint64_t *value)

I don't know if there is an easy way to test our doc comments for
mismatch from parameter names.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


