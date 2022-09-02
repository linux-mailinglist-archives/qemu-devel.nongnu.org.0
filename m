Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC525AB321
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 16:13:37 +0200 (CEST)
Received: from localhost ([::1]:34502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU7QM-0003fr-IV
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 10:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oU7NV-000117-Bj
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 10:10:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oU7NQ-0006Oc-EE
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 10:10:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662127831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kS1j6I0hA0b4YvreqYQGphjYVXIYpdwzgwAedmSjm6s=;
 b=iQV0b/XlG2ihyKQ0mtlXK0RAICMAGLPjreCMBp99ICbfkv1ZGEv86Hn4KLSD6rVkmd7DyW
 eboSQaS3hkP+hpY2EkYHHI+pEJoSSU0yDTPDUwvruZEr3ApkGTtpr/fPHIA3hNHuXpM+J0
 DddwBVQhdg3koL0KI8xLRpfl+6zt5cY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-I0cZCKVTO-ag-CjbhNVKtA-1; Fri, 02 Sep 2022 10:10:29 -0400
X-MC-Unique: I0cZCKVTO-ag-CjbhNVKtA-1
Received: by mail-qt1-f200.google.com with SMTP id
 ff27-20020a05622a4d9b00b0034306b77c08so1618369qtb.6
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 07:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=kS1j6I0hA0b4YvreqYQGphjYVXIYpdwzgwAedmSjm6s=;
 b=qW46EY3jS7u4400hWMtrsARXb3Hng5RoZT8DnQEglcZEFC7y1yOnpJnmNj7tfl+4NZ
 6r4g0aopbGxbfSSv3M1qR7lL3d4v4ie6DEl3zrf21rvWoFjwXT1Gn7Hh6IlntkQ/uY4g
 seTWnYl1Qa0vT2FkMd4Trenj5S9k8u6JGpJ0nG7SwL8cRypFhPhrvjHnjiua4QujxT0W
 FZh0ZQ5BggxySpLybUgf24nZVoJYHduIpTg88uoLBrbLTMej95BvB4LN/WF8x7VgtHzu
 VrxJGUPiPkYZd2Y6D42RF6VWCKv6Cvm3jf71RJxh2gEBiPJhMNEKSlTfMOsJowD3A/vY
 411g==
X-Gm-Message-State: ACgBeo0UHCbpUb7/Usnk8opntr8aoq8eTPkoO76/eIsWXJs6H06QwqZh
 T+SygluzGvew+fz94s0/uomX0GyBs8GQg5kh0WjObeUjeEhAjOIZxomE6VTaEFL69Fz4fnwaCNj
 XXINZptLeSy4Sejg=
X-Received: by 2002:ad4:5aa2:0:b0:498:fed1:d5e8 with SMTP id
 u2-20020ad45aa2000000b00498fed1d5e8mr22663948qvg.35.1662127829353; 
 Fri, 02 Sep 2022 07:10:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5u8AX/4Z8kdQ+52yy3n4yvVbVAgqo/PDxY9mcs8HPs99Ep/4Zq6JrMIh1c9n89ThlXQfP9Tw==
X-Received: by 2002:ad4:5aa2:0:b0:498:fed1:d5e8 with SMTP id
 u2-20020ad45aa2000000b00498fed1d5e8mr22663896qvg.35.1662127828898; 
 Fri, 02 Sep 2022 07:10:28 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 fz10-20020a05622a5a8a00b00342f05defd1sm1057039qtb.66.2022.09.02.07.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 07:10:28 -0700 (PDT)
Date: Fri, 2 Sep 2022 10:10:27 -0400
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Gavin Shan <gshan@redhat.com>,
 Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] KVM: use store-release to mark dirty pages as harvested
Message-ID: <YxIO07FuavXzXytJ@xz-m1.local>
References: <20220902001936.108645-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220902001936.108645-1-pbonzini@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Fri, Sep 02, 2022 at 02:19:36AM +0200, Paolo Bonzini wrote:
> The following scenario can happen if QEMU sets more RESET flags while
> the KVM_RESET_DIRTY_RINGS ioctl is ongoing on another host CPU:
> 
>     CPU0                     CPU1               CPU2
>     ------------------------ ------------------ ------------------------
>                                                 fill gfn0
>                                                 store-rel flags for gfn0
>                                                 fill gfn1
>                                                 store-rel flags for gfn1
>     load-acq flags for gfn0
>     set RESET for gfn0
>     load-acq flags for gfn1
>     set RESET for gfn1
>     do ioctl! ----------->
>                              ioctl(RESET_RINGS)
>                                                 fill gfn2
>                                                 store-rel flags for gfn2
>     load-acq flags for gfn2
>     set RESET for gfn2
>                              process gfn0
>                              process gfn1
>                              process gfn2
>     do ioctl!
>     etc.
> 
> The three load-acquire in CPU0 synchronize with the three store-release
> in CPU2, but CPU0 and CPU1 are only synchronized up to gfn1 and CPU1
> may miss gfn2's fields other than flags.
> 
> The kernel must be able to cope with invalid values of the fields, and
> userspace *will* invoke the ioctl once more.  However, once the RESET flag
> is cleared on gfn2, it is lost forever, therefore in the above scenario
> CPU1 must read the correct value of gfn2's fields.
> 
> Therefore RESET must be set with a store-release, that will synchronize
> with KVM's load-acquire in CPU1.
> 
> Cc: Gavin Shan <gshan@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks (again)!

-- 
Peter Xu


