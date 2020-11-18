Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F86F2B81F9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 17:34:25 +0100 (CET)
Received: from localhost ([::1]:41580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfQPY-0002NB-Kh
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 11:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfQNP-0000vy-4v
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:32:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfQNM-00041Y-G4
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605717127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L45AhtxjNGKAfJPPoWU/t1MSnnl9MGCfrt8yvR5FXXQ=;
 b=CzPmq107UMcuCJ0VYNVSZ6kWUbBAfg5Q90Xa9s39rBh0ZCm6bOSrvpF7y0sZVUS2pxEBSS
 vhzgdoSYfowW+q9okgBrihl6nKbwh4DsfgoEBCeAUMPZjYn65jk4ixiBl7nqnrhrbtgHmr
 EZUVJuAWv0XCCIQ0gdTMF1W8gFAqqxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-1-YXF4UXMa-6JWUDyuMHfA-1; Wed, 18 Nov 2020 11:31:59 -0500
X-MC-Unique: 1-YXF4UXMa-6JWUDyuMHfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07EC2100C62E
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 16:31:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90B6F10016FE;
 Wed, 18 Nov 2020 16:31:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9641911358BA; Wed, 18 Nov 2020 17:31:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH] dbus-vmstate: replace g_return with error handling
References: <20201118082942.34167-1-marcandre.lureau@redhat.com>
Date: Wed, 18 Nov 2020 17:31:41 +0100
In-Reply-To: <20201118082942.34167-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 18 Nov 2020 12:29:42 +0400")
Message-ID: <877dqihbiq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Since g_input_stream_read_all() may return less than requested when the
> stream is malformed, we should treat this condition as a runtime user
> error (g_return are for programming errors).
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  backends/dbus-vmstate.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
> index bd050e8e9c..616d291cfb 100644
> --- a/backends/dbus-vmstate.c
> +++ b/backends/dbus-vmstate.c
> @@ -229,7 +229,10 @@ static int dbus_vmstate_post_load(void *opaque, int =
version_id)
>                                       &bytes_read, NULL, &err)) {
>              goto error;
>          }
> -        g_return_val_if_fail(bytes_read =3D=3D len, -1);
> +        if (bytes_read !=3D len) {
> +            error_report("%s: Failed to read proxy Id", __func__);

Error messages containing function names are code smell.  It's
consustent with nearby errors, i.e. this patch is not to blame.

> +            return -1;
> +        }
>          id[len] =3D 0;
> =20
>          trace_dbus_vmstate_loading(id);

Reviewed-by: Markus Armbruster <armbru@redhat.com>


