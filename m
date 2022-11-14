Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDB1628EEC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:10:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijX-0003gF-T8; Mon, 14 Nov 2022 18:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ouieV-0001zn-PI
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oue4a-0004rh-K4
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 13:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668450038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vwxMGCj8LtEP5Jsg69qaV/2Xw0tVSHp7lMy5PZBI5+k=;
 b=IdVMfoIJPbjg3ZYguVthc6GoMWdR+d/wBia+xOhAfRT9ySE/9UnjycRBqrxJZjec/WYaBX
 ticr7w3vMrb8nv+clUXGFQhf8yMI8xk+cm9dDLP8wk3rjmQD4YlhJ2xqicJ+7MeD8foygU
 4PALHK54PTtmzEP02T41lvO/1edaFK4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-FjMRIr4gMy2CX8J0YJwazA-1; Mon, 14 Nov 2022 13:20:20 -0500
X-MC-Unique: FjMRIr4gMy2CX8J0YJwazA-1
Received: by mail-ej1-f72.google.com with SMTP id
 sb4-20020a1709076d8400b007ae596eac08so5973241ejc.22
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 10:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vwxMGCj8LtEP5Jsg69qaV/2Xw0tVSHp7lMy5PZBI5+k=;
 b=0cTI89LG12T9LbxxcphuBr43uyRJJcMi/INs3+NuDGx3ZsUgCLYXht+g1gBjsVZClr
 DZrgdNYp0c06+Wfqy7v5fTLrQr5C+Lt3+3eFKm6GoKwqX+7XqKrzTCle6rZgXNUYpY5Q
 o2WgGvYQcov/l/DpJM3NkXzfbdDEZVHH1DsFeb5JmqP9fd/dVt7QCQdGEm+YcOc0XifI
 LkPjLETgtGCXVk8slZBZhtc6mWIonUbb0KkYoOP4nqirUKu1JCDnAh1eIxJl93ci5pcq
 GI2tW2FdC6oBL0QlJO0mwhz/oyoJhLPdb6DAXL9cCofM9LighCfgcCvHKTJn7VQXnZix
 otng==
X-Gm-Message-State: ANoB5pm0uoEy8yk1J0bA0T2S29etPR79TgxI6JFWe5gX1MrwpaBJQ5fc
 0Vbh2n3vv+ylGgO6EprY4lEm9OBvJ9ypILXbEgM3GgX5ly3NyASS8RMq2eHcMH8jbKlB/I+f5s2
 sjUUlZErebiR0PYA=
X-Received: by 2002:a17:906:8cf:b0:7ae:59dd:e3f4 with SMTP id
 o15-20020a17090608cf00b007ae59dde3f4mr11223965eje.755.1668450019637; 
 Mon, 14 Nov 2022 10:20:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf62IRnQTyMbuF1OLzy3IMuYyDbYClS1qI891g/m1DcgjfrnjLDOpwp11vuKL2Cz3Gb1GByzWg==
X-Received: by 2002:a17:906:8cf:b0:7ae:59dd:e3f4 with SMTP id
 o15-20020a17090608cf00b007ae59dde3f4mr11223947eje.755.1668450019494; 
 Mon, 14 Nov 2022 10:20:19 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a170906068900b007ad9028d684sm4440341ejb.104.2022.11.14.10.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 10:20:19 -0800 (PST)
Message-ID: <3c01d0c8-6a0f-0b5b-1d1c-50c85aaa1320@redhat.com>
Date: Mon, 14 Nov 2022 19:20:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/13] block: Don't use subtree drains in
 bdrv_drop_intermediate()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-8-kwolf@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221108123738.530873-8-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 08.11.22 13:37, Kevin Wolf wrote:
> Instead of using a subtree drain from the top node (which also drains
> child nodes of base that we're not even interested in), use a normal
> drain for base, which automatically drains all of the parents, too.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


