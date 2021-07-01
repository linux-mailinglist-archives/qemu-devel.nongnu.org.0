Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9FC3B8FA2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 11:17:04 +0200 (CEST)
Received: from localhost ([::1]:47988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lysoh-0006Jh-1V
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 05:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lysnp-0005Zr-3R
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 05:16:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lysnj-0006LF-2M
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 05:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625130961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DEmgz0w1eZDZDEMANJkVk58+w0M2EL9JUH+4jNVTbwY=;
 b=bYVvaAH3uAA4bcggAiHE21nm1mi8YhwAX+EGPSqlSk7s3sgBCXGw8xai8Kj+2VE63rcH62
 3Q+xsX4dZa4y+Odafe4v6Zm1lO7x3jXF9gEdFH41Lu8Gy8WurO6GQY+p3rW1nFDV1IEhs8
 U7IdC4wjDFfQbbsdfyOlWiv9mhwQz3w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-uDybqcB5OSeg2Etnp__uwA-1; Thu, 01 Jul 2021 05:16:00 -0400
X-MC-Unique: uDybqcB5OSeg2Etnp__uwA-1
Received: by mail-wm1-f70.google.com with SMTP id
 y129-20020a1c32870000b029016920cc7087so1051331wmy.4
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 02:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=DEmgz0w1eZDZDEMANJkVk58+w0M2EL9JUH+4jNVTbwY=;
 b=F8uhwMiDf4PdaqCN24Ek91jR+dvTM8Ii6jrLGKh+ZN5uDX/MjPBdcntl9ztopXf78i
 M7riukmAlDO+JatWx9Oaj9Sw12Ns9SsvqDgx41k4VeZ35hMxwZMft90sF7hvwpN/wRwy
 9vdyZaOkXsZBohojuCvXojeKR8LZmpfGIHFYKqfygntBOj6Q1zj2p//wAd/Y3MxbRTOo
 fpz/7CMLdjLSlhaOzFICRkGZGRXbgg/hAqGZHQimVYe7fozVBoezNAMBnW/2kGU7SkLF
 28LWMeVWGk6onkHBTv8+Dy52sKRetTuZEunQ5wLoSWmAtWJyUnNT38/k8AGarZK5R/dK
 tTRw==
X-Gm-Message-State: AOAM530slNHGaZrVb9K5IBKQ8FAT9UwmPCfdh2Vartf2H/wlxltNLr1e
 ef/bm+N9ylRcoH932lWaHh4Porl1SPETScv+3IpLJSYfZjxgraqY1mcSxG3mhLk2aY5FMRzuSAN
 yXkPS4boG2tjUn9M=
X-Received: by 2002:a05:600c:1c8b:: with SMTP id
 k11mr9475915wms.41.1625130959330; 
 Thu, 01 Jul 2021 02:15:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsS7P7vayth/qI16cFCi5w6vpXX1g1vgfCL0WkA8iKUoNRadKx3eGDhG2FIOAs92KT59y/xA==
X-Received: by 2002:a05:600c:1c8b:: with SMTP id
 k11mr9475900wms.41.1625130959124; 
 Thu, 01 Jul 2021 02:15:59 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id e15sm25761461wrm.60.2021.07.01.02.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 02:15:58 -0700 (PDT)
Date: Thu, 1 Jul 2021 10:15:56 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH 1/2] tests/migration: parse the thread-id key of
 CpuInfoFast
Message-ID: <YN2HzJfGIr+NGsaL@work-vm>
References: <584578c0a0dd781cee45f72ddf517f6e6a41c504.1622729934.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <584578c0a0dd781cee45f72ddf517f6e6a41c504.1622729934.git.huangy81@chinatelecom.cn>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* huangy81@chinatelecom.cn (huangy81@chinatelecom.cn) wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> thread_id in CpuInfoFast is deprecated, parse thread-id instead
> after execute qmp query-cpus-fast. fix this so that test can
> go smoothly.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Queued (both 1 and 2)
> ---
>  tests/migration/guestperf/engine.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
> index 208e095794..9e16fa92d2 100644
> --- a/tests/migration/guestperf/engine.py
> +++ b/tests/migration/guestperf/engine.py
> @@ -113,7 +113,7 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
>          vcpus = src.command("query-cpus-fast")
>          src_threads = []
>          for vcpu in vcpus:
> -            src_threads.append(vcpu["thread_id"])
> +            src_threads.append(vcpu["thread-id"])
>  
>          # XXX how to get dst timings on remote host ?
>  
> -- 
> 2.24.3
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


