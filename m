Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DA44C2AF0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 12:34:03 +0100 (CET)
Received: from localhost ([::1]:50148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNCNm-00067D-JT
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 06:34:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nNCKM-0005Iv-LO
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:30:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nNCKH-0003tN-8V
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:30:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645702223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Kn160AvkI0UDlDwyeyc4Nacn9unEX8scBXgVt8ToFg=;
 b=frkjrF4zReIw97/SBG93JWsG7X2vgBZfy/4OoaPSlgtKktQuoxHwRzs6UZw/coT5XyID2l
 0i05zmkgpblX93HdjRuVyRcQq0Gr3OU8MbHp4MkqUKgZIFbBMIUpN1OduzvADuQH5HHaGs
 0pzsKuP7rchi8s+YfjCA0vVKGDsefHo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-8Qr2aWpyPMiZE59MFXLPdw-1; Thu, 24 Feb 2022 06:30:22 -0500
X-MC-Unique: 8Qr2aWpyPMiZE59MFXLPdw-1
Received: by mail-wr1-f70.google.com with SMTP id
 v17-20020adfa1d1000000b001ed9d151569so625625wrv.21
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 03:30:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8Kn160AvkI0UDlDwyeyc4Nacn9unEX8scBXgVt8ToFg=;
 b=OJ7SJPhO6lgmzHFgxttzsjppTvNdvNtmlYtnQyuFYTmS/P7jS3iaLTyWdO77Y8qdxu
 UR3H9KN3ZilWn6Q9FPFr+O2N9z3UiuB8NElbReST3fZx+ujwKskmsg4dEux/4A6z2df4
 eHGLruiWtRsoGM2a7lGCQe/ZZ9arXpPgNamABDYlYvPU9XiqOfPPb4PoU+eQV6OxiboP
 VRawag9VsNofSCZ/iA63qnVzXneTC12AbLdZPXrcYIKgoAfzoBL5kqu79K2mO42HLp3v
 /zMAqSUpfTFx3P5lISK4UP+snrlWfoiMbCNuriZmaKljL9ZebWyvFNvct6uCvIsjTAAV
 uE3Q==
X-Gm-Message-State: AOAM531sE7JsWR/sLW92ZWdAhhPmsroHAW2umkhUkrAGifjj3U8zg8Io
 1MZs6Wby7mV7nVnghqcWPUtrIUC26yjFtOVtlTs3FTROGMPxXaxiOp7gYWWKnZcGqqyPton1sl3
 rGZm4xF+b1lBQwRg=
X-Received: by 2002:a05:600c:a03:b0:37b:daff:6146 with SMTP id
 z3-20020a05600c0a0300b0037bdaff6146mr11348615wmp.85.1645702221171; 
 Thu, 24 Feb 2022 03:30:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCOTe0YnbgTTOVdA4XID/+wdTX2sZpxT8LdXcJlfQKjQLYef0dFYzXsI/9cCBXLpyj3sjWSA==
X-Received: by 2002:a05:600c:a03:b0:37b:daff:6146 with SMTP id
 z3-20020a05600c0a0300b0037bdaff6146mr11348581wmp.85.1645702220846; 
 Thu, 24 Feb 2022 03:30:20 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c350f00b0037d1e31a25csm2484407wmq.26.2022.02.24.03.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:30:19 -0800 (PST)
Date: Thu, 24 Feb 2022 11:30:17 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v8 1/3] monitor/hmp: add support for flag argument with
 value
Message-ID: <YhdsSR7oWklovhd1@work-vm>
References: <20220204101220.343526-1-f.ebner@proxmox.com>
 <20220204101220.343526-2-f.ebner@proxmox.com>
 <87tud8f7t0.fsf@pond.sub.org>
 <40352d01-3577-088d-23c6-1ab5f062d8a9@proxmox.com>
 <87zgmgvauv.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87zgmgvauv.fsf@pond.sub.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
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
> > Am 09.02.22 um 15:12 schrieb Markus Armbruster:
> >> Fabian Ebner <f.ebner@proxmox.com> writes:
> >
> > ----8<----
> >
> >>> diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> >>> index 3da3f86c6a..a4cb307c8a 100644
> >>> --- a/monitor/monitor-internal.h
> >>> +++ b/monitor/monitor-internal.h
> >>> @@ -63,7 +63,8 @@
> >>>   * '.'          other form of optional type (for 'i' and 'l')
> >>>   * 'b'          boolean
> >>>   *              user mode accepts "on" or "off"
> >>> - * '-'          optional parameter (eg. '-f')
> >>> + * '-'          optional parameter (eg. '-f'); if followed by a 'V', it
> >>> + *              specifies an optional string param (e.g. '-fV' allows '-f foo')
> >>>   *
> >>>   */
> >> 
> >> For what it's worth, getopt() uses ':' after the option character for
> >> "takes an argument".
> >> 
> >
> > Doing that leads to e.g.
> >     .args_type  = "protocol:s,password:s,display:-d:,connected:s?",
> > so there's two different kinds of colons now.
> 
> Point.

Yeh, : is probably a bad idea.

> >                                               It's not a problem
> > functionality-wise AFAICT, but it might not be ideal. Should I still go
> > for it?
> >
> > Also, wouldn't future non-string flag parameters need their own letter
> > too? What about re-using 's' here instead?
> 
> Another good point.
> 
> Dave, what do you think?

Yeh, I'd be happy reusing 's' here.

Dave

> >> Happy to make that tweak in my tree.  But see my review of PATCH 3
> >> first.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


