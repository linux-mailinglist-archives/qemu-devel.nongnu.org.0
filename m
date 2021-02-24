Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED843243D4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 19:37:42 +0100 (CET)
Received: from localhost ([::1]:39146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEz2c-0005wy-0V
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 13:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEyu3-00075e-M2
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:28:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEytu-0006Pe-DL
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:28:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614191320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YRTpxDfviEM1uFtqdrmGp0G7+XpBFme0/Kgoh9LGijI=;
 b=ARZoIcCOEwQJtaeEdw0WLiXNR0VHqTfi04P7sRNMtj0+3kyMb9qEvlfbi0LHaBklNIpDlV
 sTPshtFGlT/HA8f/4U2Icz+GPO3NEtoFLXEYCI7INs7rDbheDqGQIMSqwcQmEzb6maO23t
 zxzdYrO38XLJhgJttc1LhytEWpiMTyI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-Qozu_aIYPlqZ6uj5vMp15w-1; Wed, 24 Feb 2021 13:28:03 -0500
X-MC-Unique: Qozu_aIYPlqZ6uj5vMp15w-1
Received: by mail-ej1-f70.google.com with SMTP id j18so1198426ejk.6
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:28:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YRTpxDfviEM1uFtqdrmGp0G7+XpBFme0/Kgoh9LGijI=;
 b=EB9zntKFdhdq6ZnC/Qwsg3CKjVngn+loRvixTi71UbZLJrBI60+sNdxswQRZI4fqeM
 3zN65xWSC+H6ySBb9AtefMTyVyfkeAevghIqPBZEbW5T11EoJF4lsIQfUziwuHBsrlpd
 qmk7S1nIQGxXY1S2wcIbh0RZrPVZhKCccIRmnymmbkoHHADX5D3aeUmEu+XLoTmu3TPV
 vQ+kV2eKchZp+Qi4n90NRS5nyWTtUePJChXUzg06Lc6VeAGoMTMsYiKkMSOilkJa8te0
 VYYA7bXHWlizPOXkUvlcsyYDjfVIZI9RgMNXSGPABWnM+9/SODhFvFaFGQm5etc+np2e
 4Sjg==
X-Gm-Message-State: AOAM530GhuEzNqFeZSCe50vm3wsUK0rLBZLYkAyrT9lpEBtwh9LrUD53
 TQvkxBambsWXWE382VP4N95ItlCIoxm/wrU8volxv1RiBEG9IU0BxrctGKqubErsiPQxdNmK1XH
 fguidvgsvX0dg3IM=
X-Received: by 2002:a17:906:115a:: with SMTP id
 i26mr27811893eja.10.1614191282102; 
 Wed, 24 Feb 2021 10:28:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5I5X/IY3XxleuJpHdXLjOwzjog+BgYJv1gbhDQUGCfYpbznihZZIAniNhXufiCYCuCuaa7A==
X-Received: by 2002:a17:906:115a:: with SMTP id
 i26mr27811884eja.10.1614191281962; 
 Wed, 24 Feb 2021 10:28:01 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k13sm1801711ejc.23.2021.02.24.10.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 10:28:01 -0800 (PST)
Subject: Re: [PATCH 2/2] gitlab-ci.yml: Add jobs to test CFI flags
To: Daniele Buono <dbuono@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20210222230106.7030-1-dbuono@linux.vnet.ibm.com>
 <20210222230106.7030-3-dbuono@linux.vnet.ibm.com>
 <e9973878-6181-41c6-5e65-afd07db7c476@redhat.com>
 <b8a6d3be-727e-9006-e6f8-c80c918d8caa@linux.vnet.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7d5cce9f-e567-274b-857f-e046dd124979@redhat.com>
Date: Wed, 24 Feb 2021 19:28:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b8a6d3be-727e-9006-e6f8-c80c918d8caa@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/02/21 18:55, Daniele Buono wrote:
>>
>> Does it make sense to test only one target instead?
> 
> I'd prefer grouping multiple targets per job so that the number of jobs doesn't explode, and stopping ninja from linking in parallel does solve the issue.

Yeah, backend_max_links should do it.  The 3 hour timeout scared me.

>> Can you explain what you mean, and perhaps add a check or warning for 
>> incompatible settings?
> 
> Certainly. The issue here is that there is a function in libslirp that
> is used as callbacks for QEMU Timers: ra_timer_handler
> (There may be others, but of this one I'm sure because I traced it).
> 
> This is not an issue when you compile slirp with qemu, since the whole
> library now has CFI informations and is statically linked in the QEMU
> binary. It becomes an issue if you are dynamically linking a system-wide
> libslirp, as it happens on Fedora.
> 
> I'd be happy to add a check on configure/meson that ends the configure
> step with an error when this happens, but that would technically be an
> independent patch that I'd work on in parallel to this one.
> I would prefer to not automatically select the git-based libslirp
> because that may go unnoticed when configuring.

Sounds good.  For now just add a comment, please.

Paolo


