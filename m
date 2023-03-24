Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788A86C821A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 17:05:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfglL-00058w-1a; Fri, 24 Mar 2023 08:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfglJ-00058o-8d
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 08:43:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfgl8-0001Ym-Ec
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 08:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679661781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=elY2A6/FTPWEW52fWSfS6y8wHd0G8tNE8SA45vZzAzk=;
 b=fXiMehoaZDv8W7DxMccFrB3lzuP0BCkY3dKSnZe602wq/9IpNxOOpdr7MQYo86yOXPLTJ2
 YKwTVWDB1MYoRkqltDkp+mhrGQsD5BhX7OLKGn6RBA/Pe7jrts4OWpuEpIAmFgFp6JSaVF
 fsWE2eWo3QSVkP2yVIU3j/abVjPj86s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-Lz6wtHDyMC-gpzYhZnFYLA-1; Fri, 24 Mar 2023 08:11:53 -0400
X-MC-Unique: Lz6wtHDyMC-gpzYhZnFYLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C78C88F4CC;
 Fri, 24 Mar 2023 12:11:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E54032166B29;
 Fri, 24 Mar 2023 12:11:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0970521E6926; Fri, 24 Mar 2023 13:11:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Juan Quintela
 <quintela@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Eric Blake <eblake@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 06/10] migration: Introduce dirty-limit capability
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
 <cover.1676563222.git.huangy81@chinatelecom.cn>
 <a9952eaa2bf3c8066b0e8dee066b57395ffa37b1.1676563222.git.huangy81@chinatelecom.cn>
Date: Fri, 24 Mar 2023 13:11:36 +0100
In-Reply-To: <a9952eaa2bf3c8066b0e8dee066b57395ffa37b1.1676563222.git.huangy81@chinatelecom.cn>
 (huangy's message of "Fri, 17 Feb 2023 00:18:35 +0800")
Message-ID: <871qlepcw7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
> Introduce migration dirty-limit capability, which can
> be turned on before live migration and limit dirty
> page rate durty live migration.
>
> Introduce migrate_dirty_limit function to help check
> if dirty-limit capability enabled during live migration.
>
> Meanwhile, refactor vcpu_dirty_rate_stat_collect
> so that period can be configured instead of hardcoded.
>
> dirty-limit capability is kind of like auto-converge
> but using dirty limit instead of traditional cpu-throttle
> to throttle guest down. To enable this feature, turn on
> the dirty-limit capability before live migration using
> migrate-set-capabilities, and set the parameters
> "x-vcpu-dirty-limit-period", "vcpu-dirty-limit" suitably
> to speed up convergence.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> Acked-by: Peter Xu <peterx@redhat.com>

[...]

> diff --git a/qapi/migration.json b/qapi/migration.json
> index d33cc2d582..b7a92be055 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -477,6 +477,8 @@
>  #                    will be handled faster.  This is a performance feat=
ure and
>  #                    should not affect the correctness of postcopy migra=
tion.
>  #                    (since 7.1)
> +# @dirty-limit: Use dirty-limit to throttle down guest if enabled.
> +#               (since 8.0)

Feels too terse.  What exactly is used and how?  It's not the capability
itself (although the text sure sounds like it).  I guess it's the thing
you set with command set-vcpu-dirty-limit.

Is that used only when the capability is set?

>  #
>  # Features:
>  # @unstable: Members @x-colo and @x-ignore-shared are experimental.
> @@ -492,7 +494,7 @@
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>             { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
>             'validate-uuid', 'background-snapshot',
> -           'zero-copy-send', 'postcopy-preempt'] }
> +           'zero-copy-send', 'postcopy-preempt', 'dirty-limit'] }
>=20=20
>  ##
>  # @MigrationCapabilityStatus:

[...]


