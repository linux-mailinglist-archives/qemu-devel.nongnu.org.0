Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4EB5AC661
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 22:39:45 +0200 (CEST)
Received: from localhost ([::1]:44222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUwPA-0004vj-1F
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 16:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oUwNn-0003Nz-3l
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 16:38:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oUwNi-0004ny-Ol
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 16:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662323886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qZEMRRzOCR1TTFHYlRiqnE2jgjqBJRmYnAjYlrl73fU=;
 b=Hc/tiuY1y+2dJ/anR92/N2C2TK+ikmGrqC//GX57eGl83sL4uDW7Q9WlpzJmqeMVsJiPNi
 fg7biOeiSsghgDsWH6xyIgQl1ZVyr35RxMcZ3qnHmjv2DQBbGDUA2hLoPA8nTW3OG05dIz
 zCJzin+tTJbnNWKRngiRcZuN4Jt6MiE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-407-PrNbZozFMkCwNht-lRfnAw-1; Sun, 04 Sep 2022 16:38:04 -0400
X-MC-Unique: PrNbZozFMkCwNht-lRfnAw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j19-20020a05600c1c1300b003ab73e4c45dso4074924wms.0
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 13:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=qZEMRRzOCR1TTFHYlRiqnE2jgjqBJRmYnAjYlrl73fU=;
 b=EA+tiKH6SXiamaK1QbuKlwC2FtIgreIZ6rTpd1x7g5mmhVPWLCp2J5OiGHjB3u8/sM
 Q+jCGx3/9s9/PiSI4nc3GzaT/X+92jybTifE/5cwm5kV4S5thYYMyWTZWKqLsOkTVGn0
 ctb+F3/7G0qovm1dzABNtZvrRcQ/rjFhstwTZzBgyPpUnnvt5G3+d0XjeMd9eUfuhWVj
 Rw+TvW0P/gatVxISSwZ5yk51ll57R3Pc9umPqUrW+ZmWqzQGt91WX/ud3J7IwqhbxX14
 sD4g2Ik5bsWan+1ACM7K/wOyoHHNyE6GfLWYZyV8BZCi2od8K+0tF4+8QsByemsWCLfd
 EjpA==
X-Gm-Message-State: ACgBeo2+yF6U/WdIjUd5MR3fCVAZ3MnSbEbw35sDEM1ymsMD0smoK6QD
 tsWfb087agFZ+Vitzp9uS2IAZK1r9ZAqoeQdR0gFQvPtJl3XS4VnDcRFr62EWqMSkOOm+XpNlmW
 1auge9jn+zSUySYQ=
X-Received: by 2002:a5d:4246:0:b0:228:a8b6:ccf5 with SMTP id
 s6-20020a5d4246000000b00228a8b6ccf5mr150046wrr.7.1662323883658; 
 Sun, 04 Sep 2022 13:38:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4oMzU+f7JCGIDCD1lsWOkDlMvnqcipAxZafpBoyxzgHX2YwZPkIx9gSd29MxHsffedZdjtdA==
X-Received: by 2002:a5d:4246:0:b0:228:a8b6:ccf5 with SMTP id
 s6-20020a5d4246000000b00228a8b6ccf5mr150040wrr.7.1662323883385; 
 Sun, 04 Sep 2022 13:38:03 -0700 (PDT)
Received: from redhat.com ([2.52.135.118]) by smtp.gmail.com with ESMTPSA id
 m23-20020a05600c3b1700b003a5e7435190sm17060561wms.32.2022.09.04.13.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 13:38:02 -0700 (PDT)
Date: Sun, 4 Sep 2022 16:37:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH 0/2] expose host-phys-bits to guest
Message-ID: <20220904163609-mutt-send-email-mst@kernel.org>
References: <20220831125059.170032-1-kraxel@redhat.com>
 <957f0cc5-6887-3861-2b80-69a8c7cdd098@intel.com>
 <20220901135810.6dicz4grhz7ye2u7@sirius.home.kraxel.org>
 <f7a56158-9920-e753-4d21-e1bcc3573e27@intel.com>
 <20220901161741.dadmguwv25sk4h6i@sirius.home.kraxel.org>
 <34be4132-53f4-8779-1ada-68aa554e0eac@intel.com>
 <20220902060720.xruqoxc2iuszkror@sirius.home.kraxel.org>
 <20220902021628-mutt-send-email-mst@kernel.org>
 <20220902084420.noroojfcy5hnngya@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902084420.noroojfcy5hnngya@sirius.home.kraxel.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Fri, Sep 02, 2022 at 10:44:20AM +0200, Gerd Hoffmann wrote:
>   Hi,
>  
> > I feel there are three major sources of controversy here
> > 
> > 0. the cover letter and subject don't do such a good job
> >    explaining that what we are doing is just telling guest
> >    CPUID is not broken. we are not exposing anything new
> >    and not exposing host capability to guest, for example,
> >    if cpuid phys address is smaller than host things also
> >    work fine.
> > 
> > 1. really the naming.  We need to be more explicit that it's just a bugfix.
> 
> Yep, I'll go improve that for v2.
> 
> > 2. down the road we will want to switch the default when no PV. however,
> >    some hosts might still want conservative firmware for compatibility
> >    reasons, so I think we need a way to tell firmware
> >    "ignore phys address width in CPUID like you did in the past".
> >    let's add a flag for that?
> >    and if none are set firmware should print a warning, though I
> >    do not know how many people will see that. Maybe some ;)
> 
> > /*
> >  * Force firmware to be very conservative in its use of physical
> >  * addresses, ignoring phys address width in CPUID.
> >  * Helpful for migration between hosts with different capabilities.
> >  */
> > #define KVM_BUG_PHYS_ADDRESS_WIDTH_BROKEN 2
> 
> I don't see a need for that.  Live migration compatibility can be
> handled just fine today using
> 	'host-phys-bits=on,host-phys-bits-limit=<xx>'
> 
> Which is simliar to 'phys-bits=<xx>'.

yes but what if user did not configure anything?

the point of the above is so we can eventually, in X years, change the guests
to trust CPUID by default.

> The important difference is that phys-bits allows pretty much anything
> whereas host-phys-bits-limit applies sanity checks against the host
> supported phys bits and throws error on invalid values.
> 
> take care,
>   Gerd


