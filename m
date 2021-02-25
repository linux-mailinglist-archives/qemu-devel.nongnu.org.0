Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFF432513F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:09:30 +0100 (CET)
Received: from localhost ([::1]:41380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHKb-0001kr-UE
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFHJP-0001L3-9A
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:08:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFHJM-0002Mo-V2
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:08:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614262089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDm5gsi5TDkxicYE/9Cts9pf2lUZSwY5+49OUfi8RcE=;
 b=JeSVzZDXzFLiEqnaL/n4jAmsajhHjtCVY3df8rkpqITMOsbmq3E5jrWrlldYFY5Ty0NP6l
 /senlfsmR84+o6ODdmkWWHx6mnsgmkytoATIAoz+ronGY3NFADWmNyo5RR87dZBcCg3zS1
 DMGNmgwhmFhOl0Yv8tZEhWnSg8DuBjA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-7acVEvDHPaaOpmGY4n06pQ-1; Thu, 25 Feb 2021 09:08:07 -0500
X-MC-Unique: 7acVEvDHPaaOpmGY4n06pQ-1
Received: by mail-wm1-f70.google.com with SMTP id h16so1909195wmq.8
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 06:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vDm5gsi5TDkxicYE/9Cts9pf2lUZSwY5+49OUfi8RcE=;
 b=MCKA95IyZTID8+FLslcXvNo2/LHrJDYe9pYP8oM/CGlfshMAxNW6CmvJ8KSYdqSWVe
 VE2Y5MtwjcuoCS2Jag3Ue2rZE9t1raICAMEJJxNCzwHCe4Q2ubd8CPQQVvi/0gwTRlOX
 8lfhcUcBRjlvj02i/DR8JT4v7bJ2U1Wwg64M41V7gT/IosjDO4B0m5MFdl6/MFST/1zo
 o6iWT3UbQ9FTmC6S4uGrz+CIDUIm9fvzeBUqe6Av1HLjjN9HP6Xq8H/NAOp5ikhTH1Gc
 dqhCBdSd/L00U9KsK84dbfNT+RSaLdLDd89jLcjw08/GRc7HB2By7RHIanwffP309lZC
 Zm3A==
X-Gm-Message-State: AOAM532kH8HZdFb0MFdLJKcXKlGB7Ym+GFh4Ss+85PWQjGS8TqMSD08K
 z5awaDR2Va/nbk2u7LddvObrBiBn9K8DItGRhNK8aKtWKTz9GX7DyW7qJH6aUiLlh4SzCIHavW0
 ZtEcdgh0o0zzUXulhXlc+KDZiyUWwvFehpqWiqcwMEXUU583LDTc3Eh5SacO4HsYXiRA=
X-Received: by 2002:a5d:430a:: with SMTP id h10mr3839738wrq.162.1614262085311; 
 Thu, 25 Feb 2021 06:08:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuatB/duoW/bRR3m2mv3ucOW4+HonTcxJ6+zNaNXV7NaO28uNBRwUTayrna6ltmTAckOTz6Q==
X-Received: by 2002:a5d:430a:: with SMTP id h10mr3839716wrq.162.1614262085118; 
 Thu, 25 Feb 2021 06:08:05 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i3sm9607002wra.66.2021.02.25.06.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 06:08:04 -0800 (PST)
Subject: Re: [PATCH v2] vl: deprecate -writeconfig
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210225131316.631940-1-pbonzini@redhat.com>
 <YDeuOYpYZX+49AAd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7593fccc-fb5b-4e1c-a35f-e9e4ff940a9a@redhat.com>
Date: Thu, 25 Feb 2021 15:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDeuOYpYZX+49AAd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 25/02/21 15:03, Daniel P. Berrangé wrote:
> FWIW, we've rarely kept exactly to our 2 cycle plan. In practice it has
> become more of a minimum bar, rather than an exact deadline.  If you want
> to promise death in 6.2 though I'll defer to your judgement :=)
> 
> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>

Well, I have patches waiting for the removal and sitting over them for a 
year is already enough. :)

Paolo


