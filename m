Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A3744D299
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 08:43:07 +0100 (CET)
Received: from localhost ([::1]:59932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml4ji-0003J8-St
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 02:43:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ml4gR-0008RS-Sk
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:39:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ml4gP-0007X8-F0
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:39:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636616378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9XMMPtVyUwRkzSwyT3R8APGq+RIRCMVElTpv9bSaCfo=;
 b=WaLftkMCwxSl2G4fLE9b6Pa3QKPUMa6yGKJsHcsy4JfGKp+hgxM59KInF7CdAheVg0ID/W
 lG1YKqXSUsqPTP0tm1rIPDNoUBxMZhEE4bMD96qk6YdiVSYS8neaiepKLlUV50w7NjWHzP
 Dymf9di4S62gjxweFMumFU96jGMjV4E=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-bDEEVxalNLeM-ktVm_2zCw-1; Thu, 11 Nov 2021 02:39:37 -0500
X-MC-Unique: bDEEVxalNLeM-ktVm_2zCw-1
Received: by mail-ed1-f70.google.com with SMTP id
 g3-20020a056402424300b003e2981e1edbso4706172edb.3
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 23:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9XMMPtVyUwRkzSwyT3R8APGq+RIRCMVElTpv9bSaCfo=;
 b=a9W7LsdBHwO0CujuNjPTLiYwuJ9dQLYgdTxT9QcCY63CpQGGlDKxY3cMRJjrlM0oN/
 B972kwEeTC5ImNKw+WkLWAXURzxdWJomRjiAUnG0HT9/YCCOrISkFphrWeBvMclFCzu4
 J1ymAru9xtgXKQqL9Cl/u3+fJB+09+Wpbw6wk9rnMO8RSY74ROnE/uV1NJypc1AEtFf7
 /FQ8CUEIX4bje0Q8Ul+wBCzW7/xmRM9cUlD2xp9vOCbh/LVTt81VrlIjTkJti9lBHpwG
 71fp02B/Zrac2E/bRTaPHf8l2K4DLL6AEH2Qf3TeJD/TCkk0fjAeJz70kkShJ679ws8X
 2SEQ==
X-Gm-Message-State: AOAM530Zk5BoFNu94EildzQ3GVbzT+PKvQtU6AVja6LDUvaZA6LYimgn
 W33YcGBOG04d8flsG0V+bFLDLN+1lom0DNrzPYigH3f4x+25CpV/UHILk/rKeWKnibW1quXp2o7
 4Fuh+Ts9KZUVpC9Y=
X-Received: by 2002:a17:907:3e25:: with SMTP id
 hp37mr6967506ejc.43.1636616375549; 
 Wed, 10 Nov 2021 23:39:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpQKl0hulWv710L4GlA2RBARtFo+r9Hey7OpEsSr8yrP3+m76G/+UvuBLSKDHkqsdat8ngmw==
X-Received: by 2002:a17:907:3e25:: with SMTP id
 hp37mr6967485ejc.43.1636616375363; 
 Wed, 10 Nov 2021 23:39:35 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id t6sm1049997edj.27.2021.11.10.23.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 23:39:34 -0800 (PST)
Message-ID: <8a9e5113-7aef-e9d4-19d8-f80bcd1bd426@redhat.com>
Date: Thu, 11 Nov 2021 08:39:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 3/5] numa: Support SGX numa in the monitor and Libvirt
 interfaces
To: Eric Blake <eblake@redhat.com>, Yang Zhong <yang.zhong@intel.com>
References: <20211101162009.62161-1-yang.zhong@intel.com>
 <20211101162009.62161-4-yang.zhong@intel.com>
 <20211110165540.souq5vgqtfn2hsft@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211110165540.souq5vgqtfn2hsft@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: jarkko@kernel.org, philmd@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 17:55, Eric Blake wrote:
>> The QMP interface show:
>> (QEMU) query-sgx
>> {"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
>> [{"node": 0, "size": 67108864}, {"node": 1, "size": 29360128}], "flc": true}}
>>
>> (QEMU) query-sgx-capabilities
>> {"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
>> [{"node": 0, "size": 17070817280}, {"node": 1, "size": 17079205888}], "flc": true}}
> Other than the different "size" values, how do these commands differ?
> 

The latter is the host state, the former is the guest state.  So for 
example the guest might have been configured with a different NUMA setup.

Paolo


