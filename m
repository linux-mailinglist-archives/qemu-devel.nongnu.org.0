Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF216A91B4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 08:27:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXznt-000406-OK; Fri, 03 Mar 2023 02:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXznl-0003tE-Tc
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 02:26:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXznk-0006fM-BO
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 02:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677828358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GlcXSz9DNmOX+pue03IX6auBVmCMHCk3uJDgM9nNsx8=;
 b=CKArx7uNUJ+WVNW2Rahf++wTdQElkU+mA7l957bNLVrK/vIqX3PSRLnWVobhXMyHNk37z2
 ffQ8D1mqHAVtJgYhufnMX/9NsFgUF+jy7u8VwLrFl5uoUk99PXZG/H6eoXKUKZx9nMTneC
 YXLSlmxjjenOcqp659Ls5uRbZQY1O8g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-FwZRPpUYOkK9YQJvGiLxWA-1; Fri, 03 Mar 2023 02:25:55 -0500
X-MC-Unique: FwZRPpUYOkK9YQJvGiLxWA-1
Received: by mail-wm1-f69.google.com with SMTP id
 z6-20020a05600c220600b003e222c9c5f4so584857wml.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 23:25:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677828354;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GlcXSz9DNmOX+pue03IX6auBVmCMHCk3uJDgM9nNsx8=;
 b=NZEg8ERshY2T/YK0BS0v8mSZ3zjdO8JBFDu1cgPk+DO5rbo+v3pAhWkWD3sQVwyAgR
 +CRPmZofcV87LJbGTUGCQg+FKWGfl3Vx2JFcQNJL6dkaDnmxj3Ds0FwE7in0V96AWRom
 /13PJ3kvjfJ/P0rxQ1MaHnBWUjx7GT/lArgHAfR+0L4jb0dKj2h0K8wJ+OUx80OjOsBc
 HOnGjdzJdcRcWNYPugwUCGkV/pj0oy2ieqqNqj1s6Tlg5aaC4gcIkAXFhB+tb5n9ybNf
 7lptT37YMZiHSA9upVjv5zRWPzocovKzHbTlhM37qpLjGmsmL+8nIzpjfvbNlJPe//0R
 YExA==
X-Gm-Message-State: AO0yUKWmTp+uZPqXbWKk4PuT0I/PNTSA53w/CbgN/fMXxpW6NDkzlvu3
 iQBygiGJYL/WF3tWBwRE7fOGAp+cJxAPPeXmUhrpSP+rlmMzvP2spqjun9g+WCEheqTKX8PyGma
 YZCr02GiwkT1fKy0=
X-Received: by 2002:a05:600c:3b27:b0:3eb:399f:6b70 with SMTP id
 m39-20020a05600c3b2700b003eb399f6b70mr606215wms.31.1677828354597; 
 Thu, 02 Mar 2023 23:25:54 -0800 (PST)
X-Google-Smtp-Source: AK7set/AcOnwLNR63yyKuEjLGwJsv9IUDZrAU03YDKpPo47gBNsxZ6sxde+KUArNCHuidpw9SUQbtg==
X-Received: by 2002:a05:600c:3b27:b0:3eb:399f:6b70 with SMTP id
 m39-20020a05600c3b2700b003eb399f6b70mr606195wms.31.1677828354254; 
 Thu, 02 Mar 2023 23:25:54 -0800 (PST)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 z26-20020a1c4c1a000000b003eb395a8280sm5117783wmf.37.2023.03.02.23.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 23:25:53 -0800 (PST)
Date: Fri, 3 Mar 2023 02:25:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 arei.gonglei@huawei.com, dgilbert@redhat.com, pbonzini@redhat.com,
 armbru@redhat.com, qemu-devel@nongnu.org
Subject: Re: Re: [PATCH v6 09/12] cryptodev: Account statistics
Message-ID: <20230303022529-mutt-send-email-mst@kernel.org>
References: <20230301105847.253084-1-pizhenwei@bytedance.com>
 <20230301105847.253084-10-pizhenwei@bytedance.com>
 <Y/8xdwWYywVu4jIp@redhat.com>
 <f0589d64-79cf-7b59-47ae-ac1428f20241@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0589d64-79cf-7b59-47ae-ac1428f20241@bytedance.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Mar 03, 2023 at 03:02:24PM +0800, zhenwei pi wrote:
> 
> 
> On 3/1/23 19:05, Daniel P. Berrangé wrote:
> > On Wed, Mar 01, 2023 at 06:58:44PM +0800, zhenwei pi wrote:
> > > Account OPS/BPS for crypto device, this will be used for 'query-stats'
> > > QEMU monitor command and QoS in the next step.
> > > 
> > > Note that a crypto device may support symmetric mode, asymmetric mode,
> > > both symmetric and asymmetric mode. So we use two structure to
> > > describe the statistics of a crypto device.
> > > 
> > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > > ---
> > >   backends/cryptodev.c       | 68 +++++++++++++++++++++++++++++++++++---
> > >   include/sysemu/cryptodev.h | 49 +++++++++++++++++++++++++++
> > >   2 files changed, 112 insertions(+), 5 deletions(-)
> > 
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > 
> > 
> > With regards,
> > Daniel
> 
> Hi Daniel,
> Thanks for your patience in the trunk of work!
> 
> Hi Michael,
> All the patches in this series have been reviewed by Daniel, a small
> improvement(use macro to walk a list which is pointed out by Dr. David Alan
> Gilbert) remains and I'd like to do this work in another followup change.

OK I will do a last pull Monday, should be there.

> -- 
> zhenwei pi


