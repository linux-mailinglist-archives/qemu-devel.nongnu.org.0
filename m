Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282B747564B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:26:35 +0100 (CET)
Received: from localhost ([::1]:58660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRUX-0001es-V4
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:26:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRRH-0006ac-Ge
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:23:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRRF-0005pU-13
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:23:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639563788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZtFFuelrQOpJ3iohHzeMrgfxIaBZ5gXg+cyMxle6J8=;
 b=E7f1EZXuCN4FugGkZPHkRwTM6t9Ruaol9yBF/rkqVQJpRTzrnJACljPu+Wwdq2ipxBTT4B
 KFfW8Hkt6PqRRUAFnBXD+gi4HxJ+xHGmsx8wxnso5FETg3o4t1l+jg52+wRDOcDlwDnAld
 s4wAR80g1LZ16fAnppR+V7OtJlnNVrI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-VSxqqhinMc2vE-itQe82FA-1; Wed, 15 Dec 2021 05:23:05 -0500
X-MC-Unique: VSxqqhinMc2vE-itQe82FA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d7-20020a5d6447000000b00186a113463dso5751295wrw.10
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:23:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9ZtFFuelrQOpJ3iohHzeMrgfxIaBZ5gXg+cyMxle6J8=;
 b=s2LAlPnS3AUkEGXIcgWfwsiQChmHqXfWJTtOspEjrcw9HTh4+79QkvpxngmDsmmP6g
 FDBYA1inaLJqSzqlrGHXwijASzKqwOgDbtrLjrffOKbXSLFjkn+UBvgbOnxpZjwjmS5t
 aGyT5TTP1WT0cFucWtnuw2+WHJukBWcStyy4BmAZlMWRubB7kEhR04pc8MnbQaipaVnT
 TKJXcyxUWUiV/n+VqnQ9X5z5BZ2OftCqySbZN/w1Qib5G7l7cypF+nsSFsDMk4HbUDsM
 2CbXRkOdGkQp7cKrcBWhHVlG9TzD0CC905jbm4Kjilp43UavlhPGcjlaKmXtIXBQ67xc
 Igrg==
X-Gm-Message-State: AOAM533aAvNigDlx8WPesaN2i0bt9HDKnTomk2KYmspOXsx9eOhXduaf
 IOHGiD8JPBL8nrnyjLC0WMBljxXx0y/XleYk/U4cVz0tGEnzFYCTcDnP3uO1QUBy6qWHdiNrU/H
 +/Q2/SOBKW98ST1E=
X-Received: by 2002:a5d:6508:: with SMTP id x8mr3594966wru.388.1639563783844; 
 Wed, 15 Dec 2021 02:23:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIpZM7zcUcOH7QFp0/1FNvUO53L0fTFK6ReGB1vbwwhMLD2t4yC324DLbk9X5W7Af739Yvjg==
X-Received: by 2002:a5d:6508:: with SMTP id x8mr3594945wru.388.1639563783681; 
 Wed, 15 Dec 2021 02:23:03 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id l7sm1805529wry.86.2021.12.15.02.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:23:03 -0800 (PST)
Message-ID: <b9ec9b5d-0985-84be-ea3b-1b8aecc4fb01@redhat.com>
Date: Wed, 15 Dec 2021 11:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/2] spice: Update QXLInterface for spice >= 0.15.0
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20211207204038.664133-1-jsnow@redhat.com>
 <20211207204038.664133-2-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211207204038.664133-2-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/21 21:40, John Snow wrote:
> spice updated the spelling (and arguments) of "attache_worker" in
> 0.15.0. Update QEMU to match, preventing -Wdeprecated-declarations
> compilations from reporting build errors.
> 
> See also:
> https://gitlab.freedesktop.org/spice/spice/-/commit/974692bda1e77af92b71ed43b022439448492cb9
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/ui/qemu-spice.h |  6 ++++++
>  hw/display/qxl.c        | 14 +++++++++++++-
>  ui/spice-display.c      | 11 +++++++++++
>  3 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/include/ui/qemu-spice.h b/include/ui/qemu-spice.h
> index 71ecd6cfd1..21fe195e18 100644
> --- a/include/ui/qemu-spice.h
> +++ b/include/ui/qemu-spice.h
> @@ -40,6 +40,12 @@ int qemu_spice_migrate_info(const char *hostname, int port, int tls_port,
>  #define SPICE_NEEDS_SET_MM_TIME 0
>  #endif
>  
> +#if defined(SPICE_SERVER_VERSION) && (SPICE_SERVER_VERSION >= 0x000f00)
> +#define SPICE_HAS_ATTACHED_WORKER 1
> +#else
> +#define SPICE_HAS_ATTACHED_WORKER 0
> +#endif
> +
>  #else  /* CONFIG_SPICE */
>  
>  #include "qemu/error-report.h"
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 29c80b4289..1da6703e44 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -517,13 +517,20 @@ static int qxl_track_command(PCIQXLDevice *qxl, struct QXLCommandExt *ext)
>  
>  /* spice display interface callbacks */
>  
> -static void interface_attach_worker(QXLInstance *sin, QXLWorker *qxl_worker)
> +static void interface_attached_worker(QXLInstance *sin)
>  {
>      PCIQXLDevice *qxl = container_of(sin, PCIQXLDevice, ssd.qxl);
>  
>      trace_qxl_interface_attach_worker(qxl->id);
>  }
>  
> +#if !(SPICE_HAS_ATTACHED_WORKER)
> +static void interface_attach_worker(QXLInstance *sin, QXLWorker *qxl_worker)
> +{
> +    interface_attached_worker(sin);
> +}
> +#endif
> +
>  static void interface_set_compression_level(QXLInstance *sin, int level)
>  {
>      PCIQXLDevice *qxl = container_of(sin, PCIQXLDevice, ssd.qxl);
> @@ -1131,7 +1138,12 @@ static const QXLInterface qxl_interface = {
>      .base.major_version      = SPICE_INTERFACE_QXL_MAJOR,
>      .base.minor_version      = SPICE_INTERFACE_QXL_MINOR,
>  
> +#if SPICE_HAS_ATTACHED_WORKER
> +    .attached_worker         = interface_attached_worker,
> +#else
>      .attache_worker          = interface_attach_worker,
> +#endif
> +
>      .set_compression_level   = interface_set_compression_level,
>  #if SPICE_NEEDS_SET_MM_TIME
>      .set_mm_time             = interface_set_mm_time,
> diff --git a/ui/spice-display.c b/ui/spice-display.c
> index f59c69882d..1a60cebb7d 100644
> --- a/ui/spice-display.c
> +++ b/ui/spice-display.c
> @@ -500,10 +500,17 @@ void qemu_spice_display_refresh(SimpleSpiceDisplay *ssd)
>  
>  /* spice display interface callbacks */
>  
> +#if SPICE_HAS_ATTACHED_WORKER
> +static void interface_attached_worker(QXLInstance *sin)
> +{
> +    /* nothing to do */
> +}
> +#else
>  static void interface_attach_worker(QXLInstance *sin, QXLWorker *qxl_worker)
>  {
>      /* nothing to do */
>  }
> +#endif
>  
>  static void interface_set_compression_level(QXLInstance *sin, int level)
>  {
> @@ -702,7 +709,11 @@ static const QXLInterface dpy_interface = {
>      .base.major_version      = SPICE_INTERFACE_QXL_MAJOR,
>      .base.minor_version      = SPICE_INTERFACE_QXL_MINOR,
>  
> +#if SPICE_HAS_ATTACHED_WORKER
> +    .attached_worker         = interface_attached_worker,
> +#else
>      .attache_worker          = interface_attach_worker,
> +#endif
>      .set_compression_level   = interface_set_compression_level,
>  #if SPICE_NEEDS_SET_MM_TIME
>      .set_mm_time             = interface_set_mm_time,
> 

Could we get this patch directly applied as a buildfix?


