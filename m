Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F013ED985
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:08:27 +0200 (CEST)
Received: from localhost ([::1]:46390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFeDy-0005RV-DD
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFe6J-0002F2-4O
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:00:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFe6H-0005KY-N7
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629126029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6c/B2w01DIces0Gwf7GdMJgUY5TLllh+DG4mItOjhBc=;
 b=WZ6Gj9+oxcmorDlMvSeB6X6C8kspASiFnque/hfDtln1nqvFcNz9PU3u44TWB8KnNsKqUT
 Y5iXu+oMHuwBlgErzxBnB85w7/NFc/jGNQG74CSytZ4w4xLdHKsvFO2lbOrN7XnvnbRFxn
 E++XNAWk62OYaTvBJOJLlxy7QFuzJ8Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-gOddN-GNO4qmrPhwrjbMvQ-1; Mon, 16 Aug 2021 11:00:25 -0400
X-MC-Unique: gOddN-GNO4qmrPhwrjbMvQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 e18-20020a0564020892b02903be9702d63eso7803146edy.17
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 08:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6c/B2w01DIces0Gwf7GdMJgUY5TLllh+DG4mItOjhBc=;
 b=WQFkujHpNtMHWrOZPTbUT80XJhr8nJAqeLePDOxWyH17VgjFm9W+XFQN+BSVGMJJzC
 iEzbUai3xL+i8S1pJzGsXNwbc8v8VN+biqm3BM2olGF7x4GaNbXFscvkJCM9mlXRR7kb
 1OIVFSGxEXk9TcPOzdBjomDpHiTDC69qkDbFk87UYj0mN4bGnvSY4MtXe+WT4/WSQyzh
 cViddvTeN2aqkcJEY5yE0/FylZXgcpMArcRbdnZn2YqXWmiahrPNeZsDlejxix1XJXNn
 gjSnRijjClAYSQvr/RsN17ANzAFWcHSgl85v2x0KBoSM81wEy3EhGNz2OQNTUGKGHsyh
 Snzw==
X-Gm-Message-State: AOAM533Oxto3iz4MASHVb0UzgI+GemttCWckSCNTArqo7pNyxhO60Heq
 0V6mp1sqgguSx9su+68nlg3r2HEgZPT8odZCxIWFSqJgsGohq280pDK3SBDHpc8mG6dRHnkxtBj
 zixlKraivRE6ywGY=
X-Received: by 2002:a17:906:379a:: with SMTP id
 n26mr13897759ejc.501.1629126024608; 
 Mon, 16 Aug 2021 08:00:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxg05Adq9gspWdSbc/Y9Sdi3R19vQwkaCjgwvGhtfdPLEYQAovOnaHfkwwSg4AGDaeULaKNUw==
X-Received: by 2002:a17:906:379a:: with SMTP id
 n26mr13897731ejc.501.1629126024408; 
 Mon, 16 Aug 2021 08:00:24 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id m6sm874535edc.82.2021.08.16.08.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 08:00:23 -0700 (PDT)
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
 <YRp09sXRaNPefs2g@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b77dfd8f-94e7-084f-b633-105dc5fdb645@redhat.com>
Date: Mon, 16 Aug 2021 17:00:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRp09sXRaNPefs2g@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thomas.lendacky@amd.com, Ashish Kalra <Ashish.Kalra@amd.com>,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, tobin@ibm.com, jejb@linux.ibm.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, dgilbert@redhat.com,
 frankeh@us.ibm.com, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/08/21 16:23, Daniel P. Berrangé wrote:
> snip
> 
>> With this implementation, the number of mirror vCPUs does not even have to
>> be indicated on the command line.  The VM and its vCPUs can simply be
>> created when migration starts.  In the SEV-ES case, the guest can even
>> provide the VMSA that starts the migration helper.
>
> I don't think management apps will accept that approach when pinning
> guests. They will want control over how many extra vCPU threads are
> created, what host pCPUs they are pinned to, and what schedular
> policies might be applied to them.

That doesn't require creating the migration threads at startup, or 
making them vCPU threads, does it?

The migration helper is guest code that is run within the context of the 
migration helper in order to decrypt/re-encrypt the code (using a 
different tweak that is based on e.g. the ram_addr_t rather than the 
HPA).  How does libvirt pin migration thread(s) currently?

Paolo


