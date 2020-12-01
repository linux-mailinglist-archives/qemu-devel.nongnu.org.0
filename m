Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3C92C9986
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 09:33:15 +0100 (CET)
Received: from localhost ([::1]:33406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk161-0004YX-Ox
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 03:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk14J-00044V-B4
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:31:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk14G-0002NA-On
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:31:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606811482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dBik7l9stZ7qO4rfLARxbMOH7cNT9YEEeW7b/tSDIS0=;
 b=cGvDdAjOp3J62JLPc14esR3ZLzOE9kHdjGVnsUdtddBbNB0VWKWLC/R3L0hun2BuPbujfe
 K8p8I4tlCcbQkdJuvCJxzZxm9RhHnAp02H+Nf7feSxu7Hi3yWy4rxrNRfR2zfDL9of99K4
 dedLkUJmlK0awADm6XSQn7hwjkZ7510=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-OE-T_dvxNd-tpTs4AwJljQ-1; Tue, 01 Dec 2020 03:31:21 -0500
X-MC-Unique: OE-T_dvxNd-tpTs4AwJljQ-1
Received: by mail-ed1-f72.google.com with SMTP id f19so742244edq.20
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 00:31:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dBik7l9stZ7qO4rfLARxbMOH7cNT9YEEeW7b/tSDIS0=;
 b=MJu7rTCDIanqGsUkpLJUDLitw089w1/C/vs0z0di6MTUCqEIa2639cC17W5EoqG40F
 Jvo2I/dL1OiqheoEj1Eqej3AHSPct9IIzF//yOY0J8LGBn4oU5MAGcQ8CsOtbhKefxuA
 qGa99AaPlYQqBv+PSKN5N9PXXQS9EUU9jjffg3PzbTE+YfYEuAdD77FIwkeWiyygDOc/
 SVWeX0OzaiprERDvysB8Dm51Sq4Rfp/rTOwJnbVuCPTo3ckVDbg2LpLbxiHHS3XV2Gvq
 Od6B7aKr78XiUjOkEXU6r72Yzx05dKhcr3tTzmVWVSmoJUjbmGRc7n75VVS6kb8GOzZM
 C5bQ==
X-Gm-Message-State: AOAM532wZi0fKpsPrhep/Ym/KgsSJHdQNLTAeel3ABmrNhFX29E0Efb8
 qD/sUROoH2D7SjVXoo488Pp6jq3j8qBjYmiy5TNsfxpfBaxrUJkGuAW8u2LGHQCsTYHU/sAobOG
 sXSdwcDcpKqgsAS7lmsX51KOg1svjYltLWRqddEYoaZzkn7g/luEy41SVQcJ5KSnHPRI=
X-Received: by 2002:a05:6402:1c8a:: with SMTP id
 cy10mr1822489edb.151.1606811479767; 
 Tue, 01 Dec 2020 00:31:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0TpUIWrx5jN20yMSg8VjkbsPNS6RCTy4z+/0tWNKJy4Z45Pf48CdbBMUv4nt9etRMIuQZZA==
X-Received: by 2002:a05:6402:1c8a:: with SMTP id
 cy10mr1822465edb.151.1606811479544; 
 Tue, 01 Dec 2020 00:31:19 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m24sm464667ejo.52.2020.12.01.00.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 00:31:18 -0800 (PST)
Subject: Re: [EXTERNAL] Re: [PATCH] WHPX: support for the kernel-irqchip on/off
To: Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <SN4PR2101MB0880B13258DA9251F8459F4DC0170@SN4PR2101MB0880.namprd21.prod.outlook.com>
 <167595b8-bf4a-b961-cfaa-593a3f8d1940@redhat.com>
 <SN4PR2101MB08804B299AF5979564CB4CB7C0FA0@SN4PR2101MB0880.namprd21.prod.outlook.com>
 <dea94346-0f74-54db-f541-dd749e5608cf@redhat.com>
 <SN4PR2101MB08808315D017124D795824A0C0F41@SN4PR2101MB0880.namprd21.prod.outlook.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f7f50bb1-07e0-5a0b-eb76-92e11d530ecc@redhat.com>
Date: Tue, 1 Dec 2020 09:31:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <SN4PR2101MB08808315D017124D795824A0C0F41@SN4PR2101MB0880.namprd21.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/12/20 05:21, Sunil Muthuswamy wrote:
> 
>> It's close enough to the release that you can resend (or if no rebasing
>> is needed, just tell me).
>>
>> Paolo
> 
> Thank you. No rebasing needed; the same patch applies on the current master.
> 

Queued, it's nice and clean.  Thanks!

Since you are doing some pretty significant work with QEMU, is there 
anything with respect to documentation that you wish was there?  I'm 
asking in the most general possible sense: both high-level design 
documentation and low-level APIs that you wish were documented better; 
and both stuff that you had trouble figuring out and stuff that you'd 
like to have for future work.

Thanks,

Paolo


