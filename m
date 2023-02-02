Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E88687C12
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:18:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXbq-0000BA-85; Thu, 02 Feb 2023 06:18:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXbn-0000Ag-Pt
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:18:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXbm-0004b5-8G
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:18:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675336705;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=4o1O8Ztu5Inub5UVyrA6PW84J0jfcC+Ritaf4pDYmRs=;
 b=WAkfAb1ywzYsfb2HwzRTMXrLR5goeInF8D4GckzVd4TrD1yrhaTkcYGMu8yk1O0OEwkAa3
 whko0JF0Nf8mIQP5gR8YExHDMLqJunR+REZFmqz5srBgYibZnVRD6iy5Z3gowDvr9MTjNC
 J8NX2tIizFQPexcgRQLD1663C3ZIRjY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-T-BzBM5IM--LzOxZKgYYyw-1; Thu, 02 Feb 2023 06:18:23 -0500
X-MC-Unique: T-BzBM5IM--LzOxZKgYYyw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg32-20020a05600c3ca000b003dc0df8c77dso780019wmb.6
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:18:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4o1O8Ztu5Inub5UVyrA6PW84J0jfcC+Ritaf4pDYmRs=;
 b=taDOeAwPi9XuZSNi6+0QF/gDFYOlkcGUuVOwACTNX5RncZ4rPQKzv9Nrn8CyuwiWGg
 /Jw7GqcwSitrZN1w+sVs05R1lnbdYQWyYqQZ/iZyCVG5p0gj/7WjuYwTudujM1Ban+Cq
 mYe5qLsU7z+1Sf7GITujaJZ072di9QnfwYqwNNiIX/jCEJAR6yoikbDY8agtoXxngCTv
 CnUYnCxozHL36P+zHT6Isb3gNIf4URe+XXZXKvOia/boSBlwFWZJZmX0eTEyRbRLRMA7
 JqfzLfIJ3/sviY1zdDQG0j0xWx4SxZ13Tfsvna5j5HRHYRuIA/5UMqvxMDt74fbYTb+n
 Zl/A==
X-Gm-Message-State: AO0yUKXK49Q3hX/FVwqYCEOlGjU0HeF93TN8Qr3di54WpIuMB/js+xOa
 +fDHATdeIrM0TbRHrf5u819qJN9sfypgEvdBpPCZ3+0TEgIpNkc4O+1GsvGybgaO/RYhLy+B6zD
 KnnfCaT5uYbsXHrc=
X-Received: by 2002:a05:600c:a297:b0:3dc:42e7:f626 with SMTP id
 hu23-20020a05600ca29700b003dc42e7f626mr5375793wmb.26.1675336702840; 
 Thu, 02 Feb 2023 03:18:22 -0800 (PST)
X-Google-Smtp-Source: AK7set9irUjd7rph3JJ3unDLcyNoIR5SLr5mYzPywox6BA8gc1TFW/qizVe9V8bVwRiidwaW6i10dQ==
X-Received: by 2002:a05:600c:a297:b0:3dc:42e7:f626 with SMTP id
 hu23-20020a05600ca29700b003dc42e7f626mr5375776wmb.26.1675336702657; 
 Thu, 02 Feb 2023 03:18:22 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c459100b003dee8c5d814sm4469023wmo.24.2023.02.02.03.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:18:22 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,  Andrey Gruzdev
 <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v1 4/5] migration/ram: Rely on used_length for
 uffd_change_protection()
In-Reply-To: <20230105124528.93813-5-david@redhat.com> (David Hildenbrand's
 message of "Thu, 5 Jan 2023 13:45:27 +0100")
References: <20230105124528.93813-1-david@redhat.com>
 <20230105124528.93813-5-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 12:18:21 +0100
Message-ID: <87k010qps2.fsf@secure.mitica>
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
> ram_mig_ram_block_resized() will abort migration (including background
> snapshots) when resizing a RAMBlock. ram_block_populate_read() will only
> populate RAM up to used_length, so at least for anonymous memory
> protecting everything between used_length and max_length won't
> actually be protected and is just a NOP.
>
> So let's only protect everything up to used_length.
>
> Note: it still makes sense to register uffd-wp for max_length, such
> that RAM_UF_WRITEPROTECT is independent of a changing used_length.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


