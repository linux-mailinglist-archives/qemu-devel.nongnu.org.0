Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F0A6402ED
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 10:08:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p11zu-0006wm-Tm; Fri, 02 Dec 2022 04:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p11zM-0006iB-93
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 04:05:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p11zH-0006bL-Uq
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 04:05:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669971929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PfJ93dLRCeG2GBsUtx3//WXn16R7gr7n62jhn2ToEZQ=;
 b=e/diA4bscdT5iChz84V5E9m2bdrHFPIBhYwedjTcEZOYmPvr3MieW7337pA1ZU0v9l1igA
 nyU7ds5y0IF1K8aY12nmpuazxygFKiztVT1ILfrazjAXayLPHT9kc7dFXRbx5/rJftqCJ5
 wETl1sNMdeSzpATb07BuZT4nskVzsiE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-246-snJd65-kP2y5cDv7fS-naw-1; Fri, 02 Dec 2022 04:05:28 -0500
X-MC-Unique: snJd65-kP2y5cDv7fS-naw-1
Received: by mail-wm1-f70.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so3830448wme.7
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 01:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PfJ93dLRCeG2GBsUtx3//WXn16R7gr7n62jhn2ToEZQ=;
 b=5Jot6HRZqpbSbjG4RBKd7sPFxfXuuxCUdulLNfr1npVaVIOdsSMiUZpdp7yU4JUsU3
 qaIjmWIVc1ZEb9TlW6j24y4hhImGBnTyuA8a4OiYkitlfAGxQIrAhW0/YbaQFfTjOjbb
 ib32jT/UjNlTPWDYRcTTRt6SwFSGRKzfpxcBA9q1WWlJ559ZuwagzXH1Sqiz0zRldJVo
 O8zAqFrYxmEI9hKL2C5HKnueJcFstMhQOs/Q5MxWTRuREA/Bvx+WOsRu8jWnQqJAXDvs
 WatBsrVfeGKwwI4MMsI03L/ZrojEEWISERE14WAe8vS0b5UhwPdwDyjFILr7xl06xyV5
 TJSQ==
X-Gm-Message-State: ANoB5pl46KRFHmlfgC1tIfkt6640XWj/A131HQzu8ouCZHM9XlbFKtrL
 qS2/Zbkhx3PtkoWtgnMQRkC7eB2zoU2lohG92QtAcTxzkUw21slbXuH2U0o1THZ0iGZbJRDjz4n
 PJBEK1ZFAlwGGxes=
X-Received: by 2002:a5d:6045:0:b0:242:16ad:9a91 with SMTP id
 j5-20020a5d6045000000b0024216ad9a91mr15335434wrt.197.1669971926970; 
 Fri, 02 Dec 2022 01:05:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6WJceT8QBVUD0zpPQkSfWy5DScDnZDc3La9y+xbLksGd4EzJm0mv7STAApMu247vDJZ0sbSQ==
X-Received: by 2002:a5d:6045:0:b0:242:16ad:9a91 with SMTP id
 j5-20020a5d6045000000b0024216ad9a91mr15335397wrt.197.1669971926631; 
 Fri, 02 Dec 2022 01:05:26 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-86.web.vodafone.de.
 [109.43.178.86]) by smtp.gmail.com with ESMTPSA id
 r2-20020a056000014200b002422bc69111sm8080008wrx.9.2022.12.02.01.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 01:05:26 -0800 (PST)
Message-ID: <37a20bee-a3fb-c421-b89d-c1760e77cb11@redhat.com>
Date: Fri, 2 Dec 2022 10:05:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org,
 david@redhat.com
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, cohuck@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, kvm@vger.kernel.org, ehabkost@redhat.com,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 seiden@linux.ibm.com, nrb@linux.ibm.com, scgl@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20221129174206.84882-1-pmorel@linux.ibm.com>
 <20221129174206.84882-7-pmorel@linux.ibm.com>
 <fcedb98d-4333-9100-5366-8848727528f3@redhat.com>
 <ea965d1c-ab6a-5aa3-8ce3-65b8177f6320@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v12 6/7] s390x/cpu_topology: activating CPU topology
In-Reply-To: <ea965d1c-ab6a-5aa3-8ce3-65b8177f6320@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/12/2022 12.52, Pierre Morel wrote:
> 
> 
> On 12/1/22 11:15, Thomas Huth wrote:
>> On 29/11/2022 18.42, Pierre Morel wrote:
>>> The KVM capability, KVM_CAP_S390_CPU_TOPOLOGY is used to
>>> activate the S390_FEAT_CONFIGURATION_TOPOLOGY feature and
>>> the topology facility for the guest in the case the topology
>>> is available in QEMU and in KVM.
>>>
>>> The feature is fenced for SE (secure execution).
>>
>> Out of curiosity: Why does it not work yet?
>>
>>> To allow smooth migration with old QEMU the feature is disabled by
>>> default using the CPU flag -disable-topology.
>>
>> I stared at this code for a while now, but I have to admit that I don't 
>> quite get it. Why do we need a new "disable" feature flag here? I think it 
>> is pretty much impossible to set "ctop=on" with an older version of QEMU, 
>> since it would require the QEMU to enable KVM_CAP_S390_CPU_TOPOLOGY in the 
>> kernel for this feature bit - and older versions of QEMU don't set this 
>> capability yet.
>>
>> Which scenario would fail without this disable-topology feature bit? What 
>> do I miss?
> 
> The only scenario it provides is that ctop is then disabled by default on 
> newer QEMU allowing migration between old and new QEMU for older machine 
> without changing the CPU flags.
> 
> Otherwise, we would need -ctop=off on newer QEMU to disable the topology.

Ah, it's because you added S390_FEAT_CONFIGURATION_TOPOLOGY to the default 
feature set here:

  static uint16_t default_GEN10_GA1[] = {
      S390_FEAT_EDAT,
      S390_FEAT_GROUP_MSA_EXT_2,
+    S390_FEAT_DISABLE_CPU_TOPOLOGY,
+    S390_FEAT_CONFIGURATION_TOPOLOGY,
  };

?

But what sense does it make to enable it by default, just to disable it by 
default again with the S390_FEAT_DISABLE_CPU_TOPOLOGY feature? ... sorry, I 
still don't quite get it, but maybe it's because my sinuses are quite 
clogged due to a bad cold ... so if you could elaborate again, that would be 
very appreciated!

However, looking at this from a distance, I would not rather not add this to 
any default older CPU model at all (since it also depends on the kernel to 
have this feature enabled)? Enabling it in the host model is still ok, since 
the host model is not migration safe anyway.

  Thomas


