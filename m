Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDF75340DE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 17:59:43 +0200 (CEST)
Received: from localhost ([::1]:56362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nttQD-0004Qs-Et
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 11:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nttMo-0002Ic-73
 for qemu-devel@nongnu.org; Wed, 25 May 2022 11:56:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nttMg-0003GJ-1C
 for qemu-devel@nongnu.org; Wed, 25 May 2022 11:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653494160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YxoCB5zUgcIUV53KhNO6zwdYzDZFwyG7QqdId6KiNvg=;
 b=atYMf8WkuzbqT0l3Sw3h4lVtjggkb/rQ47lkYmu9zqDENWxn3tXntgfdbX91JcZoiD48F0
 pxId+7VuaXZjuzgwsszpJEQ27KtcC2xXeQl1Dud0dS03ohNfplqKThg47XB+tjEZX7BdRZ
 tWNYQ8qdzVeu9ObnpMvSJlxzVBQelp0=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-2nT1vl7KOI-fQk93BKraPg-1; Wed, 25 May 2022 11:55:58 -0400
X-MC-Unique: 2nT1vl7KOI-fQk93BKraPg-1
Received: by mail-il1-f200.google.com with SMTP id
 b13-20020a92c56d000000b002d125a2ab95so12880629ilj.13
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 08:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YxoCB5zUgcIUV53KhNO6zwdYzDZFwyG7QqdId6KiNvg=;
 b=7D8x5K2n+pK5K5fwumPFYYvtBq+vFNKAjNBCR/Mr7uPqpRgLi29nF4S2CVnXLEDzKJ
 eJdMEGPDGXL1LlSZ9AyeYD4liGI5211JSSvRsImgS4D7Mz7PfFoekEmsMnHco/eMua9B
 vuM+hs+q/FW05ZpWVbiZCh1vmHW/Oou/Xxuf1FFOiujBW4uGSZJFm54lOc49QIP0meXM
 2tU4JaVOpf85MJyK+qHd7XuT4PqQt11x7EOdruOhougJKT06sC7P1zMtJ0eMBRvYRtfl
 AiYFwrB6OdQjHJzW4MVT18YSVg0L35rjA+0uNwz3+E8j8LcrZtHN9hlOWAKJ2ytEEx8h
 3Vdg==
X-Gm-Message-State: AOAM531YOpp3Wd8d5OoEcivvqaQwN4alVv2AqwUGVO7B3wWxMpWbDvBd
 V6DI5R6/SytSBoLTgJt5DfmMk2PREyGyUntKTanj1XpYMp1irHBr1a2nmASh5fuZqdjaY4MFp/B
 tTuAOD/ZG++XotXI=
X-Received: by 2002:a5d:88c7:0:b0:649:7b59:949c with SMTP id
 i7-20020a5d88c7000000b006497b59949cmr14945230iol.181.1653494157786; 
 Wed, 25 May 2022 08:55:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXwnXUBoSJG/tbyMaW35O/giPRsw+qBlNF8k401dSEoApTS2J2eK87ks2cB7LuWSzNK0s23w==
X-Received: by 2002:a5d:88c7:0:b0:649:7b59:949c with SMTP id
 i7-20020a5d88c7000000b006497b59949cmr14945204iol.181.1653494157248; 
 Wed, 25 May 2022 08:55:57 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a02cf8a000000b0032e211cff48sm4252905jar.102.2022.05.25.08.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 08:55:56 -0700 (PDT)
Date: Wed, 25 May 2022 11:55:54 -0400
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Cc: "manish.mishra" <manish.mishra@nutanix.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v17 6/8] softmmu/dirtylimit: Implement virtual CPU throttle
Message-ID: <Yo5RiqKWuwZPY6Iv@xz-m1.local>
References: <cover.1646243252.git.huangy81@chinatelecom.cn>
 <a650dbf80c9415a9d4054b6e1f936170cbfce9ea.1646243447.git.huangy81@chinatelecom.cn>
 <1e117589-1719-0d11-099f-9f3392e0ba6f@nutanix.com>
 <f98ae9a1-8d47-7995-ae0d-101c626c3be4@chinatelecom.cn>
 <f0e09ec4-7d16-b022-0949-4599a5378356@nutanix.com>
 <fb42912b-e3f4-f0cb-fb16-671ba75bd7ef@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fb42912b-e3f4-f0cb-fb16-671ba75bd7ef@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Wed, May 25, 2022 at 11:38:26PM +0800, Hyman Huang wrote:
> > 2. Also this algorithm only control or limits dirty rate by guest
> > writes. There can be some memory dirtying done by virtio based devices
> > which is accounted only at qemu level so may not be accounted through
> > dirty rings so do we have plan for that in future? Those are not issue
> > for auto-converge as it slows full VM but dirty rate limit only slows
> > guest writes.
> > 
> From the migration point of view, time spent on migrating memory is far
> greater than migrating devices emulated by qemu. I think we can do that when
> migrating device costs the same magnitude time as migrating memory.
> 
> As to auto-converge, it throttle vcpu by kicking it and force it to sleep
> periodically. The two seems has no much difference from the perspective of
> internal method but the auto-converge is kind of "offensive" when doing
> restraint. I'll read the auto-converge implementation code and figure out
> the problem you point out.

This seems to be not virtio-specific, but can be applied to any device DMA
writting to guest mem (if not including vfio).  But indeed virtio can be
normally faster.

I'm also curious how fast a device DMA could dirty memories.  This could be
a question to answer to all vcpu-based throttling approaches (including the
quota based approach that was proposed on KVM list).  Maybe for kernel
virtio drivers we can have some easier estimation?  My guess is it'll be
much harder for DPDK-in-guest (aka userspace drivers) because IIUC that
could use a large chunk of guest mem.

[copy Jason too]

-- 
Peter Xu


