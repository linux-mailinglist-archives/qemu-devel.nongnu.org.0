Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0E72F4BF7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 14:08:02 +0100 (CET)
Received: from localhost ([::1]:60242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzfsX-00087M-Sa
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 08:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzfpE-0007OW-RQ
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:04:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzfoz-0002Ls-Vg
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610543059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a0dBtvwZSWy8e52Nm+ojwoDoPbLtB99ewM72K2DGQ60=;
 b=YuWQYRF7U7fLzuTjAUTcY7vK/0dLFDQ+KsXSnxg8bivl4xZLfbFth5f7PXFfjEiW6dSX4J
 4jopA78LiyMSCgL9plQkmsGRreXwQzqvBrxMXLjcp13g4qiC2NSPfTLhRlSlNXKrNHnCGn
 o+daXFjQEMs5IaBKHMDbIOOBOB7KeHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-2eJiJCtqMTea1xLSSqAH1A-1; Wed, 13 Jan 2021 08:04:17 -0500
X-MC-Unique: 2eJiJCtqMTea1xLSSqAH1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B728192D785;
 Wed, 13 Jan 2021 13:04:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0158A5E1A4;
 Wed, 13 Jan 2021 13:04:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8AB1411386A7; Wed, 13 Jan 2021 14:04:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 5/7] qapi: Introduce QAPI_LIST_APPEND
References: <20201223221102.390740-1-eblake@redhat.com>
 <20201223221102.390740-6-eblake@redhat.com>
Date: Wed, 13 Jan 2021 14:04:14 +0100
In-Reply-To: <20201223221102.390740-6-eblake@redhat.com> (Eric Blake's message
 of "Wed, 23 Dec 2020 16:11:00 -0600")
Message-ID: <877doh0z01.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> Similar to the existing QAPI_LIST_PREPEND, but designed for use where
> we want to preserve insertion order.  Callers will be added in
> upcoming patches.  Note the difference in signature: PREPEND takes
> List*, APPEND takes List**.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  include/qapi/util.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/include/qapi/util.h b/include/qapi/util.h
> index 6178e98e97a5..8b4967990c0d 100644
> --- a/include/qapi/util.h
> +++ b/include/qapi/util.h
> @@ -37,4 +37,17 @@ int parse_qapi_name(const char *name, bool complete);
>      (list) = _tmp; \
>  } while (0)
>
> +/*
> + * For any pointer to a GenericList @tail, insert @element at the back and
> + * update the tail.
> + *
> + * Note that this macro evaluates @element exactly once, so it is safe
> + * to have side-effects with that argument.
> + */
> +#define QAPI_LIST_APPEND(tail, element) do { \
> +    *(tail) = g_malloc0(sizeof(**(tail))); \
> +    (*(tail))->value = (element); \
> +    (tail) = &(*tail)->next; \
> +} while (0)
> +
>  #endif

You mentioned parenthesizing the lone unparenthesized occurence of
@tail, like

  +    (tail) = &(*(tail))->next; \

Did you decide not to?


