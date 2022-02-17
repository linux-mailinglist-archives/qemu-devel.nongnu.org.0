Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD8F4BA82C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 19:25:49 +0100 (CET)
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKlTQ-0006cr-0n
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 13:25:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKlRr-0005WA-B8
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 13:24:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKlRm-0004Ug-VT
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 13:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645122245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XqGBf6Z40AhQ4vD7OO/56dM6GT4XvIs/gur0uK95AS0=;
 b=FLEyQShQKyFbRyynuxAldtzAk7+5J0JLnPZxmVY2GPR6HA7190ySO6mEywtEB/emM3kbal
 5pTKhNkCBQyImj7TrLvbIRsaAjLGCZubLMEy8iK8pY1tVQMLv1Obf3uZnuYuKisfQl1LFo
 DyUZt6+j/2I3ei4Gaxql6ai/EdOdFi4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-NSCX-2psMV6hq2olASG30A-1; Thu, 17 Feb 2022 13:24:01 -0500
X-MC-Unique: NSCX-2psMV6hq2olASG30A-1
Received: by mail-wr1-f72.google.com with SMTP id
 s22-20020adf9796000000b001e7e75ab581so2600808wrb.23
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 10:24:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XqGBf6Z40AhQ4vD7OO/56dM6GT4XvIs/gur0uK95AS0=;
 b=0WdV1SyAiCaoopbDCifHazL8CFpvK0jsM3iQHNUw9tfjrN0nMtwkNaYdJOlhXbJIBM
 p6TQ7GZvkaO4l+zGUufesfH8LjOT/ru7UTOOUF6bOXcfREdq2xxiiB3y/oDfhIp3L+a4
 PoEH3S9Tedl8Vkfxx+Qtcsti19cyIqmtPmAshEYJGMfyxjwWAKTy2JQACOwUeYhIw1cx
 G2YVRrwVk9HZ8lH5SHgRrGW081H3+HiUOzlZpjR+rlC33Hxok0QB34yFMPEO91lvujMO
 xtn/hhH+/lKyDiAG3MdCk9k+vGhmj9sLb2U18cU0CWICSpIC8SGCNQ0ndifqyCh7LtU0
 K3Vw==
X-Gm-Message-State: AOAM530uSRGlySYVVfHKqtee7a53raCgqelWCfFkmaV8WFOLPFT47aay
 7GTXR6BE+uKYzk4IQTJfGREERl6WyFzx2T7xkaXCjKkS5XdosnYgg3Yjxia5O/iiFdrIpFY13I0
 Nk5w1UauSJbHzLd4=
X-Received: by 2002:a5d:6309:0:b0:1e4:9a62:d46f with SMTP id
 i9-20020a5d6309000000b001e49a62d46fmr3132240wru.50.1645122240070; 
 Thu, 17 Feb 2022 10:24:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8J8S3KjcSB53W68quuOsgTicFzC163zhUDnZtl2wsjoLgU7epesyFAOxnQC2aN5mOYlEcTQ==
X-Received: by 2002:a5d:6309:0:b0:1e4:9a62:d46f with SMTP id
 i9-20020a5d6309000000b001e49a62d46fmr3132213wru.50.1645122239768; 
 Thu, 17 Feb 2022 10:23:59 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id i7sm6923001wrf.67.2022.02.17.10.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 10:23:59 -0800 (PST)
Message-ID: <09b8f0ae-c47a-eb55-9f66-65568ac47ff9@redhat.com>
Date: Thu, 17 Feb 2022 19:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/01/2022 16.47, Stefan Hajnoczi wrote:
> Dear QEMU, KVM, and rust-vmm communities,
> QEMU will apply for Google Summer of Code 2022
> (https://summerofcode.withgoogle.com/) and has been accepted into
> Outreachy May-August 2022 (https://www.outreachy.org/). You can now
> submit internship project ideas for QEMU, KVM, and rust-vmm!
> 
> If you have experience contributing to QEMU, KVM, or rust-vmm you can
> be a mentor. It's a great way to give back and you get to work with
> people who are just starting out in open source.
> 
> Please reply to this email by February 21st with your project ideas.

I'd like to suggest an idea (shamelessly "inspired" by Philippe's suggestion 
last year):

=== Improve s390x (IBM Z) emulation with RISU ===

Summary: Adapt RISU to s390x and fix CPU emulation along the way.

RISU (Random Instruction Sequence generator for Userspace testing) is a tool 
for testing CPU instructions with randomly generated opcodes. The goal of 
this project is to adapt the RISU framework for the IBM Z architecture 
(a.k.a. s390x), so that it could be used to test the s390x emulation of QEMU 
for correctness. This will certainly help to spot some instruction emulation 
deficiencies in QEMU which should be addressed during this internship, too.

'''Links:'''
* [https://git.linaro.org/people/peter.maydell/risu.git/tree/
    Peter Maydell's RISU repository]
* [https://www.linux-kvm.org/images/6/63/01x03-ValidatingTCG.pdf
    KVM Forum 2014 presentation by Alex Bennée]
* [http://publibfp.dhe.ibm.com/epubs/pdf/a227832c.pdf
    z/Architecture Principles of Operation] (the description
    of the CPU instructions)

'''Details:'''
* Skill level: intermediate (a good basic understanding of CPU
   instructions is required)
* Language: C, Perl
* Mentor: Thomas Huth (thuth@redhat.com) (+1 TBD)


What do you think about that idea?

  Thanks,
   Thomas


