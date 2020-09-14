Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A0D26899C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 12:52:00 +0200 (CEST)
Received: from localhost ([::1]:40776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHm5X-0003TA-HQ
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 06:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kHm4D-0002D3-DV
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 06:50:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38527
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kHm4B-0003bp-5i
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 06:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600080633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39Pv2bPBFx2WlMIEN6zwUX9JOT8pfEqlhhVu26vBS0g=;
 b=iytBwyJlHxnIkcpZkWlYadzFxwBHdXP4XzbiitbjEzEdP7evxGUucOiUvF1zwxrZCSfczE
 5p5g3w9QadXwwq9aPpTNrF2tAYcgakB7cNaebRxpmE9IoF+J1EMsIe3ZgeNnaDRMuJUA3P
 GIIc2qMv6A0IfkeLix1Hi6Igv/H75BE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-5fl1RIgSNne5fYBNxu2hmw-1; Mon, 14 Sep 2020 06:50:28 -0400
X-MC-Unique: 5fl1RIgSNne5fYBNxu2hmw-1
Received: by mail-ed1-f71.google.com with SMTP id f16so9087312edm.10
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 03:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=39Pv2bPBFx2WlMIEN6zwUX9JOT8pfEqlhhVu26vBS0g=;
 b=fgPrICxqEY//V1FJKAf5/8NG687oY/crpr1atn5ruJ/s1hXDFVkJRsD8W47g8FU+V8
 RLODOb07K5kmlzqzQ2gumD5FpPhBTwM/1Z6JLXxQHoTQs7oWfoDSvdZZUw4FaMhZNA+i
 Wm6KLyi84gdnM219EvO6a1nf0zNFSPk1qAO0HLv8AXKzF0VjCgyrDowkYo1ADuvrRqwU
 NjbKLV25GKpP6s+QrRMMagB6UxvLlVDitXm/V2PTALxeVbd/LrUb3HXw8hr1+WuJxs6U
 4CDSDLqYUIJIirRXA7CCAt2mO22MnPvHf4gGFi9XymwhiNhCZmErX9+KLy8EAa97N2Ye
 AgsQ==
X-Gm-Message-State: AOAM5328gWhXRRT9p3aZ5qW/ZVeR3Jk4zzrdaoYvhMyf+t28Jikduajy
 qQ6+2QjAU4Cr3L9cgZJm3t2xNhyt2Hkp2bCH5GGbCXI//X6/vtxHpJkU9lO3GDkF7X8KJkyyMvl
 zcFJidUkwCOJ4Jo0=
X-Received: by 2002:a17:906:ca4f:: with SMTP id
 jx15mr13833159ejb.454.1600080627304; 
 Mon, 14 Sep 2020 03:50:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYjKxzPCR36K3IdTVfyruRHrvG8PRJc96VL4lq3CWMCur+8QVwDbA5N2lnTxSsNvknbEoUiw==
X-Received: by 2002:a17:906:ca4f:: with SMTP id
 jx15mr13833152ejb.454.1600080627147; 
 Mon, 14 Sep 2020 03:50:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:6047:f58e:7d32:2e02?
 ([2001:b07:6468:f312:6047:f58e:7d32:2e02])
 by smtp.gmail.com with ESMTPSA id z18sm7478140ejb.92.2020.09.14.03.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 03:50:26 -0700 (PDT)
Subject: Re: [PATCH 0/3] configure: add missing CONFIG_FOO variables
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20200914095231.621068-1-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8cda7b10-1eba-ccfe-1cae-c023fba87553@redhat.com>
Date: Mon, 14 Sep 2020 12:50:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200914095231.621068-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 01:39:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/09/20 11:52, Stefan Hajnoczi wrote:
> The meson.build feature summary checks the presence of CONFIG_FOO variables.
> Several of these variables are never emitted by ./configure so the feature
> summary always shows these features as disabled.
> 
> Stefan Hajnoczi (3):
>   configure: add missing CONFIG_TCMALLOC
>   configure: add missing CONFIG_JEMALLOC
>   configure: rename QEMU_GA_MSI_ENABLED to CONFIG_QGA_MSI
> 
>  configure   | 10 +++++++++-
>  Makefile    |  2 +-
>  meson.build |  2 +-
>  3 files changed, 11 insertions(+), 3 deletions(-)
> 

Thanks!

For 1 and 2 I think it's simpler to move the whole test to Meson.  I
already have a patch for that, though I was going to send it next week.

Paolo


