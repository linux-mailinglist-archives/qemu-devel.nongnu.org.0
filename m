Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6B03B9098
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 12:42:03 +0200 (CEST)
Received: from localhost ([::1]:33572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyu8w-0007YL-5A
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 06:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyu7q-0006PF-Rz
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 06:40:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyu7p-00061L-BC
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 06:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625136052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z8GOgnrv/qg7dnfKolHUA4/y3k9UkDKWy7p4fn7q1KU=;
 b=gjd6rhAQmDNbSAWrpue+GVtjVAxq4K0Iun5hSZcwGrGc24gMl4Ga4G12QpsdFDwf9aWxED
 jLIgs2Zfm9XVOYWIh2zj9kpLXnwjlHjNesqRL+50ulB0w+4kh1rMq8TVGWQa6sA3shUuiR
 /NWAhnaFMy6P7VnXn3jivwhThEVI83E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-HLVpsRkkOriAk3kJKJppkg-1; Thu, 01 Jul 2021 06:40:51 -0400
X-MC-Unique: HLVpsRkkOriAk3kJKJppkg-1
Received: by mail-wm1-f71.google.com with SMTP id
 j6-20020a05600c1906b029019e9c982271so4409318wmq.0
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 03:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z8GOgnrv/qg7dnfKolHUA4/y3k9UkDKWy7p4fn7q1KU=;
 b=lDQ5y8GO26FnzDNVNlhR3sdp0FffPsiIDnSin2d1YiSpBO6P7fEeyDuKJp6qwttqKL
 LxLRCF1a4rDquSzLt77MmY7WD9XXLyeKGwQf642TEYvaOA4m7H5gc/7Cn35pZdmVrN7T
 +kMID6TiOE+DMcfUK6Crt47uoT1WSytU6DmVyIxYapr5i0ncej9cNv7rYYD2G2dgQQii
 XvG+JJBHAyVR3r/5vIDvFMSrTz+W+Rn1pbHukvfSANcPUMdlUPsUZ6HQgh53/528FUXr
 LY/3LmYCNggm27mE45tXvCl0pLw4B9iTPj8hujeYgURS0PwmAG0AyCiWHY8QvT6VIf5m
 0e6Q==
X-Gm-Message-State: AOAM533rdQ0B8jViAIKTKi29jHbjdJyuxLWovObHh/DDtHgTDQK+3yT6
 T5022QVBm9LeD0wBtkK8Kswb388yqWJWyQQnZKiJ4t67funaipx4hN6lb3f+u7oDaW4JqGZbvjr
 n5SUMAl1yiLzhpfI=
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr12769230wml.111.1625136050233; 
 Thu, 01 Jul 2021 03:40:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz13IYFdL3zTY/GhL8Wrvqajt28aVeeGEG6ADc+tb9QqBIcYMEVwgw87FPm1VBL/LtuyY79Ng==
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr12769219wml.111.1625136050111; 
 Thu, 01 Jul 2021 03:40:50 -0700 (PDT)
Received: from thuth.remote.csb (pd9575bc6.dip0.t-ipconnect.de.
 [217.87.91.198])
 by smtp.gmail.com with ESMTPSA id y17sm23461648wma.48.2021.07.01.03.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 03:40:49 -0700 (PDT)
Subject: Re: [RFC v6 05/13] target/s390x: remove tcg-stub.c
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-6-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <828b13cc-e8e2-86db-41a6-72657355c797@redhat.com>
Date: Thu, 1 Jul 2021 12:40:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629141931.4489-6-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Cornelia Huck <cohuck@redhat.com>, cfontana@suse.com,
 David Hildenbrand <david@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/06/2021 16.19, Cho, Yu-Chen wrote:
> now that we protect all calls to the tcg-specific functions
> with if (tcg_enabled()), we do not need the TCG stub anymore.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>   target/s390x/meson.build |  2 +-
>   target/s390x/tcg-stub.c  | 30 ------------------------------
>   2 files changed, 1 insertion(+), 31 deletions(-)
>   delete mode 100644 target/s390x/tcg-stub.c

Reviewed-by: Thomas Huth <thuth@redhat.com>


