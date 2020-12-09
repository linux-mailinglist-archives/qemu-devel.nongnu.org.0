Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 874862D3DE4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 09:49:33 +0100 (CET)
Received: from localhost ([::1]:45818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvAC-000895-1p
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 03:49:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmv83-0007Oz-CG
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 03:47:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmv80-000367-7v
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 03:47:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607503635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hqL8pRQWm/2V6Zvc8kPDUy1/Nxbx5F3rsST6a/BWYwQ=;
 b=VuGYNNXiYGp3e1Z3FuT7EqbPMjcMfjmpJJOTvzAhWM7yy1VRdYav4si9416teCb9TiYqRU
 MXY7JbH8szzCqnqc/R2GSkfj5TcYy13zY1FindWv7U1lDR4e+Eltl7NTG6vgbk8sGQtktZ
 oPVYCXAi982cgdVrYQ2PxeMKL2UbDV4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-1MwhBCV8OtCcFIeH5XGc9g-1; Wed, 09 Dec 2020 03:47:13 -0500
X-MC-Unique: 1MwhBCV8OtCcFIeH5XGc9g-1
Received: by mail-ej1-f72.google.com with SMTP id bm18so333285ejb.6
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 00:47:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hqL8pRQWm/2V6Zvc8kPDUy1/Nxbx5F3rsST6a/BWYwQ=;
 b=ieU7Q1zD2PA5daaz9jk0lTYB29i9GI8r3smk1DuZ0S80BGh3+q4fSoSAKcQf4v0+ty
 mmMDGPrBuv/dvC4Iq8vwjd7G3uIlnHxeArRf2y4giVWP0SKb8HOcCEwRpvlVQstM3BSw
 mTR9qAkSexKgZkEhQPP8+KExp98FGyAeY6N21bSw4k+dNxK1tqjGNesjBr8mEsYxXqbJ
 TJftRiCdgFLUPhfNTDFfCaRVsbfN7d4rNwgQwVQtJuPI+ZPYswzFTko2lJ18R6RXUmgV
 VP3TFCqt7X9MkA1hnrBi9We5ZZ54aSLPl/20yEBBqb5brqXZtu5yixlT3vuKhZWBspp8
 x2rA==
X-Gm-Message-State: AOAM5334oWxVC37AlLS5V5IgKua+ll6OrgJHwiETTKvDm0GGDMihJvD/
 58GuJo6I1WRUudDT5xLN0BrSBbXThKxa0s5yx1TYUon70fohfPXELtahYULMwPGQVqksELDmWAE
 bP+sU2+tlyprZufM=
X-Received: by 2002:a50:cdc8:: with SMTP id h8mr1006550edj.293.1607503631902; 
 Wed, 09 Dec 2020 00:47:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTX0aTISbZSVX4lZW2L1p4WjmbkBKvkNxRMvHtdRgOlGm+KG1c6dZHJ91DYDmOXchYw9VpsQ==
X-Received: by 2002:a50:cdc8:: with SMTP id h8mr1006523edj.293.1607503631711; 
 Wed, 09 Dec 2020 00:47:11 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id 91sm1005921edy.45.2020.12.09.00.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 00:47:10 -0800 (PST)
Subject: Re: [RFC v9 00/22] i386 cleanup
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201208194839.31305-1-cfontana@suse.de>
 <6395fe61-fe47-6d36-dd12-f523e66c75ec@redhat.com>
 <98b0c5fc-54cb-8e11-5cd9-ab3da978e664@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <322a850e-bb05-ea4a-5321-e06082de77c9@redhat.com>
Date: Wed, 9 Dec 2020 09:47:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <98b0c5fc-54cb-8e11-5cd9-ab3da978e664@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, "Emilio G . Cota" <cota@braap.org>,
 haxm-team@intel.com, Cameron Esfahani <dirty@apple.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/12/20 23:15, Claudio Fontana wrote:
> On 12/8/20 9:00 PM, Philippe Mathieu-Daudé wrote:
>> On 12/8/20 8:48 PM, Claudio Fontana wrote:
>>> v8 -> v9: move additional methods to CPUClass->tcg_ops
>>>
>>> do_unaligned_access, transaction_failed and do_interrupt.
>>>
>>> do_interrupt is a bit tricky, as the same code is reused
>>> (albeit not usually directly) for KVM under certain odd conditions.
>>>
>>> Change arm, as the only user of do_interrupt callback for KVM,
>>> to instead call the target function directly arm_do_interrupt.
>>
>> Please use scripts/git.orderfile for such refactors please ;)
> 
> Aye aye!
> If you'd like me to respin now, just let me know.

No, not needed thanks!

Paolo


