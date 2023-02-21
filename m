Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C001269E39A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:37:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUhF-0000Y9-55; Tue, 21 Feb 2023 10:36:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pUUhD-0000XE-Kz
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:36:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pUUhC-0001vI-11
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676993804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QW3pIlyS1DILgj8C4dKXTsA8BZL1hqj4Sa8DrS+IAV8=;
 b=AeofpA7e2qSNSqWq5I7Lk5DFpQ070UnSz9YmJ/CHTpyVkmtW4hwJSe8aeacevWnLo9Jqok
 1ek9Y8IrEgS8pgskwSKiXgSZIS2W7jXHu+cIyuH7x+cFPv0NwIKo5JCE8PwNWGh4jcFGY/
 rHwGGvz6dWDOKLE8QNNBuzPfJWkgQRg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-136-ufW42MSVNuurT2X2I6uiZQ-1; Tue, 21 Feb 2023 10:36:43 -0500
X-MC-Unique: ufW42MSVNuurT2X2I6uiZQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c15-20020a05600c0a4f00b003ddff4b9a40so2008864wmq.9
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 07:36:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QW3pIlyS1DILgj8C4dKXTsA8BZL1hqj4Sa8DrS+IAV8=;
 b=QKXOKTTlsxi1JFG6Iqkv97ACXY/RZ2XXi4zWT8M/dIC02nZ7YemxeSVcUjHPGIj4Ap
 FptOCxWDtE6i8Zs7eAwx+cz+Vo2OeXbsosjo7cvSlHfeIDLe1KTeXE5J+XnTYAfCs7Sj
 hwCofKyXWSrS6VGeQqD1I4WlxWufxolK1F31/EbxQwPBuK9m1XycipBWweQjKIsTup5R
 d/czciWSTZUS75luhFMEuTean/avy5NDoYKo78OPZLjAe5/mWcp/1+okhLj4JxJVb8dg
 NoCRkk3BGiZKfTNTa0x7gqLKzsPmxGB/fXTcrN1BX8gqvCkEeB2FnWIip7AlpMEU3xuP
 vg0A==
X-Gm-Message-State: AO0yUKWKpgaeCWhQnUdoznwLdpfAX2tqf0rrmXx5IKxBg+JLNa4lQgML
 NbvFpHAdxaSCK2phYu2u9v4IXM6F7AMFNxXNu/b+2bMCMFhvx4tYmLRuS6R5yF5uP1vAP2ggsz3
 5w3e2SGsDtlT38fc=
X-Received: by 2002:a05:600c:30ca:b0:3df:12ac:7cc9 with SMTP id
 h10-20020a05600c30ca00b003df12ac7cc9mr8875029wmn.15.1676993801975; 
 Tue, 21 Feb 2023 07:36:41 -0800 (PST)
X-Google-Smtp-Source: AK7set8WWHi8JGqjjBHN0AH4da5tJ2e1Yqk9AHONqeXzbnrJIHn/QmrQdHc64Pq+jyBm2hXXfpSKYQ==
X-Received: by 2002:a05:600c:30ca:b0:3df:12ac:7cc9 with SMTP id
 h10-20020a05600c30ca00b003df12ac7cc9mr8875019wmn.15.1676993801762; 
 Tue, 21 Feb 2023 07:36:41 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 3-20020a05600c024300b003daf7721bb3sm4915274wmj.12.2023.02.21.07.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 07:36:41 -0800 (PST)
Date: Tue, 21 Feb 2023 15:36:39 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] tests: Disable migration-test
Message-ID: <Y/TlB36EjrWwr2ne@work-vm>
References: <20230221132726.2892383-1-peter.maydell@linaro.org>
 <Y/Thas4efx14JsBi@work-vm>
 <CAFEAcA9=p0XYti45m0sW+iO9qgF9iXpeOPvHd7Xpy32yCUL3sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9=p0XYti45m0sW+iO9qgF9iXpeOPvHd7Xpy32yCUL3sw@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Tue, 21 Feb 2023 at 15:21, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> > Damn this is really going to impact the stability of migration if we
> > don't regularly test.
> > But fundamentally, I've never been able to debug much of the reports
> > that come from flakyness in gitlab ci; we're not getting the most basic
> > information like which subtest or where we're upto in the test which
> > makes it very very hard to debug.
> 
> Right, but if you want more information you need to change the
> tests and/or test harness to provide it.

I don't think the migration test is doing anything odd in that respect;
We've just got a bunch of qtest tests; having a test framework which
doesn't tell you which test failed is very difficult.

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


