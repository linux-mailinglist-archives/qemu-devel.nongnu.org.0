Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0D5587DC0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:59:40 +0200 (CEST)
Received: from localhost ([::1]:57920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIsQt-0000VT-66
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIsOV-0004xT-Ai
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:57:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIsOR-0000TY-G3
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659448626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zp/cMLIYn1GU7C+7zGOanJXDF/x4Vkrka1oDogQUnig=;
 b=gMLl4VpLwzklKD3TULRzBVP+mZoHhjdnW5soz0DCHlC9xzjwY2SZ1PNtrkolGQdUd9PI6g
 XiYx0SmA0vhuVNIDs8NBt3mxaQZvCH14jwgxi2vnLfyfzCsoSEhb4IDBuiFQOJ/IXCDkux
 RragTBgWJWHxKBn3y09K/vP9cfADuyw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-is2kkJGlOPeOxQuRS3gYSA-1; Tue, 02 Aug 2022 09:57:05 -0400
X-MC-Unique: is2kkJGlOPeOxQuRS3gYSA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m4-20020a7bce04000000b003a386063752so2011477wmc.1
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 06:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zp/cMLIYn1GU7C+7zGOanJXDF/x4Vkrka1oDogQUnig=;
 b=1jaH13VROOxi/yjLJCgTkOQsgXXgpYC1bCFnPTOAtN9cOgpoBt2ZndRoChX+lsrKV8
 hwulajCCToj7h9JbabfKOPsv7CF8v+ZntIA0/M+PRXcQPrMNJaGLSbPs5t37ZxSPMbtK
 r6SOSELTEIvcqZ4YaqaCHIN7yqCV2EaaIZ3l+qq38Kz+Be2gnCOu68hEZIj+7rITbY/1
 +XYNf9+a/gvD55UtcbevbciwkR5l8mvMe/lI5zFXHfANanDzpa+X3wbRU0x58nnQ7DKn
 OGuW1VXcmpobyR2pLNWHC9d7gNpkQZLQqDzXaBMhm4lFBNz2J1DJoDfIb1/PG+os7sTa
 FScQ==
X-Gm-Message-State: AJIora8uyRmREB2hHNB4PeyqZ55ri3V4Stg7vn4vWR5BmtP67T/7vaKO
 EjdHAUQtDSweiykOpWHCQmdq6/DPeSRNB2VpyCH8hytCUtSmcZMiffBIvBfG/mgnNfVLIoLgsB7
 yqT7GmsVfNcfKrlM=
X-Received: by 2002:a7b:c391:0:b0:3a3:2f22:7bf6 with SMTP id
 s17-20020a7bc391000000b003a32f227bf6mr14461917wmj.96.1659448624282; 
 Tue, 02 Aug 2022 06:57:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v3b3kkSB5fj4JZOZXpIZ90x79WayXccrlo4Wyc2BWSuOfGRarqlYXEBniKkcrF0NEnWvPgaA==
X-Received: by 2002:a7b:c391:0:b0:3a3:2f22:7bf6 with SMTP id
 s17-20020a7bc391000000b003a32f227bf6mr14461903wmj.96.1659448624090; 
 Tue, 02 Aug 2022 06:57:04 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 m12-20020a056000008c00b0021eaf4138aesm17837377wrx.108.2022.08.02.06.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 06:57:03 -0700 (PDT)
Date: Tue, 2 Aug 2022 14:57:01 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Cc: virtio-fs-list <virtio-fs@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [PATCH] virtiofsd: Disable killpriv_v2 by default
Message-ID: <YuktLWPTVHjwOrNj@work-vm>
References: <YuPd0itNIAz4tQRt@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuPd0itNIAz4tQRt@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Vivek Goyal (vgoyal@redhat.com) wrote:
> We are having bunch of issues with killpriv_v2 enabled by default. First
> of all it relies on clearing suid/sgid bits as needed by dropping
> capability CAP_FSETID. This does not work for remote filesystems like
> NFS (and possibly others). 
> 
> Secondly, we are noticing other issues related to clearing of SGID
> which leads to failures for xfstests generic/355 and generic/193.
> 
> Thirdly, there are other issues w.r.t caching of metadata (suid/sgid)
> bits in fuse client with killpriv_v2 enabled. Guest can cache that
> data for sometime even if cleared on server.
> 
> Second and Third issue are fixable. Just that it might take a little
> while to get it fixed in kernel. First one will probably not see
> any movement for a long time.
> 
> Given these issues, killpriv_v2 does not seem to be a good candidate
> for enabling by default. We have already disabled it by default in
> rust version of virtiofsd.
> 
> Hence this patch disabled killpriv_v2 by default. User can choose to
> enable it by passing option "-o killpriv_v2".
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Queued

> ---
>  tools/virtiofsd/passthrough_ll.c |   13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> Index: rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c
> ===================================================================
> --- rhvgoyal-qemu.orig/tools/virtiofsd/passthrough_ll.c	2022-07-29 08:19:05.925119947 -0400
> +++ rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c	2022-07-29 08:27:08.048049096 -0400
> @@ -767,19 +767,10 @@ static void lo_init(void *userdata, stru
>          fuse_log(FUSE_LOG_DEBUG, "lo_init: enabling killpriv_v2\n");
>          conn->want |= FUSE_CAP_HANDLE_KILLPRIV_V2;
>          lo->killpriv_v2 = 1;
> -    } else if (lo->user_killpriv_v2 == -1 &&
> -               conn->capable & FUSE_CAP_HANDLE_KILLPRIV_V2) {
> -        /*
> -         * User did not specify a value for killpriv_v2. By default enable it
> -         * if connection offers this capability
> -         */
> -        fuse_log(FUSE_LOG_DEBUG, "lo_init: enabling killpriv_v2\n");
> -        conn->want |= FUSE_CAP_HANDLE_KILLPRIV_V2;
> -        lo->killpriv_v2 = 1;
>      } else {
>          /*
> -         * Either user specified to disable killpriv_v2, or connection does
> -         * not offer this capability. Disable killpriv_v2 in both the cases
> +         * Either user specified to disable killpriv_v2, or did not
> +         * specify anything. Disable killpriv_v2 in both the cases.
>           */
>          fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling killpriv_v2\n");
>          conn->want &= ~FUSE_CAP_HANDLE_KILLPRIV_V2;
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


