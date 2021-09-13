Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682B04083CA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 07:24:33 +0200 (CEST)
Received: from localhost ([::1]:49056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPeSG-0000VT-Fu
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 01:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPeRC-0008BC-3P
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 01:23:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPeRA-00060I-PZ
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 01:23:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631510604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2TyyXGaaUThXswivazXRu0oucvnVRHvpBzf+0F0/wIM=;
 b=LdOnseZoVvOtdyvWTUTlRUtiAtveHb0+d9UTlI7e5r0zkpWlA4rBEbZzrTd9HhKGK7Jagr
 8f3VWCpDGgVlEG2anLzRa2RwRwNFt8o6qmq2iNXU6Hw7IBWvWLHmrnYMpOECT155RtKsVi
 F5v9M7cxOD9ZTVcpMRPM9IM9iTAA558=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-p2tZdJ2RPSS_U07rg_I_Gw-1; Mon, 13 Sep 2021 01:23:22 -0400
X-MC-Unique: p2tZdJ2RPSS_U07rg_I_Gw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE357835DE0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 05:23:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FBD75C25A;
 Mon, 13 Sep 2021 05:23:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 43A7A113865F; Mon, 13 Sep 2021 07:23:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qapi: define cleanup function for g_autoptr(Error)
References: <20210912124834.503032-1-pbonzini@redhat.com>
Date: Mon, 13 Sep 2021 07:23:20 +0200
In-Reply-To: <20210912124834.503032-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Sun, 12 Sep 2021 14:48:34 +0200")
Message-ID: <87fsu959rr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Allow replacing calls to error_free() with g_autoptr(Error)
> declarations.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qapi/error.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/qapi/error.h b/include/qapi/error.h
> index 4a9260b0cc..8564657baf 100644
> --- a/include/qapi/error.h
> +++ b/include/qapi/error.h
> @@ -437,6 +437,8 @@ Error *error_copy(const Error *err);
>   */
>  void error_free(Error *err);
>  
> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(Error, error_free);
> +
>  /*
>   * Convenience function to assert that *@errp is set, then silently free it.
>   */

I'd like to see at least one actual use.


