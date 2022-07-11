Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD540570BE3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 22:34:04 +0200 (CEST)
Received: from localhost ([::1]:45474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB06V-0006es-Cg
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 16:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB034-000322-94
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 16:30:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB02y-0000x9-OM
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 16:30:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657571424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TLrcIlM+JoKqFwKcxXSLKZFwgjJVx62DbtgUizDbsOw=;
 b=FWmw0vSaV3AaWTCxa4ow+2KPMWIKCDcJSGg75a5xPX+PVtouiiKqb9738z9acioPYqwgf2
 EpJ181xH1sTzk448o5Z82z5lBoCQ0FhwaHOCCtItE3QUD/ojMT2uaswVQAZrsfpco+vU2g
 1tr0U3rdnBFcbJXESfHo1fujSeC/UDQ=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-UuWRARweMUeACoIX5S3-OQ-1; Mon, 11 Jul 2022 16:30:23 -0400
X-MC-Unique: UuWRARweMUeACoIX5S3-OQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 38-20020a9f22a9000000b00382735c8f92so1202819uan.19
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 13:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TLrcIlM+JoKqFwKcxXSLKZFwgjJVx62DbtgUizDbsOw=;
 b=lSnDZyhhx7Ypd35DxSJee9nxUnzumn9MkBhJGTCGsYPMzPyBnpKBMLCQrzu51leHbP
 gPZdGEvUn62BA5sXPMDdkQgTYZacnQy/CabZmXriXErxVrQmWvxLBFDbVjwrRXJJi9yg
 hmhuwkiPINSc+o3YvenlBuYif/eT+wIqLQRWPGi3kMZg7PY1vwGAQOFCMklZV5RnvNN9
 K1LRxgVRj3BIGa3ZSpdXTo2LD1rWehI6VWpyiRgrilthivsedU9x44/Dep4XlIbdY+nP
 v8RNnSdIzKvjFSrZj2EsfAL+sWvgNN7c2IcYwrikxGbks7xIQ4nG9N/4qfTrjTiMLvOl
 5OKA==
X-Gm-Message-State: AJIora/zTLdXptV6EdUCf7Dt5fo3VENaaEdSxMzzTVVkIj6vfBeLLiEa
 4xqBDnbkRY6WKMZgJXU4Uby+PnYxFfKUL76OPKV9RA5qb49u4Y9Y5jpQ9W9+MevxsJT7bSjgLKb
 mZDLEDfevK2gOgXASRbcQlBYphGkbLkk=
X-Received: by 2002:ab0:7706:0:b0:383:589e:1925 with SMTP id
 z6-20020ab07706000000b00383589e1925mr2082934uaq.42.1657571422544; 
 Mon, 11 Jul 2022 13:30:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uw3exorh1eIDkc79sVUmvJ9ADptNJquZDGRq3t0UYjZ88CIePD468zfBU3GrGML9ISGrXz4rjmHUGSe2RnktQ=
X-Received: by 2002:ab0:7706:0:b0:383:589e:1925 with SMTP id
 z6-20020ab07706000000b00383589e1925mr2082925uaq.42.1657571422317; Mon, 11 Jul
 2022 13:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220711095721.61280-1-thuth@redhat.com>
In-Reply-To: <20220711095721.61280-1-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 11 Jul 2022 16:30:11 -0400
Message-ID: <CAFn=p-ZKR-1W-4yuXSEh10mu5M-PEZdf693vpWsEtEAOHL2gaw@mail.gmail.com>
Subject: Re: [PATCH] python/qemu/qmp/legacy: Replace 'returns-whitelist' with
 the correct type
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Jul 11, 2022 at 5:57 AM Thomas Huth <thuth@redhat.com> wrote:
>
> 'returns-whitelist' has been renamed to 'command-returns-exceptions' in
> commit b86df3747848 ("qapi: Rename pragma *-whitelist to *-exceptions").
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  python/qemu/qmp/legacy.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
> index 03b5574618..1951754455 100644
> --- a/python/qemu/qmp/legacy.py
> +++ b/python/qemu/qmp/legacy.py
> @@ -50,7 +50,7 @@
>
>  # QMPMessage can be outgoing commands or incoming events/returns.
>  # QMPReturnValue is usually a dict/json object, but due to QAPI's
> -# 'returns-whitelist', it can actually be anything.
> +# 'command-returns-exceptions', it can actually be anything.
>  #
>  # {'return': {}} is a QMPMessage,
>  # {} is the QMPReturnValue.
> --
> 2.31.1
>

May I cajole you to send a MR to
https://gitlab.com/qemu-project/python-qemu-qmp ?

(Sorry for the duplicated effort while the library isn't 100% split
out of the tree yet.)

In this case, for qemu.git:

Reviewed-by: John Snow <jsnow@redhat.com>


