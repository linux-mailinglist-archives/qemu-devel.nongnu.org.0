Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430BB6887C7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 20:50:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNfaL-0004jZ-7q; Thu, 02 Feb 2023 14:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNfaI-0004jA-7V
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 14:49:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNfaG-0006Ud-SP
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 14:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675367364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zgdViYoyhVpR+CIR3k/A5rTt41Plvt2rI/1bUHh1wXQ=;
 b=HnwAeXif6ENJ5WBfsUx2ylkrAb2PtQIGufW654w5dZmAqORbqyKTV254+2pXzGBROmMxg6
 CgLxjn+OyL7ryvmLvHsxO1CUGy1ImRQtpRNTp81Lc2nRh8UXo9+DVUiWbdJAokGVJCBuY/
 D8o5tKFcorndfqgB6BcNIQo7lAyFWQI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-272-HNKQmZezNtO0G_m7FL1pJA-1; Thu, 02 Feb 2023 14:49:22 -0500
X-MC-Unique: HNKQmZezNtO0G_m7FL1pJA-1
Received: by mail-qt1-f198.google.com with SMTP id
 bp43-20020a05622a1bab00b003b63be6827dso1493560qtb.23
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 11:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zgdViYoyhVpR+CIR3k/A5rTt41Plvt2rI/1bUHh1wXQ=;
 b=f/nU1sLGm/hP6Ledtsj5cVECOO5HA/++ZoerufiKTDok/1OX8i14rQ+oZF2Iz1gN8Q
 ZvJxquQVerk5WdM9yEjDxEMTLOc/wwbH8n7MhqEvkCLovK3ihph1VQ6XBynkmd3JDYZv
 fACsXR11ZAUpKw/4COwbAZJtQhAY6DNT8vigiarfjGClE+U0b4yvD62H8ONRa9N0qEQy
 r5xMrtpNxBFA3LJPYORel4kq6E+PDjowrIW2oNXd/ekQQrLvwEn39g4+m4lJR3SQvD2B
 YFTTbOA7IhmKFy2jMhJQ63r8w7WqBI+TItVlsjlO6ffyVVkKPmKwdRUGDMZTp+J6mdWL
 IxFQ==
X-Gm-Message-State: AO0yUKUiBj8vEV/boWfglaE3HZ4OwdQ62t3Yy4ywxZ9MEODAG8rNGgnM
 csctzb/YxKw5qNrQvXu5f+idgs/2i1HxtXe8sPmwciQNsiWDmp6WLbHnOVoyuBiuNZ5h651c6J7
 NrD1MbOfHCjXrMJM=
X-Received: by 2002:a05:622a:1e10:b0:3b8:68df:fc72 with SMTP id
 br16-20020a05622a1e1000b003b868dffc72mr11824043qtb.2.1675367362557; 
 Thu, 02 Feb 2023 11:49:22 -0800 (PST)
X-Google-Smtp-Source: AK7set8EcqdWeZ+GMbuFMeAYZ8nmbT1YBD/SV8NHtaDEdZfe68Jvd/cYuocSPUZfXjwLgqaMFn7gUA==
X-Received: by 2002:a05:622a:1e10:b0:3b8:68df:fc72 with SMTP id
 br16-20020a05622a1e1000b003b868dffc72mr11824022qtb.2.1675367362312; 
 Thu, 02 Feb 2023 11:49:22 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 y4-20020a37af04000000b0072ddf70791fsm301712qke.122.2023.02.02.11.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 11:49:21 -0800 (PST)
Date: Thu, 2 Feb 2023 14:49:20 -0500
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 1/3] linux-headers: Update to v6.1
Message-ID: <Y9wTwCAwWRmHdc/a@x1n>
References: <20230201211055.649442-1-peterx@redhat.com>
 <20230201211055.649442-2-peterx@redhat.com>
 <878rhgtk29.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <878rhgtk29.fsf@secure.mitica>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Thu, Feb 02, 2023 at 11:53:34AM +0100, Juan Quintela wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> How does this change gets into the tree?
> 
> I know that it is "automagically" generated, but who decides when that
> goes into the tree?
> 
> As we need that for the following patch?

Copy PeterM.  Peter, could you share how we used to do linux header
updates?

Thanks,

-- 
Peter Xu


