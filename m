Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE69B654684
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 20:24:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8R9Z-0000M3-MD; Thu, 22 Dec 2022 14:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p8R9W-0000LX-1v
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 14:22:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p8R9U-0007HQ-Ky
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 14:22:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671736966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gMQdiFuFKjpZNFhelq2FVi1rghiIaDfQe5KxyHX1pck=;
 b=M21HRGirNdbHgr/Jk6Xtld6aN9GsylJ2uXSNyV4J8EF8uKaYXebTeppscc4wIMMQUrpZ0/
 bs54a7FR9+IVd2o5hQ/tMempK1DCxAbm9rNRW1I2hyhYZL8Tf4UJqtvy6XE8ee6ws4HQP2
 ohQp1H9E3mA8ZvIQ45YldE6pw1UX9XM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-379-xXewo6ohO22-LCwL1iexwg-1; Thu, 22 Dec 2022 14:22:45 -0500
X-MC-Unique: xXewo6ohO22-LCwL1iexwg-1
Received: by mail-ed1-f72.google.com with SMTP id
 l17-20020a056402255100b00472d2ff0e59so2138047edb.19
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 11:22:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gMQdiFuFKjpZNFhelq2FVi1rghiIaDfQe5KxyHX1pck=;
 b=fceUMITh+a8dtwQUzhYZVyMcTV8JTYgsMK4KUF/swymDRkMY1PWgI1bVtWLXcTWXdb
 cCX04YVsRFiTEsSNt/LZagKqzFYa2T3NfXmgcUuVwwV5B3Jsp1VEc1d4ro4Yn/0ObF0D
 x9HIgYAs6YYiF52H/713/3e2EYfYSlZZCFWb9JhaQuCAKfI6PMBPyTsdTAwNBQWFJUt/
 2LRi8g0ZEG1r63nkrwCQ7IZyfIkABTzOar9LzFz6MrGNv/g3VeNDwjA1wfuwhRh7hfIM
 HK+s6vAT66GcNN+lBt7NQ1THGUR4Qi3voeWDDEDWpCR1r6dD7wJ1Yl/nQlwpO+3WVvSD
 JqRw==
X-Gm-Message-State: AFqh2krv8K6MDZvDfhYOfh/UiXrpDdcS37YVEgCvbVv7XjSyifPrSOXB
 0P4bXdkzHEzjZ0Mg/dI7CzmilgyFyRmvQXfrgS6g2LyZxu1nAkauqiEJWTfrBMH//3qJmTwiA87
 H/0hNO1PhMwhjqXg=
X-Received: by 2002:a17:906:555:b0:7c1:47bd:1814 with SMTP id
 k21-20020a170906055500b007c147bd1814mr5721475eja.63.1671736964326; 
 Thu, 22 Dec 2022 11:22:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsg5ZR9oQZJI5Is54E39fwy2XreEzSJNn4WQb/MFUUqIdBlrKXpiYfLW4OBBrW7heIx595Oew==
X-Received: by 2002:a17:906:555:b0:7c1:47bd:1814 with SMTP id
 k21-20020a170906055500b007c147bd1814mr5721461eja.63.1671736964069; 
 Thu, 22 Dec 2022 11:22:44 -0800 (PST)
Received: from redhat.com ([2.55.175.215]) by smtp.gmail.com with ESMTPSA id
 a11-20020a1709062b0b00b007c1675d2626sm553625ejg.96.2022.12.22.11.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 11:22:43 -0800 (PST)
Date: Thu, 22 Dec 2022 14:22:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, jonathan.cameron@huawei.com, philmd@linaro.org
Subject: Re: [PATCH v2 0/7] include/hw/pci include/hw/cxl: Clean up includes
Message-ID: <20221222142149-mutt-send-email-mst@kernel.org>
References: <20221222100330.380143-1-armbru@redhat.com>
 <B98EF322-5449-4942-8718-D3504B863B96@gmail.com>
 <87edsremti.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edsremti.fsf@pond.sub.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Dec 22, 2022 at 11:48:25AM +0100, Markus Armbruster wrote:
> Bernhard Beschow <shentey@gmail.com> writes:
> 
> > Am 22. Dezember 2022 10:03:23 UTC schrieb Markus Armbruster <armbru@redhat.com>:
> >>Back in 2016, we discussed[1] rules for headers, and these were
> >>generally liked:
> >>
> >>1. Have a carefully curated header that's included everywhere first.  We
> >>   got that already thanks to Peter: osdep.h.
> >>
> >>2. Headers should normally include everything they need beyond osdep.h.
> >>   If exceptions are needed for some reason, they must be documented in
> >>   the header.  If all that's needed from a header is typedefs, put
> >>   those into qemu/typedefs.h instead of including the header.
> >>
> >>3. Cyclic inclusion is forbidden.
> >
> > Sounds like these -- useful and sane -- rules belong in QEMU's coding style. What about putting them there for easy reference?
> 
> Makes sense.  I'll see what I can do.  Thanks!

It would be even better if there was e.g. a make target
pulling in each header and making sure it's self consistent and
no circularity. We could run it e.g. in CI.

-- 
MST


