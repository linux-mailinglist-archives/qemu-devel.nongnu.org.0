Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F2E2B905A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:47:06 +0100 (CET)
Received: from localhost ([::1]:36260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfhSz-0005rO-Jb
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:47:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfhNK-0000zN-Km
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:41:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfhNI-00028G-DJ
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:41:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605782470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SBnkeF+kmjFA2OJ98iFXEtMgdDVRwYyrh0lsICwh4ck=;
 b=Yy8ziuzF25/6f3wo0nTfywJZG0ZIGdqxLnMKxa5TzrRvJGONAOaSUaBYQr6Eq+p7Xk5C73
 728RnQlZWiM4iqwAXe+mt8drJvxrG/+ONX9KsPV1nMDky44CAtjUuxqnMvZ72brqBeZ+uI
 BhBTMY/UL45qXOUQLoOZwC3grj6tglA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-C3GesT7gO6OsqWNd0-afmg-1; Thu, 19 Nov 2020 05:41:08 -0500
X-MC-Unique: C3GesT7gO6OsqWNd0-afmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73857101F7A1
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 10:41:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 459C71E5;
 Thu, 19 Nov 2020 10:41:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A0FF211358BA; Thu, 19 Nov 2020 11:41:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 6/8] qlit: qlit_type() function
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-7-ehabkost@redhat.com>
Date: Thu, 19 Nov 2020 11:41:05 +0100
In-Reply-To: <20201116224143.1284278-7-ehabkost@redhat.com> (Eduardo Habkost's
 message of "Mon, 16 Nov 2020 17:41:41 -0500")
Message-ID: <877dqhd3y6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> Useful function where we need to check for the qlit type before
> converting it to an actual QObject.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  include/qapi/qmp/qlit.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/qapi/qmp/qlit.h b/include/qapi/qmp/qlit.h
> index f9e356d31e..acddb80831 100644
> --- a/include/qapi/qmp/qlit.h
> +++ b/include/qapi/qmp/qlit.h
> @@ -59,4 +59,9 @@ bool qlit_equal_qobject(const QLitObject *lhs, const QObject *rhs);
>  
>  QObject *qobject_from_qlit(const QLitObject *qlit);
>  
> +static inline QType qlit_type(const QLitObject *qlit)
> +{
> +    return qlit->type;
> +}
> +
>  #endif /* QLIT_H */

Hiding qlit->type behind a function makes sense only when the structure
of QLitObject is an implementation secret.  It don't think it is.


