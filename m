Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7483C641541
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 10:29:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1OpG-0006ut-2B; Sat, 03 Dec 2022 04:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p1OpD-0006uj-Uz
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 04:28:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p1OpC-0003LK-CX
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 04:28:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670059725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nd167yFF+a4EX5cEhtPuSqkztVgQGHwXyTaC7/jorr8=;
 b=Uq0vhHA7jExD8Oo83077mhZlXwwqTPupNLqs1/yMz5GxQUkKonQiI8aL2D7vkT1TYOtdeB
 h+9xKIjhx90dwi7Jw8aLxrs6p3h3CsXR2podu1CGcpP2r2H2FKj1KvaF4SFqJWpO9NPiPH
 09jj5qUQ+jPFJv+ZnbYJz571rzTh5LA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-a_VoGiudNve_Ag8ZvuWZ4Q-1; Sat, 03 Dec 2022 04:28:44 -0500
X-MC-Unique: a_VoGiudNve_Ag8ZvuWZ4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 989D529AA2FA;
 Sat,  3 Dec 2022 09:28:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 636D52166B2A;
 Sat,  3 Dec 2022 09:28:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 502F621E6921; Sat,  3 Dec 2022 10:28:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,  Eric Blake
 <eblake@redhat.com>,  Juan Quintela <quintela@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 08/11] migration: Export dirty-limit time info
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <cover.1669047366.git.huangy81@chinatelecom.cn>
 <513421b79099d7f73b3db227b5eb347fe9a3c241.1669047366.git.huangy81@chinatelecom.cn>
Date: Sat, 03 Dec 2022 10:28:40 +0100
In-Reply-To: <513421b79099d7f73b3db227b5eb347fe9a3c241.1669047366.git.huangy81@chinatelecom.cn>
 (huangy's message of "Mon, 21 Nov 2022 11:26:40 -0500")
Message-ID: <87cz90omyf.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

huangy81@chinatelecom.cn writes:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> Export dirty limit throttle time and estimated ring full
> time, through which we can observe the process of dirty
> limit during live migration.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

[...]

> diff --git a/qapi/migration.json b/qapi/migration.json
> index af6b2da..62db5cb 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -242,6 +242,12 @@
>  #                   Present and non-empty when migration is blocked.
>  #                   (since 6.0)
>  #
> +# @dirty-limit-throttle-us-per-full: Throttle time (us) during the perio=
d of
> +#                                    dirty ring full (since 7.1)
> +#
> +# @dirty-limit-us-ring-full: Estimated periodic time (us) of dirty ring =
full.
> +#                            (since 7.1)

8.0

In review of v1, I asked you to explain the two members' meaning,
i.e. what exactly is being measured.  You replied.  Would it make sense
to work your explanation into the doc comments?

> +#
>  # Since: 0.14
>  ##
>  { 'struct': 'MigrationInfo',
> @@ -259,7 +265,9 @@
>             '*postcopy-blocktime' : 'uint32',
>             '*postcopy-vcpu-blocktime': ['uint32'],
>             '*compression': 'CompressionStats',
> -           '*socket-address': ['SocketAddress'] } }
> +           '*socket-address': ['SocketAddress'],
> +           '*dirty-limit-throttle-us-per-full': 'int64',
> +           '*dirty-limit-us-ring-full': 'int64'} }
>=20=20
>  ##
>  # @query-migrate:

[...]


