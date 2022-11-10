Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7308C624708
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 17:31:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otASK-0008Ok-BN; Thu, 10 Nov 2022 11:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otAS9-0008JL-G7
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 11:31:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otAS4-0005eN-Tn
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 11:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668097851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtEXcT2tS3C1urB6CvC83gwpobbWIpFxSGHbQB5uUGI=;
 b=bu3JVwJEaSkTpys2Wmqa/0eoqPf/Vaox2xrIO3XUTI5VDc/4WOAp+t66goX3rpFGSr5+Ly
 XcY3GTuITlE3e/Vl49mthAwGMFHExw1Qbt2mroIgWL4OmRzkPSBe3s7e7StjfqpJIL9Xnf
 ccI/OhYQ99L+U5CNdc7Mga4u38PgU3U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-uyGpY9pbMiSDNp7SQtkcfg-1; Thu, 10 Nov 2022 11:30:50 -0500
X-MC-Unique: uyGpY9pbMiSDNp7SQtkcfg-1
Received: by mail-wm1-f70.google.com with SMTP id
 p14-20020a05600c204e00b003cf4cce4da5so805979wmg.0
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 08:30:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rtEXcT2tS3C1urB6CvC83gwpobbWIpFxSGHbQB5uUGI=;
 b=ha13dri5fYPBuwFg3oVkNZp3sdkYwV71XGFulEAujPZvZs8J/cvLf6fQW79Dww3YJ/
 qz7EGZMcB/CeqUcXAVJMBneV02N7u6Z8/ATHKNH0HMczaCCjehlGbvZFa/RrYl3BN91H
 sDsGlCkPM6KUfxjMmxtLkUooehuPD/kWwfi4x52vjJZsTqQzhRXaSfckUtL2FAClzXlL
 JVDWymWDLrqaOKXthWU3Ccz0gbgnpxhtbsztPZ4UDkOYXPHVYUDgTO5qIopJHYl8iJx9
 lcKZlBf4qCRJJMSCvVrADRAmF6rtFLiRgQxe6Mui3D/ZMOdER1R7/g/T4ydstMjEhl0U
 j5Aw==
X-Gm-Message-State: ACrzQf0QPfmeMyBKHT/feSKNsxBDfePgeErqvMiicPYLuTCnhpADzNXt
 /8DYE+FgZ8iD7G/M9gQuP28SLhgB8HdbRZyjbYhBwc6Mm0BeKZlg+uVjvMXgfij9YQrvj+Fh1r0
 M83GtVp3jgvMeDfg=
X-Received: by 2002:a7b:c009:0:b0:3cf:6b95:73c8 with SMTP id
 c9-20020a7bc009000000b003cf6b9573c8mr40536138wmb.121.1668097849424; 
 Thu, 10 Nov 2022 08:30:49 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4QmNAarOn++wzGwEygWNP3ukm836YfgPL9hPJEdwn26sVXk7lqS5D390sRtyCGLBPE/C0kXg==
X-Received: by 2002:a7b:c009:0:b0:3cf:6b95:73c8 with SMTP id
 c9-20020a7bc009000000b003cf6b9573c8mr40536122wmb.121.1668097849123; 
 Thu, 10 Nov 2022 08:30:49 -0800 (PST)
Received: from redhat.com ([2.52.3.250]) by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b003c6b9749505sm6422788wmq.30.2022.11.10.08.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 08:30:48 -0800 (PST)
Date: Thu, 10 Nov 2022 11:30:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH 0/4] hw: make TCO watchdog actually work by default for Q35
Message-ID: <20221110112956-mutt-send-email-mst@kernel.org>
References: <20221031131934.425448-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031131934.425448-1-berrange@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Mon, Oct 31, 2022 at 01:19:30PM +0000, Daniel P. Berrangé wrote:
> The TCO watchdog is unconditionally integrated into the Q35 machine
> type by default, but at the same time is unconditionally disabled
> from firing by a host config option that overrides guest OS attempts
> to enable it. People have to know to set a magic -global to make
> it non-broken
> 
> IOW we're exposing a broken watchdog by default to all Q35 machines,
> but which to the guest OS & its apps looks fully functional :-(
> 
> This behaviour was set in response to feedback from Michael:
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2015-06/msg07128.html
> 
>     "I think sample high is a safer default."
> 
> but as explained in the commit message in the last patch, I think the
> watchdog defaults were already safe without that pin strap setting.
> The guest OS needs to take explicit action to clear the guest visible
> 'no reboot' flag, and so we don't need a second guest hidden 'no reboot'
> flag to override that choice IMHO. Am I missing something ?
> 
> NB, I'm toggling this for 7.2 machine type since that's the current
> git latest machine. Since this has already been "broken" for 7 years
> though, I am ambivalent about whether we try todo this for 7.2, vs
> just wait until the 8.0 machine types arrive.


So I expect v2 with minor issues fixed and hopefully a
fixed property (we can debate removing it down the road
if we want).


> Daniel P. Berrangé (4):
>   hw/acpi: add trace events for TCO watchdog register access
>   hw/isa: add trace events for ICH9 LPC chip config access
>   hw/watchdog: add trace events for watchdog action handling
>   hw/isa: enable TCO watchdog reboot pin strap by default
> 
>  hw/acpi/tco.c            | 41 +++++++++++++++++++++++++++-------------
>  hw/acpi/trace-events     |  2 ++
>  hw/i386/pc.c             |  4 +++-
>  hw/isa/lpc_ich9.c        |  5 ++++-
>  hw/isa/trace-events      |  4 ++++
>  hw/watchdog/trace-events |  4 ++++
>  hw/watchdog/watchdog.c   |  4 ++++
>  tests/qtest/tco-test.c   |  2 +-
>  8 files changed, 50 insertions(+), 16 deletions(-)
> 
> -- 
> 2.37.3


