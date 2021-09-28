Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF0941AD48
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 12:49:24 +0200 (CEST)
Received: from localhost ([::1]:54998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVAfr-000500-H9
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 06:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAdW-0001qy-Uk
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:46:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAdT-0006nH-MV
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+E+OQyuRr04ezd3Dkr8PDTZR+4wCJD5xibUm1NThzA=;
 b=ZIq5b3mkc0jYXuBHCgFzevpi8DfNXuJ1cXgTm/27tpIKm0b+NO9tfcGuDERR3b73rZftXp
 WQtisfztIZaVQ9ZwNpGAMkDjDarMTeUSv1HLdKRLhDISzc/7QEgjyj5EtnLbbzr4C3OIN0
 G3ZP8qua7CDmoHaYHSkHGyg+f/qTHjs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-o4VUK5VvNqyfBfN9eyN3PA-1; Tue, 28 Sep 2021 06:46:51 -0400
X-MC-Unique: o4VUK5VvNqyfBfN9eyN3PA-1
Received: by mail-wr1-f69.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so1864047wrg.10
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 03:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e+E+OQyuRr04ezd3Dkr8PDTZR+4wCJD5xibUm1NThzA=;
 b=ScuzpO+2EBx2elSJqhLgB+gSqMnwHiqUZxO5YWo2PffZbGWEy+6vTL4EF6ccNltGnC
 rl0Vi5YZfiUNKl127dzGm66OOOV2CyXHiJ8liwjtxJINiMWCfQpc5LYZJ4RXkeUgyXWU
 NRVbN2rJAzNpo+WdBVJ7zHSaGKgvYUb8Km7aM8HNq8en4iI5IfUb4vnakjHQL0yKLVqw
 pPaTGhwy24YbsdEUi3T17ocmJfp4wYlWud/nu2NCzEdKOXYe069HGb9r8QQVpU7IVfSw
 voB6xrACspnbldJjCLReujVI1A0yOBpzw9IcYFWHhk5Zn1bCS1OULiBcQGqIiCHq7ssr
 IKyQ==
X-Gm-Message-State: AOAM530qhltkCNnDOJseC30bcUOu2hPzRIcHHspOSOf/XpqvF/I4gUtb
 Z3A8agCgi4iIbynSfXBdIbwyDTmDn1pdoStmhC9alpW+dWBw5I587s5V2JCS00oFtYp7n55ioVQ
 pLfQB6CzT8c2qa8w=
X-Received: by 2002:a5d:4810:: with SMTP id l16mr5567778wrq.3.1632826010729;
 Tue, 28 Sep 2021 03:46:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw46BYGIBjzwhSQxupnHMq0/Li4KPfFWoXvG5sqUz9W7gOr7Ua20yVyRYOyFDKJvGI/BCm+zQ==
X-Received: by 2002:a5d:4810:: with SMTP id l16mr5567761wrq.3.1632826010498;
 Tue, 28 Sep 2021 03:46:50 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id g21sm2280904wmk.10.2021.09.28.03.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 03:46:50 -0700 (PDT)
Message-ID: <9728083c-059c-3990-f651-3fbdce86491c@redhat.com>
Date: Tue, 28 Sep 2021 12:46:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] qemu-options: Add missing "sockets=2" to CLI "-smp 2"
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20210928093157.14620-1-wangyanan55@huawei.com>
 <20210928093157.14620-3-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928093157.14620-3-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: wanghaibin.wang@huawei.com, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 11:31, Yanan Wang wrote:
> There is one example of -smp CLI in qemu-options.hx currently
> using "-smp 2" and assuming that there will be 2 sockets.
> However now the actually calculation logic of missing sockets
> and cores is not immutable, we should use more explicit CLIs
> like "-smp 2,sockets=2" if we want multiple sockets.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index dcd9595650..ff8917c5e1 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -395,7 +395,7 @@ SRST
>          -m 2G \
>          -object memory-backend-ram,size=1G,id=m0 \
>          -object memory-backend-ram,size=1G,id=m1 \
> -        -smp 2 \
> +        -smp 2,sockets=2,maxcpus=2 \

Is the addition of "maxcpus=2" intentional?

>          -numa node,nodeid=0,memdev=m0 \
>          -numa node,nodeid=1,memdev=m1,initiator=0 \
>          -numa cpu,node-id=0,socket-id=0 \
> 


