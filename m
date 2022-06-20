Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBDB552194
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:50:19 +0200 (CEST)
Received: from localhost ([::1]:38990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JfO-0002Ae-Pa
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o3JZi-0006l3-Hk
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:44:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o3JZh-0005xN-1m
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655739864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EVQc1KXXSw7ukO7r+TA3iO5aVW3Ot2aMRoVSGwundaI=;
 b=bSzaIDVKyQQiu1vd9I4ExMdaY3DATbIAT09cYJvlNOQ/VA5wYEePsxBd3oQbYimfSx/XQ8
 Q+EaVkg7+Hc6XtMbg0OEZgZvxa+VKNyWZ2oZJVncE8kuwOs1SXjDVHPXANIdUFI7ZFxbWo
 4cRIXNC/ftL48CrNIYasth+NeoXyfqo=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-rJWKrzQAPaStscMncUbCRA-1; Mon, 20 Jun 2022 11:44:23 -0400
X-MC-Unique: rJWKrzQAPaStscMncUbCRA-1
Received: by mail-io1-f72.google.com with SMTP id
 i126-20020a6bb884000000b006691e030971so6242988iof.15
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EVQc1KXXSw7ukO7r+TA3iO5aVW3Ot2aMRoVSGwundaI=;
 b=gejQOLT+m9DpxLfXJre5gOMOvwkLWAPHx/PiggkeuTbsZVRqanbY0yVpOE+gbf8s/p
 Fldml8+Q9bmgwoYGBjZutFmr2IjTy7+I/mTnqDDXZFl3T0Hvg/HFQS1GV/PBadhl3qXl
 +hffbH43/tzWxzphOlcPiQUEy1/lA4xW+w7pfdLSmrV7Tyk3yk8CuRq9UNJYF3m4bans
 AajZs88pIdgItaCX8C9vAvP0nVnQdhTC/Zglxc30VEKPPs+LAb7M/lGer0lNdtu9TasF
 PyiaU0iAYuXcD3WCLLtGIZTC2BOGVHAkFBeUOGqcuvyyp4A/M6Q+MjBVnkppvFHJat6o
 UWgQ==
X-Gm-Message-State: AJIora9cIBQ/UwkckQSXyklhy5NXGBuVW3BGZVaN9lL7xupWZvFTvNF5
 Bb9T1iT6J5luz6xOorjTcOtXnojI/6gWbUVwLagCty8hjtG7mAPvjkhcp1G7EnJitm97PJUJLA7
 hYmJ9aXPn9o37Z5U=
X-Received: by 2002:a05:6638:2481:b0:331:df8f:95e0 with SMTP id
 x1-20020a056638248100b00331df8f95e0mr13275066jat.280.1655739861456; 
 Mon, 20 Jun 2022 08:44:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sVIf/jwh7D/VWZAEMPUwVfriBXHLhr1S/S/PF9NEy4m1iQL8XJ7Jd6TStFeQadRj1YlPsJWA==
X-Received: by 2002:a05:6638:2481:b0:331:df8f:95e0 with SMTP id
 x1-20020a056638248100b00331df8f95e0mr13275046jat.280.1655739861188; 
 Mon, 20 Jun 2022 08:44:21 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a02ce95000000b0033206b52e4csm6113791jaq.42.2022.06.20.08.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:44:20 -0700 (PDT)
Date: Mon, 20 Jun 2022 11:44:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 3/4] migration: zero-copy flush only at the end of
 bitmap scanning
Message-ID: <YrCV089JKhc067sm@xz-m1.local>
References: <20220620053944.257547-1-leobras@redhat.com>
 <20220620053944.257547-4-leobras@redhat.com>
 <87wndb4riu.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87wndb4riu.fsf@secure.mitica>
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

On Mon, Jun 20, 2022 at 11:23:53AM +0200, Juan Quintela wrote:
> Once discussed this, what I asked in the past is that you are having too
> much dirty memory on zero_copy.  When you have a Multiterabyte guest, in
> a single round you have a "potentially" dirty memory on each channel of:
> 
>    total_amount_memory / number of channels.
> 
> In a Multiterabyte guest, this is going to be more that probably in the
> dozens of gigabytes.  As far as I know there is no card/driver that will
> benefit for so many pages in zero_copy, and kernel will move to
> synchronous copy at some point.  (In older threads, daniel showed how to
> test for this case).

I was wondering whether the kernel needs to cache a lot of messages for
zero copy if we don't flush it for a long time, as recvmsg(MSG_ERRQUEUE)
seems to be fetching one message from the kernel one at a time.  And,
whether that queue has a limit in length or something.

Does it mean that when the kernel could have cached enough of these
messages then it'll fallback to the no-zero-copy mode?  And probably that's
the way how kernel protects itself from using too much buffer for the error
msgs?

This reminded me - Leo, have you considered adding the patch altogether to
detect the "fallback to non-zero-copy" condition?  Because when with it and
when the fallback happens at some point (e.g. when the guest memory is
larger than some value) we'll know.

Thanks,

-- 
Peter Xu


