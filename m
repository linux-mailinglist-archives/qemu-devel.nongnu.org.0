Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D33C243AFBF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:08:50 +0200 (CEST)
Received: from localhost ([::1]:43848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJNx-0007Vc-EU
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfJMp-0006dH-Tn
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:07:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfJMm-0007hq-RJ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635242856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cZ4sTCS5wKpAmQsi8LlevqDMskrRdPWihDmvNfpf4bQ=;
 b=ixSAwswug8NlFCF/qSfYHOKfB/5IIUp52z4ka5SDQoF7mioJVlejoQJ7vXYFRJThnQaxV7
 9iL7boE2UPozAg4PImZpliKek1dTIGXVgILwOvdeuOwMG1eatvfddrlAx8usftujcWlDS7
 Fy39AynIab8vXjWz49bESJkYBYhdspw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-OA4sXcG9McmqvJGGekym6g-1; Tue, 26 Oct 2021 06:07:35 -0400
X-MC-Unique: OA4sXcG9McmqvJGGekym6g-1
Received: by mail-wr1-f72.google.com with SMTP id
 d10-20020adffd8a000000b00167f0846597so3301464wrr.16
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cZ4sTCS5wKpAmQsi8LlevqDMskrRdPWihDmvNfpf4bQ=;
 b=0yPVjJO7AVYwVGWBBKfJtJdczukPIz2lO+GV6CrVE33XVDpm9+jOBvwSR74tWtcH/r
 mQwZupd9rNi66bnB/nswoM+5R0T/Xk8SqLjvd6PQ2COycBxIIwsW3oOkrgq/G2lnTgig
 XQ/P5lpmo2lCFGTfYpB0FeutAHG5hIpQXDqSUOtjTbXp1wYLLPFTxawRnkxrAnzbgjpN
 gAuw+PxeNgvmbzxLMadeE3qBZFssJgIsoHWxO9WA7Iet3pnS2dI6hxn255O1Te42X2JR
 jzuRJWuQawoHK62aYsLGrORUPBDiPMB4cg4oTQft/IvC+r7GoamiFKXaFC0oOf6mpif/
 cV5A==
X-Gm-Message-State: AOAM5330cQ202pM7J1koGgTbcAPM4R+4Bh82q7wdzzU9X6hqCttEB/iR
 dH+ZjAci6kLxRTFFQCjgFbettKjb3rQhpH1lyZU8fvJEGR9dUgaS83fj8EpVbY35SuIBSeiAnRE
 pAHgKCqWPxitl7ms=
X-Received: by 2002:adf:d1eb:: with SMTP id g11mr30229576wrd.16.1635242853854; 
 Tue, 26 Oct 2021 03:07:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzPmbcZfn0a38ljfxZJc34E5G2O1Bpzo7DCP7myEjVniMW6XHMPy1oOGalBlTT9IiAD+CESQ==
X-Received: by 2002:adf:d1eb:: with SMTP id g11mr30229547wrd.16.1635242853600; 
 Tue, 26 Oct 2021 03:07:33 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id z26sm110281wmi.45.2021.10.26.03.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:07:33 -0700 (PDT)
Date: Tue, 26 Oct 2021 11:07:31 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH v7 1/4] monitor/hmp: add support for flag argument with
 value
Message-ID: <YXfTY2MGliDYXb7E@work-vm>
References: <20211021100135.4146766-1-s.reiter@proxmox.com>
 <20211021100135.4146766-2-s.reiter@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20211021100135.4146766-2-s.reiter@proxmox.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Reiter (s.reiter@proxmox.com) wrote:
> Adds support for the "-xV" parameter type, where "-x" denotes a flag
> name and the "V" suffix indicates that this flag is supposed to take an
> arbitrary string parameter.
> 
> These parameters are always optional, the entry in the qdict will be
> omitted if the flag is not given.
> 
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> 
> v6:
> It wasn't possible to pass the 'connected' parameter to set_password, since the
> code to handle optional parameters couldn't live with a different param (not
> starting with '-') coming up instead - fix that by advancing over the 'value
> flag' modifier in case `*p != '-'`.
> 
> Also change the modifier to 'V' instead of 'S' so it can be distinguished from
> an actual trailing 'S' type param.
> 
> Discovered in testing. I dropped Eric's R-b due to the code change.
> 
>  monitor/hmp.c              | 19 ++++++++++++++++++-
>  monitor/monitor-internal.h |  3 ++-
>  2 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index d50c3124e1..899e0c990f 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -980,6 +980,7 @@ static QDict *monitor_parse_arguments(Monitor *mon,
>              {
>                  const char *tmp = p;
>                  int skip_key = 0;
> +                int ret;
>                  /* option */
>  
>                  c = *typestr++;
> @@ -1002,11 +1003,27 @@ static QDict *monitor_parse_arguments(Monitor *mon,
>                      }
>                      if (skip_key) {
>                          p = tmp;
> +                    } else if (*typestr == 'V') {
> +                        /* has option with string value */
> +                        typestr++;
> +                        tmp = p++;
> +                        while (qemu_isspace(*p)) {
> +                            p++;
> +                        }
> +                        ret = get_str(buf, sizeof(buf), &p);
> +                        if (ret < 0) {
> +                            monitor_printf(mon, "%s: value expected for -%c\n",
> +                                           cmd->name, *tmp);
> +                            goto fail;
> +                        }
> +                        qdict_put_str(qdict, key, buf);
>                      } else {
> -                        /* has option */
> +                        /* has boolean option */
>                          p++;
>                          qdict_put_bool(qdict, key, true);
>                      }
> +                } else if (*typestr == 'V') {
> +                    typestr++;
>                  }
>              }
>              break;
> diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> index 9c3a09cb01..9e708b329d 100644
> --- a/monitor/monitor-internal.h
> +++ b/monitor/monitor-internal.h
> @@ -63,7 +63,8 @@
>   * '.'          other form of optional type (for 'i' and 'l')
>   * 'b'          boolean
>   *              user mode accepts "on" or "off"
> - * '-'          optional parameter (eg. '-f')
> + * '-'          optional parameter (eg. '-f'); if followed by an 'V', it
> + *              specifies an optional string param (e.g. '-fV' allows '-f foo')
>   *
>   */
>  
> -- 
> 2.30.2
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


