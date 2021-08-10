Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D3D3E814A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 19:59:57 +0200 (CEST)
Received: from localhost ([::1]:59170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDW2e-00085X-Sb
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 13:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mDW0S-00063V-UN
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:57:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mDW0P-0007x3-RJ
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628618256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yDtNzzJRzMyGYG9nyiY3rgZ22kplw7EEbJiAGji2Umw=;
 b=PAs5HPKLrO2IeRtD8Xt7pbKCqmEUfF67sn0IChp8+aMLBDMj998dD9FfVpb7tPSg5T46Ti
 rQyZJMo8bbSvI4r/0DrnD0+wobgZILN7WnNXyPhYhZz/jgKVVEcLzPnSZKUCERFvwZy6P0
 WEoYKc9o54Iecre6b6dPyGs/J8k6qU8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-62U6Dbv1MuK6BXwQoerB8Q-1; Tue, 10 Aug 2021 13:57:35 -0400
X-MC-Unique: 62U6Dbv1MuK6BXwQoerB8Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 p2-20020a50c9420000b02903a12bbba1ebso11067472edh.6
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 10:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yDtNzzJRzMyGYG9nyiY3rgZ22kplw7EEbJiAGji2Umw=;
 b=BQnKqQ+drY9E2jcqMQ8Y/oyX3uHWhlM3jUGGEfRgPD9iSOTvR8OtVdTNJdoa5dBUT4
 Oqb6OxT5HBE7+yKQYe3bluuAs+86LqskRTPAKn+psovvoGAVrAkJ3Du+8SXwiOSjEA+A
 FE2VBZYSZ6YBgvoUvu2r2+4avjZNLjvWtLCO0K5tmppNie3pXVLzzaak5lSfbOtA1OGJ
 HRFXiHy1Loy/h/73YD+lwRkTI4oaAY3uQA41bvRSllDpvOamj3xA1BUgDNBYvhv9Npyy
 aVgof3GXwR/0zTtdN5tt1mgPdB3SON+y9WIjt/WS7hBZgel+aITj3zoNG4eBlCzXESQH
 cYKQ==
X-Gm-Message-State: AOAM533/u1HH96hdd8KvKq76a9Gu/LGwmMNRY8RzD3kyb0Oh7/aVJoOY
 fnx8KAEMCwXcUJ432Jb3GIzKyHxFvRhyG0g4480MymRuKYXn9LOrGrEMxlwDxco34fJWZs4mq2O
 Im2t9dQCOeTxInmIiyy0bXjf6uZ2+m4+IMis2HS0I186YLNDtt99c2HoQqsSUKZTqvRI=
X-Received: by 2002:aa7:d607:: with SMTP id c7mr6535585edr.140.1628618253864; 
 Tue, 10 Aug 2021 10:57:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEuU+s/m4XMQA+ZfCMyJCK6NQqZ4pLgEwBezu6m0RSKDoD9aRKcNlmoUgHiX9Q3znGJeCAgQ==
X-Received: by 2002:aa7:d607:: with SMTP id c7mr6535567edr.140.1628618253671; 
 Tue, 10 Aug 2021 10:57:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id c6sm7112161eje.105.2021.08.10.10.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 10:57:33 -0700 (PDT)
Subject: Re: [PATCH] vl: fix machine option containing underscores
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210810131228.2332728-1-jean-philippe@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6e233344-dd09-598f-082a-afe73d788b33@redhat.com>
Date: Tue, 10 Aug 2021 19:57:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810131228.2332728-1-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/08/21 15:12, Jean-Philippe Brucker wrote:
> My first take was renaming default_bus_bypass_iommu, since it's the only
> machine option with underscores, 

We should do that, since the underscore variant still works and the 
result is a simple one-line patch.

Paolo

> but then we'd want to rename
> bypass_iommu as well for consistency and update all the docs. I prefer
> this but don't mind either way.


