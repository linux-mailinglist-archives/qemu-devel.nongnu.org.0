Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C0C341EFF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:09:08 +0100 (CET)
Received: from localhost ([::1]:54694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFoJ-0005Ds-5Z
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNFnZ-0004os-CK
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:08:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNFnX-0002TK-Uy
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616162899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATyK/uQQ3exE83SEvV8rNNFd15uVPp94jBawgWvpZTc=;
 b=MmtwqX8HRFDVK3y3l2qrr/UUr9sPyAXrqfy18CNJ04Fgr+yec9lGu2JS5RJYCySi7o3M5W
 4dOblH+2VmjmyMZd2m2RcFUkDjYiY7DTyIL4MPieW4hH8PTcgaVU2BdvqPvHWhsd2TRCjI
 un0TTvc0TuCTsMgIUoy5ASR4j1/rmRY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-II7yn9kxOEiEj4VXeh1O2w-1; Fri, 19 Mar 2021 10:08:17 -0400
X-MC-Unique: II7yn9kxOEiEj4VXeh1O2w-1
Received: by mail-wm1-f71.google.com with SMTP id o9so4464500wmq.9
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 07:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ATyK/uQQ3exE83SEvV8rNNFd15uVPp94jBawgWvpZTc=;
 b=HCrkU8NlDNclEhXwJ9amrei10XUQStwREQ6AiF8Z43FsO4ROKjV7C9AJEKKXE+4IB0
 fPODcAOmZi7yXCS3r8w0XlobntG02FKE+9dtSHGuPqapSlN8WbwMAXlJux/lj0xmq4Hh
 +mnRbGvX172b07LU6C0FCh4Yo8dQpBTkIN5eJrDpoh4nw7H7G6mXfV6dEMZhLpWRM4LX
 pJBbJy53ObYIS7kNk7VIrRM264cG6DMZ/uc9b2AvQjRdXZAoE3188H84YHZtgIu0tYee
 Gi/veoErz+4SmEKVEI6wONMdfaudJvOIa1wS6glGLfS/CvF2tftVHXpYS97jgOmAvZtY
 Q1Lg==
X-Gm-Message-State: AOAM531H/W3G1P5jAvXwazlyTOSBvRh/zxR7XRrkiYN36TZ3thNUbXyy
 6xhYpeCLa+575WFZSUmzl1EMz9hlCRSsT3g0jckmE02kQ5p0VBDbV13DPM0LuOw14ZGwz/sN/Bm
 dH+B/j/LWQdAfEDA=
X-Received: by 2002:a1c:2203:: with SMTP id i3mr3875141wmi.163.1616162896159; 
 Fri, 19 Mar 2021 07:08:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlacQ67VMNZWR3mmaV9kA2LYp7ZdkNP1GaLDXgTLmrmzHl740LCBKvUCH1IOWiDZ8xhiqPdA==
X-Received: by 2002:a1c:2203:: with SMTP id i3mr3875133wmi.163.1616162896024; 
 Fri, 19 Mar 2021 07:08:16 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id f16sm7879456wrt.21.2021.03.19.07.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 07:08:15 -0700 (PDT)
Subject: Re: [PATCH] fuzz: Avoid deprecated misuse of -drive if=sd
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210319132008.1830950-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b7c12e7a-6109-13cb-ca57-ad75a7967835@redhat.com>
Date: Fri, 19 Mar 2021 15:08:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319132008.1830950-1-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: lvivier@redhat.com, thuth@redhat.com, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/21 2:20 PM, Markus Armbruster wrote:
> qemu-fuzz-i386-target-generic-fuzz-sdhci-v3 uses -drive=sd where it
> should use -drive if=none instead.  This prints a deprecation warning:
> 
>     $ ./build-oss-fuzz/DEST_DIR/qemu-fuzz-i386-target-generic-fuzz-sdhci-v3 -runs=1 -seed=1
>     [ASan warnings snipped...]
> --> i386: -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive: warning: bogus if=sd is deprecated, use if=none
>     INFO: Seed: 1
>     [More normal output snipped...]
> 
> Support for this usage will be gone soon.  Adjust the test.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  tests/qtest/fuzz/generic_fuzz_configs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


