Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEB33DD29F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 11:07:58 +0200 (CEST)
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mATvR-0002Rx-7r
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 05:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mATsq-0006tS-KZ
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:05:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mATso-0003kD-E1
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627895113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A6sUXfGXs+YdfxvrD3OOrE4UkSqPT+U3y1D/wAuinrM=;
 b=ScF+e5R2swOZm8H7JuyiHu0ic5ZtAoz3rXjJB6O/KqVE0TA8QEg5Yxl1GIjg5G+lQSoKrf
 81bruQ4yq1QUp2ZzdB9c+F8pi6Ut8vh+wet1AGvXlRUD7D+2VlHoYo6smCsH3ZmZRtpc0y
 c/SWdcYr0wIs3FZU+XAKxJpqWq7g8Vg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526--REFuDAMPuil982-CRCskg-1; Mon, 02 Aug 2021 05:05:12 -0400
X-MC-Unique: -REFuDAMPuil982-CRCskg-1
Received: by mail-ed1-f71.google.com with SMTP id
 y19-20020a0564021713b02903bbfec89ebcso8323726edu.16
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 02:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A6sUXfGXs+YdfxvrD3OOrE4UkSqPT+U3y1D/wAuinrM=;
 b=L9I1RyT6yXjfvr0OhfxVKWSPI/+/m/14sKdJoGg2HTneeXAkZOvi/xefVfSdCodl0h
 q3pKz+I3kVK5t1LILusAb2nel7Hq4uJAVXhSMzpcAtKo51HltFnWmzzNjsmCOx0mox8z
 NTlu8sFEHXgF5pOPyTEFQ+9JvFvl77MAzBT2nEhG+V2va53tvT3wVrlBrdMn3AV5D5Ai
 o/O2GrL9zoc855GVN5Zw4ByYkwkxKEYtn19VqMyVLuzIechVZThyvhqYqp9o4sxnsyfv
 RU10xk+BiaM0NxeweP3rDANf3Sum8tFDXJqrz2vAMnmIJiekT+7f7zbwjpB19YNmhxPm
 di3A==
X-Gm-Message-State: AOAM533ENckzmAHzsYBFk1b0OP7VEvQhokmJjVgwafXV52HEfNoQov7W
 UaDpqqaBz1jwIaWzfPGMbh10ZLnhDA/c7OkgEKg0HMYfx2r8XXfhMnoB55ZRYn95yReP6I3/YB5
 wFt/Z5JuMUC9DBu8=
X-Received: by 2002:a17:906:85c2:: with SMTP id
 i2mr14536727ejy.397.1627895111358; 
 Mon, 02 Aug 2021 02:05:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbGt1TU/VqagGc5MqAZ87QKVow5k4edhEaPzUf0w2WgVoq/G3NS8yexMzJRZ81qsDqEZFNbw==
X-Received: by 2002:a17:906:85c2:: with SMTP id
 i2mr14536712ejy.397.1627895111174; 
 Mon, 02 Aug 2021 02:05:11 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g10sm4237082ejj.44.2021.08.02.02.05.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 02:05:10 -0700 (PDT)
Subject: Re: QEMU on x64
To: Christopher Caulfield <ctcaulfield@gmail.com>, qemu-devel@nongnu.org
References: <CAGu1Vjjot17roFD-YTWmQcDhhMD=Lzi3b3Q51cHNRnz+6JT_HQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6dc5002f-5e64-4850-f989-eb5651d74487@redhat.com>
Date: Mon, 2 Aug 2021 11:05:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAGu1Vjjot17roFD-YTWmQcDhhMD=Lzi3b3Q51cHNRnz+6JT_HQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.08, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: alexsmendez@live.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/07/21 19:36, Christopher Caulfield wrote:
> Hi QEMU community,
> 
> This is Christopher from the debugging experiences team at Microsoft 
> focused on kernel debugging. I am reaching out with a few questions 
> about QEMU on x64.
> 
>  1. Is it possible for the QEMU-x86-64 GDB Server to send the full set
>     of x64 system registers (whether they are included in a separated
>     system xml file or as part of the core registers xml file)?
>       * e.g. System registers missing from i386-64bit.xml file
> 
>         DWORD64 IDTBase;
>         DWORD64 IDTLimit;
>         DWORD64 GDTBase;
>         DWORD64 GDTLimit;
>         DWORD SelLDT;
>         SEG64_DESC_INFO SegLDT;
>         DWORD SelTSS;
>         SEG64_DESC_INFO SegTSS;

Yes, that is possible.

>  2. How can I access x64 MSR registers by using the QEMU-x86-64 GDB server?
>       * #define MSR_EFER 0xc0000080 // extended function enable register
>         #define MSR_STAR 0xc0000081 // system call selectors
>         #define MSR_LSTAR 0xc0000082 // system call 64-bit entry
>         #define MSR_CSTAR 0xc0000083 // system call 32-bit entry
>  3. Going off of #2 - can you access it via reading GDB memory command?
>     if not - is there any plan to support reading/writing to MSRs via
>     QEMU-x86-64 GDB server?

Right now it's not possible, but for specific MSRs it's possible to add 
them to the XML and export them.

Can you create an issue on https://gitlab.com/qemu-project/qemu/-/issues 
please?

Paolo


