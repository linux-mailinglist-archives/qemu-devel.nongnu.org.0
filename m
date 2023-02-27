Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA82D6A4266
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:16:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdLM-00022A-Al; Mon, 27 Feb 2023 08:15:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pWdLK-00021p-HN
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:15:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pWdLI-0003Uz-Cz
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677503698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q/yoaebg/hPew7G8KL1l23oCVpV53iKZ2MjvQVPFa30=;
 b=Md10K/XfzgQAypscVFPS5DaVpR0AMCih6Y/AG0ic87wBV9GZHs2XVlo8Lt0gtGhVk27cd6
 9HOSuNv6zTv9NVxLYkqNai/uhW7rXhi27NiWvkZOlVELkIMJdbuHgqinfdBTa+lkkIdkc7
 UN5i3PDGSG+mHGeQEIBP4YTlFkTBXEA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-CzS15d-bN2KUQWJ5axiWEA-1; Mon, 27 Feb 2023 08:14:55 -0500
X-MC-Unique: CzS15d-bN2KUQWJ5axiWEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2F29857A8E;
 Mon, 27 Feb 2023 13:14:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A19B318EC7;
 Mon, 27 Feb 2023 13:14:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B606821E6A1F; Mon, 27 Feb 2023 14:14:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Markus Armbruster <armbru@redhat.com>,  Juan
 Quintela <quintela@redhat.com>
Subject: Re: [PATCH 1/2] qapi: Do not generate default switch case in
 gen_visit_object_members()
References: <20230224155451.20211-1-philmd@linaro.org>
 <20230224155451.20211-2-philmd@linaro.org>
Date: Mon, 27 Feb 2023 14:14:53 +0100
In-Reply-To: <20230224155451.20211-2-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 24 Feb 2023 16:54:50
 +0100")
Message-ID: <87edqbqmgi.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> When iterating over a QAPISchemaEnumType, all possible
> values are covered. The 'default' switch case is unreachable,
> remove it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  scripts/qapi/visit.py | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> index 26a584ee4c..f66a31a963 100644
> --- a/scripts/qapi/visit.py
> +++ b/scripts/qapi/visit.py
> @@ -159,8 +159,6 @@ def gen_visit_object_members(name: str,
>=20=20
>              ret +=3D var.ifcond.gen_endif()
>          ret +=3D mcgen('''
> -    default:
> -        abort();
>      }
>  ''')

This results in a bunch of warnings like

    warning: enumeration value =E2=80=98FOO__MAX=E2=80=99 not handled in sw=
itch [-Wswitch]

Obvious fix: squash into the next patch.


