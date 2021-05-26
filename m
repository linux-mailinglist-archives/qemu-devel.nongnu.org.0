Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365FE391ACD
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:53:46 +0200 (CEST)
Received: from localhost ([::1]:44002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lluun-0007Bf-8y
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lluqb-0003Zp-5R
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:49:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lluqU-0004B0-63
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622040557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GuEBUIHRcilkEenVUnOnHFZ3xrs0F0giDqz3qWqluRo=;
 b=EhhX7AQoRlR1bGzvPisFflXSH40JGJyABIgYsUblcRYgJAf+2i/wXTHp9PURk4ZbMgUIHe
 y1A1PAGuwDbwb8DraArMOKaId1Zm7GC52yK6DyxRthVwTO5SDzXalcQt4TmjJGdYNdMKCR
 hU2908l8ZIbMuTrBvZsFfrrtCedlBu8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-je4fIgkYPG2V0BAPWr1C5Q-1; Wed, 26 May 2021 10:49:15 -0400
X-MC-Unique: je4fIgkYPG2V0BAPWr1C5Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 e15-20020a056402148fb029038f9ac2d3afso515093edv.9
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 07:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GuEBUIHRcilkEenVUnOnHFZ3xrs0F0giDqz3qWqluRo=;
 b=ifadbb5cgND7q9Ni4T/5SA8GGWedIM4zR9XZUfMp+v/TgIHztsCMmsBAtLcx3XZfwp
 K/F5H1nqw3hNSz16LngLeTC4tzOvCZo/xdt0ez7LVxUj3nUzKDUsRaHY7cvoZqA23es6
 dsCcNPJqMjS3NWwd+5jGx1WmW3+RZEdCh3pMxaOfOlR+tAbUjq7X3c1JzS2zQ8Ro2moS
 EegLBMLPEypauB4Gy2clGBCw1A9Euhddlw7zOBnl4eJgvcxtr0iGr8qGVHXsJbDjsp2C
 lQXcUSG1XCpRelxxQQrLY5K48BNCDvbxjUWSXPN8C5nhmTG0DziwMIMx36HrHlYLcC1L
 uNUg==
X-Gm-Message-State: AOAM532ISmgqmr7IaKblXz4kprrXBzwVmtfdZdNVIELWyabCfnrzQe77
 yc/DJinxmT4o0pNEn+V4rGjQi0pJibCYT5R8lLzupLkpNGwv9hLlVAm0lEYXm3XtAqerPefP2R5
 qdy9ByJcEef1DrOlqN9xUY8aLmh3pOCEow1mL7qaUizb8Q+OSYKFSqbSVaWsAgGAl8Z4=
X-Received: by 2002:aa7:c7cc:: with SMTP id o12mr38796829eds.291.1622040554056; 
 Wed, 26 May 2021 07:49:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgpWN0Tj3bYqbEm9qnN5q1KHiILCoLjgmU4yIXh3XUzUOo7fV00gM6jnvJBYL6t/YKpX5q6g==
X-Received: by 2002:aa7:c7cc:: with SMTP id o12mr38796810eds.291.1622040553897; 
 Wed, 26 May 2021 07:49:13 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i8sm857606edv.97.2021.05.26.07.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 07:49:13 -0700 (PDT)
Subject: Re: [PATCH v2 5/7] block-copy: add QemuMutex lock for
 BlockCopyCallState list
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-6-eesposit@redhat.com>
 <e1170527-29de-0eda-9f66-399e12923bca@virtuozzo.com>
 <cd5dd350-cb83-c2d0-c937-393191d6c7f4@redhat.com>
 <72b73ec2-da87-f672-6a7d-bba008df9871@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0f88c4ef-d807-8ad9-cd3c-873c80b1cd37@redhat.com>
Date: Wed, 26 May 2021 16:49:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <72b73ec2-da87-f672-6a7d-bba008df9871@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/05/21 12:58, Emanuele Giuseppe Esposito wrote:
> 
> At this point, I would just rename the other lock (tasks_lock) in "lock" 
> or "state_lock", and substitute it in the calls_lock usages of this 
> patch. Depending on how it comes out, I may merge this with the previous 
> patch.

Renaming the lock is a good idea indeed.

Paolo


