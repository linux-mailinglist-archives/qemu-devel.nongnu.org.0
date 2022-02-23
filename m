Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECAD4C14B8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 14:51:08 +0100 (CET)
Received: from localhost ([::1]:48384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMs2t-0004Ds-4r
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 08:51:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMrxJ-0000o7-7I
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 08:45:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMrxG-0004QD-OS
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 08:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645623911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lpF6F7PxjqRPqUt9JPgIAyT8HUmCVloVdPoU3XSLArU=;
 b=AfFFHwd8HLpVFCkJJ0+pXT48HkxLnOHes79/KbQTcSdyU/fRA/JYJbCw70rLVTnHqCFGz0
 BS41GPGu4OBXBPUiaEaZ3ovJazh+NAKGt/UJR3U5GlGPaDsUbNXBE0qy6jSm+Oy0jDdEf/
 XiVAmwe+951YjCT68gsGlAqbt9ekgHg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-9ChkyFrRNSSe8qh_tpXc8w-1; Wed, 23 Feb 2022 08:45:09 -0500
X-MC-Unique: 9ChkyFrRNSSe8qh_tpXc8w-1
Received: by mail-wm1-f69.google.com with SMTP id
 q127-20020a1ca785000000b0037faac72dcbso1077688wme.1
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 05:45:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=lpF6F7PxjqRPqUt9JPgIAyT8HUmCVloVdPoU3XSLArU=;
 b=wl9LmDr0VbI1IHXVviHLKag7tjBgRwcgMRCy+BUE1NewZWZ3XL0E6EvkUGqIO+a4ff
 EuNmkQz9ckTC8aKMgIWnCEI361cl6TwYZv8l1mZARMM9n3Cg+wTXyFTxgZz90uyG5g8t
 InDrm7zjSIIxPDvWeDxcAH7w9yfdjQSA6AArG+2zmlWA196JcKn/rBrM9pC9grReajJs
 y4iGAhmknXBJD/Va1XEaYOe3/fT0p5b2VFgneSHd6kYJrkj0++RVVqXKa6yNXaY066Tg
 m576D1Phs59AAtJ5YP+nHUjzVPB0TcEl/vL+W5YlHo0u10PtErCT2nuGg0BoN8E2Pcf7
 Nutw==
X-Gm-Message-State: AOAM533Bwg9hHLoSS6xLzg+EzzLgwcmsgudDnho8x2rgGHONvKC4NhpS
 RTRb996t1gL+C2vVdsU1YZa0AfWue4zoXhAmiwbSmGa8g9YUx3NWRaQ7erR7vEe2pbvpwFdyDKW
 BGrgEWSWoTqBZ1gU=
X-Received: by 2002:a05:600c:2108:b0:37b:b89a:46b6 with SMTP id
 u8-20020a05600c210800b0037bb89a46b6mr7663918wml.83.1645623908626; 
 Wed, 23 Feb 2022 05:45:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzA8HLYdKeL5j4qvjQ4rNbMyS4KhF+TupMalqoqM/UFNREMNWzYshPLgCTUMt13Cq43LOHL+A==
X-Received: by 2002:a05:600c:2108:b0:37b:b89a:46b6 with SMTP id
 u8-20020a05600c210800b0037bb89a46b6mr7663892wml.83.1645623908379; 
 Wed, 23 Feb 2022 05:45:08 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id f6sm37481636wrv.116.2022.02.23.05.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 05:45:07 -0800 (PST)
Date: Wed, 23 Feb 2022 13:45:05 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v8 3/3] qapi/monitor: allow VNC display id in
 set/expire_password
Message-ID: <YhY6YUk+k3TEDO78@work-vm>
References: <20220204101220.343526-1-f.ebner@proxmox.com>
 <20220204101220.343526-4-f.ebner@proxmox.com>
 <875ypogmkt.fsf@pond.sub.org>
 <988fcea0-b231-6a23-5c2b-e384ddaf7ef4@proxmox.com>
 <87wnhtvrza.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87wnhtvrza.fsf@pond.sub.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: w.bumiller@proxmox.com, berrange@redhat.com, qemu-devel@nongnu.org,
 marcandre.lureau@gmail.com, kraxel@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, Fabian Ebner <f.ebner@proxmox.com>,
 eblake@redhat.com, t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> Fabian Ebner <f.ebner@proxmox.com> writes:
> 
> > Am 09.02.22 um 15:07 schrieb Markus Armbruster:
> >> Fabian Ebner <f.ebner@proxmox.com> writes:
> >> 
> >>> From: Stefan Reiter <s.reiter@proxmox.com>
> >>>
> >>> It is possible to specify more than one VNC server on the command line,
> >>> either with an explicit ID or the auto-generated ones à la "default",
> >>> "vnc2", "vnc3", ...
> >>>
> >>> It is not possible to change the password on one of these extra VNC
> >>> displays though. Fix this by adding a "display" parameter to the
> >>> "set_password" and "expire_password" QMP and HMP commands.
> >>>
> >>> For HMP, the display is specified using the "-d" value flag.
> >>>
> >>> For QMP, the schema is updated to explicitly express the supported
> >>> variants of the commands with protocol-discriminated unions.
> 
> [...]
> 
> >>> diff --git a/hmp-commands.hx b/hmp-commands.hx
> >>> index 70a9136ac2..cc2f4bdeba 100644
> >>> --- a/hmp-commands.hx
> >>> +++ b/hmp-commands.hx
> >>> @@ -1514,33 +1514,35 @@ ERST
> >>>  
> >>>      {
> >>>          .name       = "set_password",
> >>> -        .args_type  = "protocol:s,password:s,connected:s?",
> >>> -        .params     = "protocol password action-if-connected",
> >>> +        .args_type  = "protocol:s,password:s,display:-dV,connected:s?",
> >>> +        .params     = "protocol password [-d display] [action-if-connected]",
> >>>          .help       = "set spice/vnc password",
> >>>          .cmd        = hmp_set_password,
> >>>      },
> >>>  
> >>>  SRST
> >>> -``set_password [ vnc | spice ] password [ action-if-connected ]``
> >>> -  Change spice/vnc password.  *action-if-connected* specifies what
> >>> -  should happen in case a connection is established: *fail* makes the
> >>> -  password change fail.  *disconnect* changes the password and
> >>> +``set_password [ vnc | spice ] password [ -d display ] [ action-if-connected ]``
> >> 
> >> This is the first flag with an argument in HMP.  The alternative is
> >> another optional argument.
> >> 
> >> PRO optional argument: no need for PATCH 1.
> >> 
> >> PRO flag with argument: can specify the display without
> >> action-if-connected.
> >> 
> >> Dave, this is your call to make.
> >> 
> >
> > I'll go ahead with v9 once the decision is made.
> 
> Dave?

I think the flag with argument is clearer; HMP has a problem of
having a lot of optional arguments that get very order dependent which
is messy; so I'd go with the flag with argument.

Dave

> [...]
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


