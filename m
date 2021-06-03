Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BF7399FFE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 13:40:37 +0200 (CEST)
Received: from localhost ([::1]:41964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loliG-0001Ic-5a
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 07:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lolfv-0008Rx-65
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:38:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lolft-0003dq-Hy
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622720288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kFpPlJF8XMe2rrSO0n+9LZ5Uc8SFedkoPqIR5Chjx3M=;
 b=clCX/eKdzBwmvrZ2o85serm56X2SEgvpSUYfc1QaQy843CIeS3SfhAzmdV3uvKefhYn23g
 YTDzAbaVsfKWyqjvZETRhaArBjnyYxkNFlitUSGr1yLnH2rjTz6Djs6EzKQkyEpki2VYGV
 1ae7keuX1EAau0K4fLEYqHSqwBRIDq0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-oFxWDQK-NU2a1R9HDAsIOw-1; Thu, 03 Jun 2021 07:38:06 -0400
X-MC-Unique: oFxWDQK-NU2a1R9HDAsIOw-1
Received: by mail-ed1-f71.google.com with SMTP id
 y7-20020aa7ce870000b029038fd7cdcf3bso3099690edv.15
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 04:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kFpPlJF8XMe2rrSO0n+9LZ5Uc8SFedkoPqIR5Chjx3M=;
 b=Wgg19P5mcFrY9X4rBLjnDtUTJxOT498KhqQcFEgeC+NpbjfRelb6Mtkojti0EX8uS1
 vTbABj1Sw+8VA7Up3WcK7Vkm4SjSU6UYaHNj0RKXQmwonYK7kZcl5/zsSF3xHAzs6W/N
 d1gyan9lhfGL6jJqhDo62u7K6dL6w0+QwExRNaYUxKR8oSBALmsK0vOppZ4KIeFoNRBW
 NJvUj8nwHB61IqhdGh0bjHk5XE8k7kW2wYmCtJyNfczgGiKBaPM9R7BGb/0W1mm9v/Kh
 NPkm//r5lM/7R9DxXBfWw3QrEw7lxjtX4M1lqRAHxw93wEs/W7XYgcPD5yDIZ7tzmO1d
 GTBw==
X-Gm-Message-State: AOAM5324/oUv7Zymi8TIZHDV2AQ5cBS7gtKftTVvivPbly2K4w2Ntg8T
 Ahg/ESX6K4IkefvedUnI7oMRftkQKXZc+a2YXJ3Emit+1i5g0D6MoPo3Fnf8uYY3xIQZrwedfZq
 Iq6yHWlxcQyV7PNc=
X-Received: by 2002:a17:906:2c1b:: with SMTP id
 e27mr20895391ejh.5.1622720285690; 
 Thu, 03 Jun 2021 04:38:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEn42MOdcQmR4QQxLM2ZwI+ShJUIlrOqg5K7qnfhNyV7NGtnqaqExtXmCtv9V1NYjTrXE9yA==
X-Received: by 2002:a17:906:2c1b:: with SMTP id
 e27mr20895369ejh.5.1622720285481; 
 Thu, 03 Jun 2021 04:38:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dk9sm1411431ejb.91.2021.06.03.04.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 04:38:04 -0700 (PDT)
Subject: Re: [PATCH] iotests/check: move general long options to double dash
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210526181659.365531-1-vsementsov@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3d086c41-80c0-a970-367d-00e19ce55817@redhat.com>
Date: Thu, 3 Jun 2021 13:38:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526181659.365531-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, eesposit@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/05/21 20:16, Vladimir Sementsov-Ogievskiy wrote:
> So, the change:
> 
>    -makecheck -> --makecheck
>    -valgrind  -> --valgrind
>    -nocache   -> --nocache
>    -misalign  -> --misalign
> 
> Motivation:
> 
> 1. Several long options are already have double dash:
>    --dry-run, --color, --groups, --exclude-groups, --start-from
> 
> 2. -misalign is used to add --misalign option (two dashes) to qemu-io
> 
> 3. qemu-io and qemu-nbd has --nocache option (two dashes)

Just like for QEMU, let me reiterate that this is generally not an 
improvement.

Double-dash options give extra information to the user that short 
(single-dash) options can be combined, while this is not the case for 
iotests/check.

Paolo


