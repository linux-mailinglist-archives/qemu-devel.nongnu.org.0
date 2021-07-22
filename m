Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865E93D2B8B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:56:11 +0200 (CEST)
Received: from localhost ([::1]:36892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6cva-0004Sq-93
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6csA-0004Q8-PA
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6cs7-00021v-Dw
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dEOxhE/d8Gi5VBU+iwIGqOwgtV0hIHkhjoYTS9cVDoI=;
 b=QKrbZGEOwihyNMekTD3SzJVF+01mtAB6q7ufNrkpGyTv+LAYxB94IcxALjRMzuHSyi7Wvk
 3k5iB2xmaQOF632aa9bzJJ6KIrmtm17f+GVvGP+IUHBuKNJephf+DlNUzmyDtx3xOQZzRE
 B5H/3pLpyXeP4zMQHiNHEZP9qcLFRNo=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-iPgJx4viNUS40wjNNAgjeA-1; Thu, 22 Jul 2021 13:52:33 -0400
X-MC-Unique: iPgJx4viNUS40wjNNAgjeA-1
Received: by mail-ot1-f69.google.com with SMTP id
 59-20020a9d0dc10000b02902a57e382ca1so4149529ots.7
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dEOxhE/d8Gi5VBU+iwIGqOwgtV0hIHkhjoYTS9cVDoI=;
 b=TrSYjnXQdkyY0mA/pXz34sgCf0S6s5iGjDDiDIaNQFmLtEbxkcjqihbCkxzCl0QFLp
 5ewV7aEdVf2klo2JVHwuo+oLDh1U61vV1uYTVFtcfH14lr1QrPjJj27PcdsEK4kzRKLT
 0LCZRNdFG5aQjNf6xv3Xh2zxSwSnMjjK5iQSXEwkp4CUncuFli6QMSjjbmGZ3FP6mKMQ
 huIB0wqOkixUVVmICNFNRFoHbdINox3CdS5S382CHNfABlz+n8FUOuE7SzIY6EMmPYaJ
 hhOIPhlgrNvsYCa5Iedli/UqxY1gShyF2r8YJ0ntFNOVV1OXDyaNKxOvpxHCxVMSW0xk
 nMQg==
X-Gm-Message-State: AOAM5330PQtFcFLSjk17xgwRwqsL6+Fy3B/QM4sgHHgKrTNvz0JfKo5p
 UWiUiIn5EPFLH0UkA3IoiKIN6HQN4gMT3DrjaFpdpcuvSOnI9jHNW26H4u9wMl7NYdkQbf7ZikY
 QKC6nL0/UUl9GePs=
X-Received: by 2002:a05:6830:242f:: with SMTP id
 k15mr693644ots.72.1626976350602; 
 Thu, 22 Jul 2021 10:52:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVngI+s525L2IadOp9NPRC/8sx8fKedYJuuVoInHFTAafcxtIaaHGbG3lEZWesX+f+pApHYQ==
X-Received: by 2002:a05:6830:242f:: with SMTP id
 k15mr693632ots.72.1626976350435; 
 Thu, 22 Jul 2021 10:52:30 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-176.ks.ok.cox.net. [68.102.25.176])
 by smtp.gmail.com with ESMTPSA id u19sm28220ote.76.2021.07.22.10.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 10:52:29 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [RFC PATCH v2 01/44] target/i386: Expose
 x86_cpu_get_supported_feature_word() for TDX
To: isaku.yamahata@gmail.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 alistair@alistair23.me, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, cohuck@redhat.com, mtosatti@redhat.com,
 xiaoyao.li@intel.com, seanjc@google.com, erdemaktas@google.com
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <f78aa143d508c5fd0f54da4f31c339e79ebdd105.1625704980.git.isaku.yamahata@intel.com>
Message-ID: <f721d65d-a844-6854-bd89-9e3feb0f8c8f@redhat.com>
Date: Thu, 22 Jul 2021 12:52:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f78aa143d508c5fd0f54da4f31c339e79ebdd105.1625704980.git.isaku.yamahata@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 7:54 PM, isaku.yamahata@gmail.com wrote:
> From: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> Expose x86_cpu_get_supported_feature_word() outside of cpu.c so that it
> can be used by TDX to setup the VM-wide CPUID configuration.
> 
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


