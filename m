Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B431F579423
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:27:59 +0200 (CEST)
Received: from localhost ([::1]:42278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDheA-0003mK-Le
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDhbB-0000f3-Bc
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:24:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDhb8-000686-VQ
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658215490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4GUwawcrTd1sdAZymiUmnofLbH00i1cUzhvqGJG9TlA=;
 b=Yn5rkWVkBK30YmOX5u6nRtPhqytKZA91drRLMRMsZ2UXUWTR/qId+nj0w21LDMYuDQfwHS
 DcOhFYKQ5Lhc9jtJ5N6K9qE7jC1hvu5vbKVs5oNFo3ev/a02cAg6MaoGT5Ec0/E8oFKfsM
 lLJlv4qiskgD+pst3kU8RT5vO8fc5ho=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-xXQVqFNYMdy_TbPSn88UWw-1; Tue, 19 Jul 2022 03:24:46 -0400
X-MC-Unique: xXQVqFNYMdy_TbPSn88UWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F213185A7BA;
 Tue, 19 Jul 2022 07:24:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2B2C2166B26;
 Tue, 19 Jul 2022 07:24:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CF46C21E690D; Tue, 19 Jul 2022 09:24:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Cleber Rosa
 <crosa@redhat.com>,  qemu-block@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Xie Yongji <xieyongji@bytedance.com>,  Kyle Evans
 <kevans@freebsd.org>,  Peter Maydell <peter.maydell@linaro.org>,  John
 Snow <jsnow@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Warner
 Losh <imp@bsdimp.com>,  Kevin Wolf <kwolf@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Laurent Vivier <laurent@vivier.eu>,  Fam
 Zheng <fam@euphon.net>,  Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 05/15] stubs: remove needless error_vprintf_unless_qmp()
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-6-marcandre.lureau@redhat.com>
Date: Tue, 19 Jul 2022 09:24:44 +0200
In-Reply-To: <20220712093528.4144184-6-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 12 Jul 2022 13:35:18 +0400")
Message-ID: <87r12hzhs3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  stubs/error-printf.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/stubs/error-printf.c b/stubs/error-printf.c
> index 0e326d801059..1afa0f62ca26 100644
> --- a/stubs/error-printf.c
> +++ b/stubs/error-printf.c
> @@ -16,8 +16,3 @@ int error_vprintf(const char *fmt, va_list ap)
>      }
>      return vfprintf(stderr, fmt, ap);
>  }
> -
> -int error_vprintf_unless_qmp(const char *fmt, va_list ap)
> -{
> -    return error_vprintf(fmt, ap);
> -}

Easy enough to add back should we ever need it.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


