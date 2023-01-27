Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1665F67E8E2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:04:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQFJ-0002Rh-AF; Fri, 27 Jan 2023 10:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLQEy-0002Q5-VS
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:02:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLQEx-0004IX-2h
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674831726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BCAWQePqlmcUdEfpPWmFWDPQKTGxJINbp8IdMUJzeiY=;
 b=deXJAZsI6OUDqVJywpy32GPOjvnu3KMW/AlVZl0609KVKVsWdwwqt7CMauSyjA637sQ60N
 GBywxRnH1KJUwZJbVVavQ4POIDr+bDqjGyn83nO344TSKgvmOJKcSxL49RbPuzox4gJLaB
 cHk0JLKlwesbw1xDFzu7AMh4illsRL8=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-577-BoBMK3x0P2yiyOufqD0TqQ-1; Fri, 27 Jan 2023 10:02:01 -0500
X-MC-Unique: BoBMK3x0P2yiyOufqD0TqQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 u7-20020a2eb807000000b002904ea2bdf9so367271ljo.21
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:02:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BCAWQePqlmcUdEfpPWmFWDPQKTGxJINbp8IdMUJzeiY=;
 b=dSv4xJx8g+SBjhpmk4Pq0MFX//9g9l40ZpWluYi3v157+wfwQjzFytFczNRIF0LqEZ
 ZEKsvd8Ri0PJPv9+dk5e2rHGM7zv1BPu9EjHt16HApZvVy/7bcMT2MKKm0TjjU3oLOh5
 ahBuA7H/jdb7LXgEhdX8ykxfBiwdzlmyt5uXCBkhu51sJOG1RS0TgJrR6BuE2h1++K3R
 Ha+tA77V2Cn2PzKV2CwA4mbsdANmoTxpFziWb+gyiGqjuazxAy9uT2kAb8QcUr0CKAmb
 rph/tUFzuILc4b2XfPNblkjVhXkZfAFv25um1zj5YMqPFsN35Oz/IW1Z3Mo3ptIzbffS
 fkGQ==
X-Gm-Message-State: AO0yUKWHIA0FZAO9qXqjeox2b74+O2OgIgzwltjNSb1lqd8zyvEqpc6H
 edTaEPTM58yrzlSw6Sc/piXyimwBuiejHEzownepI0qGpymivrg7cPWeY85/hhhr+1omqiN5yMX
 xeqs1NifMoChUJzg=
X-Received: by 2002:a2e:a4b6:0:b0:28f:8fa4:7c25 with SMTP id
 g22-20020a2ea4b6000000b0028f8fa47c25mr1203857ljm.25.1674831718789; 
 Fri, 27 Jan 2023 07:01:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+JBei17P+JlKSLUUJ2snxVBR2+znakBl4L/6Mt+b5zgCQP9Nf+lOhDJKMfTt0XG4UjFdntSA==
X-Received: by 2002:a2e:a4b6:0:b0:28f:8fa4:7c25 with SMTP id
 g22-20020a2ea4b6000000b0028f8fa47c25mr1203715ljm.25.1674831717017; 
 Fri, 27 Jan 2023 07:01:57 -0800 (PST)
Received: from redhat.com ([2.52.137.69]) by smtp.gmail.com with ESMTPSA id
 cm20-20020a170907939400b00871cb1b8f63sm2370175ejc.26.2023.01.27.07.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:01:56 -0800 (PST)
Date: Fri, 27 Jan 2023 10:01:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Warner Losh <imp@bsdimp.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 kevans@freebsd.org, berrange@redhat.com, groug@kaod.org,
 qemu_oss@crudebyte.com, philmd@linaro.org, alistair@alistair23.me,
 jasowang@redhat.com, jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de, quintela@redhat.com,
 dgilbert@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com,
 tsimpson@quicinc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 04/19] bsd-user: Clean up includes
Message-ID: <20230127100052-mutt-send-email-mst@kernel.org>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-5-armbru@redhat.com>
 <CANCZdfrU4zVcepMj=B5EVUz-qhCDhMYDs+cYS5yfW1-G01PsbA@mail.gmail.com>
 <CAFEAcA8E98v5X5ekA16c6Fby2HAhOC5G4JYnN9TkrA9G7rVzvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8E98v5X5ekA16c6Fby2HAhOC5G4JYnN9TkrA9G7rVzvA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Fri, Jan 27, 2023 at 02:54:30PM +0000, Peter Maydell wrote:
> On Thu, 19 Jan 2023 at 14:42, Warner Losh <imp@bsdimp.com> wrote:
> >
> > Also, why didn't you move sys/resource.h and other such files
> > to os-dep.h? I'm struggling to understand the rules around what
> > is or isn't included where?
> 
> The rough rule of thumb is that if some OS needs a compatibility
> fixup or workaround for a system header (eg not every mmap.h
> defines MAP_ANONYMOUS; on Windows unistd.h has to come before
> time.h) then we put that header include and the compat workaround
> into osdep.h. This avoids "only fails on obscure platform" issues
> where somebody puts a header include into some specific .c file
> but not the compat workaround, and it works on the Linux host
> that most people develop and test on and we only find the
> problem later.
> 
> There's also no doubt some includes there for historical
> reasons, and some which really are "everybody needs these"
> convenience ones. But we should probably not add new
> includes to osdep.h unless they fall into the "working around
> system header issues" bucket.
> 
> thanks
> -- PMM


BTW maybe we should teach checkpatch about that rule:
if a header is in osdep do not include it directly.

-- 
MST


