Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BED36F5933
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:42:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puCj1-0002LB-0Q; Wed, 03 May 2023 09:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1puCiy-0002Kz-CA
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:40:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1puCiw-0003Xt-FK
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683121249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=17dWTw/pFqLBxdrP2uslPZovuFd881frI+ZskzyzvuU=;
 b=UqJHOTbvnYIfC0onfCk7RW/ZvQXt1oXf2UAf8LTQvgGXXgKsn0su++uTEJH3k2yeq5ef86
 WnxhragbKru8Uwwr07UjphcMphNq/gxAWqXmAiqUH7UyA3RnhGw6iQCKtD4z9DvJrEwPNa
 +/igJfsqTs89F1zo+hOYc82Hhgn3g8Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-NvxX3PRWN0GrIATdjz1DCA-1; Wed, 03 May 2023 09:40:48 -0400
X-MC-Unique: NvxX3PRWN0GrIATdjz1DCA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2f479aeddc4so3270079f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 06:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683121244; x=1685713244;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=17dWTw/pFqLBxdrP2uslPZovuFd881frI+ZskzyzvuU=;
 b=GryfhYfU1Alkl0GDihc9guP14pOgPUAi99JLFIVpO1TLiWKUFKG/86XTx6/CvvXUmh
 3ZSdX/XQmYuwfmhivcmEZZo1GHgYc+TtDZkLoxi9yDvgYJAA0XtDkhyAq1O37I7LKE5L
 580A2vnX1nDLzs5+S5b4GE5k7qpVszJUk00h4jSabxiL+T8NWyR85T7h9gN3VKny4UsH
 zN/E5WrubW0qbAs+T5ryBXBcewQvy5g7Y02JXEgtNZGPoUwuE6akYaTvGap1cLSbbnyF
 cUzGKb3EcJY7XjDkCx7BwnsyUiShykHOk97QvyK+oXT98Vzv8J8ltro7mJCYa478grxs
 cxqw==
X-Gm-Message-State: AC+VfDw5svXAakUOq6xwJbNkJYJJucoWU3js9lcNqpainBbQZA8ru3OR
 yrrsqPzQxgYWSpzoPvWiMTHPUTG1DQ19Uo/it4beB/+M8miKdko9mr1EqTlBGv16lIszvD8zAr6
 vtWg4+KhgTAvvQKs=
X-Received: by 2002:a5d:4e0b:0:b0:2fe:605e:c77a with SMTP id
 p11-20020a5d4e0b000000b002fe605ec77amr88510wrt.52.1683121244253; 
 Wed, 03 May 2023 06:40:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ44HE5olYlFG/51+C08KNRV5+MPBJk/Z6QQKYKHpyhKk2rRvSiZFLcoK7oOJ0EbWld3eZo3dg==
X-Received: by 2002:a5d:4e0b:0:b0:2fe:605e:c77a with SMTP id
 p11-20020a5d4e0b000000b002fe605ec77amr88493wrt.52.1683121243924; 
 Wed, 03 May 2023 06:40:43 -0700 (PDT)
Received: from ?IPV6:2003:cb:c711:6a00:9109:6424:1804:a441?
 (p200300cbc7116a00910964241804a441.dip0.t-ipconnect.de.
 [2003:cb:c711:6a00:9109:6424:1804:a441])
 by smtp.gmail.com with ESMTPSA id
 r17-20020adfdc91000000b002ff2c39d072sm33873558wrj.104.2023.05.03.06.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 06:40:42 -0700 (PDT)
Message-ID: <6132b3b2-626f-2dac-c499-47767db08886@redhat.com>
Date: Wed, 3 May 2023 15:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5] hostmem-file: add offset option
Content-Language: en-US
To: Alexander Graf <graf@amazon.com>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Eric Blake <eblake@redhat.com>,
 Philippe Mathieu-Daude <philmd@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>
References: <20230403221421.60877-1-graf@amazon.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230403221421.60877-1-graf@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 04.04.23 00:14, Alexander Graf wrote:
> Add an option for hostmem-file to start the memory object at an offset
> into the target file. This is useful if multiple memory objects reside
> inside the same target file, such as a device node.
> 
> In particular, it's useful to map guest memory directly into /dev/mem
> for experimentation.
> 
> To make this work consistently, also fix up all places in QEMU that
> expect fd offsets to be 0.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> 
> ---
> 
> v1 -> v2:
> 
>    - add qom documentation
>    - propagate offset into truncate, size and alignment checks
> 
> v2 -> v3:
> 
>    - failed attempt at fixing typo
> 
> v3 -> v4:
> 
>    - fix typo
> 
> v4 -> v5:
> 
>    - improve qom doc comment
>    - account for fd_offset in more places
> ---

I queued this as is to

https://github.com/davidhildenbrand/qemu.git mem-next


I might send this upstream soonish (nothing else is really pending).

Thanks!

-- 
Thanks,

David / dhildenb


