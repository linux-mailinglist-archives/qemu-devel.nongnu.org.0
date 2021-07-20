Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E406A3CFC48
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:28:44 +0200 (CEST)
Received: from localhost ([::1]:43934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5qjk-0004aw-14
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m5qig-0003OE-MG
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:27:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m5qif-00051q-29
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626791256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Es74+UVO8IM2+xpGxdNoQ8bX3XKKTTRhEwu0W0we+FE=;
 b=Aszhp6Ubrmgc/Gbvom/kcDURSJPpyXZp8puoxdXiIb0XbFY4eybzQRXh8OvPbr2SYld+qv
 7nJowSAYICROPok21Pj3qdipE6KFX1LQF8FTzGwsgd3ttQrd/byS/lyBGAO1t14gh2sZbu
 dWc7wfFqvaO/VZ6snW79L4gzTHPv0I4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-G8iR_nCcOmCkdKZHUtaayQ-1; Tue, 20 Jul 2021 10:27:35 -0400
X-MC-Unique: G8iR_nCcOmCkdKZHUtaayQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 d9-20020adffbc90000b029011a3b249b10so10293528wrs.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 07:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Es74+UVO8IM2+xpGxdNoQ8bX3XKKTTRhEwu0W0we+FE=;
 b=JtPaCaBiFYfcwlz5S0F0F3vjUzopPHHCJBVv8MeHjVatI4N2KQTz37vy47eATjjto4
 ynAaDegbyTOBMljGal1994QDRFtKao2u1QxqlKI7jUkhykV+yysKlDwO1HkUuXGSmVh8
 iv3IckjW5Yl7bnUDEvLGZRgCPWLCJ93p+veLNQmmCXa8bi/uqKyWEuUEyUJQGoR4XPwh
 EiTlPTDfM2YIiX6aJ1uoj+GrUDUUEVSs8W8+TvJZqoypJ41vxdxjqwZtjHE3rVPiXc0Z
 JqHCpXPXpJY0rrsjGs31ZqbZrxZ3JlkPX1cWREZVgT4dJmZLK3vi2jLnQOjl0ErBn/0n
 TF5g==
X-Gm-Message-State: AOAM532tXB7cYjDaUCFnU/cUVqfevBbYOS0WlMHGTdnMGVyAk4hhBznh
 Rdn/ChQZQYezfEIHFC60m/69UZGR3VMFZiO0hV2Qy5r7iGLrJNUC/QepvBxBhZbU5EpSjbjONBr
 hSFQUuOZ9QwGwnqM=
X-Received: by 2002:a1c:23d0:: with SMTP id
 j199mr13271520wmj.176.1626791254076; 
 Tue, 20 Jul 2021 07:27:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbRtbYwCtDNJxey9ev1uy4aZ6/Yl2md3/LTbWckCs/m4+0fEP3igb1ASzDeTHnp9L2VnVDfQ==
X-Received: by 2002:a1c:23d0:: with SMTP id
 j199mr13271498wmj.176.1626791253829; 
 Tue, 20 Jul 2021 07:27:33 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id i10sm11974416wml.31.2021.07.20.07.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 07:27:33 -0700 (PDT)
Subject: Re: [PATCH v1 3/3] util/oslib-posix: Support concurrent
 os_mem_prealloc() invocation
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210714112306.67793-1-david@redhat.com>
 <20210714112306.67793-4-david@redhat.com> <YPbcQmgAY+GdsIfb@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <a8b2e7c8-9c95-ea23-c1f0-f74387647809@redhat.com>
Date: Tue, 20 Jul 2021 16:27:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPbcQmgAY+GdsIfb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.07.21 16:22, Daniel P. Berrangé wrote:
> On Wed, Jul 14, 2021 at 01:23:06PM +0200, David Hildenbrand wrote:
>> Add a mutext to protect the SIGBUS case, as we cannot mess concurrently
> 
> typo  s/mutext/mutex/
> 
>> with the sigbus handler and we have to manage the global variable
>> sigbus_memset_context. The MADV_POPULATE_WRITE path can run
>> concurrently.
>>
>> Note that page_mutex and page_cond are shared between concurrent
>> invocations, which shouldn't be a problem.
>>
>> This is a preparation for future virtio-mem prealloc code, which will call
>> os_mem_prealloc() asynchronously from an iothread when handling guest
>> requests.
> 
> Hmm, I'm wondering how the need to temporarily play with SIGBUS
> at runtime for mem preallocation will interact with the SIGBUS
> handler installed by softmmu/cpus.c.

That's exactly why I came up with MADV_POPULATE_WRITE, to avoid having 
to mess with different kinds of sigbus at the same time. You can only 
get it wrong.

> 
> The SIGBUS handler the preallocation code is installed just
> blindly assumes the SIGBUS is related to the preallocation
> work being done. This is a fine assumption during initially
> startup where we're single threaded and not running guest
> CPUs. I'm less clear on whether that's a valid assumption
> at runtime once guest CPUs are running.

I assume it's quite broken, for example, already when hotplugging a DIMM 
and prallocating memory for the memory backend.

> 
> If the sigbus_handler method in softmmu/cpus.c is doing
> something important for QEMU, then why is it ok for us to
> periodically disable that handler and replace it with
> something else that takes a completely different action ?

I don't think it is ok. I assume it has been broken for a long time, 
just nobody ever ran into that race.

> 
> Of course with the madvise impl we're bypassing the SIGBUS
> dance entirely. This is good for people with new kernels,
> but is this SIGBUS stuff safe for older kernels ?

It remains broken with old kernels I guess. There isn't too much that we 
can do: disabling prealloc=on once the VM is running breaks existing use 
cases.

Fortunately, running into that race seems to be rare, at least I never 
hear reports.

-- 
Thanks,

David / dhildenb


