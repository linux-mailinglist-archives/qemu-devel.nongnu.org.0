Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24043D956F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:43:29 +0200 (CEST)
Received: from localhost ([::1]:60398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8oWe-0000jT-N8
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8oRq-0002T2-Eb
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8oRp-0002e1-3p
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627497508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l3obsMpa1ums7OFa0SlocuC6ph6hwAYBez0MvRud7fk=;
 b=JTDoR3XFFFolhzM5T4cgssd3AUUQZ5OMHxGsCBAfSoymEvf7FngGjKuNx+Iz5U+w3BNMuQ
 UlzgYigdN2HP1xcE3cDcBUDE3t+VFJlEYaL+OSE+SHKMi/nOhnqmGElZFahcQ0vsi3pccF
 P9/fA0zMVi9qb5jAbZTRppGTKpWTNjI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-VGXhCD5TPYSLr1MKTZ-3WA-1; Wed, 28 Jul 2021 14:38:27 -0400
X-MC-Unique: VGXhCD5TPYSLr1MKTZ-3WA-1
Received: by mail-wr1-f70.google.com with SMTP id
 p2-20020a5d48c20000b0290150e4a5e7e0so1250732wrs.13
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 11:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l3obsMpa1ums7OFa0SlocuC6ph6hwAYBez0MvRud7fk=;
 b=TB3hBIqNWep+/hlr3s4c53O0ADH9sBiZeo0koOBg+Vp7WSq+jdKy2CpY6Hasrrfp4q
 4U0bUzczl5yi9v+sN972IkUJTO9mfNdCp6QrjFK9tP176ikjbFiuWYKkuMzEZDDhxCzp
 EaGGMokP6V7PF7Rs5IJYVf/lsqWjRBPKNv1JXYwMH9t2q8bSHhlNpYXph4T2c6WNZqYr
 RAFOcWmBVxwiVGSPJDm/oGz9I0WcVIqcJ5M4FMD2mPiOqWZZQ0JpBhTdi3MJDak/uDe3
 BZDrxMPFQi4AKOElNBWBHkcGl/vouccDVnjb5K/TCOSyKfLZkFhrP79vsP+yRlHcyzaz
 JKMQ==
X-Gm-Message-State: AOAM530cIJDhyM4zvIo+1KxUV/E8BTWJkY50ATUwH6ib4FywKIx7yfZb
 2+sfOoh5xqw5pzdzLX7jaDyF/6xopPuCwrr4mEaAZp6dhNR7o5FSHMwn6g5lZgOJtIpz9jGSUAQ
 ifom4n32ANkSiWZo=
X-Received: by 2002:a5d:6a0d:: with SMTP id m13mr772528wru.33.1627497506000;
 Wed, 28 Jul 2021 11:38:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyT5oT2rDz7UvumZlXrkHeEofO9Q3CnrBLIWnQ12OuU+B7jrWkRwwui8mL6Xq6J5oOuyBmGbg==
X-Received: by 2002:a5d:6a0d:: with SMTP id m13mr772513wru.33.1627497505845;
 Wed, 28 Jul 2021 11:38:25 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id 140sm771149wmb.43.2021.07.28.11.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 11:38:25 -0700 (PDT)
Subject: Re: [PATCH v3 5/8] cpus: Use qemu_cond_wait_iothread() where proper
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210728183151.195139-1-peterx@redhat.com>
 <20210728183151.195139-6-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d65e039b-659b-62f6-4963-fc9509d42197@redhat.com>
Date: Wed, 28 Jul 2021 20:38:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728183151.195139-6-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/21 8:31 PM, Peter Xu wrote:
> The helper is introduced but we've still got plenty of places that are directly
> referencing the qemu_global_mutex itself.  Spread the usage.
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  softmmu/cpus.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


