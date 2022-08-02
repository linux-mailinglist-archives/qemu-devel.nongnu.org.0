Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C20B587AD3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:39:10 +0200 (CEST)
Received: from localhost ([::1]:46424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIpIr-0001Yr-9r
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIpDP-00049U-II
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:33:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIpDM-0000Tz-4i
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659436406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uWrkLzxKHzZ0625x/cEcPqPrmb9hew6NvTRuf4+W/AU=;
 b=PLN5ZG80tfLuZWGkVKqK6fKaZalDKl+CE5GbsC47zgFRpopKQgxuAS47R6E8yCIumCJxJG
 xsJkM5/21aNdXz+rouDTrnQJqV1rse74q7doBKdfC/juuPImsxdjEtkrRx5nisQwAEbiJt
 2O/pp8GgsJz9GTNuhO5vCv5QrJ1cm/M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-cpSPjQzWPoWsQ6ElfTkzcw-1; Tue, 02 Aug 2022 06:33:25 -0400
X-MC-Unique: cpSPjQzWPoWsQ6ElfTkzcw-1
Received: by mail-wr1-f71.google.com with SMTP id
 i17-20020adfaad1000000b0021ecb856a71so3360569wrc.4
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 03:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uWrkLzxKHzZ0625x/cEcPqPrmb9hew6NvTRuf4+W/AU=;
 b=VEdzg6oeVHyUbxoR+Bly1ZQPJQypF8Z+IkNwZv32Abuq25UZovJl/c5X5oPPu8fBhv
 1x5VGU/QpHrY/vbjxJQvatAbK+9zQ6y5XMZVsh7a2RtVrrQhpWTdueyfoupS3o1MzStJ
 Yhc374RVhFRYzGNAf5m3zuz70fWd1EfjagIBf6V+gsDHFmu68FB1PclpaX8Gp1PEfdsE
 yeR+4OmKqxpf2oYSfIUdmsN3icZ9S9ot4NI5Epzgf8455Ajx0aldayiqsAVNmXCxL/mh
 31/b71KCjRyXfcFTcyxQwH2NuIgEyFFZnEhmzIby6Ns00ZQngNiPJQPfXgQsWIF+r6us
 c77Q==
X-Gm-Message-State: ACgBeo2SVdWj9m6bsxlEtOg2LZgqF5/tAGtEXGGmCH4sjkqUnSB/5tH7
 JHzrNxBSKBniJDmCTKg/rMLOgeJ/dmA4j3d/GCnCSQgfife/w8SbYrBHiOVqfOvuji1Uazbq4Uu
 6htUHIgvDQ1x1MWg=
X-Received: by 2002:adf:fd09:0:b0:21e:c912:151f with SMTP id
 e9-20020adffd09000000b0021ec912151fmr12518959wrr.302.1659436404453; 
 Tue, 02 Aug 2022 03:33:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7YmhO+CBvcNrdOo8y2LXA9KvvEignLuMntDkYHp+5AgjQ9hyy2e92CI18GqF1BO1N1GwVTrw==
X-Received: by 2002:adf:fd09:0:b0:21e:c912:151f with SMTP id
 e9-20020adffd09000000b0021ec912151fmr12518942wrr.302.1659436404211; 
 Tue, 02 Aug 2022 03:33:24 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 p6-20020a1c5446000000b003a2f96935c0sm26942999wmi.9.2022.08.02.03.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 03:33:23 -0700 (PDT)
Date: Tue, 2 Aug 2022 11:33:21 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Cc: virtio-fs-list <virtio-fs@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [PATCH] virtiofsd: Disable killpriv_v2 by default
Message-ID: <Yuj9ca+1O2xya1mV@work-vm>
References: <YuPd0itNIAz4tQRt@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuPd0itNIAz4tQRt@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

OK, yes I see the corresponding 9b03f65d commit in the Rust version.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


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


