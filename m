Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025FD3775D6
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 09:57:27 +0200 (CEST)
Received: from localhost ([::1]:51224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfeJb-0000lQ-3E
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 03:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lfeIU-0008TJ-Ct
 for qemu-devel@nongnu.org; Sun, 09 May 2021 03:56:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lfeIS-0005dA-LV
 for qemu-devel@nongnu.org; Sun, 09 May 2021 03:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620546971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydGlgnDfBqRyhjRw053Vpa9u+t+dkJuCEMM5kWRL2ps=;
 b=CGBKn9V+HixvUUjgpgRPQg8DNuZQ5TZ0fR2yhF13wLax7CzxOgs0LaZjqnU03wJJsbIhgE
 k6Ckv3fwXKrm5yal6c2JoOH2f+xfBXJRBLUI3TyLNJzJwGabiBXxTzZctnRLixeiMtYrXq
 +LbK4iSj/cAiPBV7owxjC0nOpb6Idho=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-Y8fJmrXLNKO76eL00SnpiA-1; Sun, 09 May 2021 03:56:07 -0400
X-MC-Unique: Y8fJmrXLNKO76eL00SnpiA-1
Received: by mail-wr1-f70.google.com with SMTP id
 t5-20020adfb7c50000b029010dd0bb24cfso5836663wre.2
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 00:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ydGlgnDfBqRyhjRw053Vpa9u+t+dkJuCEMM5kWRL2ps=;
 b=MxLYa1kHZ7atEe6TuqYuzqbIcq7JX0M1Pq5V67RtSQjF2qYNCrs9HeHQ5aoNyPCsvc
 wIEahUOnu/cPn8soJuMlM5an+lP7iDt7nHB3Oz9oCk5AoOFw+rlFHpwXgIZA9chzQF55
 rb2sTE3FkByMLBJOsneJdXvCmuW5QHbt1DY2pt7002CGjbaL+OYIqvYGcGCIo/gbvZa0
 5iIOArUgF1r/dpYGBnuFw1YIMs3Zjgt9RaNBFC02arebtkzMIjMphNeOuUAdOiMx6ZPR
 IQSDQRH4QMnP/Fg6B6REfP6IXIzZflRmi9+Qar0O2u1+Y66G1ICnPaNE+mkesHStHjQ1
 lnWQ==
X-Gm-Message-State: AOAM531mWSu7GzbyuW5E/z4TC0oXgp+m1+lHhzgc7jQ2JI0rVN1iWTya
 7cQD03SAKqLuEotUInVBM41abw5NfTqExEWW8QS7FDIKqBghseM2NBphkgafAtxpFqI+S/TFSbH
 5p3i3Oc/PROQVH1M=
X-Received: by 2002:a5d:64e6:: with SMTP id g6mr23348686wri.216.1620546966654; 
 Sun, 09 May 2021 00:56:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbGOFEbY0pz4ss/Pk+bvMxc+HbjrAUnNEjdNnY5FUk44FnbX0dvF7xIhfJFQkMJZ8JcZxQ3g==
X-Received: by 2002:a5d:64e6:: with SMTP id g6mr23348664wri.216.1620546966484; 
 Sun, 09 May 2021 00:56:06 -0700 (PDT)
Received: from [192.168.43.238] (26.red-95-127-155.staticip.rima-tde.net.
 [95.127.155.26])
 by smtp.gmail.com with ESMTPSA id z2sm18828544wrg.6.2021.05.09.00.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 May 2021 00:56:05 -0700 (PDT)
Subject: Re: [PATCH v8 0/4] Implements the NetBSD Virtual Machine Monitor
 accelerator
To: Reinoud Zandijk <reinoud@NetBSD.org>
References: <20210407161631.1780-1-reinoud@NetBSD.org>
 <YJaf3+2gzM7K0m2Q@dropje.13thmonkey.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <62615396-f250-6d49-822e-a443574919ca@redhat.com>
Date: Sun, 9 May 2021 09:56:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJaf3+2gzM7K0m2Q@dropje.13thmonkey.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Kamil Rytarowski <kamil@NetBSD.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/8/21 4:27 PM, Reinoud Zandijk wrote:
> ping?

Paolo sent a pull request:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg804321.html
And you and Kamil have been Cc'ed:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg804320.html

> On Wed, Apr 07, 2021 at 04:16:27PM +0000, Reinoud Zandijk wrote:
>> The NetBSD team has implemented its new hypervisor called NVMM. It has been
>> included since NetBSD 9.0 and has been in use now for quite some time. NVMM
>> adds user-mode capabilities to create and manage virtual machines, configure
>> memory mappings for guest machines, and create and control execution of
>> virtual processors.
>>
>> With this new API we are now able to bring our hypervisor to the QEMU
>> community! The following patches implement the NetBSD Virtual Machine Monitor
>> accelerator (NVMM) for QEMU on NetBSD 9.0 and newer hosts.
>>
>> When compiling QEMU for x86_64 it will autodetect nvmm and will compile the
>> accelerator for use if found. At runtime using the '-accel nvmm' should see a
>> significant performance improvement over emulation, much like when using 'hax'
>> on NetBSD.
>>
>> The documentation for this new API is visible at https://man.netbsd.org under
>> the libnvmm(3) and nvmm(4) pages.
>>
>> NVMM was designed and implemented by Maxime Villard <max@m00nbsd.net>
>>
>> Thank you for your feedback.
>>
>> Refrences:
>> https://m00nbsd.net/4e0798b7f2620c965d0dd9d6a7a2f296.html


