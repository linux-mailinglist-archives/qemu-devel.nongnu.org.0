Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1EB36D77A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 14:36:34 +0200 (CEST)
Received: from localhost ([::1]:44122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbjQf-0003V3-Tx
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 08:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjNW-0001bR-Qu
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:33:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjNT-0007tX-IQ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619613194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JDgLDVKJ28xzv5/2R0oY9/v19J5nF237XZ5DCsYwAoE=;
 b=Xu5UTJ3DVvZtnDPLdplPTfzdDC2Un39I5CUWzsqn0kcbIp2tgLgsdinrzkHzrKQ+hgwzzl
 nSREu7UmiZwjLA73iiBwkdPJ+NgtGuilx44/Sw+KKBrW2MNHdTQojetZNfiwEGVBMKz1Ls
 lpGlkmSJ0Jg59W/up3tRb6cSboByJjE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-TgiB6mkgODenLbQ3WBph7w-1; Wed, 28 Apr 2021 08:33:12 -0400
X-MC-Unique: TgiB6mkgODenLbQ3WBph7w-1
Received: by mail-wr1-f70.google.com with SMTP id
 t18-20020adfdc120000b02900ffe4432d8bso22320195wri.6
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 05:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JDgLDVKJ28xzv5/2R0oY9/v19J5nF237XZ5DCsYwAoE=;
 b=f5k2lV0ItDMk4mozEo7b1/IYFWwwWfFx7llxUM9sETegVGef7Dk6Y7dDD+ptN+1V+5
 ugrEux8mrLkfHSpfQ8ixOplOLwazkvtRD00h9OD2qAUVMLYLr7hW2glxvXYfLdN2sMjh
 6rzC0+hxapB7h2DFI7m6w1JQxreCc2f8Ylcvqj0Ern/syzIAQACKGT3wRuw3dYHCwAjb
 YmD60gwj0tWaCfoaGTQ8sVhIezMIBLL4fQCaorwjeXjBllzzOMSeeUjseAmNcRyQnV88
 WdsBV7ixlK6Dliw7n3jW2xHtdfgVHaVoi8wIeD8MpxCCtBxOECcGVI2IvkD9drq0Ib/1
 7QNQ==
X-Gm-Message-State: AOAM530Kh9qgql9onTy68G4KsX+QJdlQzcVAOQchx97Sz5lYhSESbx3x
 7DChofa84G3FM4zD9DotzOmfU7oadxyPfcmdfHZngVG1CluLpBonLJl3yzcnWEzrRpEVXYIr5V3
 3DZk8LOL3veA2nGc=
X-Received: by 2002:a5d:5308:: with SMTP id e8mr10044434wrv.228.1619613191023; 
 Wed, 28 Apr 2021 05:33:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwB91g4cuOjeTXD21cavvuJFb2RfphNKXrOzaZB7AI+BvhlPEtZ4fw4MgCgu/IpDmJ0ZkT6A==
X-Received: by 2002:a5d:5308:: with SMTP id e8mr10044414wrv.228.1619613190904; 
 Wed, 28 Apr 2021 05:33:10 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l9sm8210878wrz.7.2021.04.28.05.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 05:33:10 -0700 (PDT)
Subject: Re: [PATCH 0/4] hw/block/fdc: Allow Kconfig-selecting ISA bus/SysBus
 floppy controllers
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210415102321.3987935-1-philmd@redhat.com>
 <edae6f90-6658-0ad0-7516-74073d9be0c2@ilande.co.uk>
 <0a713d9b-9ce2-0e9b-b515-f26ce09c0443@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <06a1e1fe-925b-ff52-50ea-eb5d3eed2454@redhat.com>
Date: Wed, 28 Apr 2021 14:33:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0a713d9b-9ce2-0e9b-b515-f26ce09c0443@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 1:25 PM, Philippe Mathieu-Daudé wrote:
> On 4/28/21 9:57 AM, Mark Cave-Ayland wrote:

>> This basically looks good to me. You may be able to simplify this
>> further by removing the global legacy init functions
>> fdctrl_init_sysbus() and sun4m_fdctrl_init(): from what I can see
>> fdctrl_init_sysbus() is only used in hw/mips/jazz.c and
>> sun4m_fdctrl_init() is only used in hw/sparc/sun4m.c so you might as
>> well inline them or move the functions to the relevant files.
> 
> But both use FDCtrlSysBus which this series makes local to
> hw/block/fdc-sysbus.c, and use fdctrl_init_drives() which is declared in
> hw/block/fdc-internal.h, and use FloppyBus (also declared there).
> 
> Apparently they do that to initialize the fdctrl->dma_chann field...
> Which should be a property, but FDCtrl isn't QOM... So not that
> easy, it requires more work.

Hmm FDCtrl doesn't have to be a QOM object, it is a simple embedded
structure. It should be doable then.


