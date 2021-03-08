Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260F433196A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 22:38:22 +0100 (CET)
Received: from localhost ([::1]:59472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJNa0-0007ds-G5
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 16:38:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJNYg-0006tm-E8
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 16:36:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJNYd-0004mw-KO
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 16:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615239414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wC/Lcmy7vZYQiDz37IHci6ppwraAnYtKjQ3e5pRbNSc=;
 b=SZxmwHi+pLMp3JQjkMviDPz4Q9tb7marInaSOQ0JJepMO4Ei6I0lQosjuIlRjpnc/kmyl7
 JcLYcGfKl6wsWqAwctfl1p8iX2BwZJ/JBIRfIHp0aXX0CazLXpFIyGPfFm/bH4zIRmakPV
 1mDeaq+bimCiCzhDSkbo/gczMMFjuXg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-4Yq5UIBbNESynPwsBW5pWg-1; Mon, 08 Mar 2021 16:36:50 -0500
X-MC-Unique: 4Yq5UIBbNESynPwsBW5pWg-1
Received: by mail-qk1-f199.google.com with SMTP id h134so8460967qke.1
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 13:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wC/Lcmy7vZYQiDz37IHci6ppwraAnYtKjQ3e5pRbNSc=;
 b=gZkgxwnDS+CH7+AeyhhfHVGCOWDmk2vZPUX6eQhoeAGRknGWhUzec1pYsQhWRQAgD7
 rrehFzUJjoWJtc+u1vcyoGPYTBnevFaoi8e5CxqfB9mTLm82HRA0FNDU7M0AoQj49DbX
 +AQdqW4KwvuLAcc3jPMYDupJZa8fMqjoiiEPf40bqtSxq9twHGShhoY23V0D33Pw61/5
 kFY4yG5E76AxQVdmroi+ct/jyi46RdsEmJ2lXr4lpRzN9qxZa3RBoDXNeXQDD12xYcsl
 x0/jcDiXsSHkbNz701Qx61uPVh18/ad25zc4+QYlz1DdRlut4csw6ayi5tVLTbBfxUfe
 vfcA==
X-Gm-Message-State: AOAM532zxgLlaKCYGpm6fIACgVeS3lmiXcCO00qnoD7uRJqqQBnRolbb
 EgmlFkBn3Y9T17XM1j+ywoyH9IQUC2/k/Gau8vWKtYvQbLT1FQ8QF+7vUGL+zlTW7M1IhIrhoMm
 TYKjw7nL4g6YeIvg=
X-Received: by 2002:a05:6214:1144:: with SMTP id
 b4mr23032241qvt.12.1615239409748; 
 Mon, 08 Mar 2021 13:36:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybV9vrqsuzprt6ptehSpIzMVMMk/MNtRIfd+BJzlysyhLk1TwezoYH+6ebTdn+oS6LBhFfaw==
X-Received: by 2002:a05:6214:1144:: with SMTP id
 b4mr23032216qvt.12.1615239409475; 
 Mon, 08 Mar 2021 13:36:49 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id t6sm8590224qti.2.2021.03.08.13.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 13:36:49 -0800 (PST)
Date: Mon, 8 Mar 2021 16:36:47 -0500
From: Peter Xu <peterx@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH v3 3/3] migration/ram: Optimize ram_save_host_page()
Message-ID: <20210308213647.GM397383@xz-x1>
References: <20210305075035.1852-1-jiangkunkun@huawei.com>
 <20210305075035.1852-4-jiangkunkun@huawei.com>
 <20210305143033.GF397383@xz-x1>
 <228f70c3-4c4f-5d21-c2f0-1be7c0d7aea5@huawei.com>
MIME-Version: 1.0
In-Reply-To: <228f70c3-4c4f-5d21-c2f0-1be7c0d7aea5@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, David Edmondson <dme@dme.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Alexey Romko <nevilad@yahoo.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 08, 2021 at 09:58:02PM +0800, Kunkun Jiang wrote:
> Hi,
> 
> On 2021/3/5 22:30, Peter Xu wrote:
> > On Fri, Mar 05, 2021 at 03:50:35PM +0800, Kunkun Jiang wrote:
> > > Starting from pss->page, ram_save_host_page() will check every page
> > > and send the dirty pages up to the end of the current host page or
> > > the boundary of used_length of the block. If the host page size is
> > > a huge page, the step "check" will take a lot of time.
> > > 
> > > This will improve performance to use migration_bitmap_find_dirty().
> > Is there any measurement done?
> I tested it on Kunpeng 920.  VM params: 1U 4G( page size 1G).
> The time of ram_save_host_page() in the last round of ram saving:
> before optimize: 9250us               after optimize: 34us

Looks like an idle VM, but still this is a great improvement.  Would you mind
add this into the commit message too?

> > This looks like an optimization, but to me it seems to have changed a lot
> > context that it doesn't need to... Do you think it'll also work to just look up
> > dirty again and update pss->page properly if migration_bitmap_clear_dirty()
> > returned zero?
> > 
> > Thanks,
> This just inverted the body of the loop, suggested by @David Edmondson.
> Here is the v2[1]. Do you mean to change it like this?
> 
> [1]: http://patchwork.ozlabs.org/project/qemu-devel/patch/20210301082132.1107-4-jiangkunkun@huawei.com/

I see, then it's okay - But indeed I still prefer your previous version. :)

Thanks,

-- 
Peter Xu


