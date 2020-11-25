Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D2C2C3C36
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 10:33:22 +0100 (CET)
Received: from localhost ([::1]:59456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khrAv-0004b8-47
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 04:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khr8d-0003Xu-WE
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 04:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khr8b-0006L6-Uh
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 04:30:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606296656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/fQ+BRB8mHAS2bjUfCv+NrFaC/Djp9Z/00CRKhq/JA=;
 b=XLgqfGs3KsrdKs/fTBA0AreWNcLpco3redxkGEQCnvrKQcKuxFkl2BXYbLFEoE5NeSBaKY
 n10JYe+cqfoLBmzFWGDlLS/E7IULqjMzvqewnUsO1B7LohQP2wvF+ChF/RZnuCOyxrwmOf
 +LWtBjSpTSdv0bMN2DqROgd1X/mb0oI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-DOnoIFdLN12tM3meHKgr6w-1; Wed, 25 Nov 2020 04:30:52 -0500
X-MC-Unique: DOnoIFdLN12tM3meHKgr6w-1
Received: by mail-wm1-f72.google.com with SMTP id y26so256341wmj.7
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 01:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8/fQ+BRB8mHAS2bjUfCv+NrFaC/Djp9Z/00CRKhq/JA=;
 b=ZjP+vC1XAT8QOQDg5PUTQA/3KCYKp4yT1MjYL2tOCyWcwrw1UKG7B4wj+HjJ9ZVX60
 oBWkGVLmOmSrJ51MYWcfeimP3AhnYrzpV+fF/q95oyW9d0x7Xuw1tfAMRTJzUsn2w1J4
 Toi48ALkP0Op6sr4Ue5krCu9fblfVN29FFleSJyMxnpjw1O4LaJpgHri9VlO7Q2Hpbv3
 JgbFDy8i2FO5P/b9Ssobd4FVxIdXIxzDXpUl6g/yDZ7H6slXN9xKgM43no30iUlEoc7r
 vtXWwX7EBt+ysGaqjoev7dBzVqglTClnz6udifL/FEBCCqoAM6PLGDBl9gO+nToDcxvP
 c+kA==
X-Gm-Message-State: AOAM5327h9X71X20ivHG1rI1FvBEanSGU098ufpBbDUoCKe2MPVU6DNT
 9PVcqjSjdvVznIAgiaKRRrENXBWu6fMDS7L/u6ibqmATn5htwWmkSr+4PvM7XKWUMmhVBvCuvol
 Os5FKgJ/NGtt5XII=
X-Received: by 2002:a5d:52c1:: with SMTP id r1mr3083672wrv.255.1606296651101; 
 Wed, 25 Nov 2020 01:30:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+de33/7QeRq4Llom0Q27zXBdFOmbEgBOccaIQz8vIsGm71V+9FZeuWvAXbPDnqe5JBRkLXA==
X-Received: by 2002:a5d:52c1:: with SMTP id r1mr3083638wrv.255.1606296650850; 
 Wed, 25 Nov 2020 01:30:50 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q5sm3802068wrf.41.2020.11.25.01.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 01:30:49 -0800 (PST)
To: Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-10-cfontana@suse.de>
 <20201124170832.GS2271382@habkost.net>
 <a7bed792-5c6f-c49e-946c-f705707ce685@suse.de>
 <20201124190807.GW2271382@habkost.net>
 <58e4d100-f096-0c41-4780-b8b7e9533b5d@redhat.com>
 <7a3e2790-1924-3d03-d588-a904d7e19282@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v5 09/12] module: introduce MODULE_INIT_ACCEL_CPU
Message-ID: <3360fb6f-d1ce-5b7e-0d2f-784e8a8345cf@redhat.com>
Date: Wed, 25 Nov 2020 10:30:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <7a3e2790-1924-3d03-d588-a904d7e19282@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Olaf Hering <ohering@suse.de>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Bruce Rogers <brogers@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, "Emilio G . Cota" <cota@braap.org>,
 haxm-team@intel.com, Peter Xu <peterx@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/11/20 10:21, Claudio Fontana wrote:
> Hi Paolo,
> 
> in RFC v5 , module init for ACCEL_CPU is not conditional anymore, right?
> But the fact that its behavior depends on current_accel() still disqualifies it?
> It is called right after the accelerator is chosen and initialized
> in RFC v5, this still is "in the middle of the machine creation sequence"?
Yes, machine creation basically starts after command line parsing, or 
perhaps even _with_ command line parsing.  Basically once the user can 
control the flow it is already too late.

> I am trying to find the actual things to fix, since when doing RFC
> v5  I tried to specifically address two points:
> 
> 1) no if () inside module init functions
> 
> 2) no proliferation of module init functions
> 
> which I accomplished via AccelClass extension to user mode, current_accel(), and class lookup.

Yes, the rest is great, I'm just not sure that MODULE_INIT_ACCEL_CPU is 
useful and if virtual functions on accel and CPU_RESOLVING_TYPE can 
achieve the same.

> If MODULE_INIT_ACCEL_CPU remains an option, where would you like to see the call so that it is not "in the middle"?

No later than the runstate_init() call, roughly.

Paolo


