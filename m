Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734833C18A4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:49:38 +0200 (CEST)
Received: from localhost ([::1]:59184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Y9Z-0003dq-HR
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m1Xdl-0007yP-Cg
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:16:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m1Xdj-0002yK-F6
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625764602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LZ+JBhU1tJIeMTIQ3Y72tUVIjZH55sxLnFovFGvWJV8=;
 b=SfmEYupRluqbnJe9KjdTeUt/flrqKUmPtrWseVHN9yuGROKy99fKEowEqqzch5uB/B2wPF
 /k8LAJWyUfbbutNSYqygSwg+5JZiJR9ZBrKQ5Nvus8V/cGkw5XMEEMJXdjxBT3zAL+n/B9
 jSYYG+1tKSDDcGLYBDaTMvVkLGhyFlU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-iI0DqYRYMcGxfhj98ugeeA-1; Thu, 08 Jul 2021 13:16:41 -0400
X-MC-Unique: iI0DqYRYMcGxfhj98ugeeA-1
Received: by mail-pj1-f72.google.com with SMTP id
 k92-20020a17090a14e5b02901731af08bd7so4222036pja.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LZ+JBhU1tJIeMTIQ3Y72tUVIjZH55sxLnFovFGvWJV8=;
 b=BdHgcLmA+euuVvRDWeU/Yn9n7ezswuo+TLkUd2xWDPwZiAc+lLP6wzpmfWzRu77fyZ
 E9PGUVoYmQt5nqhOzHvUIYkj/MNzkHZbxRBxNvI0MJczKCXwS5RtFX8rLBbKB8T0U86p
 zjm09X7A5UCP06HCfJXyRGXJWz/9wwsPLPrOfuBhVVpsizQ8LKqdskzpKZEvUSa3IvHN
 6fako3f6AAjJibvRL+w9Y7a2eUI7A7UQfxT+ZJmXDxYiV6IQjQ4AcjZ9N82AkKRexpsZ
 pArAzBqDQ7f0+Vqxqbww0hpT6YdgFZQHqW2kZS1LISuKVmOL85axABQLhfR6b1O1n9wq
 TH2A==
X-Gm-Message-State: AOAM532LHRUYQF/vd048O3wAv0x8kpfdZ+nK8dIP290iVx/zZmRThvhl
 OjCt/6xarQlPtJ7TR3ISG2a4SvljgpfPApZxPx8C8BQuDPZQXY6VK5D0LYIarUCe8e6YoLo1jaf
 Bzirzk271MuayzBg=
X-Received: by 2002:a63:eb04:: with SMTP id t4mr33747768pgh.84.1625764600300; 
 Thu, 08 Jul 2021 10:16:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcRGigFrTMUDAuQ6C2qoEmC/pEkuZpzug+3ZKO6xTT4OoEQC2tfrCrkvsx1FSX1xeQSY5icA==
X-Received: by 2002:a63:eb04:: with SMTP id t4mr33747741pgh.84.1625764600084; 
 Thu, 08 Jul 2021 10:16:40 -0700 (PDT)
Received: from [192.168.1.183] (c-76-27-223-100.hsd1.or.comcast.net.
 [76.27.223.100])
 by smtp.gmail.com with ESMTPSA id d9sm3195455pfd.91.2021.07.08.10.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 10:16:39 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] x86/sev: Measured Linux SEV guest with
 kernel/initrd/cmdline
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210624102040.2015280-1-dovmurik@linux.ibm.com>
 <2dc6c60e-48f8-7c6f-6131-0bc1020e106f@redhat.com>
 <fbf2dd1f-150e-beb5-bf17-fc5dc787ab0d@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <05d0ae90-a45f-157b-d37c-942bc0442449@redhat.com>
Date: Thu, 8 Jul 2021 10:16:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fbf2dd1f-150e-beb5-bf17-fc5dc787ab0d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 10:03 AM, Philippe Mathieu-Daudé wrote:
> On 7/8/21 6:41 PM, Connor Kuehl wrote:
>> Hi Paolo,
>>
>> Please consider this series[1] for inclusion into your next pull request.
>>
>> Just a note that this series has a companion series that is getting
>> upstreamed into OVMF[2]
> 
> Shouldn't we get the OVMF part merged first?

The approach taken in the OVMF series doesn't seem very controversial,
so I don't anticipate any breaking changes with the current state of
those patches as far as QEMU is concerned.

However, I'm fine with erring on the side of caution.

Connor


