Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CBD3FDF9B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:18:24 +0200 (CEST)
Received: from localhost ([::1]:57524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSwR-00065Q-JM
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLS9D-0001WB-Ph
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:27:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLS9C-0003e9-6N
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630510048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3p94SWuVwowKCUt8FvJriR/qkltdvAkRqgjzymSZVw=;
 b=hTBgP35CUa0kiHkp6MLwKxBwEvDHt3eUcHyHeR+tMlQNkr5w8QC+/ihVKBVMJ2kPnkU9ok
 NvyQ7liifP1Mg7l8XxzoqXhY75XfVDEGIRKDFK6y5SsmU0wQyoeDbesQqRKfrpT+YK3J4P
 Zd2vfqHOomRA1oMfDrIs+YpeoDR+oIY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-3KyoIYzGOqirlCeCQwJxuQ-1; Wed, 01 Sep 2021 11:27:25 -0400
X-MC-Unique: 3KyoIYzGOqirlCeCQwJxuQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 n18-20020adfe792000000b00156ae576abdso22067wrm.9
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 08:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q3p94SWuVwowKCUt8FvJriR/qkltdvAkRqgjzymSZVw=;
 b=Yv3y/YFQVrpAeL07qV3//kTagSfU6DfBswsmBViRJzvebYtcD9eMa9PHjaWRt2gYGy
 ziWfRvNo16oQQjWIs+JlYoBB2TwBJ1zKQ44fT4BkvGM43hCxvhc6DhnmuUocFETFm+o1
 0meDKXuGWOanLyNi6kv6WlsePzovPUIPufBbqx6IpCpH2ogmZkJhuk1x0cHXEj35nTV2
 eEuuPva5PEnmPpe4iAfV7wVKyf0Gr8KNIQZ070PoarY/VM09PYVcq1Hcdp80NE+LkPTv
 q3rHCXPPTnOVVPWNNmG4BYH79OabGHRAlKKcbuNYaE5iWmSMdM+OiMUMMIZExWmKKfLI
 KeiA==
X-Gm-Message-State: AOAM531hPccELciQkJjuJ0vDtv70lCoMjAsofcBAyvBj4YfnEsE91GIo
 nakmNwnYJSuE2hkoDvqKPY6ksy2dXmfyulsaVg/RQCI1FANZjUE8+H1f9yhzW+rTp8ET7emSsIa
 gqopmEHCGQf7cpZc=
X-Received: by 2002:a05:600c:4b92:: with SMTP id
 e18mr55286wmp.156.1630510044233; 
 Wed, 01 Sep 2021 08:27:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4HFtCPEm1y1P1+bmkka1Lcy9WXmvzBhxFooYL9VvlPL9PoGmC3pG+YpltJp6D7zZf7ugUew==
X-Received: by 2002:a05:600c:4b92:: with SMTP id
 e18mr55260wmp.156.1630510044054; 
 Wed, 01 Sep 2021 08:27:24 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t14sm5355237wmi.12.2021.09.01.08.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 08:27:23 -0700 (PDT)
Subject: Re: [PATCH] s390x: Replace PAGE_SIZE, PAGE_SHIFT and PAGE_MASK
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20210901125800.611183-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b5cebe17-c00d-dc87-5db0-7ffd0dbf2493@redhat.com>
Date: Wed, 1 Sep 2021 17:27:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901125800.611183-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 2:58 PM, Thomas Huth wrote:
> The PAGE_SIZE macro is causing trouble on Alpine Linux since it
> clashes with a macro from a system header there. We already have
> the TARGET_PAGE_SIZE, TARGET_PAGE_MASK and TARGET_PAGE_BITS macros
> in QEMU anyway, so let's simply replace the PAGE_SIZE, PAGE_MASK
> and PAGE_SHIFT macro with their TARGET_* counterparts.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/572
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/s390x/s390-pci-bus.c         | 10 +++++-----
>  hw/s390x/s390-pci-inst.c        |  8 ++++----
>  hw/s390x/sclp.c                 |  2 +-
>  include/hw/s390x/s390-pci-bus.h |  5 +----
>  4 files changed, 11 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


