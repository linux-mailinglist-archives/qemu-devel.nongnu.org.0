Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D069D552119
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:34:24 +0200 (CEST)
Received: from localhost ([::1]:47114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JPz-0004le-Vi
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o3JNj-0002g8-Bk
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:32:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o3JNh-0003bB-4S
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655739120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n05QKL3sho9yVUp3HacvH8qSNSvk3Q/ZY40B8L+tWV8=;
 b=gApv9MLQB2cciJLgQ6f9afu5wn+HgrjwqIjAfqMxLRnjhAgsT6PfkEYPYTCX726CpAOfil
 VTae/U1La+u8I8TM8CC7e7QwWtx1u9b4KT4NGTuQWSu1BJEB6Y9HsUZuCWAe1zxaxaxYiZ
 KXAySnO347PaBvUfuT2IXmOUvPc6tho=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-zsGXWpDxMqylUWfuXamMTQ-1; Mon, 20 Jun 2022 11:31:59 -0400
X-MC-Unique: zsGXWpDxMqylUWfuXamMTQ-1
Received: by mail-io1-f71.google.com with SMTP id
 k5-20020a6bba05000000b00668eb755190so6239977iof.13
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n05QKL3sho9yVUp3HacvH8qSNSvk3Q/ZY40B8L+tWV8=;
 b=6P7iblt2HVJsExwKi8NwQvFrghmugj8bOmaLjezzPZaChbqT/VgW/ZZ1gtxbScFOKX
 XWFDF0cauXiJYHZ1Epc6la/VYiwuvV7tCJE7rKG0k8F150SehLGft9tKYOy4mGtQf9JL
 7K7GhcPrVTkmtU+7sbNveDuTAMtTacnF4UyLKQLpOG5aS8bbd/yMQ8CM+/K3XLZNThDd
 9WC+bKD8MulDtDYTkr7LfSXVoKNSgXTDIGmEvxdrAwrm3EGdAwgRcIVHB1DsDCkr53Aq
 bFZfpYT34uxBT/Hf2b5WJq/bHUdtaFA/i1idWEL+r7TqfIA7VYKQJMxV/8VLVRPcUC/E
 0tJA==
X-Gm-Message-State: AJIora9pLKe0FljAWP+PyJVd0OITDZfezpHe+2bgWiXePwq3kd+Rp6am
 HHarfyfV0kKHIPQgfOKHlhLFRRqIr7cxQnnRO0mp2sNllZBNiXHvckZWMHwyOeDUfOy0Lo9t01P
 Sr3M6A9FCX0WzRlk=
X-Received: by 2002:a05:6602:3409:b0:669:d82b:4854 with SMTP id
 n9-20020a056602340900b00669d82b4854mr12132215ioz.4.1655739118536; 
 Mon, 20 Jun 2022 08:31:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uWVab5RL0LCuWJ84DtvwyuLiVHSRSSpzqVxhaMItotjMDIUoB3iv3O/bDJJBubkgEM8jcUjQ==
X-Received: by 2002:a05:6602:3409:b0:669:d82b:4854 with SMTP id
 n9-20020a056602340900b00669d82b4854mr12132197ioz.4.1655739118323; 
 Mon, 20 Jun 2022 08:31:58 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a02a814000000b0032e7bd2287asm6118183jaj.94.2022.06.20.08.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:31:57 -0700 (PDT)
Date: Mon, 20 Jun 2022 11:31:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 4/4] migration: Change zero_copy_send from migration
 parameter to migration capability
Message-ID: <YrCS7OTweyxcLmzE@xz-m1.local>
References: <20220620053944.257547-1-leobras@redhat.com>
 <20220620053944.257547-5-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220620053944.257547-5-leobras@redhat.com>
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

On Mon, Jun 20, 2022 at 02:39:45AM -0300, Leonardo Bras wrote:
> When originally implemented, zero_copy_send was designed as a Migration
> paramenter.
> 
> But taking into account how is that supposed to work, and how
> the difference between a capability and a parameter, it only makes sense
> that zero-copy-send would work better as a capability.
> 
> Taking into account how recently the change got merged, it was decided
> that it's still time to make it right, and convert zero_copy_send into
> a Migration capability.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

I assume this is a request from Libvirt? We don't have a release yet so
yeah probably we still have time..

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


