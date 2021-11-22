Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2AE458F9E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 14:43:14 +0100 (CET)
Received: from localhost ([::1]:48910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp9bE-00043M-RU
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 08:43:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mp9UD-0006Sr-30
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:35:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mp9UB-0001Qv-2H
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:35:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637588154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=602lNvVOZar2m+HSFbxBYiyDNXrGO+dVi/Ze/KZAj6g=;
 b=ZNDVdueQ4xrwWe5pXhJgvmseao91pgGi4k943MKsjUnPjFhJBevrarVBZ/Y/Ght0GUGvXk
 FmHMfDzufOBWB+sPHo6bKBVpkZ+lMUvw/XAK8svFtTb9U9RdnRxN1+r6M/Y5LPG17FVzoR
 9xfdcuB2bWSuUu1Z0DjXDXXh6biDfrs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-Wwof4F_aMOqHSTmsbgqaHw-1; Mon, 22 Nov 2021 08:35:53 -0500
X-MC-Unique: Wwof4F_aMOqHSTmsbgqaHw-1
Received: by mail-wm1-f71.google.com with SMTP id
 138-20020a1c0090000000b00338bb803204so6071136wma.1
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 05:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=602lNvVOZar2m+HSFbxBYiyDNXrGO+dVi/Ze/KZAj6g=;
 b=ieDf2HtwihrvaBZDeImg3fO2h5tbx10RhCuDr9aQ3Ojjw8U9+QovbLP9iTwpP/cm0P
 Yus1ndt7hC4+oHKAY1eU4rji0qjPhumt/MeWsTypTyztfb6QDjKlctg/iySmJQ8MoOuq
 00BnOkTJk7LTIrbRlpNt9JPfy4A8/ygrxx9F5L595lqY+tWKM60CdsWo2dI5Ugyt1Hh3
 ONEqVd0cE2pxuGW/NvaNKvHW7CURY57aW8M2UMeNetIJ7iT7Izz+BOpprxuWT7MDHSbj
 zIb6i+2QbMIX7SjcPQnCQF8fq4WiDILhtpXtAyMB2NNIvexK2QNeFW2pbSpqLEziMeFN
 LOrA==
X-Gm-Message-State: AOAM532Qf8esG71vIq96zZxXi2Dn0DGmASDV99X+FC5ZXMWXId52bVtW
 vifhLXikMAzlNJOnWTeBHX9+qi8wNLoE1x2TNCGbbqHeNZxzHN/v1ngiDVKW+Gam7nfigfGsbb3
 jxKweQbnfqHZCc0o=
X-Received: by 2002:adf:f042:: with SMTP id t2mr39515215wro.180.1637588151990; 
 Mon, 22 Nov 2021 05:35:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1uMKJXFglAoRaU5wdp0h6HMWbMcVgb35JuanaPUNLoA7JZ4ctjynARZIlt7KcqMq8Cl1Yqg==
X-Received: by 2002:adf:f042:: with SMTP id t2mr39515155wro.180.1637588151703; 
 Mon, 22 Nov 2021 05:35:51 -0800 (PST)
Received: from [192.168.3.132] (p5b0c667b.dip0.t-ipconnect.de. [91.12.102.123])
 by smtp.gmail.com with ESMTPSA id m34sm24540329wms.25.2021.11.22.05.35.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 05:35:51 -0800 (PST)
Message-ID: <56c0dffc-5fc4-c337-3e85-a5c9ce619140@redhat.com>
Date: Mon, 22 Nov 2021 14:35:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
 <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
 <20211119160023.GI876299@ziepe.ca>
 <4efdccac-245f-eb1f-5b7f-c1044ff0103d@redhat.com>
 <20211122133145.GQ876299@ziepe.ca>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211122133145.GQ876299@ziepe.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 ak@linux.intel.com, Jonathan Corbet <corbet@lwn.net>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jim Mattson <jmattson@google.com>, dave.hansen@intel.com,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 john.ji@intel.com, Yu Zhang <yu.c.zhang@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.11.21 14:31, Jason Gunthorpe wrote:
> On Mon, Nov 22, 2021 at 10:26:12AM +0100, David Hildenbrand wrote:
> 
>> I do wonder if we want to support sharing such memfds between processes
>> in all cases ... we most certainly don't want to be able to share
>> encrypted memory between VMs (I heard that the kernel has to forbid
>> that). It would make sense in the use case you describe, though.
> 
> If there is a F_SEAL_XX that blocks every kind of new access, who
> cares if userspace passes the FD around or not?
I was imagining that you actually would want to do some kind of "change
ownership". But yeah, the intended semantics and all use cases we have
in mind are not fully clear to me yet. If it's really "no new access"
(side note: is "access" the right word?) then sure, we can pass the fd
around.

-- 
Thanks,

David / dhildenb


