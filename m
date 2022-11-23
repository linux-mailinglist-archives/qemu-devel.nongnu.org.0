Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB86635DCA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 13:49:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxpBB-0007Pi-Ck; Wed, 23 Nov 2022 07:48:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oxpB8-0007Jz-2q
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 07:48:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oxpB6-0001ah-Al
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 07:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669207715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qHYmPRy4MKIzmbZvnLWf/ErNHr9+a51aDK9HPnEFkjg=;
 b=Tj0mSCwI0e9UJ9ZcRG3lPyd3TbE3i1ctVhDgJu5Zxn+fee+U89QuC2e1vhmM56VcdJQB34
 6xCo7DrNp2y2m4OJgzOfG/sKOKe1N/ZiNDBGN7jpAMK4kZzyfdDFDFRO0VlFODeX6lUD11
 xxOFNoXZPti+i0YfVEfkYCo1nmLTduo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-394-07F97AuzMCKWvXSUQiO3NQ-1; Wed, 23 Nov 2022 07:48:34 -0500
X-MC-Unique: 07F97AuzMCKWvXSUQiO3NQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 k7-20020adfc707000000b002416f2e9ad5so4959673wrg.6
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 04:48:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qHYmPRy4MKIzmbZvnLWf/ErNHr9+a51aDK9HPnEFkjg=;
 b=cgq1ogi8kYYyyzeBUwQppWjd1pzeK/4aFIsHBWvo8DPERO1CQ8Vpu8mFGz9PjR2/Cn
 2lvRYYolAfhxPFZ3hzKwk6cwQlaT9aRUnC/09r5OUN/XKIrNOeYxuC21ZjtvkiJLv62H
 d8kPhjn3pGoOEuCg9cR2Q9aNhcP3EdMw/1auoVZo1g957dmuesbMRhXuBW3aJceO/xuI
 oiCXBCYqmSAY8MB/Bo4yBRNtsxO4SVNEf00Ew/ZEcUQnJ2Iq2QYXybxZOO9tPfPriLqZ
 2UqF2etgCqK62qXvHj/ZJGsyJJ+9gx2jlK0RPoNyQdGcke4VYGPaqmCpP8gKkdElOJyv
 zMSw==
X-Gm-Message-State: ANoB5pmZE83IxkMKvspcxRkXsNfLFl4eTOcI0H+ZOxxrKpF63INw/6uR
 CRd+PulxnJlHdo2a/miMLUU6+ArqmmeVB2SyolWltEwJWEWgwXJacX9oP1TLBxuGHCL8+D27ORp
 bVRowJUPWa9YJywg=
X-Received: by 2002:adf:ee52:0:b0:241:dded:10a4 with SMTP id
 w18-20020adfee52000000b00241dded10a4mr6680248wro.109.1669207712867; 
 Wed, 23 Nov 2022 04:48:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7z2+J9S9EeAUe1tuNQuiKPZcM6euSoRYRwjAXoBE+gITSsC/cm9N4BdsnNsZKRb/5bzsro6A==
X-Received: by 2002:adf:ee52:0:b0:241:dded:10a4 with SMTP id
 w18-20020adfee52000000b00241dded10a4mr6680236wro.109.1669207712660; 
 Wed, 23 Nov 2022 04:48:32 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-58.web.vodafone.de.
 [109.43.178.58]) by smtp.gmail.com with ESMTPSA id
 fc12-20020a05600c524c00b003b4fdbb6319sm2347147wmb.21.2022.11.23.04.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 04:48:32 -0800 (PST)
Message-ID: <ea14c43b-a740-3ac0-622c-1b6360565946@redhat.com>
Date: Wed, 23 Nov 2022 13:48:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [qemu-web PATCH] Add a blog post about zoned storage emulation
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>, Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, hare@suse.de, Paolo Bonzini <pbonzini@redhat.com>, 
 dmitry.fomichev@wdc.com, damien.lemoal@opensource.wdc.com
References: <20221117064444.20648-1-faithilikerun@gmail.com>
 <CAAAx-8JHmxe=9GuoZ+T1yqtLrrzk+-6_HL5EJ6LBJ+twOKp8sA@mail.gmail.com>
 <CAJSP0QX3j9SbKW7tL6_vc9Ru518qWEG=288gkd+ArkHF05Vgsg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAJSP0QX3j9SbKW7tL6_vc9Ru518qWEG=288gkd+ArkHF05Vgsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17/11/2022 20.12, Stefan Hajnoczi wrote:
> Hi Sam,
> Please send a git repo URL so Thomas can fetch the commit without
> email/file size limitations.

The size obviously comes from the PNG image ... since this seems to be a 
photo, I think JPG would be a better file type, so please convert it to JPG 
with an appropriate compression level. I assume this will help to shrink it 
to a reasonable size.

>> +<img src="/screenshots/zbd.png" alt="zbd" style="zoom:50%;" />

Another question : Where does the picture come from? Does it have a license 
that allows it to be used on websites like the QEMU blog?

  Thomas


