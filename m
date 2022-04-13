Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55534FF003
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 08:41:51 +0200 (CEST)
Received: from localhost ([::1]:36642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neWhJ-0005M9-Pg
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 02:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1neWbv-0003yb-8B
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 02:36:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1neWbr-0000Cw-N6
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 02:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649831769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=si10/7wk+Dv4dIJITEvCiDViqxTv/qYI50XmC1dxgfM=;
 b=VBiSLz6uYtYJrtxozbby7RT3mj2zH04+NbK6/DwLh9RXz3Qs4fUGNwqv8k5UDnElNm+jSl
 1238SeIMv7eVmu5AVl/7E9/XVOSdDfaJm2l3mvkq6VHYZhHTWPGG6yadLPZtzKcTbPdwOS
 5vU8bw1QE4EJX3R+HdPgslG4WR73R3c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-Zn5ZrePCMt-tm51GglxBsg-1; Wed, 13 Apr 2022 02:36:08 -0400
X-MC-Unique: Zn5ZrePCMt-tm51GglxBsg-1
Received: by mail-wm1-f70.google.com with SMTP id
 p31-20020a05600c1d9f00b0038ed0964a90so440483wms.4
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 23:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=si10/7wk+Dv4dIJITEvCiDViqxTv/qYI50XmC1dxgfM=;
 b=uhymZ0OtbnK+1wGlqPMPE957T4TdLLnbQXE7jG6n+ApdCdrUr6k9EZF1DjP0qPMahD
 6nzlmlAPYr+rYY0DSUtOAS83wm23SIJzQ61OL9fz1pcHcWVx8pCAjtAPTB8yGCr7qaNG
 nSXpzJxss6JdFvcrOSmieyWEuzZOVtVwZ6RmIOlabf/08iMFURJI9Bpuibrl5QtcAeBw
 s03iwxbDDqIaVgipfuWDe5MvaZzjSvNDlfJ2QPOT+5KXBkPsgacNFh818ThYd9mFGnQn
 l4xtWqNRbPl5tgKA7vLUD3nfKe9/oR59vw9MFqLH2ahxbOhhP7kk0+2P8EfPfucq2sWW
 f1Hw==
X-Gm-Message-State: AOAM530vdoDqYHV6CQxzmI43+JfIlKczilfT3o0HnfhFoZegGC26Mjbl
 nDE1XSPLtsyuyVALzsfdQfMbhJMMvyZDD2zJsT+EntjRJOURC9evWW1/MsnJu8qR+dmFQjX3T54
 xHWcbB2yu9ec7ML0=
X-Received: by 2002:a5d:47cf:0:b0:207:ac31:c2ce with SMTP id
 o15-20020a5d47cf000000b00207ac31c2cemr6918797wrc.422.1649831767132; 
 Tue, 12 Apr 2022 23:36:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnfOaQkgVoR7GIrLR7rKc9w5eENYyuEexY8QByZzfgKH/3ZL7RP5ikoTH/BW0vqf2Nz7J6iA==
X-Received: by 2002:a5d:47cf:0:b0:207:ac31:c2ce with SMTP id
 o15-20020a5d47cf000000b00207ac31c2cemr6918783wrc.422.1649831766930; 
 Tue, 12 Apr 2022 23:36:06 -0700 (PDT)
Received: from [192.168.42.76]
 (dynamic-046-114-151-186.46.114.pool.telefonica.de. [46.114.151.186])
 by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b0038e75fda4edsm1405720wmb.47.2022.04.12.23.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 23:36:06 -0700 (PDT)
Message-ID: <83746e5b-61a4-1c1e-f241-8b53cb67ffd4@redhat.com>
Date: Wed, 13 Apr 2022 08:36:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To: Gautam Agrawal <gautamnagrawal@gmail.com>
References: <20220408104519.32931-1-gautamnagrawal@gmail.com>
 <f3adc652-6a89-a063-313a-4d87c11fc474@redhat.com>
 <CAG-ETXuh2-bJBO4298uyc166ptiTauimChBE=TwoYpxYx4npUA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] Warn user if the vga flag is passed but no vga device is
 created
In-Reply-To: <CAG-ETXuh2-bJBO4298uyc166ptiTauimChBE=TwoYpxYx4npUA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org, stefanha@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

On 12/04/2022 22.25, Gautam Agrawal wrote:
[...]>> On 08/04/2022 12.45, Gautam Agrawal wrote:
>>> This patch is in regards to this issue:https://gitlab.com/qemu-project/qemu/-/issues/581#.
>>
>> Better write this right in front of your Signed-off-by line:
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/581
>>
>> ... then the ticket will be automatically be closed once your patch gets merged.
>>
> I apologize for this mistake

No need to apologize, it was just a hint for a minor improvement - and 
you've got the other patch formatting very right already :-)

>> vga_interface_type is also used in hw/mips/fuloong2e.c and
>> hw/xenpv/xen_machine_pv.c ... do they need a change, too?
> 
> I can definitely make similar changes in them too since they also
> specify the vga_interface_type, shall I proceed with this?
> 
>> This will trigger a warning from the scripts/checkpatch.pl script:
>>
>> ERROR: do not initialise globals to 0 or NULL
>> #238: FILE: softmmu/globals.c:43:
>> +bool vga_interface_created = false;
> 
> Could you kindly suggest a better approach to this than creating a
> global variable.

Global variables are fine, simply drop the "= false" at the end of the line. 
All global variables are always pre-initialized to 0, so global boolean 
variables are set to 0 (i.e. false) by default, too.

>> I'm not a native speaker, and maybe it's just a matter of taste, but I'd
>> rather say it in past tense: "No VGA device has been created"
> 
> I will correct the warning message, as suggested by Peter Maydell.

Great, thank you!

  Thomas


