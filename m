Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8EE2D0271
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 11:12:36 +0100 (CET)
Received: from localhost ([::1]:51450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klr1u-0005zq-QO
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 05:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1klr0O-0005Q3-CW
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 05:11:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1klr0L-0008AY-3o
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 05:10:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607249454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EYmWuYbj3ndOo7nkbcG21/dYX2AXT2BoIcQJHNNnMzk=;
 b=IbawE7ufAsIXJTXycjAWnBZx94xs+gi1RdIfoqFkV5DSKTbSjiRktZ86vLhpT5XAieIvK2
 jHHkRgn/myVnY/xaP3IyTRYF7jFG6XYk5ZMkX5u43UcyFr2JXsGXBeqB6+xNemhqqSkk1t
 Uut4o0G5FjWJ57ReEoEWM4uYoRs+Fto=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88--8VyQEBrOseVypt5sRCxrw-1; Sun, 06 Dec 2020 05:10:53 -0500
X-MC-Unique: -8VyQEBrOseVypt5sRCxrw-1
Received: by mail-wm1-f72.google.com with SMTP id v5so4040713wmj.0
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 02:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EYmWuYbj3ndOo7nkbcG21/dYX2AXT2BoIcQJHNNnMzk=;
 b=T1B7KiSZFs6kp+hviVBFNH4zy6geFZojJ8kXYWt4xDs41TC2O8gb3ZlpinDTtDZZDN
 edOIyg5eRWBpUWmPYGjTVsKn9kAAyK//MZ2O7hNenpmUTeH8VVE6fiYP0y8ffMJpPvHk
 +nlsMYKU/PNIpeOa+fiwK99i5zvSvm6cR7uEx3DqpuVN92yrN9dT+qcrgfBqS5JY353G
 o4FiPsuPNYmGAEVsatTrrl+VtJb7nbeumJxbosDEbdVTZCrM1nxg7g1TePmmS9dwGB1o
 O/vZxJUF5Y6PxDDzbobDQc2UdizfuIgQ9j+60PXuzTovPuOxxQB7N3nwv7zVNSJS5g3p
 01fQ==
X-Gm-Message-State: AOAM531/FoLUkVJcNB0n5EgceXabr/ahleQxwc6+VMBw8rNHVjR7iJe/
 yPX6cxscvjCKd+HiAwYrVK4/x29MgTc4cISTHDlqpENI6szKgGWOXJUA2/nBp+mxCtVLE8lLOfP
 iNLabuTnWHJC12Ns=
X-Received: by 2002:a7b:c349:: with SMTP id l9mr13310964wmj.129.1607249451767; 
 Sun, 06 Dec 2020 02:10:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwc/TsLofOeuRpHou93RgjEvw7lnvtjt76tnYfNqQ+DtDRz0NzB52QWlvGyGp4dkNR1lP3kUQ==
X-Received: by 2002:a7b:c349:: with SMTP id l9mr13310943wmj.129.1607249451565; 
 Sun, 06 Dec 2020 02:10:51 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id o15sm10321067wrp.74.2020.12.06.02.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Dec 2020 02:10:50 -0800 (PST)
Subject: Re: [PATCH 1/1] Remove flatview_simplify()
To: FelixCuioc <FelixCui-oc@zhaoxin.com>, Richard Henderson
 <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20201206082142.7519-1-FelixCui-oc@zhaoxin.com>
 <20201206082142.7519-2-FelixCui-oc@zhaoxin.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <91448942-664b-9600-b17a-c96d462b9896@redhat.com>
Date: Sun, 6 Dec 2020 11:10:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201206082142.7519-2-FelixCui-oc@zhaoxin.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: TonyWWang-oc@zhaoxin.com, qemu-devel@nongnu.org, CobeChen-oc@zhaoxin.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/12/20 09:21, FelixCuioc wrote:
> From: FelixCui-oc <FelixCui-oc@zhaoxin.com>
> 
> Flatview_simplify() will cause some innocent mappings
> to be unmapped.
> 
> Signed-off-by: FelixCui-oc <FelixCui-oc@zhaoxin.com>
> Signed-off-by: FelixCuioc <FelixCui-oc@zhaoxin.com>
> ---
>   softmmu/memory.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 11ca94d037..66d36dcac4 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -733,7 +733,6 @@ static FlatView *generate_memory_topology(MemoryRegion *mr)
>                                addrrange_make(int128_zero(), int128_2_64()),
>                                false, false);
>       }
> -    flatview_simplify(view);
>   
>       view->dispatch = address_space_dispatch_new(view);
>       for (i = 0; i < view->nr; i++) {
> 

This will give a warning about an unused static function.  You have to 
clean that up too.

Also please include more information from the previous discussions in 
the commut message, thanks.

Paolo


