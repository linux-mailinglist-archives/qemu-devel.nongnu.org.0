Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0628453858
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 18:13:33 +0100 (CET)
Received: from localhost ([::1]:49972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn21V-0002JY-0A
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 12:13:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn20D-0001SG-Lo
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:12:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn20B-0002fn-7H
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:12:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637082728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5wqRyeCJL9WccSw9iwoFJA/23BXOGLoVYojHhSWq8k=;
 b=BTU0zOewoohUxdFAH4bzur7gYICPhcVtT1iH9vtguXoF1Ra5jMNE8fCsT+QCkGGt8TI6LQ
 KTjlzsuQjm10VgfWceWc+qHwbA0Z3q2SHgCoowuGffoCpGa2IshztwF/U0Y0M9B/oZeKOw
 hcqighlV8MFH3NYyVWgNrpyn4DEwWmo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-cmdCLcHtORajyjvZedZnrw-1; Tue, 16 Nov 2021 12:12:06 -0500
X-MC-Unique: cmdCLcHtORajyjvZedZnrw-1
Received: by mail-wm1-f69.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso1503128wmb.0
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 09:12:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f5wqRyeCJL9WccSw9iwoFJA/23BXOGLoVYojHhSWq8k=;
 b=QH+uhvLCBoSsC/D4rp2KSTmQ67ReuKTkYi0+U20O9pcyxwrxtCt/E5ZWbOYFOiHux4
 o1kgFeHFd7hhIr6wsRGYbx+MZn7XkvJuc/hbOhs+T+p2yBBMR2q7nfLO5kiFuLk7UrKn
 iaEMpXnGwfzbH7BHpQ7xnhdU1baidJYo30Us/qxxvys6nJImYebrGX/USHG9hIWAjTOQ
 pjx5shPkAMKSz+yWcoBybJGukAB8EOhOs8T2+0iwbZWDakpGT5WGeu/43L8e0Nt82z+M
 krzZ0Q3AaGAhcO4BAIVFMPXQBBtu/IHNkgImV+2RvW4n+DGWhRAhoZ8YuUAGvpYrfUD/
 TLQQ==
X-Gm-Message-State: AOAM530HEAhLWEEoS0vOv705P4nKgsAaWwekxCbbYfqy3vCTubB4oTnH
 R3YJv4l0aJdz47svzBzuw2qvUz4FpMpfLh3UOj+rw9Pz29AxBfCUlvsXG9kAaIn+ePslHnsInCW
 5ijzdqsA5dHLLc9Y=
X-Received: by 2002:a1c:ed02:: with SMTP id l2mr9645655wmh.115.1637082724130; 
 Tue, 16 Nov 2021 09:12:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8qMmfgndodVRJZcON3s4QUFiv3fNzjvLXvHF/P/VT+ZAs+lAz4MvvJBC5RkSPyrjxHoLP5w==
X-Received: by 2002:a1c:ed02:: with SMTP id l2mr9645626wmh.115.1637082723956; 
 Tue, 16 Nov 2021 09:12:03 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x4sm2897454wmi.3.2021.11.16.09.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 09:12:03 -0800 (PST)
Message-ID: <e0d2a9bd-1c63-7033-7daf-271fea702d66@redhat.com>
Date: Tue, 16 Nov 2021 18:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>
References: <20211114005111.515543-1-aik@ozlabs.ru>
 <735870db-c919-5f85-859a-eddbf507005b@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <735870db-c919-5f85-859a-eddbf507005b@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 17:46, Cédric Le Goater wrote:
> On 11/14/21 01:51, Alexey Kardashevskiy wrote:
>> The following changes since commit
>> d139786e1b3d67991e6cb49a8a59bb2182350285:
>>
>>    ppc/mmu_helper.c: do not truncate 'ea' in
>> booke206_invalidate_ea_tlb() (2021-11-11 11:35:13 +0100)
>>
>> are available in the Git repository at:
>>
>>    git@github.com:aik/qemu.git tags/qemu-slof-20211112
>>
>> for you to fetch changes up to 73944a4bf4ab259b489af8128b4aec525484d642:
>>
>>    pseries: Update SLOF firmware image (2021-11-13 14:47:56 +1100)
>>
>> ----------------------------------------------------------------
>> Alexey Kardashevskiy (1):
>>        pseries: Update SLOF firmware image
>>
>>   pc-bios/README   |   2 +-
>>   pc-bios/slof.bin | Bin 991744 -> 991920 bytes
>>   roms/SLOF        |   2 +-
>>   3 files changed, 2 insertions(+), 2 deletions(-)
> 
> Queued for 7.0.

I am not sure this is a good idea, as this will make bisection
painful over the release tag.

Alexey, do you mind reposting after v7.0 is released?


