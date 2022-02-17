Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B17454BA84F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 19:33:53 +0100 (CET)
Received: from localhost ([::1]:36390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKlbE-0003h7-Hs
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 13:33:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nKlXl-0001HN-Ue
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 13:30:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nKlXi-0005MH-7U
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 13:30:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645122606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/1SgVat+E0OmWYcW9b5fobONEaVEjoK3nTTS4QQsaDI=;
 b=bOW4B5XVmrbZN4GeoU+zStunYYbxtKXj+sQNRSrauz5dzp1nWEOxwyrmLQladcP9FXcb6t
 KfjFhRbUKT+CdCOKSw2nn/mWWNEA7twxUuY4eatAjNjy9A1QFFqFfy08KCENfxmMlfbHvb
 QqsP/kk2ZSf+XF/zdtzH5HlQNdrSTYc=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-CObmFzELNwSRZHEOJcYI5g-1; Thu, 17 Feb 2022 13:30:04 -0500
X-MC-Unique: CObmFzELNwSRZHEOJcYI5g-1
Received: by mail-yb1-f199.google.com with SMTP id
 128-20020a251286000000b0062234a636b0so10748532ybs.16
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 10:30:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=/1SgVat+E0OmWYcW9b5fobONEaVEjoK3nTTS4QQsaDI=;
 b=L3FlfOC909gxEBVWAxMkK1sDk83OQHr3tElpCvkDu7Nn7BTga14Au6SvUZS0YFI6CH
 6/yXi4Zlytv/0+0fyd+spqU7rejQAFdEF7stPbmxHU7C+w1QaRNH9akv/ewtsWUvEM8K
 vY0WzLu+PmX9k8560Z1YWkB3TDkrhuJzGX1Ch1d4Mpf4583iN0mvuVUYuHlvristPuvz
 mgUBynYT9vPTnq1+ubjVdnAkmW2MRl7D2cy5tT3XRgxZpI9eYhtthpB0aLtyc6eieh+4
 NtLYmkP2L61sJXtbIuUc8nMKUYIzaeVUobmw0DeYKXtucoqQmHFAoIcYJO/LKaNo0FPA
 MlFQ==
X-Gm-Message-State: AOAM533BLYd2S9Kw0/Skl5PRDRwRfyLXgMaOBY+DjyaBTPiWjHXRSzAZ
 reHai2mwV9kOt31ypKgG1NwZMLEUMdCyIPTeNAUVPqfWKNi8H+JmXk0+Xa58+dh50S5YE/BzZpx
 DvukDiFcDjQMKL6PGjgNJIXvMtSHs2gE=
X-Received: by 2002:a81:7141:0:b0:2d3:d549:23f8 with SMTP id
 m62-20020a817141000000b002d3d54923f8mr3906316ywc.87.1645122604061; 
 Thu, 17 Feb 2022 10:30:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzA6U1V1adAD9lk4ybd1frO5eWYk696kMpU6cM6xrvZz2KqJoa3XhNsg3A1qGldOOcF0bgpxZ7ixVLrv425+sU=
X-Received: by 2002:a81:7141:0:b0:2d3:d549:23f8 with SMTP id
 m62-20020a817141000000b002d3d54923f8mr3906298ywc.87.1645122603808; Thu, 17
 Feb 2022 10:30:03 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Feb 2022 10:30:03 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <CAK7yb4TeKr2br6RthdQwiU2+JGrWcs3ZgWbWHOYGEJ=Ae2z36Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK7yb4TeKr2br6RthdQwiU2+JGrWcs3ZgWbWHOYGEJ=Ae2z36Q@mail.gmail.com>
Date: Thu, 17 Feb 2022 10:30:03 -0800
Message-ID: <CABJz62MGL6a8JU12fXQ_jJNsc_4X+MRv_Cf_7iwkRWfQ1uiPWA@mail.gmail.com>
Subject: Re: qemu crash 100% CPU with Ubuntu10.04 guest (solved)
To: Ben Smith <ben.ellis.smith@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 12:07:15PM +1100, Ben Smith wrote:
> Hi All,
>
> I'm cross-posting this from Reddit qemu_kvm, in case it helps in some
> way. I know my setup is ancient and unique; let me know if you would
> like more info.
>
> Symptoms:
> 1. Ubuntu10.04 32-bit guest locks up randomly between 0 and 30 days.
> 2. The console shows a CPU trace dump, nothing else logged on the guest or host.
> 3. Host system (Ubuntu20.04) 100% CPU for qemu process.
>
> Solution:
> When using virt-install, always use the "--os-variant" parameter!
> e.g. --os-variant ubuntu10.04

FWIW, the --os-variant / --osinfo argument is going to be mandatory
starting with the upcoming virt-manager release.

https://listman.redhat.com/archives/virt-tools-list/2022-February/msg00021.html

-- 
Andrea Bolognani / Red Hat / Virtualization


