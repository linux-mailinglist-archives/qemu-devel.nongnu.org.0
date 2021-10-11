Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B14A428C42
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 13:43:40 +0200 (CEST)
Received: from localhost ([::1]:40568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZtiU-0002C9-LL
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 07:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mZtf3-0000We-K4
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:40:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mZtey-0005Nw-QE
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633952398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i9E5Labj9ctry4vYYle3h8R9QqEXBnvzJBe/fP9+1xA=;
 b=cRZgaujJ8WBO6FEeVr9LpmeM16DnKqed6e9OKRGLpqxeiV9BJ2V+cAvkkUC8tvw8Ts2Nqf
 WrCC6iMR7oWjh+rgQ3+SUNriUQcyAelHxjsMsj3Km3cW6hNAaQVCz0v+xax8wMpYrOluVJ
 zZXqhqrcWUPC0PiHoIyReOG4gljTqMs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-0Tk_AMk4OrCc2d-HCBuWXg-1; Mon, 11 Oct 2021 07:39:57 -0400
X-MC-Unique: 0Tk_AMk4OrCc2d-HCBuWXg-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso13073965wrc.2
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 04:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i9E5Labj9ctry4vYYle3h8R9QqEXBnvzJBe/fP9+1xA=;
 b=jh27GBb5N4L3wCIRpR9EJ3oWu6cuLw92qeOIoza0feziYF5jvkHSfOwgobBzPaWgMz
 rGsLGAm3SFzfnfr+dD/7p5DfeoWuNU7RSt4eJci/3jnkMEaU/Y5eMpT9zn6Rguc/QIAe
 I7ZgvvSV90uJ/91NTP17crIxv/sfsPCnIk5gIp/PMHHLKbVbZADxLw/m/VVsW0wbYguk
 DBShJ705Y2NdYcBCryWgprHePi1UfdqEaWbuJEIaFjkA/GVbo6NNpXpXU96q0WEJ5H4x
 Y1XWmeVMZud8z9Jrt2twD9azSxOjD/EV+YfljYs9kuXlnlXy8dH3LfgUB6y08UOcPhqx
 FmVA==
X-Gm-Message-State: AOAM53310ZhCVx95KBZixYYB6uPtfeGrq2WEbIR+0qepYYbmltUAE0Yl
 Bpsvdz4ew56NGbUWBcP+JuuJ/TK8YGn278wyGe7XshDIdH80owEMKGwNW6wLKyM2DPsELyS6RIQ
 rSLyvwMBsEZUPiGg=
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr23881350wrn.219.1633952396200; 
 Mon, 11 Oct 2021 04:39:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMbniszZlVkPu/vMl4RZb92zyfSixtN+OtGACKjEq8rzXnrktLv4GRvYoTjbkNIhpfL70vZQ==
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr23881323wrn.219.1633952395985; 
 Mon, 11 Oct 2021 04:39:55 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id d7sm7692076wrh.13.2021.10.11.04.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 04:39:55 -0700 (PDT)
Date: Mon, 11 Oct 2021 12:39:53 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH v4 1/2] monitor/hmp: add support for flag argument with
 value
Message-ID: <YWQiiZKoewnzOXBt@work-vm>
References: <20210928090326.1056010-1-s.reiter@proxmox.com>
 <20210928090326.1056010-2-s.reiter@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20210928090326.1056010-2-s.reiter@proxmox.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
> Adds support for the "-xS" parameter type, where "-x" denotes a flag
> name and the "S" suffix indicates that this flag is supposed to take an
> arbitrary string parameter.
> 
> These parameters are always optional, the entry in the qdict will be
> omitted if the flag is not given.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>

It would be great if you could send a patch to update the big comment in
monitor/monitor-internal.h that describes all the parameters.
But that can come another time.

Dave

> ---
>  monitor/hmp.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index d50c3124e1..a32dce7a35 100644
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
> @@ -1002,8 +1003,22 @@ static QDict *monitor_parse_arguments(Monitor *mon,
>                      }
>                      if (skip_key) {
>                          p = tmp;
> +                    } else if (*typestr == 'S') {
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
> -- 
> 2.30.2
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


