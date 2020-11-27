Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2172C6AF2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 18:51:24 +0100 (CET)
Received: from localhost ([::1]:39170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kihtz-0003Pg-R6
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 12:51:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kihrP-0001oR-A9
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:48:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kihrN-0006v3-7Y
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:48:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606499320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FrUHxBdR6Ox1T/ChkcEIyNYihhGFZ9TLF2XdomcgI9Q=;
 b=IzISu6TZBkUwIXhZo409M9xb+ndjPbM/y5jYlHaX9g8IeRlf7W3f8tKUP09J8v2FPbXF7u
 6i0WkaHAWrvoY85Pm+ZqHLRFFPYNLfUQq+NutxqR0cWRpXLzdQxhX4GL/Z/0s3Bu++5dpl
 RNwHago9Gte2TXCgFLoDutkrevNr+Pk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-Q7Ycc9AxNmWofgKIH8Jzrg-1; Fri, 27 Nov 2020 12:48:38 -0500
X-MC-Unique: Q7Ycc9AxNmWofgKIH8Jzrg-1
Received: by mail-wr1-f70.google.com with SMTP id n1so3785305wro.22
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 09:48:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FrUHxBdR6Ox1T/ChkcEIyNYihhGFZ9TLF2XdomcgI9Q=;
 b=tWjTN3n3eVUV/uGlVBl3H/+dnBUPhUUZ7N9MdY9bZWv3DfI9FdEqvhRySUZt5CyYfB
 dTVIjHEB/FG4JsQDvsiJKsOvlBRC3O+x4arWXSqiFktMXGEMyDDsUH+sTkJWYsI+6vSO
 2Fzz0MXeVxODWD/fZr25ln4skdrTQq2BGq19FiovsorQ817ld6e1M5c2tO5T5h5mM1lM
 Rh5VHKXqBnTThYRwpdevrAVNIgg8wmiG/WtzbKTacHeUeIXi7bEEu/mP4koWsqnf6dad
 K/s9GrtwisUUhtNrak4JeLf0xoATc9ISNM6VamKHiAe4ZO46K4FMHzLatf+nxzkie67P
 j39A==
X-Gm-Message-State: AOAM530+bLgmRmFlwkIQXE+IbPupFf91Cl9HhCFQBSFB5DGrtUz2xMYY
 wUSeUVcpGrTHXMse5TAybH5ojaWWMTjJNf4b62+6eTRBBkLq7S5bIRrNmoXXHY1ygnLSkPnrN08
 ICfzU8c7sPj4YLKw=
X-Received: by 2002:a05:600c:2886:: with SMTP id
 g6mr10503287wmd.110.1606499317553; 
 Fri, 27 Nov 2020 09:48:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyd/4bkUcYSNFcGQIRPCo7jYj4UrUke+CXhEuSp3bweo8Rd1mQwkk+SrIqPBsUdb/SaUOduQA==
X-Received: by 2002:a05:600c:2886:: with SMTP id
 g6mr10503263wmd.110.1606499317354; 
 Fri, 27 Nov 2020 09:48:37 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id a15sm16287289wrn.75.2020.11.27.09.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 09:48:36 -0800 (PST)
Subject: Re: [PATCH 0/8] hvf: Implement Apple Silicon Support
To: Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126221049.GS2271382@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fce7fc61-24de-0b1a-4cca-bba80ab5de60@redhat.com>
Date: Fri, 27 Nov 2020 18:48:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126221049.GS2271382@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/26/20 11:10 PM, Eduardo Habkost wrote:
> On Thu, Nov 26, 2020 at 10:50:09PM +0100, Alexander Graf wrote:
>> Now that Apple Silicon is widely available, people are obviously excited
>> to try and run virtualized workloads on them, such as Linux and Windows.
>>
>> This patch set implements a rudimentary, first version to get the ball
>> going on that. With this applied, I can successfully run both Linux and
>> Windows as guests, albeit with a few caveats:
>>
>>   * no WFI emulation, a vCPU always uses 100%
>>   * vtimer handling is a bit hacky
>>   * we handle most sysregs flying blindly, just returning 0
>>   * XHCI breaks in OVMF, works in Linux+Windows
>>
>> Despite those drawbacks, it's still an exciting place to start playing
>> with the power of Apple Silicon.
>>
>> Enjoy!
>>
>> Alex
>>
>> Alexander Graf (8):
>>   hvf: Add hypervisor entitlement to output binaries
>>   hvf: Move common code out
>>   arm: Set PSCI to 0.2 for HVF
>>   arm: Synchronize CPU on PSCI on
>>   hvf: Add Apple Silicon support
>>   hvf: Use OS provided vcpu kick function
>>   arm: Add Hypervisor.framework build target
>>   hw/arm/virt: Disable highmem when on hypervisor.framework
>>
>>  MAINTAINERS                  |  14 +-
>>  accel/hvf/entitlements.plist |   8 +
>>  accel/hvf/hvf-all.c          |  56 ++++
>>  accel/hvf/hvf-cpus.c         | 484 +++++++++++++++++++++++++++++++++++
>>  accel/hvf/meson.build        |   7 +
>>  accel/meson.build            |   1 +
> 
> This seems to conflict with the accel cleanup work being done by
> Claudio[1].  Maybe Claudio could cherry-pick some of the code
> movement patches from this series, or this series could be
> rebased on top of his.

It seems easier for Claudio to cherry-pick patch 2/8
of this series ("hvf: Move common code out") and rebase
on top.

Claudio's series is still tagged RFC, but if you were
planing to queue it, you could take patch 2/8 out of
this series, as it is generic, and let the HVF/AA64
specific bits still being discussed.

> 
> [1] https://lore.kernel.org/qemu-devel/20201124162210.8796-1-cfontana@suse.de


