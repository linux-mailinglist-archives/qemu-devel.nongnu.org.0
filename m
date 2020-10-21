Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83176295322
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 21:51:38 +0200 (CEST)
Received: from localhost ([::1]:44738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVK92-0006Jz-W4
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 15:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVK7s-0005PW-LM
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 15:50:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVK7q-00070a-37
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 15:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603309820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0LlUSXIB7K9K0NSGyfVQxqOVi5F0uuU0PhEcDTpuJ0g=;
 b=LHW9UkxARjNaMdtGYfepNWc7HAyr5NQv6U38vP2F5wzPaoxs9ApYd8fU3MHQavJxc+3oA2
 BHKcdfLVO6Ta4Tr95w7aE9n4EAPonqwQ6xUgLp/IGdE9qEhzWxpVHcp8d0MT8gH3vvxEhW
 4lM34Tf6qiETX8xAsJsNeSlctwMCB8M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-BawNU3cbOo6WhXr2r_gjIw-1; Wed, 21 Oct 2020 15:50:18 -0400
X-MC-Unique: BawNU3cbOo6WhXr2r_gjIw-1
Received: by mail-wr1-f72.google.com with SMTP id 47so3096822wrc.19
 for <qemu-devel@nongnu.org>; Wed, 21 Oct 2020 12:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0LlUSXIB7K9K0NSGyfVQxqOVi5F0uuU0PhEcDTpuJ0g=;
 b=PpAmHWIlD8Ho7FDrEy4qxCnEAsS4X1Ve3oX3DsQlms7ezj2lPgLFvi7vo4mtNpx06c
 pO1yZiQ58qHM3EINsfTAUj5MWfb7e2jhGu00Ddgv96b6PV5ZMyajB2m8hHfkmLTOt/uv
 1eEKSLG48sArIBGyo/o4M4YTfUQw55KxPa6hiGDqFSP73QMEsPchyw0bzWJeHEIGS0zp
 A1OvqPuKwbIjHon71D4Mwe7GGFa6tmZHguaBq9lM1xxCmCNpETpvJLe93DC7+BLA9Fdd
 k1z3RgXemDEaqWNeXR5DGA8wtMq+SsNXI9YClZJv9xWcdGzSKkevJKlGoxOFeBCpxx2t
 qVOA==
X-Gm-Message-State: AOAM532HP/FE/CBsOO9Lttyy0CCtpHfNXzk3uD3HyxyZal/l4r4FxrPq
 3YMKs9giEq8x3Hk0hbtQze+SuEIBxs14iqGjhw2su+EkTOT9pTPPVcZIn/NaEZO9LA5HC8Dr0q1
 3UHwUj/s5drHcFfs=
X-Received: by 2002:a1c:7707:: with SMTP id t7mr5388541wmi.54.1603309817585;
 Wed, 21 Oct 2020 12:50:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytMlKjGWtMIlywjs8rYZ1y5tekCcb8IxtL9OQSXkAG8xfSiQTNZl2FXsj6aWGdLwLeK5fLqA==
X-Received: by 2002:a1c:7707:: with SMTP id t7mr5388528wmi.54.1603309817376;
 Wed, 21 Oct 2020 12:50:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 4sm5678958wrn.48.2020.10.21.12.50.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2020 12:50:16 -0700 (PDT)
Subject: Re: [PATCH 1/1] Skip flatview_simplify() for cpu vendor zhaoxin
To: Alex Williamson <alex.williamson@redhat.com>
References: <20201016112933.14856-1-FelixCui-oc@zhaoxin.com>
 <20201016112933.14856-2-FelixCui-oc@zhaoxin.com>
 <a971c9db-469f-ddc0-1a27-3e21958f6ff7@redhat.com>
 <20201019130206.1d3baffc@w520.home>
 <4d2b96cb-8f7f-2598-39e6-4cf0f61d567b@redhat.com>
 <20201020164437.5e3cb4ce@w520.home>
 <783b5ef0-277c-363d-f342-7c0351f9ac16@redhat.com>
 <20201021124908.53c7a98b@w520.home>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <eaab570f-741e-7397-09c2-8e47f0a6d32c@redhat.com>
Date: Wed, 21 Oct 2020 21:50:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201021124908.53c7a98b@w520.home>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: FelixCuioc <FelixCui-oc@zhaoxin.com>, Eduardo Habkost <ehabkost@redhat.com>,
 CobeChen-oc@zhaoxin.com, qemu-devel@nongnu.org, TonyWWang-oc@zhaoxin.com,
 RockCui-oc@zhaoxin.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/10/20 20:49, Alex Williamson wrote:
> I can understand the general benefit of flatview_simplify(), but I
> wonder if the best short term solution is to skip operating on the x86
> PAM range, which I understand to be a small number of memory chunks
> below 1MB.

I'd rather remove flatview_simplify altogether, it probably triggers
relatively rarely.  Possibly do not let it operate on RAM/ROM regions,
only on I/O regions.

> I might also wonder why the EHCI controller on this
> platform is choosing that range for DMA.

I assume it's the BIOS's driver and it's choosing a range in low memory,
but still I'm not sure why its DMA is racing against the PAM update
(which is done very early).  Felix, do you know the answer?

Paolo


