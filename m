Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD16687B79
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:06:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXOx-0006nO-Nb; Thu, 02 Feb 2023 06:05:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXOf-0006mq-LK
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:04:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXOd-00006S-Ui
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:04:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675335891;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=S+iqFPec3XVFizk0lwqoQJ//O2NvxWDb+nnrRpDpS+U=;
 b=OOheHRGq1+d2Aim283sJNx2JxGuraWd7SMrHuy3Id6pi8/B6330bDSeNzayoa2gkh2OSyc
 D/T7/zmeKmGMSOWtb8gevgOA7JOMP4T4fWUyCeM0ZQeblGo9gru6Y9yZUqVyCICHp+zN2p
 WNjrWIRXWXx+3P/EN5PqVIGJ01gEqbg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-454-1Y5KI6S7PFSSSO_Xk2UEcw-1; Thu, 02 Feb 2023 06:04:50 -0500
X-MC-Unique: 1Y5KI6S7PFSSSO_Xk2UEcw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k9-20020a05600c1c8900b003dc5dec2ac6so2641232wms.4
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S+iqFPec3XVFizk0lwqoQJ//O2NvxWDb+nnrRpDpS+U=;
 b=BgR7/BbY5eBCaRKEh43PBGBSRZkbIgnwaU/FE7BxXMgOE7j2FqKFD/RoxpQBcXUlQT
 wRXtFwjZLhKTHZS/IE9a4UTpm8Fwne7OdWjnhnmm6QK8XwRyRp5cVonnKHF0riRb6RuT
 FH1tMIKitwoQZhU+nWsyTkv5KloTxrKRPzmuTG8iauM730aF2meALFFbszJbkW3DmdtR
 sCPZovwdQlZtaBCnIRObZXCpDYQN2qDImaCoIHqxhAOsMZxBCc+3+wmOv8EgyNJVeP+t
 FeYyqb8WelVBYy1QItk5uVEtivxUND9PTrZ/JUTGSr6mrBim7sOA6mbEwzUBaiQcxg1Z
 8vLA==
X-Gm-Message-State: AO0yUKVTqE7FtpqW8ttXg+bTIFfpZtHgmjVucob04KLLvyMMpG1i/bDX
 EWiZaffPyUgv1kn09jwNrrhT3dlAlbctwlxCl72F2xe1TT3QhL1C1OrDlGn37tY8GJde1Q2+R1h
 Kt/c0atnqZKMK9mY=
X-Received: by 2002:a5d:44d1:0:b0:2bf:bc0a:361d with SMTP id
 z17-20020a5d44d1000000b002bfbc0a361dmr4760825wrr.31.1675335888952; 
 Thu, 02 Feb 2023 03:04:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8OOWLBBBZglOCUFW0OVrz5+9lA5X79cBh7ctcckW4oJ3JDThedx0tL/M4jx8AEa7sFQxqH+Q==
X-Received: by 2002:a5d:44d1:0:b0:2bf:bc0a:361d with SMTP id
 z17-20020a5d44d1000000b002bfbc0a361dmr4760803wrr.31.1675335888684; 
 Thu, 02 Feb 2023 03:04:48 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 ay22-20020a5d6f16000000b002c3bec91679sm1744641wrb.110.2023.02.02.03.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:04:48 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,  "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v5 0/8] virtio-mem: Handle preallocation with migration
In-Reply-To: <01a7ad2a-5fbc-a3ad-f3a9-82bf5b44096e@redhat.com> (David
 Hildenbrand's message of "Mon, 23 Jan 2023 15:27:49 +0100")
References: <20230117112249.244096-1-david@redhat.com>
 <01a7ad2a-5fbc-a3ad-f3a9-82bf5b44096e@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 12:04:47 +0100
Message-ID: <87ilgks4z4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

David Hildenbrand <david@redhat.com> wrote:
> On 17.01.23 12:22, David Hildenbrand wrote:
>> While playing with migration of virtio-mem with an ordinary file backing,
>> I realized that migration and prealloc doesn't currently work as expected
>> for virtio-mem. Further, Jing Qi reported that setup issues (insufficient
>> huge pages on the destination) result in QEMU getting killed with SIGBUS
>> instead of failing gracefully.
>> In contrast to ordinary memory backend preallocation, virtio-mem
>> preallocates memory before plugging blocks to the guest. Consequently,
>> when migrating we are not actually preallocating on the destination but
>> "only" migrate pages. Fix that be migrating the bitmap early, before any
>> RAM content, and use that information to preallocate memory early, before
>> migrating any RAM.
>> Postcopy needs some extra care, and I realized that
>> prealloc+postcopy is
>> shaky in general. Let's at least try to mimic what ordinary
>> prealloc+postcopy does: temporarily allocate the memory, discard it, and
>> cross fingers that we'll still have sufficient memory when postcopy
>> actually tries placing pages.
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Cc: Juan Quintela <quintela@redhat.com>
>> Cc: Peter Xu <peterx@redhat.com>
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> Cc: Michal Privoznik <mprivozn@redhat.com>
>
> @Juan, David: I can similarly take this via my tree as well.

Reviewing it.

I can get it through migration tree, thanks.

Later, Juan.


