Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645F732DD8C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 00:02:48 +0100 (CET)
Received: from localhost ([::1]:41406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHwzX-0005Mn-Fw
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 18:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHwwn-0003pK-Lh
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:59:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHwwk-00018G-KN
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:59:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614898793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M1rpLv8KxYbBtMob/ezV18yLDXZopUTxKIYkf3/raeI=;
 b=bMOuW3RkAXRepJ20QCNC/0e6D5woQuzGSbk4KoNlKjRz8SOTr+rligd7ThAxI2snHsjZJM
 XvmKlW200hjZCY1Hg54xQ4r9tTNBxyBhzlpE5H7rEs+c0thWJFkMI1C8rYojWyf6ow6sVc
 6GJmqQwRMphIeME9nU2+nDwbiSfflBs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-siZl8EL6O_KipXvYFCY4_w-1; Thu, 04 Mar 2021 17:59:51 -0500
X-MC-Unique: siZl8EL6O_KipXvYFCY4_w-1
Received: by mail-wr1-f69.google.com with SMTP id h21so152797wrc.19
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 14:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M1rpLv8KxYbBtMob/ezV18yLDXZopUTxKIYkf3/raeI=;
 b=lxLLkBS7UMf0Das9ZZySsQnwEH9IPqN7x3cHntfb6P1q09zmyCEeUN0VR0RIJYUGDt
 FkQEPNQUc18b1eOe2UYKJZHzODus2WKfVmJ9TvXX+sUlntJHZJ1lC686anuPapEaY6J7
 /lMh8KKMe0IDjzvns3RefP31Ay/We/+fOQyZGpCb6yoZWixBCv2hXJ24IKzCFtndV4oM
 WBwxloaTNecBtZYYP9ObAOINeT5BXVc43N2J4kWs4mMCdpeNznoupAQ7hZ/oMkgnNhda
 PPeQGjwmFVS6jKjd0TExxhyKFpFKCTEGtICkq3l2GUEj1X2QnvX+xWvseg5pA8uAXTmF
 4c1A==
X-Gm-Message-State: AOAM530yff/iWpiCUWeuffvdOsYI1955tJMkUy2EdRbr66sZoQz21HNn
 M9MjRQWEhcQinmj3D9YYZEvCjQqAAihLXByZHHyPmT9QdVqagqlQDRB3/mr+VhGuR2ZFxedGSzF
 fKTMFY+YRDOevCYxUplC580zl4sClimIf0iDZZp+zWI0v1p+KBS+LNmLgk9/czxBi
X-Received: by 2002:adf:f303:: with SMTP id i3mr6130988wro.67.1614898790204;
 Thu, 04 Mar 2021 14:59:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3/zrEM2Tj1hMKOHGGzWJMfWROaOI56zRcY0YRswlLv3Whgb0VEB2ED8buxRKLBj3qrhnIlw==
X-Received: by 2002:adf:f303:: with SMTP id i3mr6130964wro.67.1614898789901;
 Thu, 04 Mar 2021 14:59:49 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id e1sm1278906wrd.44.2021.03.04.14.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 14:59:49 -0800 (PST)
Subject: Re: [PATCH v2] multi-process: Initialize variables declared with
 g_auto*
To: Zenghui Yu <yuzenghui@huawei.com>, elena.ufimtseva@oracle.com,
 jag.raman@oracle.com, john.g.johnson@oracle.com
References: <20210304021621.579-1-yuzenghui@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3f87a28e-5608-0b6e-5583-ba2acbacacf2@redhat.com>
Date: Thu, 4 Mar 2021 23:59:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304021621.579-1-yuzenghui@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: wanghaibin.wang@huawei.com, berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 3:16 AM, Zenghui Yu wrote:
> Quote docs/devel/style.rst (section "Automatic memory deallocation"):
> 
> * Variables declared with g_auto* MUST always be initialized,
>   otherwise the cleanup function will use uninitialized stack memory
> 
> Initialize @name properly to get rid of the compilation error:
> 
> ../hw/remote/proxy.c: In function 'pci_proxy_dev_realize':
> /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: 'name' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    g_free (*pp);
>    ^~~~~~~~~~~~
> ../hw/remote/proxy.c:350:30: note: 'name' was declared here
>              g_autofree char *name;
>                               ^~~~
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
> * From v1:
>   - Move the suffix iteration out of the loop (Philippe)
>   - Add Jagannathan's R-b
> 
>  hw/remote/memory.c | 5 ++---
>  hw/remote/proxy.c  | 3 +--
>  2 files changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


