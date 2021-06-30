Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8C13B8780
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 19:14:43 +0200 (CEST)
Received: from localhost ([::1]:39492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lydnO-00082M-8Q
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 13:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lydmC-0007HB-9B
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 13:13:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lydm9-0000wt-4U
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 13:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625073203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HSlEk2DJC7cl10wBibWLw+k3+8B7Yap5fv8htAJa8+o=;
 b=EK6TPSKUGa6gWRH4GYoItYQ0xEl3T/hzczBeiXVpCscTPHi0HjgQ98ZTwWrBg/Ta6urELp
 ByPBKS1HI5SjpJFWZQztx0/aVLFpQeVEDif6jHqB2MJJRNyib4rApQZKP7XD23lUYNKivL
 Q7dd+M194GpTAySyX5XqXwDTH0yNx14=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-blMNIFpfNLuX4-b8r-F6dQ-1; Wed, 30 Jun 2021 13:13:21 -0400
X-MC-Unique: blMNIFpfNLuX4-b8r-F6dQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 b3-20020a05600018a3b029011a84f85e1cso1227086wri.10
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 10:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=HSlEk2DJC7cl10wBibWLw+k3+8B7Yap5fv8htAJa8+o=;
 b=CXjyEQpm2k1f/Mfu7GAFEztiDYOc9J4IAYJiGk35EwSZL8wI0c9uMg85Gyehosi30x
 WkBP1+9XjffgOg3BeWoG7Xjf9dY3f/KJqIgTTyf96xaePUp/vRl+WQswByQYu9zpJtvj
 Puwxoo2TOYyxIn/0GsLhnqPtWM1A4ZINrtevHVy2M+Q+BaeBcj2whBF3xbABI+84Jqo1
 VL04KZk8b/IGdanYi3TT71I3a8WUcljc8fHJJHit6iZEoAsRh94IBjXJXPeVM/vZdueM
 Z01FRBoXwZhWo2Rum/Tetub7XZ7Okv1IeccaoOPRCJ+ELM9H5fzsghShZrolPsso+3N+
 Q4zA==
X-Gm-Message-State: AOAM530kp4Merx7fiI0F0flZ3V4r4vtkLiLZejMDqHFyrhGk/YWpuvp/
 u3uB+7rKU5o4RvJNhsdtXn1Ko4uASjYXq5EjEHzIohwYlF7j8Nv8B5pvGAjXwFSbqBLaNCWg0us
 8jeWyMoo/WFFcFXo=
X-Received: by 2002:a05:600c:3b8b:: with SMTP id
 n11mr5609392wms.159.1625073200141; 
 Wed, 30 Jun 2021 10:13:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5wMZn81BhTDCqpzGfdIFbrTUcD5aNQEbVrJwrkrOK25GSiNbCdS36K91XzKWIvygqb8XDzQ==
X-Received: by 2002:a05:600c:3b8b:: with SMTP id
 n11mr5609366wms.159.1625073199892; 
 Wed, 30 Jun 2021 10:13:19 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id l7sm15456477wrs.30.2021.06.30.10.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 10:13:19 -0700 (PDT)
Date: Wed, 30 Jun 2021 18:13:17 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] seccomp: don't block getters for resource control syscalls
Message-ID: <YNymLV4m+B58rvek@work-vm>
References: <20210630160526.977225-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210630160526.977225-1-berrange@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Florian Weimer <fweimer@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> Recent GLibC calls sched_getaffinity in code paths related to malloc and
> when QEMU blocks access, it sends it off into a bad codepath resulting
> in stack exhaustion[1]. The GLibC bug is being fixed[2], but none the
> less, GLibC has valid reasons to want to use sched_getaffinity.
> 
> It is not unreasonable for code to want to run many resource syscalls
> for information gathering, so it is a bit too harsh for QEMU to block
> them.
> 
> [1] https://bugzilla.redhat.com/show_bug.cgi?id=1975693
> [2] https://sourceware.org/pipermail/libc-alpha/2021-June/128271.html
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  softmmu/qemu-seccomp.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
> index 9c29d9cf00..f50026778c 100644
> --- a/softmmu/qemu-seccomp.c
> +++ b/softmmu/qemu-seccomp.c
> @@ -97,17 +97,11 @@ static const struct QemuSeccompSyscall denylist[] = {
>      { SCMP_SYS(vfork),                  QEMU_SECCOMP_SET_SPAWN },
>      { SCMP_SYS(execve),                 QEMU_SECCOMP_SET_SPAWN },
>      /* resource control */
> -    { SCMP_SYS(getpriority),            QEMU_SECCOMP_SET_RESOURCECTL },
>      { SCMP_SYS(setpriority),            QEMU_SECCOMP_SET_RESOURCECTL },
>      { SCMP_SYS(sched_setparam),         QEMU_SECCOMP_SET_RESOURCECTL },
> -    { SCMP_SYS(sched_getparam),         QEMU_SECCOMP_SET_RESOURCECTL },
>      { SCMP_SYS(sched_setscheduler),     QEMU_SECCOMP_SET_RESOURCECTL,
>        ARRAY_SIZE(sched_setscheduler_arg), sched_setscheduler_arg },
> -    { SCMP_SYS(sched_getscheduler),     QEMU_SECCOMP_SET_RESOURCECTL },
>      { SCMP_SYS(sched_setaffinity),      QEMU_SECCOMP_SET_RESOURCECTL },
> -    { SCMP_SYS(sched_getaffinity),      QEMU_SECCOMP_SET_RESOURCECTL },
> -    { SCMP_SYS(sched_get_priority_max), QEMU_SECCOMP_SET_RESOURCECTL },
> -    { SCMP_SYS(sched_get_priority_min), QEMU_SECCOMP_SET_RESOURCECTL },
>  };
>  
>  static inline __attribute__((unused)) int
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


