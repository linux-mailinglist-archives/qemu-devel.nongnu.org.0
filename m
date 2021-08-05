Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F613E0F71
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 09:42:20 +0200 (CEST)
Received: from localhost ([::1]:39992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBY1D-0000IB-55
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 03:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mBY0A-0007Xn-9f
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 03:41:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mBY07-0004J6-FM
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 03:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628149269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLODFDSfuVCzvzgkymBBCfUeMSi9xUViBnYgxksUVDs=;
 b=be1FFCZg8bDs+heBjv5HIvqsT+Lc0SDU4cldfAfa1bH13/j63s8oF64EitnyEk/p5sro/5
 5uj+rlwIPWB7Ya8NMjEBIROabmISIoK8bl4rAEXPSTe2gzhXHxMNxS2ZCLSmp9zunIsUGD
 euhHjm86ORSaec9vKaXZbHVULs5+pw8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-vnewzwAAN9uML9mS6YJCWw-1; Thu, 05 Aug 2021 03:41:08 -0400
X-MC-Unique: vnewzwAAN9uML9mS6YJCWw-1
Received: by mail-wr1-f69.google.com with SMTP id
 o4-20020a5d47c40000b0290154ad228388so1612076wrc.9
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 00:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XLODFDSfuVCzvzgkymBBCfUeMSi9xUViBnYgxksUVDs=;
 b=W/LBoYCcGJFZ0dLy45df7BDIil0A9dawaB6Ke84fd9HzSAMZrIveX4kZi7wwp+42mp
 IFAsaDiQqCu/xSiz1a9h9v0va+peFV8nZktIJ61GUW6P00uWh/ocOFyxGK4e6A7vmqv2
 kUZ0tCBnVKlbR0a5qGvMg7qge5cAkeMaFwykB9Dl4rhyM9oTHa8BhOK/KEzeFg9bJnGT
 PmslciDhlnYfMj1Z/23MepkcnbN0cBAPF30NIWWZw02uHYYvXtKzAdqFOVd3t1deESvG
 wwCqA8PvRz6QsN33Bb3mBT0LMu/wWRwQO0JxAGYGbOJjOW6pGhPT2LYBLhwnEga+jBgK
 yvCQ==
X-Gm-Message-State: AOAM530lZshszYJ4D1P/DUG81krAMLZz+vmQr+CvpdeQqu0L+jWefEWS
 E+jKrUs15WBwLldrmUZHL7YuYgHbG97uCFghVHx+mlwTB2KQT9J+cLcpNZvzvx892xfT8bOhw23
 s94N3LFWXyJo3JkA=
X-Received: by 2002:a1c:2096:: with SMTP id g144mr2286094wmg.86.1628149267220; 
 Thu, 05 Aug 2021 00:41:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwla9AcicoQ1r9Xn+FIea80972oRF6smwzHbpCa/xMSxikh6vLI/OYu/DRGQwmetSQvDctxWw==
X-Received: by 2002:a1c:2096:: with SMTP id g144mr2286062wmg.86.1628149267024; 
 Thu, 05 Aug 2021 00:41:07 -0700 (PDT)
Received: from [192.168.43.238] (166.red-193-152-126.dynamicip.rima-tde.net.
 [193.152.126.166])
 by smtp.gmail.com with ESMTPSA id i29sm4712307wmb.20.2021.08.05.00.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 00:41:05 -0700 (PDT)
Subject: Re: [PATCH v3 3/7] migration/ram: Don't passs RAMState to
 migration_clear_memory_region_dirty_bitmap_*()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210730085249.8246-1-david@redhat.com>
 <20210730085249.8246-4-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cd4e4aea-812f-7354-e008-779b85c54da0@redhat.com>
Date: Thu, 5 Aug 2021 09:41:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730085249.8246-4-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 10:52 AM, David Hildenbrand wrote:
> The parameter is unused, let's drop it.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  migration/ram.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


