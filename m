Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8A16A26EB
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 04:21:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVl6B-000385-OF; Fri, 24 Feb 2023 22:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pVl69-00037t-Qf
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 22:19:45 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pVl67-0007CO-U4
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 22:19:45 -0500
Received: by mail-pl1-x630.google.com with SMTP id bh1so1405239plb.11
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 19:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TGR2yc9Pf4/CN73+04LFcUNH6TJgHuKCMkkUZEaZoIg=;
 b=JerLar1OFwCqpBN32EI2PVIAdNFpH+zO7uqJ8Pfy0m+yWLvmAR26Ne+6YG4dcaQ6gH
 Z3h6jkwWjq9djM83VGVqYrfkQWDepFwAvh9SbbxO8ORZJi6bGqep3aY2mWTEzpXcxHlT
 30rWlUX40h6MQRaBk6RERRmLKyed5/4kqWc3S95Mr4L3juY1OaJL50Wk4FLRO5EfPMSm
 Lgrzo3obEMSn/knYc9EdwuUtTOarVZ2WLqEymDBqgS+8rup9v5G27ox/KsTsabybbJE4
 9WaECYtsFwHsnMND/tfGmsbrGSoUKRkguBmDa1lPN9hbMr56YZw3pNwO4/pLgsg8VwD1
 GTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TGR2yc9Pf4/CN73+04LFcUNH6TJgHuKCMkkUZEaZoIg=;
 b=T0DvsNuUf17hGhrmcZZxBDZFknyg3VPNA2E5PgeJDrsp/ZO1+8amq6E6hyuBatx4hR
 Q5vTA7K1MV+IT6ql4k6ZSc4nK1U8bokgfhgBgRkswgpxUWqQs9sp81KMErdoCdMvSHbB
 80dCxgVALJKsBQXSYVUS8LV4eq7eOrbiN+ujhALd4JS58oXTosC/VVKZoEv6gqfmdMfu
 QZdbxrc++bpSK/5VCrOpNc45Warb6q2bM40MWg21XwpTu4DX6woyOVRF6fxXpPd1l+Kr
 NOPestq092DBI5T5/i6Lsnwqvdr4V159TBpmynbEqanjTe2dI28gQrgSsWBUpyAfHHqS
 pa6A==
X-Gm-Message-State: AO0yUKVq8aOjJ0Y10xBerVZYxh0CSCRUKcsxbyDlL1uR2Vg6/QX4iRSQ
 Q++J2VkdKQx7qgo3v8KQ6M8=
X-Google-Smtp-Source: AK7set9TQCW43GdI/ZJb86yA9hc9+sMJUNC+DOXwjOkgSZV4lvT63rECJjlTMWH1EpWEAqDLm5KY7A==
X-Received: by 2002:a17:903:230d:b0:19a:9705:6465 with SMTP id
 d13-20020a170903230d00b0019a97056465mr23332128plh.37.1677295181884; 
 Fri, 24 Feb 2023 19:19:41 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 jd6-20020a170903260600b0019a6e8ceb49sm183227plb.259.2023.02.24.19.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 19:19:41 -0800 (PST)
Message-ID: <e4f34f81-17db-7b17-9f0a-32b8f950099c@gmail.com>
Date: Sat, 25 Feb 2023 12:19:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 0/2] ui/kbd-state: QAPI'fy QKbdModifier
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230224110153.8559-1-philmd@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20230224110153.8559-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2023/02/24 20:01, Philippe Mathieu-Daudé wrote:
> QAPI seems designed to maintain such enums,
> so convert QKbdModifier to be QAPI generated.
> Besides, this is how QKeyCode is maintained.

I recognize QkbdModifier as more like an internal detail of displays so 
I'm not convinced it should be converted to QAPI.

The interface of QEMU's input subsystem is so simple: send key up or key 
down events for QKeyCode. The modifiers are not exceptions. However, 
some display backends (cocoa, sdl2, and vnc) are not designed this way, 
and has internal states for modifiers. For such displays, QkbdState 
maintains the states to help them convert their internal key state 
representation to key up/down events of QKeyCode.

QKbdModifier is used by displays only to query these internal states 
QkbdState holds. As such, the definition of QKbdModifier is very 
dependent of the internal working of displays. It is particularly 
designed to match the needs of vnc, and I even wonder if the modifier 
state tracking should be moved away from the common code of QkbdState to 
vnc.

Regards,
Akihiko Odaki

> 
> Philippe Mathieu-Daudé (2):
>    ui/kbd-state: Rename QKbdModifier enum definitions
>    ui/kbd-state: QAPI'fy QKbdModifier
> 
>   include/ui/kbd-state.h | 16 ----------------
>   qapi/ui.json           | 10 ++++++++++
>   ui/cocoa.m             |  2 +-
>   ui/kbd-state.c         | 14 +++++++-------
>   ui/keymaps.c           |  6 +++---
>   ui/sdl2-input.c        |  2 +-
>   ui/vnc.c               | 16 ++++++++--------
>   7 files changed, 30 insertions(+), 36 deletions(-)
> 

