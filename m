Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F1B41C06F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 10:14:38 +0200 (CEST)
Received: from localhost ([::1]:40772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVUjc-0004RK-Lj
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 04:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mVUhJ-0003Z0-07
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 04:12:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mVUhE-0008LH-Gm
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 04:12:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632903126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4ylwflDruhcNAjlN8eUl7+g+e/yZt/28Ny5dKxDRAQ=;
 b=jOY5I+o2Ds5ZiK+BFVLYShGNtMouST0+Phn1nCn8NPdJT1vU0qA6rCdzOJPPJMF4jhj1GM
 iIhtYSRwehPxU5rAKjskKMoXCrcbGLO0Snzi5Zk56dTeZy/wjTAd62k2mLLMZ18ind2oXY
 k49RuXNmSnZKefSIIlOGnEoNrxTq3fU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-ghphQA7JMtus4yLQrPGdUA-1; Wed, 29 Sep 2021 04:12:05 -0400
X-MC-Unique: ghphQA7JMtus4yLQrPGdUA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l42-20020a05600c1d2a00b0030d02f09530so560976wms.0
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 01:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M4ylwflDruhcNAjlN8eUl7+g+e/yZt/28Ny5dKxDRAQ=;
 b=KbHdP1sKlLpQGbpwp8xEj6ptnaz/SQbR9FTmqvINuAYCbYlO2oezmle4jxN33/ZbcJ
 6PS1Y2o7CLhGmLN3UeKREjtgnFYfFD9S8wf2IR9s7pxye1IIbMWbJ+S7bSdIIySDhYus
 zz261CKEE9nd0EdVALp/597SZSVzAKSCUHPimVmNA/wCx/Q2ABCj+k+tI+hnqK4dnQyt
 j/neH5uQCezaiyMILTshT9ZOmdvhvezBUlUdzSgCYuSwg28bXO4Wbhz7VagXeLTYPH3r
 GVHrmQwsCn6tyPIsMfV7zHjSqIuCFRUCjyZjdwyaHrTUskYSVMuJtw61d5GEjBAmyYex
 /LfQ==
X-Gm-Message-State: AOAM53214++MUf2GehQ10cSo2b4IrrH36XnY+avwPVi7xVnLLMjpOMIi
 qWv89WG1qR+F++j9YTfU5dXFV7nDug1eeRqwd3S5l1E4ofym+4Lv45Ti/eEAaCmUEwNWIDDeLAH
 Qyv0BSSFLZ7oxsHo=
X-Received: by 2002:a5d:50c1:: with SMTP id f1mr5270834wrt.386.1632903124403; 
 Wed, 29 Sep 2021 01:12:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK7256KM44gTM8jc/OHcFiLi8+qJXwdX0juE5oTsLu7+Ojinh1l1ctlKpGtK4MfHcrTLBK1w==
X-Received: by 2002:a5d:50c1:: with SMTP id f1mr5270810wrt.386.1632903124215; 
 Wed, 29 Sep 2021 01:12:04 -0700 (PDT)
Received: from thuth.remote.csb (p549bb2bd.dip0.t-ipconnect.de.
 [84.155.178.189])
 by smtp.gmail.com with ESMTPSA id o7sm1769247wro.45.2021.09.29.01.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 01:12:03 -0700 (PDT)
Subject: Re: [PATCH v2 3/5] s390x: topology: CPU topology objects and
 structures
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
 <1626975764-22131-4-git-send-email-pmorel@linux.ibm.com>
 <aceb16ce-b944-b00b-0624-5b5dd41accf0@redhat.com>
 <c9193765-adae-d179-8a14-8bc88a288fe0@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <70fafbc6-b1f6-dfec-6e5c-9eb863cae0a0@redhat.com>
Date: Wed, 29 Sep 2021 10:12:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c9193765-adae-d179-8a14-8bc88a288fe0@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/09/2021 14.45, Pierre Morel wrote:
> 
> 
> On 9/7/21 9:32 AM, Thomas Huth wrote:
>> On 22/07/2021 19.42, Pierre Morel wrote:
>>> We use new objects to have a dynamic administration of the CPU topology.
>>> The highier level object is the S390 book. In a first implementation
>>
> 
>>
>> I didn't spot any migration related code in here ... is this already 
>> migration-safe?
>>
> 
> Not sure at all.
> 
> The topology may change at any moment and we interpret PTF, the instruction 
> which tell us if the topology changed.
> Obviously the topology on the target may not be the same as on the source.
> 
> So what I propose is to disable topology change during the migration:
> - on migration start, disable PTF interpretation and block the 
> topology_change _report in the emulation.
> - on migration end set back PTF interpretation and unblock the emulation
> 
> In the case, in discussion with David on KVM, that we do not emulate PTF for 
> hosts without the stfl(11) we can even make it simpler in QEMU by always 
> reporting "no change" for PTF 2 in the emulation.
> 
> Note that the Linux kernel, even if the topology can change at any moment 
> use a polling every minute to check the topology changes, so I guess we can 
> ignore the optimization during the migration.
> 
> What do you think?

I don't have much clue, this topology stuff is still mostly a black box to 
me - so there is no interrupt or something similar presented to the guest 
when the topology changes? The guest really has to poll for changes? ... 
that sounds like a weird design to me... if the guest polls too frequently, 
it wastes cycles due to the polling - but if it polls not often enough, it 
could run for a while with wrong topology information?

  Thomas



