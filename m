Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAEE425309
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 14:29:31 +0200 (CEST)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYSWg-0002De-6n
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 08:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mYSSw-000075-Gx
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:25:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mYSSu-00072h-60
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633609534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wPzCUic6CYIMy5ARHGSfae0aVwrn1CpgSsq1foikCFo=;
 b=Ip64Ea21sg8e/3GjPft2cUL/siACw0CiSMNuAc9Mmh+0lYZcoXKOrZbSLKsJiUwohn/Ic/
 G8I+n1Zx8hGeTxy8Z8fBSmQqntpovbrS+tn/0uPv/mGa5BQKQoxH9W67ty2LG5/B2WpnvK
 qyvPueEXytAZbxAZBu51vZXJH6BnmUQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-d1Hw0zRKPxOS8TO7iuaBNQ-1; Thu, 07 Oct 2021 08:25:33 -0400
X-MC-Unique: d1Hw0zRKPxOS8TO7iuaBNQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 l6-20020adfa386000000b00160c4c1866eso4551243wrb.4
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 05:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=wPzCUic6CYIMy5ARHGSfae0aVwrn1CpgSsq1foikCFo=;
 b=Aly6BWcdRkKEHaqrgLDbwJyGRfF2Yt57RGdiZFs3c4DmUXKIOBh8agw4VncGsIbAFJ
 k1gMuu9dHHlbxM1fbKvFUcHfhO2VOA6OA9OHlsvLNunHm6E940vz+aiCEItqztdiR50Z
 14OlQ0QQSvrIUkJDNfbeRmpiJPSbl8T4VTspPU/DJJd6FBScWk5VbBsDCBcy+91pdpIw
 Md1tWLhfKqPze+OFgLwjavGkrg/Smyjlc7PHHPyQzcQ/pyZCXe0LbrhEljAtHy7PsLK+
 5VEObhC/Ta1vQ+B9+qbDY2NrZziW7ekTrYg0W8Ir3yrcGPlpVm5W3VMtolgWOsra/BM9
 KRbg==
X-Gm-Message-State: AOAM533QdiKTKlLFT/bF10iTSobjNEzpBvg/U7Q3A8XB0ZRkeGqMyGWS
 KMoO86sfWv7w6VUVOyCqCPueH5H9L5skyamfzeyLuYVmJYw/7eQAjWBod6U7gpslr3qOvgxzYqw
 seJdr5Ioj5rCIcsk=
X-Received: by 2002:adf:a413:: with SMTP id d19mr5034977wra.246.1633609532109; 
 Thu, 07 Oct 2021 05:25:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhng+oeuXPF66rcVW/Ky2EelAOIslOG8kX+JhVf4qUHjTpWyaYVL3GY9nKDyOtcqagNm5w0g==
X-Received: by 2002:adf:a413:: with SMTP id d19mr5034951wra.246.1633609531928; 
 Thu, 07 Oct 2021 05:25:31 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id q3sm5544623wmf.11.2021.10.07.05.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 05:25:31 -0700 (PDT)
Date: Thu, 7 Oct 2021 13:25:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 05/22] target/i386/monitor: Return QMP error when SEV
 is disabled in build
Message-ID: <YV7nOJolgSSIX5Wf@work-vm>
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-6-philmd@redhat.com>
 <bef20bd5-7760-3fc7-9914-1eddca800825@redhat.com>
 <8f12bc3e-53aa-c946-bb06-f7d08721b243@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8f12bc3e-53aa-c946-bb06-f7d08721b243@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Brijesh Singh <brijesh.singh@amd.com>, Sergio Lopez <slp@redhat.com>,
 kvm@vger.kernel.org, Connor Kuehl <ckuehl@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> On 10/4/21 10:11, Paolo Bonzini wrote:
> > On 02/10/21 14:53, Philippe Mathieu-Daudé wrote:
> >> If the management layer tries to inject a secret, it gets an empty
> >> response in case the binary built without SEV:
> >>
> >>    { "execute": "sev-inject-launch-secret",
> >>      "arguments": { "packet-header": "mypkt", "secret": "mypass",
> >> "gpa": 4294959104 }
> >>    }
> >>    {
> >>        "return": {
> >>        }
> >>    }
> >>
> >> Make it clearer by returning an error, mentioning the feature is
> >> disabled:
> >>
> >>    { "execute": "sev-inject-launch-secret",
> >>      "arguments": { "packet-header": "mypkt", "secret": "mypass",
> >> "gpa": 4294959104 }
> >>    }
> >>    {
> >>        "error": {
> >>            "class": "GenericError",
> >>            "desc": "this feature or command is not currently supported"
> >>        }
> >>    }
> >>
> >> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> >> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >> ---
> >>   target/i386/monitor.c | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> >> index 196c1c9e77f..a9f85acd473 100644
> >> --- a/target/i386/monitor.c
> >> +++ b/target/i386/monitor.c
> >> @@ -28,6 +28,7 @@
> >>   #include "monitor/hmp-target.h"
> >>   #include "monitor/hmp.h"
> >>   #include "qapi/qmp/qdict.h"
> >> +#include "qapi/qmp/qerror.h"
> >>   #include "sysemu/kvm.h"
> >>   #include "sysemu/sev.h"
> >>   #include "qapi/error.h"
> >> @@ -743,6 +744,10 @@ void qmp_sev_inject_launch_secret(const char
> >> *packet_hdr,
> >>                                     bool has_gpa, uint64_t gpa,
> >>                                     Error **errp)
> >>   {
> >> +    if (!sev_enabled()) {
> >> +        error_setg(errp, QERR_UNSUPPORTED);
> >> +        return;
> >> +    }
> >>       if (!has_gpa) {
> >>           uint8_t *data;
> >>           struct sev_secret_area *area;
> >>
> > 
> > This should be done in the sev_inject_launch_secret stub instead, I
> > think.  Or if you do it here, you can remove the "if (!sev_guest)"
> > conditional in the non-stub version.
> 
> This part is not related to SEV builtin; what we want to avoid here
> is management layer to try to inject secret while the guest hasn't
> been started with SEV (IOW 'no memory encryption requested for KVM).
> 
> Maybe this error message is more explicit?
> 
>   error_setg(errp, "Guest is not using memory encryption");
> 
> Or:
> 
>   error_setg(errp, "Guest is not using SEV");

This is better; there's a separate feature called memory encryption, so
we don't want to confuse things.

Dave

> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


