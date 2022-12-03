Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A2864153D
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 10:25:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1OlD-00061B-PN; Sat, 03 Dec 2022 04:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p1Ol6-00060s-RR
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 04:24:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p1Ol4-0001jt-OK
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 04:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670059470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iw1vvY/DqnwxEUQMO5T48p2fyGCPATNdMf8BO7oaBSE=;
 b=PMFToSK2XlTYfCObgIwGP1Uv1fbsrSLs34bclt50vShl3SMjrqqujaCDwkGtwVkin5hfI6
 xl+tsP2mz31I2r+/AmAjaC5E5d1oz9pKZ9XDxDAEPKegQLhR07X8yxcl5/ezQCMzTeNQ8Y
 wgfctZptic1Rh2DCmvo/qGm27yN8jDA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-FynyQ6mDPi-7Ce7ixh089Q-1; Sat, 03 Dec 2022 04:24:28 -0500
X-MC-Unique: FynyQ6mDPi-7Ce7ixh089Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF0E21C06ED9;
 Sat,  3 Dec 2022 09:24:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2BAC40C83BB;
 Sat,  3 Dec 2022 09:24:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B0C7821E6921; Sat,  3 Dec 2022 10:24:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,  Eric Blake
 <eblake@redhat.com>,  Juan Quintela <quintela@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 06/11] migration: Introduce dirty-limit capability
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <cover.1669047366.git.huangy81@chinatelecom.cn>
 <ebcdcd608420e928d627740938ee9929f8940d38.1669047366.git.huangy81@chinatelecom.cn>
Date: Sat, 03 Dec 2022 10:24:24 +0100
In-Reply-To: <ebcdcd608420e928d627740938ee9929f8940d38.1669047366.git.huangy81@chinatelecom.cn>
 (huangy's message of "Mon, 21 Nov 2022 11:26:38 -0500")
Message-ID: <87h6ycon5j.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, TRACKER_ID=0.1 autolearn=ham autolearn_force=no
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
> migratioin-set-capabilities, and set the parameters

migrate-set-capabilities

> "x-vcpu-dirty-limit-period", "vcpu-dirty-limit" suitably
> to speed up convergence.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> ---

[...]

> diff --git a/migration/migration.h b/migration/migration.h
> index cdad8ac..7fbb9f8 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -409,6 +409,7 @@ bool migrate_ignore_shared(void);
>  bool migrate_validate_uuid(void);
>=20=20
>  bool migrate_auto_converge(void);
> +bool migrate_dirty_limit(void);
>  bool migrate_use_multifd(void);
>  bool migrate_pause_before_switchover(void);
>  int migrate_multifd_channels(void);
> diff --git a/qapi/migration.json b/qapi/migration.json
> index dd667dd..af6b2da 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -477,6 +477,8 @@
>  #                    will be handled faster.  This is a performance feat=
ure and
>  #                    should not affect the correctness of postcopy migra=
tion.
>  #                    (since 7.1)
> +# @dirty-limit: Use dirty-limit to throttle down guest if enabled.
> +#               (since 7.1)

8.0

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


