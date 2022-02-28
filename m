Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509B84C7886
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 20:14:21 +0100 (CET)
Received: from localhost ([::1]:50840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOlTQ-0002zC-Eu
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 14:14:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nOlS1-0001tf-Tj
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:12:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nOlRy-0008Bd-Oq
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:12:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646075569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wxBcRsmnlAlmoKqINvaouo67WmF4CJFN62Jt980cJus=;
 b=CsqwSU3teO5cHdjGkHKXr3I7UMac9d5UCL9pm7KtPXxKPa0ffwdiwAxUuvlZ3/ek2XHqmN
 O/m+3uQSH5tkH85UesrXpU6VVn9gJcXh4d9IN22H3kIil5n9DQNTdcddOpwPEnXCLp99Tz
 ibFE76MINxF4v3l4uVjMClGOd7+BipA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-0i9eROQlM8WhmoM0oPqZ4A-1; Mon, 28 Feb 2022 14:12:46 -0500
X-MC-Unique: 0i9eROQlM8WhmoM0oPqZ4A-1
Received: by mail-wm1-f72.google.com with SMTP id
 c62-20020a1c3541000000b003815245c642so9377wma.6
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 11:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=wxBcRsmnlAlmoKqINvaouo67WmF4CJFN62Jt980cJus=;
 b=hqsAbb6gwq5HOLxMgadW0IVYym66KJcyLDotTnJznpiCSno5dsh3VIe805m4UI66lA
 s++h7aRJP6UkHFavxrAxKdSXNnmx/BwzcyrBu8oOXQJC619vlcMjcb3gtvWzgvNqCIYY
 V/Pe20nmgsU9msEU3VCMp9LBcl9yZRUeWkWsTW30oeOlyT+y+lLbH9E8nGn7riknPJ5X
 Ys9VgILB79xM1cbwRDeE4woYJgNYYywqTWBZ5Et9cSHlaJJNn7IpHLO8JHgbrGFUo5xV
 Wp5V0eIPRmz9NGA27F8zbJ8C5Kg2+m9cozFNbkLd/qDaxXh+9x5hkXQTDQvrdHbwGR7c
 NDyA==
X-Gm-Message-State: AOAM533ZwreWiFWGZ7wxTLbkiqLbmrEciOLqby65bZY7HZ0t1vlBoBvZ
 naD9e3i4l/IkqTcI0+THbxMEK9hZh+qWdIkL9tjC3Rz8QbGFxVXuKO7oaj0q2jSlOoSF/j5NCNI
 M8qYcHTI/7+sGWM4=
X-Received: by 2002:a05:600c:384a:b0:37b:e8ac:851f with SMTP id
 s10-20020a05600c384a00b0037be8ac851fmr14467752wmr.158.1646075565080; 
 Mon, 28 Feb 2022 11:12:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrBPmWanuMhmMJXSKWZUjWE4Z03TazS0QV7Nn/fqcAzgrggFzcwiZPaGROUuQe33JyPW8RRA==
X-Received: by 2002:a05:600c:384a:b0:37b:e8ac:851f with SMTP id
 s10-20020a05600c384a00b0037be8ac851fmr14467733wmr.158.1646075564860; 
 Mon, 28 Feb 2022 11:12:44 -0800 (PST)
Received: from ?IPv6:2a0c:5a80:1b14:b500:abb:f9d1:7bc2:3db8?
 ([2a0c:5a80:1b14:b500:abb:f9d1:7bc2:3db8])
 by smtp.gmail.com with ESMTPSA id
 q23-20020a1cf317000000b003815206a638sm254927wmq.15.2022.02.28.11.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 11:12:44 -0800 (PST)
Message-ID: <114263a9a1f90d313d8f85945e398a39a3918181.camel@redhat.com>
Subject: Re: [PATCH 2/3] util/main-loop: Introduce the main loop into QOM
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 28 Feb 2022 20:12:43 +0100
In-Reply-To: <YhdXbtLpdXrL2rve@stefanha-x1.localdomain>
References: <20220221170843.849084-1-nsaenzju@redhat.com>
 <20220221170843.849084-3-nsaenzju@redhat.com>
 <YhdXbtLpdXrL2rve@stefanha-x1.localdomain>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2022-02-24 at 10:01 +0000, Stefan Hajnoczi wrote:
> On Mon, Feb 21, 2022 at 06:08:44PM +0100, Nicolas Saenz Julienne wrote:
> > diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> > index 8dbc6fcb89..fea5a3e9d4 100644
> > --- a/include/qemu/main-loop.h
> > +++ b/include/qemu/main-loop.h
> > @@ -26,9 +26,20 @@
> >  #define QEMU_MAIN_LOOP_H
> >  
> >  #include "block/aio.h"
> > +#include "qom/object.h"
> > +#include "util/event-loop.h"
> >  
> >  #define SIG_IPI SIGUSR1
> >  
> > +#define TYPE_MAIN_LOOP "main-loop"
> > +
> > +struct MainLoop {
> > +    EventLoopBackend parent_obj;
> > +};
> > +typedef struct MainLoop MainLoop;
> > +
> > +DECLARE_INSTANCE_CHECKER(MainLoop, MAIN_LOOP, TYPE_MAIN_LOOP)
> 
>  * Direct usage of this macro should be avoided, and the complete
>  * OBJECT_DECLARE_TYPE macro is recommended instead.
> 
> Is there a reason for using DECLARE_INSTANCE_CHECKER() instead of
> OBJECT_DECLARE_TYPE()?

No, bad copying on my part, I'll change it.

[...]
> > diff --git a/qga/meson.build b/qga/meson.build
> > index 1ee9dca60b..3051473e04 100644
> > --- a/qga/meson.build
> > +++ b/qga/meson.build
> > @@ -52,7 +52,7 @@ qga_ss = qga_ss.apply(config_host, strict: false)
> >  
> >  qga = executable('qemu-ga', qga_ss.sources(),
> >                   link_args: config_host['LIBS_QGA'].split(),
> > -                 dependencies: [qemuutil, libudev],
> > +                 dependencies: [qemuutil, libudev, qom],
> 
> Looks like a change because the first patch added the base class to qom
> instead of qemuutil. Maybe this can be undone if the base class is added
> to qemuutil instead.

I'm looking into it.

-- 
Nicolás Sáenz


