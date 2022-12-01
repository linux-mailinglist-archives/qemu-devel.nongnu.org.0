Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F17663ED6D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 11:17:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0gbt-0001YY-Kt; Thu, 01 Dec 2022 05:16:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0gbq-0001XL-S5
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:16:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0gbo-0003up-Tt
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:16:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669889759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e9qA4VHIN82/Ab8wC5piRWKy3zE/49XyOR+31yHpXyI=;
 b=XRsP1j0JdHXoBnSuRDoL4lxr+QTzglIyxb2SjgLqQlFUTriaD38KhHpqQMBl82TIaAXbo0
 EDciKITO2Mm/kvDcIhRVrNAVZxeJt3KxZ2zZD/gX9shJ7EICc6Sh49j2KSyrF3Hv/9Zwv7
 333bJM54SWHTnSpX1FdotgO6u57GP18=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-350-yX6Z0mFIM6G-x3KQ8XPA0g-1; Thu, 01 Dec 2022 05:15:58 -0500
X-MC-Unique: yX6Z0mFIM6G-x3KQ8XPA0g-1
Received: by mail-wm1-f69.google.com with SMTP id
 o5-20020a05600c510500b003cfca1a327fso638006wms.8
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 02:15:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e9qA4VHIN82/Ab8wC5piRWKy3zE/49XyOR+31yHpXyI=;
 b=oyxSE4ElaIoBcBRt7Dx3oa1h3Ffinf/mChn6SMy8ZkAIVgXy5KUcYEH3DQDk20A8zy
 JRXsWyiiMjJCO6QflET0Qf3f+7okr3TJ/R4dGlKK8laCEUuuAiFrvgdymAggLIKNpwt5
 NiXQoq6/HmfAchEgEGwkh/pec0KbiASTD1YpDshUcYKydI/JFezbXaIzQczwzEAfBJoi
 GtBlwvIGx2hkVIRs5wcSuZ46+gRRb+btOFKbSl8MWP2O17PktNmqYvTtElhGvBAi+k0m
 /eUmUg/RfLJQkRuDj52UmL4ohPoIoYkD1fR8SabGjLpxQPg5B/EO0KSl6oSLloi8gapa
 YJQg==
X-Gm-Message-State: ANoB5plpus5uuL/jmC7+PM/ifnfRA/2RlD83hOfogo8ft2WRzQikRPdF
 GBrbayGM2dOfADnlf+urqKitFQXHX1W4fq/BwvifxT88EMqq8SqYeqhQoW9ZBPRUT1ntQsHDih0
 qqErpGaxTzDHEom8=
X-Received: by 2002:a05:600c:34d3:b0:3cf:a7a8:b712 with SMTP id
 d19-20020a05600c34d300b003cfa7a8b712mr34056474wmq.124.1669889757070; 
 Thu, 01 Dec 2022 02:15:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5SlmLRPzdxlyszVN8pGU01bp/jRPMDL3XBjakBkWtVRvdrvZ6Zw9bnrQwCp62f8f56RICv0g==
X-Received: by 2002:a05:600c:34d3:b0:3cf:a7a8:b712 with SMTP id
 d19-20020a05600c34d300b003cfa7a8b712mr34056432wmq.124.1669889756774; 
 Thu, 01 Dec 2022 02:15:56 -0800 (PST)
Received: from [192.168.8.102] (tmo-073-221.customers.d1-online.com.
 [80.187.73.221]) by smtp.gmail.com with ESMTPSA id
 e4-20020adff344000000b00236488f62d6sm4183014wrp.79.2022.12.01.02.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 02:15:56 -0800 (PST)
Message-ID: <fcedb98d-4333-9100-5366-8848727528f3@redhat.com>
Date: Thu, 1 Dec 2022 11:15:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20221129174206.84882-1-pmorel@linux.ibm.com>
 <20221129174206.84882-7-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v12 6/7] s390x/cpu_topology: activating CPU topology
In-Reply-To: <20221129174206.84882-7-pmorel@linux.ibm.com>
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

On 29/11/2022 18.42, Pierre Morel wrote:
> The KVM capability, KVM_CAP_S390_CPU_TOPOLOGY is used to
> activate the S390_FEAT_CONFIGURATION_TOPOLOGY feature and
> the topology facility for the guest in the case the topology
> is available in QEMU and in KVM.
> 
> The feature is fenced for SE (secure execution).

Out of curiosity: Why does it not work yet?

> To allow smooth migration with old QEMU the feature is disabled by
> default using the CPU flag -disable-topology.

I stared at this code for a while now, but I have to admit that I don't 
quite get it. Why do we need a new "disable" feature flag here? I think it 
is pretty much impossible to set "ctop=on" with an older version of QEMU, 
since it would require the QEMU to enable KVM_CAP_S390_CPU_TOPOLOGY in the 
kernel for this feature bit - and older versions of QEMU don't set this 
capability yet.

Which scenario would fail without this disable-topology feature bit? What do 
I miss?

> Making the S390_FEAT_CONFIGURATION_TOPOLOGY belonging to the
> default features makes the -ctop CPU flag is no more necessary,

too many verbs in this sentence ;-)

> turning the topology feature on is done with -disable-topology
> only.
...

  Thomas



