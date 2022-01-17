Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F1D490479
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 09:57:36 +0100 (CET)
Received: from localhost ([::1]:57754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9NpY-0007UY-1y
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 03:57:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9NmX-0005XC-4r
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:54:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9NmU-0007bg-JA
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:54:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642409665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fwg2MoNFA0aPoCt0QfjY2bv8JCAypDzq/LPDbFICv4=;
 b=F3Fwhz/j/H8pYfOwV3gJIG1Vg8KteQHz5/HyxVs5VBH2dZA0Yyc6oe0NBbIUK3nJWufKaO
 H6GLLg5Ta7D3pKGlzwqgQJzqSpopbKX8jmsmTScUrUYLKzwznPCM4EnC266dYsL8K9uNAm
 IwvHOWiHptWxZYFI+mz1AfqK2QmwMuM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433--xwWurXwN-iHC0P-SWnEWg-1; Mon, 17 Jan 2022 03:54:24 -0500
X-MC-Unique: -xwWurXwN-iHC0P-SWnEWg-1
Received: by mail-pj1-f72.google.com with SMTP id
 o7-20020a17090a3d4700b001b4243e9ea2so6182732pjf.6
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 00:54:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1fwg2MoNFA0aPoCt0QfjY2bv8JCAypDzq/LPDbFICv4=;
 b=O9BI/vkWmii7eGbC0ZpVu6HvJkXJcIY6eq7MIZ3xOTL7kDeAv4qUqph26lsE7V5y5b
 T9SfdiVVDWKVE5ePFkA3oMK4h3aWnOdwnJtnOPxwRXpi+zL2ohOloF6U42W4X9nDfd7X
 XMwZIge9h4yHnn7b2rLVDgab+nibnAsskliWQcHooiKWPXvR/c74QLtLA2T5LgtN9WfE
 RL3FDBEhxJXrd7SOuR57VLdBm3Yu2IUffrYKTPq/NZCeXeszwDWdSUW2ObU1gfHWxMA9
 UtWUrk84V/PZWC7EIa7CCjvWl+tqr/Q2iYnasttWdj3EmwvGZlep2wBQbML2urtVx6tf
 8bhw==
X-Gm-Message-State: AOAM5312c7im17ccIrcUWaBmD9UmQ6eJyRvCrDsgrmoZHeCiKoz84MGI
 Y50OWy+05sF+YiNYmKm1speU/0XWgAR+7KZA2S1R13R9GW3t9TX29cdoEF3eZTBHI9grYkcZ+i9
 Zd3ThbQX2avlzT/4=
X-Received: by 2002:a17:902:aa85:b0:149:4614:bc1f with SMTP id
 d5-20020a170902aa8500b001494614bc1fmr21214521plr.150.1642409663238; 
 Mon, 17 Jan 2022 00:54:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpeZGHe1CV/beNiWKWCvvHLw2hPaMpJzSI6x8KL23EoBIdGTOQRGjnbXmnjJqS4qfyb4yVwA==
X-Received: by 2002:a17:902:aa85:b0:149:4614:bc1f with SMTP id
 d5-20020a170902aa8500b001494614bc1fmr21214507plr.150.1642409662929; 
 Mon, 17 Jan 2022 00:54:22 -0800 (PST)
Received: from xz-m1.local ([191.101.132.74])
 by smtp.gmail.com with ESMTPSA id mq15sm1564493pjb.19.2022.01.17.00.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 00:54:22 -0800 (PST)
Date: Mon, 17 Jan 2022 16:54:14 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v11 0/4] support dirty restraint on vCPU
Message-ID: <YeUutnW6DYQbVkY9@xz-m1.local>
References: <cover.1641315745.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <cover.1641315745.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 01:14:05AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> v11
> - rebase on master
> - add a commit " refactor dirty page rate calculation"  so that dirty page rate limit
>   can reuse the calculation logic. 
> - handle the cpu hotplug/unplug case in the dirty page rate calculation logic.
> - modify the qmp commands according to Markus's advice.
> - introduce a standalone file dirtylimit.c to implement dirty page rate limit
> - check if dirty limit in service by dirtylimit_state pointer instead of global variable
> - introduce dirtylimit_mutex to protect dirtylimit_state
> - do some code clean and docs

Yong,

Would you consider picking up this patch too alongside?

https://lore.kernel.org/qemu-devel/20211130080028.6474-1-peterx@redhat.com/

I didn't explicitly test cancel of dirty limit during migration just now, but I
think it'll need it.

Thanks,

-- 
Peter Xu


