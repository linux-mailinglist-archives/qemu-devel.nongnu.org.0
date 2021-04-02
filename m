Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72740352791
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 10:47:20 +0200 (CEST)
Received: from localhost ([::1]:37128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSFSZ-0005v8-4u
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 04:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lSFQv-0005UD-Q5
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:45:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lSFQs-00059t-6v
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:45:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617353132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+jICSLQJ1954QsQsTAlD+2a4lZlyc3rsMnIEDDwGTU=;
 b=bOiuaGGx9VGGwHsIintfBSLZLJaDniCk7ef//enU9DWzH5BAWxIUXZdjkM6JhX8DC2enPJ
 M8LhdUWQk4aNYGUWQb1zTU6xWOQ90Gwtn/zp1DSs7xeglsMz/Xkfax+uyfF61C9Fq+Q2fJ
 nWF9D4f3G8ns5hsm+jxqcj5oQWdBq5g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-03IuZdvENb2V4HesgBSbMA-1; Fri, 02 Apr 2021 04:45:29 -0400
X-MC-Unique: 03IuZdvENb2V4HesgBSbMA-1
Received: by mail-wr1-f70.google.com with SMTP id b6so4051245wrq.22
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 01:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I+jICSLQJ1954QsQsTAlD+2a4lZlyc3rsMnIEDDwGTU=;
 b=Mm8B+zGw+tu6F8Wmm7e8kwcvKtgahrSpt7aSQGVxSslMpvv+WrbnJIh/1vyHHpXfmu
 wqAg1UxTUbmL2AJoo0NkvSxUDkAUZeY5DpjbEUn3QHjykt8dKmQwfFRbeus/NgJGFuW7
 qr21htg7Azz4UZhJF16Ffx9kocbYEhSkjpc1qUQnAQEqA5GsabBs/c+u6WnU/lVF+Dl5
 zfZH8PZ0gYUEscAqXlfdJe56IypblmL/OyMje1ygPXuT2a64mG3S5BfxqxPDcICjkO68
 t+VTDo1nvLMTdaGllQh2tRWNq7z3zi7g9/+Rq3WBrvrq4y3HTy9lKvfCS5dkgTa2s0K0
 tIRA==
X-Gm-Message-State: AOAM533vICBFJkttRP2Zy6oAJp3ui1kAxGLGAT+nwMdJjovX/E/vkq0u
 bPxFgJgKdYbjcjlQxo8k62sSE77KumZ9i0pNhcF6w49LV/TKgYPq1MwPstmwNkGWNWJzEYXqGC5
 3Mxpw2jyijBwtym4=
X-Received: by 2002:a5d:5007:: with SMTP id e7mr14095233wrt.10.1617353128078; 
 Fri, 02 Apr 2021 01:45:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJximH62wBt95UmaHPIG+u+wXPZtX26Kb1D6hPEMmQKmTIUydzab8S+foeUY/q9GKvnEdrRaxw==
X-Received: by 2002:a5d:5007:: with SMTP id e7mr14095217wrt.10.1617353127866; 
 Fri, 02 Apr 2021 01:45:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id a13sm13392336wrp.31.2021.04.02.01.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 01:45:27 -0700 (PDT)
Subject: Re: Bug: fstenv is wrongly implemented
To: Ziqiao Kong <ziqiaokong@gmail.com>, qemu-devel@nongnu.org
References: <CAM0BWNCTD_oe3BgKQUqG41fgFqGCXVh1gaiMqJpvXbR4Fh5vHg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7c63e938-2482-3150-7cfb-1459c132fda6@redhat.com>
Date: Fri, 2 Apr 2021 10:45:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAM0BWNCTD_oe3BgKQUqG41fgFqGCXVh1gaiMqJpvXbR4Fh5vHg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: ehabkost@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/04/21 10:29, Ziqiao Kong wrote:
> 
> According to git blame, this bug is introduced about 13 years ago:
> https://github.com/qemu/qemu/blame/633decd71119a4293e5e53e6059026c517a8bef0/target-i386/fpu_helper.c#L997.
> 
> We also had a patch for this bug:
> https://github.com/unicorn-engine/unicorn/commit/59b09a71bfc6fd8b95357944f6be9aa54f424421
> which you may refer to. I can also help draft a patch if necessary.

Hi!

Unfortunately the patch is incorrect, because fpu_update_ip is called 
only at translation time and not at run-time.  If more than one x87 
instruction is present in the same translation block, or if a 
translation block has been compiled after the one that is executing, 
env->fpip will be incorrect.

Thanks,

Paolo


