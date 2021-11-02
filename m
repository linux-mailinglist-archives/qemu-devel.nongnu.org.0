Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB76442D8A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:08:30 +0100 (CET)
Received: from localhost ([::1]:43282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsab-0000QT-Gg
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhsJf-0001H9-CQ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:50:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhsJc-0000Kq-UI
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635853855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6km4zfeJQxlY+h+mVKE4wQvXRqHT61/E8FfFIQalKZE=;
 b=gAPtNLtKlSGHh1LOPkS6bAFWh/Jo7LlakDQ4IQrxo6Vt8qv8KQM1AYhxIJ6gxdBVvjeH6e
 vYWwSpzO1hyBsv3K7qEI1XVKJXylOeG2FUPdGl6h6e75a4ILmkGdFsMG4e4SCA5PF7SFM4
 ltrneT6SCmuZrSyK6+bjNkz7QnJpEkg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-YgsrcxN4MbeQa2Tc4raugg-1; Tue, 02 Nov 2021 07:50:54 -0400
X-MC-Unique: YgsrcxN4MbeQa2Tc4raugg-1
Received: by mail-wm1-f70.google.com with SMTP id
 u14-20020a05600c19ce00b0030d8549d49aso623100wmq.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6km4zfeJQxlY+h+mVKE4wQvXRqHT61/E8FfFIQalKZE=;
 b=4H/B54jvd1+eLOYtfIaNGqcKYxExWzYs5lZoaKrmkOqE0xWP99CrLZmB7+yW2mW3Z3
 7eOxWUwRkqsx7C2ZsZYvTirIZrRAWHSR+vshrkgJnL+Vrb0VKRLn+i3f+YDcTGUR+WPt
 TUzE5yUmMMsl10HN2CeWZr5TXJG8QV9xPyNIt9d05O4jvboCStQogCPGX68JtBKYQaU8
 a1rc6+dOU6Nr6lVC/k/3i9XeTDj+LkUzh1KQuBhZK5DiF8F14kU45Mm8TsR/LagA92Ss
 1bxJXmJj2IrxoS++t7hpFkN6xGT91WpnS8i+2Rn3upz12eHoHpv43Ludu2UXCqwe8zSp
 n+4w==
X-Gm-Message-State: AOAM530Tt2xmnHa9YbCrqBN1sYsbg8uc4+km1YReLXDfRLkEF5UlFhGG
 Tv6Holoh2qsvLPxCGDaLRyYL3n/USXkIeIb3jSV7Ql4vI3gbP74n88sy8iiqOZN+kc49GJE/9Wh
 hoxHxepsNJzMdqYk=
X-Received: by 2002:adf:db47:: with SMTP id f7mr28585464wrj.113.1635853853052; 
 Tue, 02 Nov 2021 04:50:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo71iUNzaIHRRbMGCumE22yHC9r07oDKzVoGLn7tA6HnMJNTD+uV5xHwBRE3iXbX5QCrXzyw==
X-Received: by 2002:adf:db47:: with SMTP id f7mr28585447wrj.113.1635853852874; 
 Tue, 02 Nov 2021 04:50:52 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f20sm2840444wmq.38.2021.11.02.04.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 04:50:52 -0700 (PDT)
Message-ID: <8a1c9a53-b955-80ce-c216-9e418ce7c5e1@redhat.com>
Date: Tue, 2 Nov 2021 12:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/4] Move CONFIG_XFS handling to meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211028185910.1729744-1-thuth@redhat.com>
 <20211028185910.1729744-4-thuth@redhat.com>
 <e02332c0-7c4e-18a2-5c33-b00e8045f6da@redhat.com>
 <cbeb23e1-8d44-5751-4e61-a4ef46d0510a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <cbeb23e1-8d44-5751-4e61-a4ef46d0510a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/11/21 12:38, Thomas Huth wrote:
>>
>>
>> struct dioattr {
>>          u32           d_mem;          /* data buffer memory alignment */
>>          u32           d_miniosz;      /* min xfer size                */
>>          u32           d_maxiosz;      /* max xfer size                */
>> };
>>
>> #define XFS_IOC_DIOINFO        _IOR ('X', 30, struct dioattr)
> 
> I thought about something like that, too, but I'm not sure whether 
> xfs/xfs.h exists on some non-Linux systems, too and might be implemented 
> differently there?

In theory on IRIX XFS exists, but I'm not sure about xfs/xfs.h and 
anyway we don't support it.

Paolo


