Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAEC2AF233
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:31:58 +0100 (CET)
Received: from localhost ([::1]:46352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcqE7-0000JA-SV
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:31:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcq50-0000ua-4D
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:22:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcq4s-0005Pl-Gg
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:22:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605100941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4HnPb6Oc9xhQIm6QsY3Rhh5zwn+ec3Z/yZ0yLTtlxVU=;
 b=VNRzATTy/b3glUrUAj0LNCwnDdXO7y/6r1/8TWBG1rbp2v1tK0dbs/kU7ExJn4ldy0OKVy
 Y0zlULuJ/HFUaraoZYOE/nPnZd+d9r7W+LQcf1Sm+75j67N525DAqvCrnshw4VQYNKLM8g
 /Suq7ms5RGZquw/37bgkirSiGtnoT7I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-YW1Jl0TzOKy3jrvSF6J3GA-1; Wed, 11 Nov 2020 08:22:19 -0500
X-MC-Unique: YW1Jl0TzOKy3jrvSF6J3GA-1
Received: by mail-wr1-f70.google.com with SMTP id z13so586227wrm.19
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 05:22:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4HnPb6Oc9xhQIm6QsY3Rhh5zwn+ec3Z/yZ0yLTtlxVU=;
 b=PsCsMglMEFyszT/Vn2PKJB+/okfjOxGJASnVvRzuTQ5QiehVj+BwfrZnV2mWr+XH3p
 O9fQS5sOXzy0AgbItyobD2YSaZUubqrPApGMbJ/Ah8BJvxz/ddvkpJUdov29BXVgm38f
 7sWZCNxfSUaotv2GemSQkKQd2gk3VTLAPWCEyjI/OLE56/oDUD6YOD6W24ECs8N6zFeU
 emsBZa0sQ+socH45IgGCcDV3jLSH3wFmJBcf2vs2igwGm6AEl6QUlNwG5SsbMQj1YJ4c
 axgJDEAQZIWt3wih+Yx8ceFsSv7AOVHSw/MN+Zc2zRISxU37hUhHfJmCMF8fkSknH2hV
 zcRg==
X-Gm-Message-State: AOAM533tU4i8I+0+ZK6BrXsF9dr8ZpslO3hwPjwZ1xLRhSzBPMLsopjf
 pcC0Vqfkp6M55apeXEv0JzY54U8t6tAI/oOmwX460kFf2IriUG2Hkpskt63xWxVvwTuO0A7cSdm
 6kjmJrpuW095ZtH4=
X-Received: by 2002:a7b:c94d:: with SMTP id i13mr4069945wml.130.1605100938579; 
 Wed, 11 Nov 2020 05:22:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOSTT9xjQN7vxOYwzdwqkCVCkDUzOqvSlQ/kwOZSudXDC6vfMgUt/rbMGfVpiP6o2J/ndvYg==
X-Received: by 2002:a7b:c94d:: with SMTP id i13mr4069926wml.130.1605100938358; 
 Wed, 11 Nov 2020 05:22:18 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 35sm2711741wro.71.2020.11.11.05.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 05:22:17 -0800 (PST)
Subject: Re: [PATCH 0/2] char: Deprecate backend aliases
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20201111130834.33985-1-kwolf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <18025d15-a566-f175-e42a-00266059f43f@redhat.com>
Date: Wed, 11 Nov 2020 14:22:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111130834.33985-1-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: libvir-list@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 14:08, Kevin Wolf wrote:
> These aliases only work the command line, but not in QMP. Command line
> QAPIfication involves writing some compatibility glue for them, which
> I'm doing, but I think it's desirable to unify accepted values of both
> paths. So deprecate the aliases so that we can drop the compatibility
> glue later.
> 
> In the deprecation documentation I assumed that this is for 6.0, but if
> we want to include it in 5.2 still, this can be changed, of course.
> 
> Kevin Wolf (2):
>    char: Skip CLI aliases in query-chardev-backends
>    char: Deprecate backend aliases 'tty' and 'parport'
> 
>   docs/system/deprecated.rst |  6 ++++++
>   chardev/char.c             | 32 ++++++++++++++++++++++++--------
>   2 files changed, 30 insertions(+), 8 deletions(-)
> 

Even though I disagree with QAPIfying -chardev, this one is obviously a 
good thing.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


