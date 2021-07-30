Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9293DB940
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 15:20:47 +0200 (CEST)
Received: from localhost ([::1]:48502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9SRS-0004fg-Bx
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 09:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9SQL-0003zL-EB
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:19:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9SQK-00048H-0x
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627651175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oKA2vdfwhZVJn1WkNOV/AveAK390z9DVLgbha92Tfjw=;
 b=cTcwyEmZDfYydQA/bHqZRvliYiDEGv9xHWKcsMBTJ2/0r5SH5ZXenAybBmg6U9U3AdD/x0
 bzD74DUzF1yzSDSoK03b8ow2aac6F2RQKh1YZPqTLtTRiN3M5i8PM7AFQjgvTUKWs3ipCu
 4Tw28op3vF9T0+yk86Ji0siIy9FmwJI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-mO5-0cbpMX6Om6dPsC3k-w-1; Fri, 30 Jul 2021 09:19:32 -0400
X-MC-Unique: mO5-0cbpMX6Om6dPsC3k-w-1
Received: by mail-wr1-f72.google.com with SMTP id
 u11-20020a5d434b0000b029013e2027cf9aso3193934wrr.9
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oKA2vdfwhZVJn1WkNOV/AveAK390z9DVLgbha92Tfjw=;
 b=e3TYx0Mh9beGtJONowGBJNEIjnR9PfPxPY4HGtOZavUbsJQbLbnbHWnN362Qrhn1Bf
 50OM1IjhClL6D6lg41yJa2TduxIPDuGlFPh/fwNfdP14OXLXUu/HYaojQjzeR4O4TqbY
 VX+59uRjhwPDpUYN26xlZn0LpgojGf9ldufhEhpqGVGD1gePCEa/UHBGGpTK9qHt4dvF
 JK11ShWezDA213NNU637HX5ecq6YrDlcKCAeWgAl41zrJxmQcr5G3BEd00bVtpLD7WzJ
 SehJKH1SkQVQn2GLoJXIqByVKNHcAB42snZ5sQWYhtgRSm7pjwivQ7Yp/iWrE2l0l7Hg
 DDdw==
X-Gm-Message-State: AOAM532ThOIDppyKHw4CqL6DMJ1DR0vrUg4gUgLthw23VugVsP+YRXCR
 z4wcTbk6Z67qkoN0zXr3uTVl+UYR8C/O4eE3NFLlCyAk7wq59yHTWEyWWWaDR/LnmLa0lkle3UD
 r4ZMJUyA7Z6Upl8c=
X-Received: by 2002:a7b:c7d7:: with SMTP id z23mr2874473wmk.136.1627651171475; 
 Fri, 30 Jul 2021 06:19:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9/IK77IibaD4qpe+GCuRrhxQteagCiaHVHp2b7LyDoAepVqeFpkiXCx9w9BwpnZ/8L1e10w==
X-Received: by 2002:a7b:c7d7:: with SMTP id z23mr2874465wmk.136.1627651171367; 
 Fri, 30 Jul 2021 06:19:31 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id k6sm1705352wrm.10.2021.07.30.06.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 06:19:31 -0700 (PDT)
Subject: Re: [PATCH for-6.2 4/8] meson.build: Define QEMU_ARCH in
 config-target.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210730105947.28215-1-peter.maydell@linaro.org>
 <20210730105947.28215-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a73b6953-7372-906e-bbfb-307523af61ac@redhat.com>
Date: Fri, 30 Jul 2021 15:19:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730105947.28215-5-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 12:59 PM, Peter Maydell wrote:
> Instead of using an ifdef ladder in arch_init.c (which we then have
> to manually update every time we add or remove a target
> architecture), have meson.build put "#define QEMU_ARCH QEMU_ARCH_FOO"
> in the config-target.h file.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  meson.build         |  2 ++
>  softmmu/arch_init.c | 41 -----------------------------------------
>  2 files changed, 2 insertions(+), 41 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


