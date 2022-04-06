Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F294F5A43
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 11:45:51 +0200 (CEST)
Received: from localhost ([::1]:54776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc2EX-0006bx-VS
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 05:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nc2A3-0004s7-Fr
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:41:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nc2A1-0006dM-OP
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649238069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3BcJFGJGxzRXHZImWELvedzSgjdUaQSNmmPvQ4o/NLA=;
 b=TIPk8zMYt/rwYHbW+IXpc09GQ0lNygZTaZSJHf2UP1CGaAq6l+XYcd6ogSEJU01y9q3Sff
 q+mcZomwpV9sw5I+IyLIU0dUjZZSKoIarz1YZndXUojxzk4wK8VdGfpPsBcJ/sejJO2cPF
 xhXus1is//QrG8SdC81dxa7gpWb2MoQ=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-F76JPlo0NJCPc0vPYV4SnQ-1; Wed, 06 Apr 2022 05:41:05 -0400
X-MC-Unique: F76JPlo0NJCPc0vPYV4SnQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 i13-20020a056902068d00b0063da6c20dccso1351374ybt.10
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 02:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3BcJFGJGxzRXHZImWELvedzSgjdUaQSNmmPvQ4o/NLA=;
 b=5hWEMTjB5jdXEc8qBf6XOmZMhwV68fP+jfXUtBanVs6lgutVh+ia28QPzxGs1NaaIT
 7mvNp4nzFFRiQdEuhkB5qQ14ikqtinmatcXwGJkfp1dvMOeT9zAoc+H6aoRZI/lCUKI8
 foN9rr7v1QEV3RJ3K1aQb/jaAO1KlmhqSPnk0E6y79u2Cabj6E/WymZ2lthZ+paW04Rp
 98Xy8RcpuD0+ZXHWMEmEQupFY9vWEJ56+9+6W/bAtjw5HgRCw6p2VUAo62eTmoHnNDAe
 cCGxbh1FY5LyEJZco7qxk2YDUOrh9MeviHL8iJB9XQGz0pYX2PMcMZEGBEuq3JhaRzBd
 wwTQ==
X-Gm-Message-State: AOAM532VGdX3538H2r8huM8kIiqsHSNpiVRSlKyguUhAqf9qV4yu6Fuq
 s23fbBDcHSpZaqMByhbSE3YaELLSDeTxcs/Li4vESaIRdxKRFPUoP9WQDO686FU+sCUG6ZkGxOl
 mhzC808AYTddTLpmmHrhqegrKNliArWM=
X-Received: by 2002:a81:6c8a:0:b0:2eb:55fa:f1e9 with SMTP id
 h132-20020a816c8a000000b002eb55faf1e9mr6223746ywc.15.1649238065084; 
 Wed, 06 Apr 2022 02:41:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz58cwRl5VTgCEPeYgQGch0v3Nhnbrz/cwxweV89gvi7R4PXboqi4Vh4clMrnghog0qv5tUYPRGhrbnd7n7Ik=
X-Received: by 2002:a81:6c8a:0:b0:2eb:55fa:f1e9 with SMTP id
 h132-20020a816c8a000000b002eb55faf1e9mr6223736ywc.15.1649238064867; Wed, 06
 Apr 2022 02:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-14-marcandre.lureau@redhat.com>
 <87fsmqr34l.fsf@pond.sub.org>
 <CAMxuvazZMQFJ4-8my4kLOe_XuJQNSqttXd2tn7zXGS9U+6FeEA@mail.gmail.com>
In-Reply-To: <CAMxuvazZMQFJ4-8my4kLOe_XuJQNSqttXd2tn7zXGS9U+6FeEA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 6 Apr 2022 13:40:54 +0400
Message-ID: <CAMxuvaxVMMhVdaXBt+YhdbDgxC8yV=AqbfaH119LKGWp3bgmZA@mail.gmail.com>
Subject: Re: [PATCH 13/32] error-report: replace deprecated
 g_get_current_time() with glib >= 2.62
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 6, 2022 at 1:35 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi
>
> On Wed, Apr 6, 2022 at 1:08 PM Markus Armbruster <armbru@redhat.com> wrot=
e:
> >
> > marcandre.lureau@redhat.com writes:
> >
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > According to GLib API:
> > > g_get_current_time has been deprecated since version 2.62 and should =
not
> > > be used in newly-written code. GTimeVal is not year-2038-safe. Use
> > > g_get_real_time() instead.
> > >
> > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >  include/glib-compat.h | 10 ++++++++++
> > >  util/qemu-error.c     | 17 ++++++++++++++---
> > >  2 files changed, 24 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/include/glib-compat.h b/include/glib-compat.h
> > > index 3113a7d2af84..dc14d3ec0d1e 100644
> > > --- a/include/glib-compat.h
> > > +++ b/include/glib-compat.h
> > > @@ -145,6 +145,16 @@ qemu_g_test_slow(void)
> > >  #define g_test_thorough() qemu_g_test_slow()
> > >  #define g_test_quick() (!qemu_g_test_slow())
> > >
> > > +#if GLIB_CHECK_VERSION(2,62,0)
> > > +static inline gchar *
> > > +g_date_time_format_iso8601_compat(GDateTime *datetime)
> > > +{
> > > +    return g_date_time_format_iso8601(datetime);
> > > +}
> > > +
> > > +#define g_date_time_format_iso8601 g_date_time_format_iso8601_compat
> > > +#endif
> >
> > I'm confused.
> >
> > If we're using v2.62 or later, g_time_val_to_iso8601(dt) calls GLib's
> > g_time_val_to_iso8601().  Why do we need the inline function and the
> > macro?
>
> To hide the "deprecation" warning because GLIB_VERSION_MAX_ALLOWED is 2.5=
6.

This is probably a better solution, I will change the patch:

--- a/util/qemu-error.c
+++ b/util/qemu-error.c
@@ -185,7 +185,10 @@ real_time_iso8601(void)
 {
 #if GLIB_CHECK_VERSION(2,62,0)
     g_autoptr(GDateTime) dt =3D g_date_time_new_from_unix_utc(g_get_real_t=
ime());
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
     return g_date_time_format_iso8601(dt);
+#pragma GCC diagnostic pop
 #else
     GTimeVal tv;


>
> >
> > Else, I expect g_date_time_format_iso8601(dt) not to compile.
> >
> > > +
> > >  #pragma GCC diagnostic pop
> > >
> > >  #endif
> > > diff --git a/util/qemu-error.c b/util/qemu-error.c
> > > index 7769aee8e791..4ea380dd4169 100644
> > > --- a/util/qemu-error.c
> > > +++ b/util/qemu-error.c
> > > @@ -180,6 +180,19 @@ static void print_loc(void)
> > >      }
> > >  }
> > >
> > > +static char *
> > > +real_time_iso8601(void)
> > > +{
> > > +#if GLIB_CHECK_VERSION(2,62,0)
> > > +    g_autoptr(GDateTime) dt =3D g_date_time_new_from_unix_utc(g_get_=
real_time());
> > > +    return g_date_time_format_iso8601(dt);
> > > +#else
> > > +    GTimeVal tv;
> > > +    g_get_current_time(&tv);
> > > +    return g_time_val_to_iso8601(&tv);
> > > +#endif
> > > +}
> > > +
> > >  /*
> > >   * Print a message to current monitor if we have one, else to stderr=
.
> > >   * @report_type is the type of message: error, warning or informatio=
nal.
> > > @@ -189,12 +202,10 @@ static void print_loc(void)
> > >   */
> > >  static void vreport(report_type type, const char *fmt, va_list ap)
> > >  {
> > > -    GTimeVal tv;
> > >      gchar *timestr;
> > >
> > >      if (message_with_timestamp && !monitor_cur()) {
> > > -        g_get_current_time(&tv);
> > > -        timestr =3D g_time_val_to_iso8601(&tv);
> > > +        timestr =3D real_time_iso8601();
> > >          error_printf("%s ", timestr);
> > >          g_free(timestr);
> > >      }
> >


