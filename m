Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32ED323A22
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:05:33 +0100 (CET)
Received: from localhost ([::1]:44578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEr2y-0000nb-VK
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:05:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEqxv-00049H-HN
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:00:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEqxt-00037i-P5
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:00:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614160816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lrsh83E/Es7llSBasd3bo6B/1glPPktJvh4MwKTGnfs=;
 b=NxlPj455C2zUD71c2wK3KXZij5V/3JJ73gOenxad3esizzTS1rER0z4wcDW/Wxv3Rarj/+
 Sgb6ZeApz08uq/SYbRsv9O9xqWQUrOR7SG24nE+4+AgCRu+Owu3gt2zlxOueYacNCBT2QI
 92XcT+uBwxGaN2KSvoQnBeh7EZXeSZc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-6HpD-PEHOUG26YQmPs8kOA-1; Wed, 24 Feb 2021 05:00:14 -0500
X-MC-Unique: 6HpD-PEHOUG26YQmPs8kOA-1
Received: by mail-ed1-f71.google.com with SMTP id q2so606692edt.16
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 02:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lrsh83E/Es7llSBasd3bo6B/1glPPktJvh4MwKTGnfs=;
 b=X7XEVtfZLKLeck87pWpapLRMiPeRFLUezH4r5Iece5665hz9UUKhHy3V4/TWS+sYB2
 dmp7mMGxm7TqPNXahMvbOw60FwGHiAxvu4ROb1BQScYYuGrMC4q/hnPeOVY5ZfbLbvZM
 +GkSaiAAeN+3FB7XQKZ+yGryFad2+eHdbL9RqDqbQFDEqA2NGgrQJAJldHvYQywji8GK
 Kf4jGxm73aiH9IMbRR+4t3qiQ6TcFpumMEjsg85B9X7GiaeYfpvQw0f9NGOzRuK2HGi7
 3iFJJAZJsF+Evds5pQhx1wMORJeAPFA/ip6SXYTA24+206lRwsIw/lNao8AHJ5UXgy2m
 U0CA==
X-Gm-Message-State: AOAM533wtrQF1lHoBAXDmyqPDPhXBsjdRPHGHio+ZU8GLKKQadbOPZ1W
 YK4WcMnfwUv6dPRyzRi4hOJHga9IQGLyF7WYsznYUYT60wdp5I/g8MdybcMjPXx380CLsiLkQoS
 iVppubqSRS9Sk0e0=
X-Received: by 2002:a17:906:8593:: with SMTP id
 v19mr366747ejx.32.1614160813038; 
 Wed, 24 Feb 2021 02:00:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCsDc3KRUscQbl28gl+0CE1NP6WKUaCNZIc/XX8Wkxfq1ANGdsoOOiMmdCLh/GosAujTqTNg==
X-Received: by 2002:a17:906:8593:: with SMTP id
 v19mr366721ejx.32.1614160812834; 
 Wed, 24 Feb 2021 02:00:12 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b2sm1139939edk.11.2021.02.24.02.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 02:00:12 -0800 (PST)
Subject: Re: softmmu vs sysemu [Was: Re: [RFC v1 06/38] target/arm: split off
 cpu-softmmu.c]
To: Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-7-cfontana@suse.de> <87blcc57rj.fsf@linaro.org>
 <e7f21ff9-b2c6-668e-c973-d2949b81327e@suse.de>
 <2765ff1d-8b77-c2c8-c48a-dc2f582d80ff@redhat.com>
 <477a7799-cb25-afa7-c280-09d839a2b180@suse.de>
 <a6682a0f-5993-ed12-98d7-0c8f59385bbd@suse.de>
 <0a47d627-fda8-54c7-dbf8-2ebfc9000137@linaro.org>
 <9dee8138-2088-33ba-b941-494c64925004@amsat.org>
 <cbece07f-67ae-147b-98b7-62b37b16e808@linaro.org>
 <52d854fa-120a-d748-2469-383b4b46f8e7@redhat.com>
 <5a2a9620-1322-1e6d-a0c5-c1d495d2e289@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <048b1cbd-3ba3-95e7-d6f8-d020f5eabbc6@redhat.com>
Date: Wed, 24 Feb 2021 11:00:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <5a2a9620-1322-1e6d-a0c5-c1d495d2e289@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@centriq4.arch.suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/02/21 10:30, Claudio Fontana wrote:
>> - easy: rename files and directories
> right. The ask in this series from Richard is to rename new files and
> directories from "softmmu" to "sysemu".
> 
> This gives us a resulting codebase where some directories are
> softmmu, some are sysemu, and the meson stuff is still softmmu. To me
> this is a worse situation than where we started, but if I am the only
> one perceiving this I will just call the new directories and files
> "sysemu".

We already have include/sysemu.  Renaming softmmu/ to sysemu/ would be 
easy enough, maybe even one-line.

If you are going to post the i386 version with the files renamed in the 
same way, I think that one was pretty close to ready?

Paolo


