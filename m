Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FFC6A1C8A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 13:58:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVXdj-0004du-Bi; Fri, 24 Feb 2023 07:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVXdc-0004dV-JP
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 07:57:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVXdb-00079C-0r
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 07:57:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677243442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHGcwrbL2ARvXMAxgbBrtGiw5+Pq5RBgR+UHc0R74po=;
 b=MSfOP0o4jR5zl/aOI2xLVVWu8yNtnlmbRTnl9KKiT1mYsMUT8MnEY8VUB7ZLU4cJLaWk7K
 WGYG+HM5VV5HnqOZvd1jgOW5nCmYIlV9GaIPVTVHBiMZMW7Ur6L19dAXY9b1xPzuE4/jlP
 rNF4S52PwMLY95wkohTIIN81h01o9O8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-f0kTh31KNAKbTjESPkgpVQ-1; Fri, 24 Feb 2023 07:57:20 -0500
X-MC-Unique: f0kTh31KNAKbTjESPkgpVQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c7-20020a7bc847000000b003e00be23a70so1193750wml.2
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 04:57:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VHGcwrbL2ARvXMAxgbBrtGiw5+Pq5RBgR+UHc0R74po=;
 b=0SIeUJpT+/sEep4uCskXwMGfvTwg8MbA2wy9cmD1sNdz9V/KF/rp+4lpw8S6EXSKB2
 RPdcySCR+OMOEfA/cRIsOvSAo+y1S1FWlxiDebdkaR2JEIp3fGlJWQqLdhF68SjsXkgI
 ZG2jaiwiMJnx3tFLSTn1rbhR+dAWpYiwom5VoIIl57flcYyaV1iWCmNMuUTac5sif5S0
 DMMpsJwChNJKfzxqksXY98iBxejVuIUezKkWggilJ/sgWpIvLaSKE4RtTXPl6COn5ysg
 QOo71QjL+ZF4lJREpCwvDbud4a2joZ2C0Pl3fnk8m8fxdQreX4hABVA/I70Mv7tbzUHQ
 Zk+g==
X-Gm-Message-State: AO0yUKUFsUHZUq/6kOh2fUENWRszC29g8BoAikoTz6QqwV9HaIskRSUK
 IskBPts+sxJAM98oaWsE0QQ+yB54EE3y3JpM/NKoI1uprQo5cWprgRZBov+WpsPVfyfgTvmjeJ2
 /n7Rjb1X/CCkEFkOHIEmI
X-Received: by 2002:a5d:6d8c:0:b0:2c7:e48:8ca3 with SMTP id
 l12-20020a5d6d8c000000b002c70e488ca3mr7380343wrs.0.1677243435165; 
 Fri, 24 Feb 2023 04:57:15 -0800 (PST)
X-Google-Smtp-Source: AK7set8JWJmmdbZHvUjLp/WwHDd/PVdijWPsZPyh5Kelg8cj16wCDQyi5cVnN7RWRXpUabbCuPLq6g==
X-Received: by 2002:a5d:6d8c:0:b0:2c7:e48:8ca3 with SMTP id
 l12-20020a5d6d8c000000b002c70e488ca3mr7380331wrs.0.1677243434921; 
 Fri, 24 Feb 2023 04:57:14 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a056000118400b002c5544b3a69sm9636394wrx.89.2023.02.24.04.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 04:57:14 -0800 (PST)
Date: Fri, 24 Feb 2023 13:57:13 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Shannon Zhao <shannon.zhaosl@gmail.com>, Sunil V L
 <sunilvl@ventanamicro.com>, Ani Sinha <ani@anisinha.ca>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH v2] Deprecate the "-no-acpi" command line switch
Message-ID: <20230224135713.46569886@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230224090543.1129677-1-thuth@redhat.com>
References: <20230224090543.1129677-1-thuth@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 24 Feb 2023 10:05:43 +0100
Thomas Huth <thuth@redhat.com> wrote:

> Similar to "-no-hpet", the "-no-acpi" switch is a legacy command
> line option that should be replaced with the "acpi" machine parameter
> nowadays.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  v2: Fixed stypid copy-n-paste bug (Thanks to Sunil for spotting it!)
> 
>  docs/about/deprecated.rst | 6 ++++++
>  softmmu/vl.c              | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index ee95bcb1a6..15084f7bea 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -99,6 +99,12 @@ form is preferred.
>  The HPET setting has been turned into a machine property.
>  Use ``-machine hpet=off`` instead.
>  
> +``-no-acpi`` (since 8.0)
> +''''''''''''''''''''''''
> +
> +The ``-no-acpi`` setting has been turned into a machine property.
> +Use ``-machine acpi=off`` instead.
> +
>  ``-accel hax`` (since 8.0)
>  ''''''''''''''''''''''''''
>  
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 459588aa7d..a3c59b5462 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3271,6 +3271,7 @@ void qemu_init(int argc, char **argv)
>                  vnc_parse(optarg);
>                  break;
>              case QEMU_OPTION_no_acpi:
> +                warn_report("-no-acpi is deprecated, use '-machine acpi=off' instead");
>                  qdict_put_str(machine_opts_dict, "acpi", "off");
>                  break;
>              case QEMU_OPTION_no_hpet:


