Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A32666C915
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:46:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHScG-0004Wj-U1; Mon, 16 Jan 2023 11:45:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pHScC-0004Ni-QC
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:45:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pHScA-0004iR-QK
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:45:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673887540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJHPTUqOm06iuk5CQ3eyuo7SM6vCmzGcotUi5cguy1Q=;
 b=A29F8t2fNO7jeN6BTLb3lySi7IpH6aDIesqcZU9pUwxQpD4N9j9qL5odwDSMKSLMBt/mvO
 6KFnU1mjRvkiBodSlWiUEKMpw2AnT+v2ZWG4n1AMOom451bGZONLKR+9FZ/Wme/siEiqmH
 XldhPYG97Tib1U3O27F2v2lTD3AY2E4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-216-iaIWrQr0OoibtU5YLbHRJA-1; Mon, 16 Jan 2023 11:45:39 -0500
X-MC-Unique: iaIWrQr0OoibtU5YLbHRJA-1
Received: by mail-ej1-f72.google.com with SMTP id
 qa18-20020a170907869200b007df87611618so19776156ejc.1
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 08:45:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AJHPTUqOm06iuk5CQ3eyuo7SM6vCmzGcotUi5cguy1Q=;
 b=LqElzpbNUUqXVy5O5zcJ5cXqRddssyooL7s/plo1pEoonbZevpMQQbWIf3mOODBLaZ
 0HI3UNYfPm28kKUhnyBcn686OgR7z9B7JyxNShRxU2uGyvYoxsbP8789FXheNf/zgWY+
 fmQFWA9rpHI9A55gXyt0O/hCDYwAXcoVfsZu43vZMrOiCuBU7E8o6vi9Pdf9Z7nzVrjQ
 jh0qtuBlLyp8EK9Yl3acyj5tgdCetsqwQc8XXyf7oaRjWmG/glFqrxy41a2IIfmwU/02
 tUI85z3moAk2H2hf+crHkA6pBlFkEQ5FcsV1M+un954KqKYeEFZW+rWBvycB8PMEsWT0
 t1WA==
X-Gm-Message-State: AFqh2koaM4T3DOvuJn4zNrZfMPmRuJxrmcwZk3bBkktf+Xm2DDdhRaqi
 SZDfc/Z81XA5VrNMBJSQYpHm+H/ZpIazFCJFoiuWR6H+cjC2QVkO9BY32tykgw7LloXnAr8SH7v
 6u2Ko3zs3IbB9WLM=
X-Received: by 2002:a05:6402:d55:b0:499:c294:77b6 with SMTP id
 ec21-20020a0564020d5500b00499c29477b6mr22961870edb.9.1673887538044; 
 Mon, 16 Jan 2023 08:45:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsCazXPP0HauozXCEt2CwHd8Z+/34G6TSrL38/C75Z+zuyYXDO4r0hoJI3UW8Tp4Se8Fyb99Q==
X-Received: by 2002:a05:6402:d55:b0:499:c294:77b6 with SMTP id
 ec21-20020a0564020d5500b00499c29477b6mr22961853edb.9.1673887537869; 
 Mon, 16 Jan 2023 08:45:37 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 s1-20020aa7d781000000b0048ecd372fc9sm11704919edq.2.2023.01.16.08.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 08:45:36 -0800 (PST)
Date: Mon, 16 Jan 2023 17:45:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH v3 5/7] hw/i386/acpi-build: Remove unused attributes
Message-ID: <20230116174535.197cd4e2@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230116152908.147275-6-shentey@gmail.com>
References: <20230116152908.147275-1-shentey@gmail.com>
 <20230116152908.147275-6-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Mon, 16 Jan 2023 16:29:06 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> Ammends commit 3db119da7915 'pc: acpi: switch to AML API composed DSDT'.
>=20
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/acpi-build.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 0be3960a37..428328dc2d 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -117,8 +117,6 @@ typedef struct AcpiMiscInfo {
>  #ifdef CONFIG_TPM
>      TPMVersion tpm_version;
>  #endif
> -    const unsigned char *dsdt_code;
> -    unsigned dsdt_size;
>  } AcpiMiscInfo;
> =20
>  typedef struct FwCfgTPMConfig {


