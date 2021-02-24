Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AD5324339
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:37:26 +0100 (CET)
Received: from localhost ([::1]:42988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEy6H-0003D5-5a
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:37:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEy4r-0002Up-SD
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:35:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEy4j-0002b6-8x
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614188143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QFwoaXIg/8dcv3zQFVRwnKZ5yfoVU3LKrNRCTM/7KIg=;
 b=NY551m6LJoDfDAOOBM0Ukn8CWlvj7ZpNSn14xNplPzl+ue+sFw0VIfID0JRllO4GkY8BZc
 jOvFn0C7K4mmZmXdrJ/aAUqzcm8CsVQIuwuFIfF0X0lrqQOFZcf4SMuS21bsvvkU78sGuE
 GwoPQQExeEydIpykb+tsTlU0E/Vo+zI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-cdo4kI4NMOS3tAK9jzjFJg-1; Wed, 24 Feb 2021 12:35:41 -0500
X-MC-Unique: cdo4kI4NMOS3tAK9jzjFJg-1
Received: by mail-ej1-f72.google.com with SMTP id g7so1133751ejd.16
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 09:35:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QFwoaXIg/8dcv3zQFVRwnKZ5yfoVU3LKrNRCTM/7KIg=;
 b=kBnpgbdNO1Zi1xSzCkq65N6wtFDsVD2rgQ6L/c8wsw6GGV20WZneGWnb+l4cZvdqR/
 lPuwc0kY04KM6farMGaY0ByNG5/zOtBa8jSEqy41Hvra7UTCGenXzEeuCHQWVw4RvHnx
 DcYEBBepWp3+dhl1OmEWFP9M4No4rpzjEG5qG3nnL6oHnWzyXm7zka+4FGoCLA6kjQui
 5G//81hjgfnaa2mO9Sd0qmV8Kynf3CIaESP0/paQcdK6IiS+S17OEtx+XhPGYOLSbW0Q
 Lpd7XESaax797IkSOeiBpi0FsDf0SPUdQHgvMoN5AUFPU89mRTovvyVXv6/myDGoZgJL
 +8HQ==
X-Gm-Message-State: AOAM530gl3pZ7Wp5eX2Uvx8iR2c4WJcwQHwmkuG4Qyoxm/iDc9Il8x/S
 Qi8XW/Q6GiUAQPiu/TtbK8vO8tt4xSYXsL0xufRTP5dculyaNDwS0B272248y42Ss2skMe5xLqm
 sjsI5hjUvGCKc3uY=
X-Received: by 2002:a05:6402:40b:: with SMTP id
 q11mr5401611edv.36.1614188140226; 
 Wed, 24 Feb 2021 09:35:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKvTx0gVWscnPQq+wB6TWq8cw1ElcAkMxYTB5LOy8k49zacMRRZ92GdhRUev6WMEkdGVYPmA==
X-Received: by 2002:a05:6402:40b:: with SMTP id
 q11mr5401593edv.36.1614188140082; 
 Wed, 24 Feb 2021 09:35:40 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bn2sm1697102ejb.35.2021.02.24.09.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 09:35:39 -0800 (PST)
Subject: Re: [PATCH] qapi: Remove QMP events and commands from user-mode builds
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210224171642.3242293-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <12557ba5-e8c1-80ca-8a51-1d7319372d35@redhat.com>
Date: Wed, 24 Feb 2021 18:35:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224171642.3242293-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/02/21 18:16, Philippe Mathieu-Daudé wrote:
> We removed the QMP loop in user-mode builds in commit 1935e0e4e09
> ("qapi/meson: Remove QMP from user-mode emulation"), now commands
> and events code is unreachable.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   qapi/meson.build | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/qapi/meson.build b/qapi/meson.build
> index 0652569bc43..fcb15a78f15 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -102,11 +102,15 @@
>       'qapi-types-@0@.h'.format(module),
>       'qapi-visit-@0@.c'.format(module),
>       'qapi-visit-@0@.h'.format(module),
> -    'qapi-events-@0@.c'.format(module),
> -    'qapi-events-@0@.h'.format(module),
> -    'qapi-commands-@0@.c'.format(module),
> -    'qapi-commands-@0@.h'.format(module),
>     ]
> +  if have_system or have_tools
> +    qapi_module_outputs += [
> +      'qapi-events-@0@.c'.format(module),
> +      'qapi-events-@0@.h'.format(module),
> +      'qapi-commands-@0@.c'.format(module),
> +      'qapi-commands-@0@.h'.format(module),
> +    ]
> +  endif
>     if module.endswith('-target')
>       qapi_specific_outputs += qapi_module_outputs
>     else
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


