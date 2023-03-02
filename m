Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89126A7C68
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:20:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXe9k-0000nW-BP; Thu, 02 Mar 2023 03:19:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pXe9h-0000n8-BI
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:19:13 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pXe9f-00062h-Nq
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:19:13 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 16so9287051pge.11
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677745150;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dsj4gw8eOT9LdA+6gyH7R3o0TvSBiMHhi7t9smJowvY=;
 b=IsclPXqWTvxt+u5b6NFskrmfGclkpWk4a/ZTYtCmxpRtx3zzHDwIFW4L3patPoUJpi
 qqi7aUVbGkX9rgYQUC3wVCt3DbZZtx5Iryp1Ef7e6fag9CGAf6Knt8dHDNdhvi4cVVfu
 xqZjtntaYWSvostbEOnvIGnFtLnMCpB9QufKEHaa2oS1t2YBuVhlfz4ZrpqgiNGxoDpD
 VVWAtbRJe6WuttJrG8/BN2s9IPObAFnKmywuTVldPCf+sxf1o4+wSdew/K2eLKEEtN8N
 ukT110CYb5jzUeLn5DWTbrkSlMS8EVQV3CUcnVqpocdKCSxNIYS0vrHa7S10r2JQ92kP
 tQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745150;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dsj4gw8eOT9LdA+6gyH7R3o0TvSBiMHhi7t9smJowvY=;
 b=09eo36Ji9Q3P4elGx+2DXPmklMofh4N0tEwsEEnSybmv51bBRbrLNoNFWEYFbULo66
 A+OQBBD6WCG5t2VejLPYD6Qwc9OpPp9sVLyINoznaTP0wDhdh94iOwcIPxDDikY3rxFN
 hWWR+/R4THiIrWfNA3MxlvAY+vjsVVzklI4ZIKvdlXAOdj5BbpIqNefZuq0tjHA4qzOJ
 Xg6JWnivHl7ZGTiIaXjWeAtdlCx2va5Z1A2VSb2GnWUK6r1mwGtVcuTTaSI7zJfU5K3c
 NV8pen1+yDSf/6YX8VIsDMaT9GFaYBpO90vy8b2A/assaIK7AdjjtE+AM39QNXcV/QDZ
 vdCg==
X-Gm-Message-State: AO0yUKWFtCbyKKy14woTr4WLtI1CUxLUAKYpB9DAhfvp4HNhZPYvEgiH
 ZB9qSHNA0iNN5YiqVp+rrqPgPQ==
X-Google-Smtp-Source: AK7set/R/7m2YH2OxVBgHgIHB3sQI/WMTf6qYCSQuViRUx1uXw/vsbHB8XOHZu3eZC8ih4eXLUxj+Q==
X-Received: by 2002:a05:6a00:a81:b0:5a8:aa5e:4bc3 with SMTP id
 b1-20020a056a000a8100b005a8aa5e4bc3mr1878722pfl.1.1677745149672; 
 Thu, 02 Mar 2023 00:19:09 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 y25-20020aa78559000000b00592543d7363sm9074120pfn.1.2023.03.02.00.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:19:09 -0800 (PST)
Date: Thu, 2 Mar 2023 13:49:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 virtio-dev@lists.oasis-open.org
Subject: Re: [virtio-dev] [RFC QEMU] docs: vhost-user: Add custom memory
 mapping support
Message-ID: <20230302081907.pwt4nvz5buyt2dz3@vireshk-i7>
References: <Y/9zkDAS4odz93GM@fedora> <877cw0ctpr.fsf@linaro.org>
 <Y/+LdfF0rL3wEqfd@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/+LdfF0rL3wEqfd@fedora>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01-03-23, 12:29, Stefan Hajnoczi wrote:
> What is the advantage over defining separate messages? Separate messages
> are cleaner and more typesafe.

I thought we wanted to keep single message for one kind of functionality, which
is mmap related quirks here. And so it would be better if we can reuse the same
for next hypervisor which may need this.

The value parameter is not fixed and is hypervisor specific, for Xen this is the
domain id, for others it may mean something else.

> I don't have a concrete example, but was thinking of a guest that shares
> memory with other guests (like the experimental virtio-vhost-user
> device). Maybe there would be a scenario where some memory belongs to
> one domain and some belongs to another (but has been mapped into the
> first domain), and the vhost-user back-end needs to access both.

These look tricky (and real) and I am not sure how we would want to handle
these. Maybe wait until we have a real use-case ?

> The other thing that comes to mind is that the spec must clearly state
> which mmaps are affected by the Xen domain information. For example,
> just mem table memory regions and not the
> VHOST_USER_PROTOCOL_F_LOG_SHMFD feature?

Maybe we can mention that only the mmap's performed via /dev/xen/privcmd and
/dev/xen/gntdev files are affected by this ?

-- 
viresh

