Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4CF43E443
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 16:52:22 +0200 (CEST)
Received: from localhost ([::1]:34530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg6lR-0000X4-9W
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 10:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mg6hG-0004Bi-Rr
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:48:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mg6hF-0001wH-BT
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:48:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635432480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZcQj5nsryuWUyzenSBZe4MSLsYu3EJuCNN9FahbbQ0U=;
 b=V6so7jq2YkNTlK9Wz+Hmnym1KLJ2VOtJHeaPKqeUu08nVnRP1VjgFqVlz5gjUf0TGc1LHo
 dhGTMtmspMUAJn9t6XqgQrAUCrxNEog0j5VLou8CT1qpcQKblHKWu1LlclahsOR6n9dCaY
 TR9P+8RJFcwA08jhIhR8B2gq3NJPGo4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-OqM6Q1z6OvC1L21aCgdZnA-1; Thu, 28 Oct 2021 10:47:57 -0400
X-MC-Unique: OqM6Q1z6OvC1L21aCgdZnA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29D0019251A0;
 Thu, 28 Oct 2021 14:47:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E07DF5D9DE;
 Thu, 28 Oct 2021 14:47:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 97D9C11380A7; Thu, 28 Oct 2021 16:47:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 05/19] docs/devel: document expectations for HMP
 commands in the future
References: <20210930132349.3601823-1-berrange@redhat.com>
 <20210930132349.3601823-6-berrange@redhat.com>
Date: Thu, 28 Oct 2021 16:47:54 +0200
In-Reply-To: <20210930132349.3601823-6-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Thu, 30 Sep 2021 14:23:35
 +0100")
Message-ID: <87mtmtnr39.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> We no longer wish to have commands implemented in HMP only. All commands
> should start with a QMP implementation and the HMP merely be a shim
> around this. To reduce the burden of implementing QMP commands where
> there is low expectation of machine usage, requirements for QAPI
> modelling are relaxed provided the command is under the "x-" name
> prefix.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  docs/devel/writing-monitor-commands.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing=
-monitor-commands.rst
> index 82a382d700..8fb855e192 100644
> --- a/docs/devel/writing-monitor-commands.rst
> +++ b/docs/devel/writing-monitor-commands.rst
> @@ -11,6 +11,14 @@ For an in-depth introduction to the QAPI framework, pl=
ease refer to
>  docs/devel/qapi-code-gen.txt. For documentation about the QMP protocol,
>  start with docs/interop/qmp-intro.txt.
> =20
> +New commands may be implemented in QMP only.  New HMP commands should be
> +implemented on top of QMP.  The typical HMP command wraps around an
> +equivalent QMP command, but HMP convenience commands built from QMP
> +building blocks are also fine.  The long term goal is to make all
> +existing HMP commands conform to this, to fully isolate HMP from the
> +internals of QEMU. Refer to the `Writing a debugging aid returning
> +unstructured text`_ section for further guidance on commands that
> +would have traditionally been HMP only.
> =20
>  Overview
>  --------

Reviewed-by: Markus Armbruster <armbru@redhat.com>


