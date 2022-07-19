Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C3E57A857
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 22:36:42 +0200 (CEST)
Received: from localhost ([::1]:56500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDtxP-0001t6-CG
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 16:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oDtw1-0000WB-FU
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 16:35:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oDtvx-0001Bf-Sg
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 16:35:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658262908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IN20gitrg5d2gf1h45S/mkrlzI4xg2pP7Msp5iRUPgw=;
 b=CAJmfog2uqxCj+NG7g339h5Eygb3f5U4hgRy48iancZzmI1+sCOj6QGnREu2Ci0CzBMdtA
 349bcpAvJ+/Y7GzQ0KHwdt0CxtDAtqTD/6x36mpJfYuk+7riwsmD0tX4ysCAvJB7e7u0L8
 U7a2FLdvhrUzIk7zOQnvVECqw7iLVUw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-HjTzVNqLOzyETAzEghP08Q-1; Tue, 19 Jul 2022 16:35:06 -0400
X-MC-Unique: HjTzVNqLOzyETAzEghP08Q-1
Received: by mail-qt1-f199.google.com with SMTP id
 f1-20020ac84641000000b0031ecb35e4d1so10838623qto.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 13:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IN20gitrg5d2gf1h45S/mkrlzI4xg2pP7Msp5iRUPgw=;
 b=5Me6U03/qtJmuKAAnc905Zln0dgZ6oIsxwQEC2N8F4oL/heex+d58oOQVqBr93Qa7X
 5IqmN1TVrOk/tEA7QTnRpifFwmQ+cxsBEvtMsYQqfv1IlVLyjeIEtHw4ZTXkUrl73CZb
 ry1DRdMsyMup5Wv6Z8tQJtUD27iTqhSMnUi7ia7jYkWZlV/H1vpJT7fX361QEY2RdRPY
 rYXtP0QP1pE+RXko7sGDATJiJR53I0K2/J4B5zBnDTAXGvaRHfbMyfyTKN056v/TUWdq
 A08MNRiqx4CBxtGR2TMXxRGNMc77zzpHlMxnaUumlSryFobx8EBnB7Miwe1EvN874fSP
 WzlQ==
X-Gm-Message-State: AJIora+Ik+OlwlXKXFVQU+R0nTo9dUJ8vXsubkvJr9qIi1ihElou/3ym
 sSQkOBzfRfYG2GIZSzjQOwHm/KVd/rEHvzF6m2Zwg/BoSCAithg3Nl81agwhTusxWbsTG3kZR60
 IgG5ihS81iCIgn7c=
X-Received: by 2002:ad4:5be8:0:b0:472:f169:de89 with SMTP id
 k8-20020ad45be8000000b00472f169de89mr27736821qvc.88.1658262906367; 
 Tue, 19 Jul 2022 13:35:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uAgWo8acc8jxvufP4MZc3nw71WJpIbjnrVx8fdfsbGEt4deyeAklTxmU9IzvQlj3vZ+rADkQ==
X-Received: by 2002:ad4:5be8:0:b0:472:f169:de89 with SMTP id
 k8-20020ad45be8000000b00472f169de89mr27736807qvc.88.1658262906099; 
 Tue, 19 Jul 2022 13:35:06 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-37-74-12-30-48.dsl.bell.ca. [74.12.30.48])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a05620a408300b006b60876f014sm805774qko.55.2022.07.19.13.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 13:35:05 -0700 (PDT)
Date: Tue, 19 Jul 2022 16:35:04 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/1] migration: Avoid false-positive on non-supported
 scenarios for zero-copy-send
Message-ID: <YtcVeCkZeR2a5nGa@xz-m1.local>
References: <20220719122345.253713-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220719122345.253713-1-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Tue, Jul 19, 2022 at 09:23:45AM -0300, Leonardo Bras wrote:
> Migration with zero-copy-send currently has it's limitations, as it can't
> be used with TLS nor any kind of compression. In such scenarios, it should
> output errors during parameter / capability setting.
> 
> But currently there are some ways of setting this not-supported scenarios
> without printing the error message:
> 
> !) For 'compression' capability, it works by enabling it together with
> zero-copy-send. This happens because the validity test for zero-copy uses
> the helper unction migrate_use_compression(), which check for compression
> presence in s->enabled_capabilities[MIGRATION_CAPABILITY_COMPRESS].
> 
> The point here is: the validity test happens before the capability gets
> enabled. If all of them get enabled together, this test will not return
> error.
> 
> In order to fix that, replace migrate_use_compression() by directly testing
> the cap_list parameter migrate_caps_check().
> 
> 2) For features enabled by parameters such as TLS & 'multifd_compression',
> there was also a possibility of setting non-supported scenarios: setting
> zero-copy-send first, then setting the unsupported parameter.
> 
> In order to fix that, also add a check for parameters conflicting with
> zero-copy-send on migrate_params_check().
> 
> 3) XBZRLE is also a compression capability, so it makes sense to also add
> it to the list of capabilities which are not supported with zero-copy-send.
> 
> Fixes: 1abaec9a1b2c ("migration: Change zero_copy_send from migration parameter to migration capability")
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/migration.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 78f5057373..c6260e54bf 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1274,7 +1274,9 @@ static bool migrate_caps_check(bool *cap_list,
>  #ifdef CONFIG_LINUX
>      if (cap_list[MIGRATION_CAPABILITY_ZERO_COPY_SEND] &&
>          (!cap_list[MIGRATION_CAPABILITY_MULTIFD] ||
> -         migrate_use_compression() ||
> +         cap_list[MIGRATION_CAPABILITY_COMPRESS] ||
> +         cap_list[MIGRATION_CAPABILITY_XBZRLE] ||
> +         migrate_multifd_compression() ||
>           migrate_use_tls())) {
>          error_setg(errp,
>                     "Zero copy only available for non-compressed non-TLS multifd migration");
> @@ -1511,6 +1513,17 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
>          error_prepend(errp, "Invalid mapping given for block-bitmap-mapping: ");
>          return false;
>      }
> +
> +#ifdef CONFIG_LINUX

A trivial nit: we don't need this since migrate_use_zero_copy_send() will
be defined unconditionally, and it's returning false with !CONFIG_LINUX.
So feel free to drop this if there's a new version.

> +    if (migrate_use_zero_copy_send() &&
> +        ((params->has_multifd_compression && params->multifd_compression) ||
> +         (params->has_tls_creds && params->tls_creds && *params->tls_creds))) {
> +        error_setg(errp,
> +                   "Zero copy only available for non-compressed non-TLS multifd migration");
> +        return false;
> +    }
> +#endif

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


