Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E29D354381F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 17:53:26 +0200 (CEST)
Received: from localhost ([::1]:43874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyxzp-0008KY-Ke
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 11:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyxyP-0007Kt-4A
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:51:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyxyM-0007Wx-No
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654703514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LKRLPv86HaCSXVBFMJB9KPcreAytf0aEM85cLJ+gTo0=;
 b=FD+gxYtjA5qs/sy3XYdFADblVLxVLCvlSMrhd93Q/Q62W7Zr5eslHU2tsjMjML3J+Of9B/
 UcA+fmS4aJL/EpF2FP3TsXofQQhI00OJnLfNavqiFD9dQaqATV1iI6W20rM3qtjH+9KGJA
 jmELTYxKYYKMhs/Ww8OwfiF/S/SY8nM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-7kt0xpYFO5KuDlWT4qFt7Q-1; Wed, 08 Jun 2022 11:51:52 -0400
X-MC-Unique: 7kt0xpYFO5KuDlWT4qFt7Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 v8-20020a056402348800b004315c52b92cso6419569edc.19
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 08:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LKRLPv86HaCSXVBFMJB9KPcreAytf0aEM85cLJ+gTo0=;
 b=R/gFq2JtTKLEUWB7kaoLNWa1U5Hq1dlWRy/VqQsBjZYnU2/uq3egok+gS6wOLynDjc
 YSk9ODzNFyhgUqxPkuUy2NbaeMfBSurs1Pv/TR2PhXphMhDVSFcaLWXbvNZGSQ6ROYIE
 EXl2zzhiUC48fRNuqj5Av91QYUu3L4Fndy9M4kxDCw5WlLxj27MPTfMeClYs1IAN7pXC
 KDmKmzUj2rse9sH6gPbhRNFUX/zfM4fguIwiP8Yfja6xKVUyaLSgsfGKrihb5RtjH2d1
 ClQ2exncWBtanqpDtG6uaAwmAvMlt44oTQkJj4sVy9g3DO0/Bo/PyfGNyXA0xjbWObkH
 9rkA==
X-Gm-Message-State: AOAM532RVwCP0SaNbcCNvgUs36Etc4PjQeZp5ran3tJASRmfpLy+xXhJ
 Qr4TnYv7goo0zglHRVd7IFjoRYb+Y3NPPMTNgUBDXqb8vQJTvrNxR8QLhPVmZ7q0mR0fbP9zvVr
 8xZ7QkY6CKhg4ReE=
X-Received: by 2002:a17:907:160f:b0:70f:cceb:d78c with SMTP id
 hb15-20020a170907160f00b0070fccebd78cmr24314288ejc.247.1654703511748; 
 Wed, 08 Jun 2022 08:51:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfncr1XUcQqGB76NBpT2kzdVI8YjlNaW/l9obgdLFkJkEfjsczULyVL2qiN0y1yI556PK0YQ==
X-Received: by 2002:a17:907:160f:b0:70f:cceb:d78c with SMTP id
 hb15-20020a170907160f00b0070fccebd78cmr24314261ejc.247.1654703511434; 
 Wed, 08 Jun 2022 08:51:51 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 g2-20020a1709063b0200b0070a5ba0669dsm8488865ejf.218.2022.06.08.08.51.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 08:51:50 -0700 (PDT)
Message-ID: <7ae17984-89c4-2247-57a7-fde6206e41e0@redhat.com>
Date: Wed, 8 Jun 2022 17:51:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] disas: Remove libvixl disassembler
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefan Weil <sw@weilnetz.de>
References: <20220603164249.112459-1-thuth@redhat.com>
 <07f021e7-1346-c6b3-3bd1-ef0d0f0e2ff5@suse.de>
 <52c51ac4-5598-faf2-d5e5-638cab0dc1fd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <52c51ac4-5598-faf2-d5e5-638cab0dc1fd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/22 19:35, Thomas Huth wrote:
> On 03/06/2022 19.26, Claudio Fontana wrote:
>> On 6/3/22 18:42, Thomas Huth wrote:
>>> The disassembly via capstone should be superiour to our old vixl
>>> sources nowadays, so let's finally cut this old disassembler out
>>> of the QEMU source tree.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>
>> agreed, one thought: at the time I added this thing, I had to add C++ 
>> compilation support,
>> maybe something we can now drop if there are no more C++ users?
> 
> I thought about that, too, but we still have disas/nanomips.cpp left and 
> the Windows-related files in qga/vss-win32/* .

That is pure C++ so it does not need the extra complication of "detect 
whether the C and C++ compiler are ABI-compatible" (typically due to 
different libasan/libtsan implementation between gcc and clang).  So 
it's really just nanoMIPS that's left.

> And I think Paolo was 
> considering to use C++ for coroutine fixes - not sure whether that still 
> is planned, though.

No, that was just an experiment.

Paolo


