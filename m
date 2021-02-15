Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C043331B5AF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 08:40:08 +0100 (CET)
Received: from localhost ([::1]:60428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBYUJ-0000op-B1
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 02:40:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBYSl-0008PY-Q6
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 02:38:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBYSh-00086s-Dn
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 02:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613374705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m24bkUsHWHWGubdSH21KXcCmTCjAYdFijVJu5Fnk6wg=;
 b=WIoKEGyIkhHPWB8sLkZK3f5IeaDJQ+ZEAzYzQuAJBOjXCt9IXNewZK5vxF2KZoqrqMHXSB
 4dkbCSsuppGRCFC0d9Xyp2IdhwyIa/hhmdQP3OsP9NH6nkm7KF35C7sSSMldHcUvLUWfjj
 LrvSjjdi2HqBMqPWLvFSe092eL2Wpcc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-YXKJcu50Pwm4YdShwd2gqw-1; Mon, 15 Feb 2021 02:38:21 -0500
X-MC-Unique: YXKJcu50Pwm4YdShwd2gqw-1
Received: by mail-wm1-f70.google.com with SMTP id q24so7176603wmc.1
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 23:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m24bkUsHWHWGubdSH21KXcCmTCjAYdFijVJu5Fnk6wg=;
 b=JerHaghLvE9BOPwyl7UuwiT9Uszs9lVaJx87/NUru8/j373IBHV2ZHqMXK3iIt5X1d
 y5yOTnowcH6Lhc3hFU3QxGMKIplYKBnW35/6DBVmj2dFKVVELKRykLNOuB65vePlCK9F
 jfdA+Y155qJ0ykYUqqkSqZ50SxFmFKfpQ7hWahEHdnI9lf71j1Rg+y65OJBNkQ9ZqpOH
 KhiiVeQnzdvRdH2ivYUTPwvEc6IaEGOcCTnCymKFbZLBf2kCE6i3dF9X/EQRI9zWZEK9
 k6BOsBl7S7h6+jAseykG6AN7TXpxuVeeTZgtacG5Ntbxot7dLHET/cXhFiIEIFKToHmO
 oAtA==
X-Gm-Message-State: AOAM530+M/5sL7EdernBCHaRi3NTOZTdHc55VcNJ8yLYnfminu1uVcAP
 F1PIdhVhWDEbuzXrL/1k/Ji83ZwAF9NFR/4tuRjfhViC1UeFyN0i7CEW1JSY1vyAd7YOJ/UHRMC
 6igMHkpkku3yx4nI=
X-Received: by 2002:adf:de01:: with SMTP id b1mr8472427wrm.369.1613374700181; 
 Sun, 14 Feb 2021 23:38:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxs5e7hL07aDLEwaUPMIzR4YA48ovBW3aC6DTYlSbDR760aB62XenOa6eDAvzgX+3JCtnxVxw==
X-Received: by 2002:adf:de01:: with SMTP id b1mr8472412wrm.369.1613374699949; 
 Sun, 14 Feb 2021 23:38:19 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c3sm9230474wrr.29.2021.02.14.23.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 23:38:19 -0800 (PST)
Subject: Re: supported machines for aarch64
To: ckim@etri.re.kr, qemu-discuss@nongnu.org
References: <027101d7035b$2e94a600$8bbdf200$@etri.re.kr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <57e74877-84a4-0157-1407-a67156dc2b6e@redhat.com>
Date: Mon, 15 Feb 2021 08:38:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <027101d7035b$2e94a600$8bbdf200$@etri.re.kr>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/15/21 6:26 AM, ckim@etri.re.kr wrote:
> Hello,
> 
> I tried “qemu-system-arm –machine help” and it gave me 75 machines.
> 
> Then I tried “qemu-system-aarch64 –machine help”, and it gave me almost
> the same result except it had raspi3, sbsa-ref, xlnx-versal-virt and
> xlnx-zcu102 in addition.
> 
> I asked myself, Does this mean most machines work both in 32bit mode and
> 64bit mode and those added 4 machines work only in 64bit mode?

Yes.

> So I tried for integrator machine which is supported both by
> qemu-system-arm and qemu-system-aarch64,
> 
> “qemu-system-arm –machine integrator –cpu help” and “qemu-system-aarch64
> –machine integrator –cpu help”, and this time,
> 
> The cpu list was almost the same(mostly seemd older 32 bit versions) but
> the aarch64 cpu list gave me 3 more cpus (cortex-a53, a57 and a72).

Indeed.

> 
> So I realized the qemu-system-aarch64 can emulate both 32bit and 64bit
> machine and cpu cores – as the document says.

Correct.

> .(it’s still strange “qemu-system-arm –machine help” doesn’t give me
> xlnx-versal-virt in the list, but “qemu-system-arm –machine
> xlnx-versal-virt –cpu help” still gives some machines in the list..)

This is because '-cpu' is processed *before* '-machine', so this works:

$ qemu-system-arm -M adsfafdadsfasdfdafadfasdfa -cpu help
Available CPUs:
  arm1026
  arm1136
  arm1136-r2
  ...

> I started this as a question but found out the answer while writing..

:)

> Thank you and correct me if I’m wrong

Regards,

Phil.


