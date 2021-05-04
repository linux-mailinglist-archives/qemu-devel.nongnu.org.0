Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47482372E38
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 18:46:28 +0200 (CEST)
Received: from localhost ([::1]:35866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldyBn-0007jC-9n
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 12:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ldxzm-0001TZ-Px
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ldxzh-00062Z-0E
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620146034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uI29p89nq0KJqsCWpVfspL7xWqiEWHH7lTMJP05KryQ=;
 b=WLXU7s2QEVbt1LipoDxCaNDAHN2XKGqmlxcLmiAnlCo66uUvU2i9bsz72CJd3wDMVD19sC
 yo6UfsnmB3xTyGVBIsENVUMDlPH6QuO0UWwn7hJRpHbvLysW0Q8+JeDOwBkySO9DuYzspc
 fGNcvU5CLxe3RBlYKxHHAwJsu/1GXVc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-MhGCVwhhOOSDnydE332u8A-1; Tue, 04 May 2021 12:33:53 -0400
X-MC-Unique: MhGCVwhhOOSDnydE332u8A-1
Received: by mail-ed1-f69.google.com with SMTP id
 d13-20020a056402144db0290387e63c95d8so6697771edx.11
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 09:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uI29p89nq0KJqsCWpVfspL7xWqiEWHH7lTMJP05KryQ=;
 b=Fl/PjRjxpDCrMJV1r6lj1vf+/OFucVLoxY9PlcBiLsp0iVs4FD5be6x/jU8T+CesR1
 Xgxr49ZTu8fKR7YZmJu5H7sAZKU3R2wfxpeGH2THvFTMyG4CvxJaPrs0qvcKYc/nNqXf
 3jAWPaNCLux6SN+OboqkmdOvKSrCtYTI1QlYSXuBzqZPu5xR/kvlKSCsCK0inJErEj47
 8UndiXumGPOnk3lRp2z5wm1uXTorwepCY5rxkP5RvVDMh3wb3mRUJEeLpcEnQniS22tC
 dhZjsqvHIsd37fLOa/zYfjB50OzDpFDuSErlWn1wJsXQu3LTI5edmccQzNB66WV1Li37
 xEkg==
X-Gm-Message-State: AOAM533TWxnw3hnB8Acm82008nZ8p0bPNyNXtSerRmbDob1dj6HxfL+P
 e1JKu7A/x/5qTqlucKMG7RVPtsbWX5DD1D3JFAug1b/UbME47qn/B356l4sm+Jks/xtyr28AlD8
 w/QZTpIAvdCg9m9Y=
X-Received: by 2002:a17:906:5285:: with SMTP id
 c5mr11991714ejm.282.1620146032103; 
 Tue, 04 May 2021 09:33:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpoyilZpc41PMflYjyoBlpfFVgPlo+QZpfmzYkJtwXuyRtcikFqOkb4Lfaw4tT3kc+wcTu2Q==
X-Received: by 2002:a17:906:5285:: with SMTP id
 c5mr11991697ejm.282.1620146031899; 
 Tue, 04 May 2021 09:33:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r10sm1642212ejd.112.2021.05.04.09.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 09:33:51 -0700 (PDT)
Subject: Re: [RESEND PATCH 05/32] vl: Add "sgx-epc" option to expose SGX EPC
 sections to guest
To: Sean Christopherson <seanjc@google.com>
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-6-yang.zhong@intel.com>
 <d772cdd1-69fa-b48f-b8ff-c07cd383b04e@redhat.com>
 <YJCQwXVmS/om2HrW@google.com>
 <d0785500-d007-9d96-1ee1-ce0e4a71c88c@redhat.com>
 <YJF0PXZc3/X8hJ4P@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <17e96348-920b-4b89-934c-a652a7b80af4@redhat.com>
Date: Tue, 4 May 2021 18:33:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJF0PXZc3/X8hJ4P@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Yang Zhong <yang.zhong@intel.com>, kai.huang@intel.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/05/21 18:20, Sean Christopherson wrote:
>> If it's just CPUID, one possibility could be to mark the EPC sections
>> specially in KVM_SET_USER_MEMORY_REGION and synthesize the leaves within
>> KVM; or even look inside the VMA structs and detect EPC regions that way.
>
> I experimented with those options, and a few others, and they all lack the
> flexibility of making EPC just another memory backend.
> 
> For synthesizing CPUID within KVM:
>    - Requires a vendor specific memory region flag for all architectures to work
>      around a quirk of one userspace VMM.
>    - Pushes a lot of complexity into KVM, e.g. KVM needs to update CPUID in
>      response to memslot changes, and needs to query memslots in response to
>      CPUID changes.
>    - Does KVM or userspace define the section attributes, e.g. confidentiality,
>      integrity, etc...?  If KVM, are they hardcoded to match the host?  What
>      happens if a future Intel platform supports multiple EPC sections with
>      different attributes?  If userspace, how does userspace communicate the
>      attributes?
>    - How does userspace know what KVM enumerated to the guest?  See the whole
>      KVM_GET_CPUID2 fiasco...
>    - Prevents userspace from enumerating EPC without a memslot, e.g. to trap on
>      the first EPC access for tracking purposes.
>   
> For probing VMAs:
>    - In addition to the above issues, requires MMU notifier integration to update
>      CPUID in response to a VMA change.
>    - Requires SGX subsystem to provide a helper to identify EPC VMAs.
> 
> In short, I feel very strongly that this is QEMU's problem to solve.
> 

Makes sense, thanks.  (Of course this or other design comments could 
have been in the commit message too; but in all fairness it's never 
obvious which misguided ideas the reviewers could come up with).

Paolo


