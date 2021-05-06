Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D717C374F6B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 08:35:03 +0200 (CEST)
Received: from localhost ([::1]:42890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leXbC-0000nK-VW
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 02:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leXYX-0007Vt-Q0
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leXYU-0005wS-VH
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620282734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZYnDO8ePyPvArR5qYR5dqiktWpN7ozW6xvmZULzilxc=;
 b=LP+xfRUXs2GPDukntBUVdx42RFjSYuaUIJQTR3xkQ/DvsHp+gnIEoeirOG4Es0G3QbIo7o
 CBfnzmWALg/SGsLuMiNAN6g2zxYVgKP3AHwmU2mTAck7SzPgNHjuG3g0Nx12tZLsoNF4wY
 tiB8yoHyEYlW5vjAYLaE4040SfOeEGw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-mxLxoKgeM_WwoBubrBMmZA-1; Thu, 06 May 2021 02:32:12 -0400
X-MC-Unique: mxLxoKgeM_WwoBubrBMmZA-1
Received: by mail-wr1-f72.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso1762821wre.8
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 23:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZYnDO8ePyPvArR5qYR5dqiktWpN7ozW6xvmZULzilxc=;
 b=oEoZ6BiaX5SOX8/0QlCQL3p+6pMlzu+1P0tX6Lj7pahrbFEH8yCA7tOtMfHTSjAjKe
 zlYVO3crZ3eCVg62KbGfCZHE+ETfL2mB/+t0VWd3nUBmfilUGqdp999FMLdR8pmW+l1F
 xXZ6G0net+rLl++Q/3ghdonuriBTRTsdEbGGKHVyKoGkEDxzPBWrpp5B5QFerzXgXAU2
 1a3t356pv4yGSHZSmZKxIH/vT9Q30UBK6wM213dlRJQ2CgIYNub5t3BUhrwOXdbym/83
 gjwGG6GJRyA+WiFC7JbrNeR8QzXrUJN49cv5Y7AX9BkYB8oGMxzx14i1kGn/tQ+NeB20
 xDWA==
X-Gm-Message-State: AOAM531BTGbm2bNSTr8K5X5nvW5KNnz0xz/Kp98ZxxtFfhEGgQVSlPUk
 S5Sr2iI5RbNEletGcuz5cRJt+3XxiJgX022pRj55LlvAg0pFfIRLemBR9cGHEQPPMEUXrmM1Osb
 Kh74q9MTGJWWwKO9xKoqCE730e2h0lqTVArIumzilnxcRuZr7KH5HMXpCKWQKFyeT
X-Received: by 2002:a5d:694c:: with SMTP id r12mr2995453wrw.224.1620282731188; 
 Wed, 05 May 2021 23:32:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSb0GMAALQh7eUn73DLT4HQeAdGkfS/okpogwnPomY6LAbiJx2qq1fwlIZZJq9ZFs/ECPLkw==
X-Received: by 2002:a5d:694c:: with SMTP id r12mr2995418wrw.224.1620282730888; 
 Wed, 05 May 2021 23:32:10 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id z8sm2380740wrw.74.2021.05.05.23.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 23:32:10 -0700 (PDT)
Subject: Re: [PATCH 03/10] ps2: don't deassert irq twice if queue is empty
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <aed90d92-4e34-6f33-005f-10cf176e5483@t-online.de>
 <20210505192133.7480-3-vr_qemu@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4bb538e1-5c16-25c0-980c-317f2fb66646@redhat.com>
Date: Thu, 6 May 2021 08:32:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505192133.7480-3-vr_qemu@t-online.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 9:21 PM, Volker Rümelin wrote:
> Don't deassert the irq twice if the queue is empty. While the
> second deassertion doesn't do any harm, it's unnecessary.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>  hw/input/ps2.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


