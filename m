Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6A15B994E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 13:06:21 +0200 (CEST)
Received: from localhost ([::1]:48368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYmhG-0005WO-V4
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 07:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYmbq-0003Hk-Gz
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 07:00:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYmbm-0005yp-95
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 07:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663239636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XsAt24A1cnBg1KfpOLxJpXhCtucmcoCzPmNoxVPwgjU=;
 b=CJYbpzvoQOe2SeRuiXX49P2McKVvloIFQXsQc531DiAO9t7Vmxw+MFgjbxAcu6PLTjzARl
 7XwsBUEjusSTkMStrcqv+N0i7Ogmhnc3Bzhkwyhyq+QVXJygiANoWUXnY72A6Z4bwQxEg6
 3dPnVCK6rB+DCKppDaN6noz6slxeQcE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-498-yFCZSgYMM6e7ZJSPm1bX5g-1; Thu, 15 Sep 2022 07:00:35 -0400
X-MC-Unique: yFCZSgYMM6e7ZJSPm1bX5g-1
Received: by mail-wm1-f70.google.com with SMTP id
 c128-20020a1c3586000000b003b324bb08c5so12272503wma.9
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 04:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XsAt24A1cnBg1KfpOLxJpXhCtucmcoCzPmNoxVPwgjU=;
 b=UqNMTGStE68ia3+8h01031W26G2qD2wuv9J4Q/BEJXRp8KVVoaXxu4glU2FbmeU7ib
 kQ0nB8E6bLdvtWFGirMNlPqLQAhVDaa8xB1Yorh5tiXYexUuTLYZUd2kLnV6jUVkW6mg
 DO2yMlC2JAWgCX7wTe9rV7WpU8iPP09vrKP4KYnDvc5ayivsVLcmyfJAL00/I5z24Zvt
 srVx3WPZDeDkHGRVlS4AC2XvFkup3hrUqD/qQLepr1ysq9gRXpMcNGDwgS/tq8UlqXEK
 ZMnSI+DSCNAxIuWkFZaTkFG/t7C0WR6P/DnuEp7ot5TOK7PaRUJB4RtM/wlC2mpO96Du
 q8LA==
X-Gm-Message-State: ACgBeo2jFWjqVSQI5OTeFmiA7RhUUUEMtBBgAQUcbONUZEXd3AS7xA/M
 Zf0MB2z4DZ152xzhbWRnw0ozzIfEMYiwQanvqjmBJb+eFg9l9GrAhymWjLCTLS9AC7NdRPyHUwE
 96AiTjxDZQTdi+MM=
X-Received: by 2002:a5d:53c8:0:b0:228:62ee:64cb with SMTP id
 a8-20020a5d53c8000000b0022862ee64cbmr23804881wrw.267.1663239634065; 
 Thu, 15 Sep 2022 04:00:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5tm9mOX8Kndls+CC15YGAZY0Xs9+DxcYKrxIO2kdEWa3Qoy/pO/sG+GXrwUJBT8/gV3W6xLw==
X-Received: by 2002:a5d:53c8:0:b0:228:62ee:64cb with SMTP id
 a8-20020a5d53c8000000b0022862ee64cbmr23804863wrw.267.1663239633799; 
 Thu, 15 Sep 2022 04:00:33 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c294600b003b482fbd93bsm2297887wmd.24.2022.09.15.04.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 04:00:33 -0700 (PDT)
Date: Thu, 15 Sep 2022 12:00:31 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: armbru@redhat.com, qemu-devel@nongnu.org, darren.kenny@oracle.com
Subject: Re: [PATCH v4 0/1] monitor: Support specified vCPU registers
Message-ID: <YyMFz1uVOd4hEMtP@work-vm>
References: <20220802073720.1236988-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802073720.1236988-1-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* zhenwei pi (pizhenwei@bytedance.com) wrote:
> v3 -> v4: 
> - Tweake a few document and output '\n' prefix.
> 
> v2 -> v3: 
> - Add more document in help info.
> - Use 'qemu_get_cpu()' to simplify code.
> 
> v1 -> v2: 
> - Typo fix in commit message.
> - Suggested by Darren, use '[-a|vcpu]' instead of '[-a] [vcpu]',
>   becase only one of these may be specified at a time.
> 
> v1:
> - Support specified vCPU registers for monitor command.
> 
> Zhenwei Pi (1):
>   monitor: Support specified vCPU registers
> 
>  hmp-commands-info.hx |  8 +++++---
>  monitor/misc.c       | 10 ++++++++--
>  2 files changed, 13 insertions(+), 5 deletions(-)

Queued.  Sorry for the delay.

Dave

> 
> -- 
> 2.20.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


