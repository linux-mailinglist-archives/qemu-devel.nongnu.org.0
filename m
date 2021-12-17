Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24033478DE8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:37:55 +0100 (CET)
Received: from localhost ([::1]:50458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEMr-0004AL-Py
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:37:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myELc-0003Qe-VG
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:36:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myELb-0006iq-G1
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:36:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639751794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zO+nPWi16d726uMEHdt8hNAdHsCXDvVyQj3fUPAneaw=;
 b=ZSgiKXNoIBfiijKpsfoPyA7pzKG7wo+OJ/IBM6zqnHvIuVaWnQQXmB1KXZYz42qPHcq3iB
 aJK2Co3wTOvXeNvxpvDTLvcFvQlhd12gumXLfh74FF1wnfrRUGHKJwiEHOWjO7f3PNr942
 VPBxYiTK5VgL3voW6oUEEKI3ilu3Dx8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-v2KigmqqMgqY7FFIjcCnaA-1; Fri, 17 Dec 2021 09:36:33 -0500
X-MC-Unique: v2KigmqqMgqY7FFIjcCnaA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l34-20020a05600c1d2200b00344d34754e4so3023882wms.7
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 06:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zO+nPWi16d726uMEHdt8hNAdHsCXDvVyQj3fUPAneaw=;
 b=0OjL9rc5vEk7rLz5Kxgx9GQMl/XI5rknA997HVmFwLXPDsymXEqDLiP+UkwHer98CD
 OhWwDLydTZOOqPO7dclH9x6KAkx/D3lihz1rC+az/K8nS48tqqTau8V75kkdBz++P6TS
 7KOtxM6pwtBswxA+HxtEnfCiqwIX1O2EqsFT6Ja2BbAqaM+CmpYtDo2G6i/vfrp+offc
 z3ddWjulNDKmDYQXh8pp8FdWwgwOG16J8A2z61w7RTkGA9qvBN2A3FKjf3cPb8CbOcAa
 QodsGgzvjsa0WQO55a4okujNrBFtbfRXxcE1DWjKNBdSvvRH0+m7jnVRG2glHDyKXQhA
 Bf/A==
X-Gm-Message-State: AOAM532RXecBHduAZB4X5G2tEjSD5CUL4ymeA/6TpDFZjhwgfyo7gwSl
 y8cRGPz5nv/ii+y0JL36XDK86CF42Xf6gcpsiowgRtieUb12LcKqMVOwRqprWemF/0XbTQLPMnr
 y1Im1GIldEsTdN9A=
X-Received: by 2002:a5d:64ef:: with SMTP id g15mr2835400wri.639.1639751792738; 
 Fri, 17 Dec 2021 06:36:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvGOgO+Ed2SdxJpYIAuUEn4YuqTraC5w7t1dQFBi6LTcXr4w2S7LSSL9xWghd4hU5u/HHI8g==
X-Received: by 2002:a5d:64ef:: with SMTP id g15mr2835390wri.639.1639751792568; 
 Fri, 17 Dec 2021 06:36:32 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id l7sm8891356wry.86.2021.12.17.06.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 06:36:31 -0800 (PST)
Message-ID: <90c6025f-8c4c-bbb3-2919-2cacc84c350d@redhat.com>
Date: Fri, 17 Dec 2021 15:36:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 25/37] build-sys: set glib dependency version
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
 <20211009210838.2219430-26-marcandre.lureau@redhat.com>
 <9efb2356-6865-2126-727e-429d867e90b0@redhat.com>
 <CAJ+F1C+TAW8Z_UMfN=s2LS2jL0pNamMTRt8ZYwg9DWri_C7=Bg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <CAJ+F1C+TAW8Z_UMfN=s2LS2jL0pNamMTRt8ZYwg9DWri_C7=Bg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 14:40, Marc-André Lureau wrote:

>     > diff --git a/meson.build b/meson.build
>     > index e1cddf5139..9494590aa2 100644
>     > --- a/meson.build
>     > +++ b/meson.build
>     > @@ -311,14 +311,16 @@ endif
>     >  add_project_arguments(config_host['GLIB_CFLAGS'].split(),
>     >                        native: false, language: ['c', 'cpp', 'objc'])
>     >  glib = declare_dependency(compile_args:
>     config_host['GLIB_CFLAGS'].split(),
>     > -                          link_args:
>     config_host['GLIB_LIBS'].split())
>     > +                          link_args:
>     config_host['GLIB_LIBS'].split(),
>     > +                          version: config_host['GLIB_VERSION'])
>     >  # override glib dep with the configure results (for subprojects)
>     >  meson.override_dependency('glib-2.0', glib)
>     > 
>     >  gio = not_found
>     >  if 'CONFIG_GIO' in config_host
>     >    gio = declare_dependency(compile_args:
>     config_host['GIO_CFLAGS'].split(),
>     > -                           link_args:
>     config_host['GIO_LIBS'].split())
>     > +                           link_args:
>     config_host['GIO_LIBS'].split(),
>     > +                           version: config_host['GLIB_VERSION'])
>     >  endif
>     >  lttng = not_found
>     >  if 'CONFIG_TRACE_UST' in config_host
>     >
> 
>     Can you display it in summary_info too?
> 
> 
> Yeah, although it would need a special treatment.
> 
> Since GLib is a mandatory dependency, I am not sure we want to show
>     GLib                         : YES
> 
> And because it's not a pkg-config dep, it doesn't show the version
> (could probably be fixed in meson).

Ah OK. Yes, I was thinking about displaying the GLib version.

> If you don't mind,  I leave that for another day :)

Sounds good, thanks.


