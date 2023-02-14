Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0546968BA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:04:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxle-0004Mp-2s; Tue, 14 Feb 2023 11:02:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxlZ-0004Mc-SX
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:02:50 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxlY-0001HW-9L
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:02:49 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bk16so16156690wrb.11
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+0f7nU4h8gWNQ2mPm4AtGOg9F9z8FgRF1TbEx8NuvRI=;
 b=R9eGloBv4+5+tFGbo+tG9bn98Np7IIeG9jCD4nGx90b70PLZ/6z/mxcImRCaLp/o3C
 eNluqAZTocvRI4A4BwA3H/Lw1gXFjrRhKAUtgjAX3JynSOB4Owm0+U5deIn81Ej7rOeb
 O6WUWs2MqNFi4VX3kb8Aan/5pwFUK6PDsBnFLUW/3zMC+YGRGeFfkIDgpOnaGA5xv6xL
 W7aD+CfF6g3p6YocrSkgFbv2biiTO22FaZ4MqbyzP/COj1YHaOZ03HFz7l0qGNVPz6rB
 oLS/IXNTqG9X80c/t17N3B+xH22gUD3r0u1HS1FMBjpQpqhbHJHenpJYPLnMVApFySIo
 A14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+0f7nU4h8gWNQ2mPm4AtGOg9F9z8FgRF1TbEx8NuvRI=;
 b=XzNEsk3Nw4qWa5FOSIaPV6f3lD/CGlDugq3NlpfQQwsl2tz4KN42J0oqvlEBIWWKmh
 kyYMJ1/uHKno1OmMS40NNAcHIO4owkJWc8tnVMohB++BPdqxII6WOTfeHFFo9Tza7TVI
 sN36J3Ue1QTsMIVeOcIvCF4MGvBjApvbMWAtZu+a2WBOuJ7gDkI7NzHPBGeYNNeZgu6Z
 bF4JCSLa8wIcBrcQDMfYpSPhzR/SEsTmnVDINULSTcjPbDk53hOGqZrnKFKh3eGq9mut
 hca4vr9NXMQcwaAJO3A8QiIvqcljWkBgCiXJ3r1ZW+71Ut4B9RyFDVWmVRgh3cb7fYZq
 aKHg==
X-Gm-Message-State: AO0yUKXjz6NrEIPG9vgzojsXYA4/KNg8AYFHj4iLBqo0wZpgPdZN3zIQ
 Tz1+GHB6HF+uKNB1mOwG2kQ=
X-Google-Smtp-Source: AK7set+1YIqHF3THIh8SgFzk/rNQ77yOh5E+F9z7BsVbELzWWe11YBKu8NLWXtK7NtkgEFvj6ag3Pg==
X-Received: by 2002:a5d:670f:0:b0:2c5:4de4:bcd8 with SMTP id
 o15-20020a5d670f000000b002c54de4bcd8mr2377696wru.36.1676390565712; 
 Tue, 14 Feb 2023 08:02:45 -0800 (PST)
Received: from [10.95.154.108] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c2cd000b003daffc2ecdesm21811118wmc.13.2023.02.14.08.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 08:02:45 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <15c4e9a2-d480-69cc-63af-65dd7138c640@xen.org>
Date: Tue, 14 Feb 2023 16:02:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 52/59] hw/xen: Add basic ring handling to xenstore
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-53-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-53-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/02/2023 14:31, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Extract requests, return ENOSYS to all of them. This is enough to allow
> older Linux guests to boot, as they need *something* back but it doesn't
> matter much what.
> 
> In the first instance we're likely to wire this up over a UNIX socket to
> an actual xenstored implementation, but in the fullness of time it would
> be nice to have a fully single-tenant "virtual" xenstore within qemu.
> 

I think you can probably re-work that second paragraph now :-)

> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_xenstore.c | 223 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 220 insertions(+), 3 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>

