Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8ED38C0E0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 09:43:56 +0200 (CEST)
Received: from localhost ([::1]:58136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljzp5-0001l3-6x
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 03:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ljzo7-0000x2-Sj
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:42:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ljzo4-0000iu-VR
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:42:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621582971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GQk77kpNqwGjei3HR/0IS25Ze7MpSV1SowB16cN759A=;
 b=XraH7/tOCC9p4l6thPLJ/dx8T+fSSYPfwinfJG78/mM1eC8f9bx0kTzXzHcRRJW3axRx+s
 9oPtMq4jfO9bnA/BiFl8vHIHdGmrUqN9fzihgK/GR9vW13i54GzKr6941YF1CzGraacPZ/
 DwKdzufz5jIJ/oAW+6aXslAx8f59bzA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-UUAq27IsMiapvQmy6o1MSg-1; Fri, 21 May 2021 03:42:48 -0400
X-MC-Unique: UUAq27IsMiapvQmy6o1MSg-1
Received: by mail-ej1-f70.google.com with SMTP id
 dt6-20020a170906b786b02903dc2a6918d6so930435ejb.1
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 00:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GQk77kpNqwGjei3HR/0IS25Ze7MpSV1SowB16cN759A=;
 b=JITt9GGQTXyd6qMJ4B1qWJq5T9P6M8TeMvFHUzPsX7eV353OxJxPQ0VOA+ehX74mDq
 tl/NYcyhTtnKjXPIwD2ZxU8XDBGTggFOe9gBULOe6eGKyzr9n/RnW5YfTAiIPDMHrjhx
 A9JpGzb4VxX9EXwlBlQXGAbA/AxyIxO4uKv31q4VDci7k7D4qYoGifDs1YGMrlY9940S
 IShHsuetv6iCFlRCCv0tDu1wUK1XTuzf0DGoO8chVgjdl2EB/WgpuqY7O1bblTxzASQK
 0Ro6JEFazucnULAXqWC3s0g558TRslQc0MSnFQWUY/qigAJUxreIRXS/ctFkpPeJ2OHM
 zhZQ==
X-Gm-Message-State: AOAM530UCkCFfYN3QvS3uSaFTacXsUqFkvbcWCcxaqJpsS6qYxlxA35o
 hXeWL/c6OIV21h37O1g/wFCpGC7s6AWphuC6mL1kD0X7AJfhHZ5ptJ+ZcG7tTtGbxq/j/PZwd3M
 p4sYkgQWT8pdrk2E=
X-Received: by 2002:a17:906:4a81:: with SMTP id
 x1mr8764077eju.508.1621582967033; 
 Fri, 21 May 2021 00:42:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz25p+Vbd3p3X35FgXWp8noT0C6OSC/U1d2YxyATo4IZSzOOvpCxr454z9fO5wJYAo+sGB6hw==
X-Received: by 2002:a17:906:4a81:: with SMTP id
 x1mr8764049eju.508.1621582966713; 
 Fri, 21 May 2021 00:42:46 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6502.dip0.t-ipconnect.de. [91.12.101.2])
 by smtp.gmail.com with ESMTPSA id
 g22sm2996247ejz.46.2021.05.21.00.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 00:42:46 -0700 (PDT)
Subject: Re: [PATCH 0/2] Fix SIGILL psw.addr reporting
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <20210521030146.2831663-1-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <e2eb83ba-6937-741c-ea67-1bbd2346f9d5@redhat.com>
Date: Fri, 21 May 2021 09:42:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210521030146.2831663-1-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.05.21 05:01, Ilya Leoshkevich wrote:
> qemu-s390x puts a wrong value into SIGILL's siginfo_t's psw.addr: it
> should be a pointer to the instruction following the illegal
> instruction, but at the moment it is a pointer to the illegal
> instruction itself. This breaks OpenJDK, which relies on this value.
> 
> Patch 1 fixes the issue, patch 2 adds a test.

I assume that should fix

https://bugs.launchpad.net/qemu/+bug/1920913

right?


-- 
Thanks,

David / dhildenb


