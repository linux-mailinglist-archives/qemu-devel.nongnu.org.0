Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D9444C4D7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:09:00 +0100 (CET)
Received: from localhost ([::1]:42744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkq9j-0006Ij-Jz
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:08:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mkq8e-0005cy-WC
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:07:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mkq8a-0001nr-Tl
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:07:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636560467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ovFWAqig97gx3wDhLbrvKdqHWB6ZQyKauxtarDQJak8=;
 b=A1Jc0Ux3xv+yEg8RifI4LHirnyCFoMOTnLVCqgehMIjS5Vh62BMt0dcE4FDAyXdUbq0Wib
 iNem5QmVrWaxbR9Azb1qQHjGSruOZfCntBTu8iJq/N2RaiLWwN7Ec9d1+uJ/+QXqwJNStC
 qAh8jljI9D3Zzvqym/tcJ5LTK5k944o=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-v0_xGTpIOHOYKE9jTc3EpA-1; Wed, 10 Nov 2021 11:07:46 -0500
X-MC-Unique: v0_xGTpIOHOYKE9jTc3EpA-1
Received: by mail-ed1-f70.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so2714172edl.17
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 08:07:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ovFWAqig97gx3wDhLbrvKdqHWB6ZQyKauxtarDQJak8=;
 b=qZz28AluzXZPgHgIksjBKfj7XUOGd8dUuyBrBw0wpnSBrfTPhAEh101tU+agd7p796
 VhOOutNoXB0QC2CxjK9vPPxqXf2kAvRsfpcaAw3M8n9mMmupc3oI1Sp6rIFPVzOmRRsk
 7XbLqWK2xLNtPCxH7e7i7dOiP7zKANPNBZv/Ao55QgewHKIGg04dBaw03WZEumHeH2RS
 OwzJTmgqMysVklnjRg9euySPHvtVLlAEGDvRqVPMRh5GgJd9/OTl0ACykFoMtxzrcBjN
 vPf2OYGFbfDntORl7czlUv/wM32UqJ+xYf+hs31unKTH6A2Qzf+earIRDOOVMkYrsVeD
 ZQ9Q==
X-Gm-Message-State: AOAM530R1NbSFJu0XUIc04ffvkLV2yCr4f7kNgL9Ejh9ofkH50uvj7KW
 0mB0OheCgDJmLTlVCi37xWg7xacwulOAz87B/x6UYolLVRT8nHckxdYyzebhWd3eF0wtHU9X0sI
 LqePSSyh90QE/vKY=
X-Received: by 2002:a17:906:2d51:: with SMTP id
 e17mr318459eji.132.1636560465006; 
 Wed, 10 Nov 2021 08:07:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAujSTMO5jSeDh9/xXl0xTD/pEg573XT7ZX94BCGcUNV/8cyurnTdxFzYjYNrInuQ9bip27w==
X-Received: by 2002:a17:906:2d51:: with SMTP id
 e17mr318437eji.132.1636560464799; 
 Wed, 10 Nov 2021 08:07:44 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id i13sm133391edc.62.2021.11.10.08.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 08:07:43 -0800 (PST)
Message-ID: <8532a0e7-17e0-7f71-f1dd-1e01a4dc1e29@redhat.com>
Date: Wed, 10 Nov 2021 17:07:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 0/5] SGX NUMA support plus vepc reset
To: Yang Zhong <yang.zhong@intel.com>
References: <20211101162009.62161-1-yang.zhong@intel.com>
 <f8ce527e-5ea7-3359-d2e9-62497136d7af@redhat.com>
 <20211110125637.GA3447@yangzhon-Virtual>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211110125637.GA3447@yangzhon-Virtual>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: eblake@redhat.com, jarkko@kernel.org, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 13:56, Yang Zhong wrote:
>    Paolo, thanks!
> 
>    No other maintainers to review numa patches, so i will send the numa
>    patches again? thanks!

The patch look good, but they were sent too close to the 6.2 release 
freeze.  I'll take a look at them again a month.

Paolo


