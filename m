Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63354441B4E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 13:48:39 +0100 (CET)
Received: from localhost ([::1]:46668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhWju-0005y4-1e
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 08:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhWhi-0004xc-62
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 08:46:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhWhd-0008Ls-U3
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 08:46:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635770776;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSQiNTBkPmNVx6D5vlUQYLDMouMfk6hqw/5P0O7Jdlo=;
 b=WN/BwS4x0EF4EXKzP+OR2cTaQBmvKYkxKcJ8EcC7w0jv4rIzxD9Xjn2HU5muNO+d3D8XTa
 55VIdaFtDcLe1hQCPe3VAYGdXa+RxXQMu6uwC25VYaoCSKp3zh1c0zCj0KIHhwjyWO55me
 OoLPd2TsWoRWKCUKdDKcPXthOrFu30c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-LFZ3yMNpMHi6bKw5ITRvmg-1; Mon, 01 Nov 2021 08:46:15 -0400
X-MC-Unique: LFZ3yMNpMHi6bKw5ITRvmg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n189-20020a1c27c6000000b00322f2e380f2so5845675wmn.6
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 05:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WSQiNTBkPmNVx6D5vlUQYLDMouMfk6hqw/5P0O7Jdlo=;
 b=k4NLbBVN9Qew529q5YQD9bnDeOcp5iif28+bpL16opN7BeDrIKbNB8WNZZ0e3bhUfL
 S+rYAF4s/xvZ2MmVRgScslLwMYVBr1E2ucN+nFB/LonClIS6m+LdQXsaTtFthEdkK+WU
 Sl7h3wvGaP7zA7CJ64GVQNueQmVRoj5KMx0G+bXho/Ln0d2JJTzRggBgZ40KbA8FM/yV
 1t9trs7QyCchCg6b/j4u4MmLrdDOMelLhd9a6WCpk+byv6MvFsX0rWVRqto35qBzJ4ac
 YcOWsOP+GFLUpnXdMYKNWIJI+oopjeXnmzhC13JyG/SCvpaNH7vImEkaoM7hZkTQ267s
 Z8IA==
X-Gm-Message-State: AOAM530OpjAPVaGqFD0MuqCAz00PFETxnfL8JSgF6EyZq+1TLmXkXbfG
 A1CnGxebRYpyKAePdPBz2JFzrt28tAagp3CTU62tU1gpbHur0zOfMGDgTfZyLglRvvpQGPq0Dgs
 VDUE/iV6nbh2ax/Y=
X-Received: by 2002:adf:e390:: with SMTP id e16mr37555168wrm.217.1635770774069; 
 Mon, 01 Nov 2021 05:46:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqz4nszcet8HakcQ9rGAdc/jKrU54PrsmIorVOOET4rq7laIC89jHRdOheYF8fdh/p8fH7Uw==
X-Received: by 2002:adf:e390:: with SMTP id e16mr37555136wrm.217.1635770773906; 
 Mon, 01 Nov 2021 05:46:13 -0700 (PDT)
Received: from localhost ([178.139.231.243])
 by smtp.gmail.com with ESMTPSA id b6sm15803984wrd.85.2021.11.01.05.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 05:46:13 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 3/9] migration/ram: Don't passs RAMState to
 migration_clear_memory_region_dirty_bitmap_*()
In-Reply-To: <20211011175346.15499-4-david@redhat.com> (David Hildenbrand's
 message of "Mon, 11 Oct 2021 19:53:40 +0200")
References: <20211011175346.15499-1-david@redhat.com>
 <20211011175346.15499-4-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 01 Nov 2021 13:46:11 +0100
Message-ID: <8735ogqc18.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> wrote:
> The parameter is unused, let's drop it.
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

This was already been included.


