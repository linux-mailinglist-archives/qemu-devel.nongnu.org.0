Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A507C505A57
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 16:52:34 +0200 (CEST)
Received: from localhost ([::1]:41194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngSjx-0001WD-HW
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 10:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngSiF-0000as-Cf
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 10:50:47 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngSiB-0007rK-Iq
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 10:50:45 -0400
Received: by mail-wr1-x432.google.com with SMTP id m14so18830364wrb.6
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 07:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SPQVbLj+7sI78bIgf5d898sDojgi7u9bHGzVvw1WcXk=;
 b=Tg/NVoBxIg6fQUxcWBbkuwBPKQCJAL6RB/lViHNHnWgo/3nwQuXW10iJb67Jb72O/a
 kVVmI+auDZ6y7rs4217LTln19KxHHqYEgVL3v70HAyoK/fMLz+8U0Vpuor9La+rn7lS+
 FkjuSznOvaKDiTNsBJlz/grS0CIDhLpBctP0CgHTIVXxDcf0o77ZFjcYYyD9PRmV8964
 +5UXxR95BThSjDKXIlNER+e8FHdzLQ5eo2MlPqiXjX76iqrz1RpSyBPOLX61AufLv78M
 5Cv7C95a5ZCjuem8sRpg5kGIZ+10et1WykHVkDdBUEVT2u/PnBPUaSjaH6QUE0C5S9Iy
 4rgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SPQVbLj+7sI78bIgf5d898sDojgi7u9bHGzVvw1WcXk=;
 b=Qy5FuTndOFWWKFVQR70Zz7ze3FiotrkMc8sSD0eRK8M4g5OLy6aMuNjIJW7fnsXF3k
 s49zCQT8uGzXays6ARb1HWkzYfocoicCIwWjLo3b9wesZ9TUw6rNcei8kFsEFYFfEkup
 xUtUU0H0GiOFdButV2SR9o9fasRkZD7pzVZO0O+0YewaesipDzAFat7KbuvYXCWRq5YE
 Q6ckOjlz0V/yperOLcuKu6EjTNk5r98SkzIiqIfr3vmnGcFnGxXiBkGaD+nbX+7kfcyI
 TJALX/xbw7I4QBcbwGvSCb98hUXmtFXzSFOjw1p7iHMJhyw9LLoFcI/JaUW3B4mj3QZx
 /zjA==
X-Gm-Message-State: AOAM533kwQBEPKg/Wl/l8Mi8ZNWEBzBVUl1p7VyAjvKw+JfZPQeoQana
 GEb/O7Vv6PpoD+O8g8ae/H0=
X-Google-Smtp-Source: ABdhPJx6byWTQGtsCNYWFRhU/UToP9T3rhH67odXFfPxJZz6pgFtpr2w3WNKH5fcaS/71n1HGXgcwA==
X-Received: by 2002:a5d:6caf:0:b0:207:ab83:64c7 with SMTP id
 a15-20020a5d6caf000000b00207ab8364c7mr8778772wra.668.1650293440345; 
 Mon, 18 Apr 2022 07:50:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 u7-20020a05600c19c700b003928959f92dsm8017284wmq.2.2022.04.18.07.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Apr 2022 07:50:39 -0700 (PDT)
Message-ID: <95995737-9199-9da2-99e8-cb5c91be1c12@redhat.com>
Date: Mon, 18 Apr 2022 16:50:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/3] qapi-schema: support alternates with array type
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <20220321164243.200569-1-pbonzini@redhat.com>
 <87k0c5t5bc.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87k0c5t5bc.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/4/22 14:13, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> As suggested in the review of the statistics subsystem.
> 
> Queued for 7.1, thanks!

Thanks, I will follow up with the stats patches after these land.

Paolo

