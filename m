Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDE4338A65
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:40:59 +0100 (CET)
Received: from localhost ([::1]:38826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfE2-0006oT-Ak
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKfCe-0005Qt-Oc
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:39:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKfCc-0000A2-W6
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:39:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615545569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3F6fDzDkdxSC3cr+OoSx0+5nUAwAT3Hf367KG1X8ks=;
 b=KdpNvM3g9XyeKDZNoGCfVRsBgwfcheIMlfp4I34n7es50rYz6/iqkOGKSlUKN+gai9Ewny
 P1wqNuG9yKs1+SyQuXSJ81qub/vuYK13k+lXuWcNT1TyphnN6IfoW0eDsEvuib+UK9RsME
 ZmdefSb+7c2gCFzr15NUyVKHHTWKx/A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-CmKKKK1jN9ymr58XTm_rcA-1; Fri, 12 Mar 2021 05:39:26 -0500
X-MC-Unique: CmKKKK1jN9ymr58XTm_rcA-1
Received: by mail-wm1-f70.google.com with SMTP id l16so3016954wmc.0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 02:39:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b3F6fDzDkdxSC3cr+OoSx0+5nUAwAT3Hf367KG1X8ks=;
 b=K4q5W46MRrPaUwFM/vkG7AayWm2gTjBv3S+GQ2IxgZt5lUNUXqhs/yOkTuD4tX9Y+o
 JvPBoYYregyhkhA71PHVMn+GiKvryGfJ3JRRKDFWCmeMV/IOizB4NBVXo7Gd8WUCoAfr
 o6BibADm2XXY5A97UTgmeFFDRHOl+8Zoqhlj7QH462eyGU6Zaqaq80LNz+RS9O6HKMZg
 noiEAQhZ01sNIsE27llPpHxDAWGrZZ+YSyUZD9a1z8s6fDqBVwuEnWc9gY+RWo+oKAxF
 9QLMqcFkizKB6jVCfgtObWG83g6sHwTyqcdIws82Z+wCoOoempaqxf2PxF1ASKw3PAaG
 YCBg==
X-Gm-Message-State: AOAM5329P0Orp+3cnyFSMDsbtVFE9TtKDqS2jJ0WQeE5eGh3+Leuizyi
 DlOHZSGUO2cNE98MN4BYmusYp8kgh0YxT39xVtJCLh7IOROKi2fs076QIn9eqRLZndWVzVb93bT
 DZyO2dlnrcD9D6e1WBl01334o4SZbBb5b3awM+ZzYdKVUB5fl5P+zG9mKlAl4mRjpY6Q=
X-Received: by 2002:a1c:2390:: with SMTP id j138mr12257563wmj.72.1615545565429; 
 Fri, 12 Mar 2021 02:39:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxh2Y8Vv3kJl4thONz0B8na5xjgWkKIegas7iXmfALLObp+NcSnx8RVcMl9Dmzwe/0eLZ28RA==
X-Received: by 2002:a1c:2390:: with SMTP id j138mr12257539wmj.72.1615545565188; 
 Fri, 12 Mar 2021 02:39:25 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id u63sm1716017wmg.24.2021.03.12.02.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 02:39:24 -0800 (PST)
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <bdc8dbaf-8d63-833a-3e57-7e823a321486@suse.de>
 <a81c0a8d-af3c-4b40-bcb4-9b120b5eee93@redhat.com>
 <ec7f83ae-8529-3a0e-4b00-73c856b28a3e@suse.de>
 <be88d88a-dd9d-547d-9f3d-7444f0f8bbc6@redhat.com>
 <3b7c6a4e-c191-063c-affa-0e179227a633@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: all class init functions for all types in QEMU are called in
 select_machine(). Expected?
Message-ID: <26c2b88b-4c9e-09a0-a1c0-350a01e9a697@redhat.com>
Date: Fri, 12 Mar 2021 11:39:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <3b7c6a4e-c191-063c-affa-0e179227a633@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 11:25, Claudio Fontana wrote:
> We can register them from there if needed I think,, but where ever we
> do it, we still have to point to the one set of ops or the other,
> depending on the cpu model that is finally chosen.
> 
> So when we attach the tcg cpu accelerator object to the cpu, we
> currently should check which cpu it is, and behave accordingly.
> 
> Maybe this is better? Ie, not set the tcg ops in different places (in
> the v7m cpu class init and in the tcg cpu accel init),
> 
> but rather set them just in a single place, when we attach the accel
> cpu object, checking which cpu profile it is somehow (TBD), and then
> behave accordingly?

Take a look at 
https://wiki.qemu.org/User:Paolo_Bonzini/Machine_init_sequence#Basic_phases. 
  The phases are:

- creating backends (PHASE_NO_MACHINE)

- creating machine (after which PHASE_MACHINE_CREATED is entered)

- creating accelerator (after which PHASE_ACCEL_CREATED is entered)

- initializing embedded devices (in machine_run_board_init, after which 
PHASE_MACHINE_INITIALIZED is entered), including CPUs

- creating devices (in qmp_x_exit_preconfig, after which 
PHASE_MACHINE_READY is entered)

And the last is where the guest actually starts.

I think that you should have a callback in the accelerator that runs 
after -cpu is processed and before PHASE_MACHINE_INITIALIZED is entered. 
  So the right place to add it would be machine_run_board_init.

Maybe some kind of double dispatch, where the accelerator has an 
acc->init_cpu(acc, cc) method and the CPU has a cc->init_tcg_ops(cc) 
method.  Then TCG's init_cpu calls into the latter.

Paolo


