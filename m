Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE5759FFB3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 18:43:47 +0200 (CEST)
Received: from localhost ([::1]:37184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQtTm-0002fl-3v
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 12:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQtSE-0000iy-Px
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 12:42:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQtSA-0003mv-Jc
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 12:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661359325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4iFniGucJc63s28+FvjKLJaLMMZzPLmYI9h/JnhHwlM=;
 b=J/IATZC+5o/N0wz980HVkEz/6iAJ4qAQ3BS8SKBEODoAZvxxG4iMQ8dCia2KVDUHqzoDFP
 cq3Qqp5oaD9gUCQhIOgh19v8tbP3nSM9B0Lhg1cMCkn7lus5VZymMHPgULGxlmy1ripXIq
 wixXp9reemowx5k0pc6HauaO+D9DINg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-eI63CJGKOGen_8g5GGJNdw-1; Wed, 24 Aug 2022 12:42:03 -0400
X-MC-Unique: eI63CJGKOGen_8g5GGJNdw-1
Received: by mail-wr1-f70.google.com with SMTP id
 s20-20020adfbc14000000b002252dae05f7so2950916wrg.20
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 09:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=4iFniGucJc63s28+FvjKLJaLMMZzPLmYI9h/JnhHwlM=;
 b=kKIydKIqoleNi57Pkfu6v8CGJAQMQtGKue87V81QQvGHLuu/lj6NN6cMdikc0JdjHm
 6W1CgrqT7Kk1eqOniE5jazQex6qSRk5zl93E0cwt25whl7V7tD4PF5OpL1yApBbnQ9Ez
 XDEj2Bny/LIxRN9ucWHlhIltp2HLBI7l+4lad5pt6v0I9CYIXNKiNsB65mTsq74kk2iv
 +H/go3dJUWsM94Nb/uGqyTcEa+nc2OQJzsdsDYQj6fWEGJclImWuLKyW4P74toQd4j3/
 t+nSyiRR6ujt7WewzqrjJjZ6tnFiUji2GjQgcherCgh5CPPXarII31HiCDwl8Mo4J54v
 o9pQ==
X-Gm-Message-State: ACgBeo3vhivfiU5y+wgcI5FGsYDYQenr0ApDZgaJzlLVBs53MdYy+kdr
 4y09EjTcfvopLNecRSFBWLGjUdQ58+GLp1Wx1jvlGGjOT/neL6WW2kLk0RlPKvxwarJga9UJv/m
 n8IBc2c1pNzgktcE=
X-Received: by 2002:a5d:68c9:0:b0:225:330b:2d0 with SMTP id
 p9-20020a5d68c9000000b00225330b02d0mr37386wrw.243.1661359322728; 
 Wed, 24 Aug 2022 09:42:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4lIFzU34cd5WLYheu4nUsWyNWvWXv2EONHK7VKL36vWuDi91zuur5IqU15ucHmp0KhngvEbQ==
X-Received: by 2002:a5d:68c9:0:b0:225:330b:2d0 with SMTP id
 p9-20020a5d68c9000000b00225330b02d0mr37370wrw.243.1661359322463; 
 Wed, 24 Aug 2022 09:42:02 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:c500:5445:cf40:2e32:6e73?
 (p200300cbc707c5005445cf402e326e73.dip0.t-ipconnect.de.
 [2003:cb:c707:c500:5445:cf40:2e32:6e73])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a05600c2cd700b003a6632fe925sm2768730wmc.13.2022.08.24.09.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 09:42:02 -0700 (PDT)
Message-ID: <e7b3468a-cdfb-4592-8a7a-48da2fa77647@redhat.com>
Date: Wed, 24 Aug 2022 18:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qiaonuohan@cn.fujitsu.com
References: <CAJ+F1CL27O8dmGSws=-QgutRRpM2NHcued28gnvt5jWo2WeUvw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: Page alignment & memory regions expectations
In-Reply-To: <CAJ+F1CL27O8dmGSws=-QgutRRpM2NHcued28gnvt5jWo2WeUvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 24.08.22 14:43, Marc-André Lureau wrote:
> Hi,

Hi!

> 
> tpm-crb creates a "tpm-crb-cmd" RAM memory region that is not page
> aligned. Apparently, this is not a problem for QEMU in general. However,
> it crashes kdump'ing in dump.c:get_next_page, as it expects

I assume you mean "dumping in kdump format".

> GuestPhysBlock to be page-aligned. (see also bug
> https://bugzilla.redhat.com/show_bug.cgi?id=2120480
> <https://bugzilla.redhat.com/show_bug.cgi?id=2120480>)
> 
> Here is some relevant DEBUG_GUEST_PHYS_REGION_ADD log:
> guest_phys_block_add_section: target_start=00000000fd000000
> target_end=00000000fe000000: added (count: 3)
> guest_phys_block_add_section: target_start=00000000fed40080
> target_end=00000000fed41000: added (count: 4)
> guest_phys_block_add_section: target_start=00000000fffc0000
> target_end=0000000100000000: added (count: 5)
> 
> I am looking for ideas on how to solve this crash.

Do we care if we don't include everything in the dump? I recall that
e.g., vfio will simply align and not care about such partial RAM blocks.


One idea is doing another pass over the list at the end (after possible
merging of sections) and making sure everything is page-aligned.

Another idea is specifying somehow that that memory region should simply
not be dumped ...


But I do wonder why the ram memory region that's mapped into the guest
physical address space has such a weird alignment/size ...

> 
> Should qemu enforce that memory regions are target page-aligned? In

... can we simply fixup tpm-crb-cmd?

> which case, TPM CRB MMIO region would overlap with the RAM region, and I
> wonder how that turns out to be, and if other devices would be impacted etc
> 
> Or should kdump learn to handle non-aligned blocks somehow? I think that
> option should make a reasonable solution, as long as we only have
> empty/zero-memory "gaps". Handling other cases of joint or overlapping
> regions seems more difficult.

Right, you'd actually have to pad the remainder with zeroes.


-- 
Thanks,

David / dhildenb


