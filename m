Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386896482D0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 14:34:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3dUr-0002Vk-Sy; Fri, 09 Dec 2022 08:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3dUh-0002V3-Rn
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:32:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3dUf-0004FH-BE
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:32:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670592767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fN0W6rkQk+OsPoOfSXi6YU0PA5r8oMFk7Ig9SLybsGo=;
 b=C/TW4FiIt39nKi9FZ5HyHphKRSlIX1pAOAuql4+K7lfNQMgLCq8Oih3dQQiZLsTaypxcLz
 2JGx2BbbFy+esB4QUq/FzHtF9RAW9xSzBnoW00UAv5P500j1ma6div3AACAgUJZxgeLcfJ
 EwK0fmdM5fRmimnUAtquSCCTaVLUuTk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-JuNtX5mUNt290PBCCS-xwQ-1; Fri, 09 Dec 2022 08:32:46 -0500
X-MC-Unique: JuNtX5mUNt290PBCCS-xwQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 f1-20020a1cc901000000b003cf703a4f08so1790692wmb.2
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 05:32:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fN0W6rkQk+OsPoOfSXi6YU0PA5r8oMFk7Ig9SLybsGo=;
 b=BwupdHx4cIRqR7vzhgsaxNcFThsLW08C6KAealpCwzBZ9QzJEF0W3i4FFWSFRhm4KW
 UphJqhDJFj1iZAPgFaKcxdLf3UwKO5epcUDa/ljLNcKQIQTuyMBKQs5m8hzUzY6PyE/M
 GhGX40TIkOvMvy6bI4wK5M8tx5leitTyR5nxRupK5p8A/ShEri2QU8no22aUuYAW44X3
 7CvK7FbvEJ8xpHw062AVXZVCEsL7Wb7Dllc0sD1GhiBupeseimkGjtWf7d53Gey7qsu3
 gt1GUl6/qjq68hGWL8ytfac00+5Pqll3lxhUJw6PCCjUO4eERItrMN1RiJxU+7nf1Wcv
 y7KA==
X-Gm-Message-State: ANoB5plzrTZA1+rJb3QMZGh3ZYlNX2zK7l19iOXe0skh7azNZta16JES
 6khBCHrl1niS7hrRZ44B8vkEcb1obtRvXNVd5rS3Yh1ZaKhjWkuRijs/6p1gERCijhqsEi3uvbP
 2IjUUTaTwNUsOZEc=
X-Received: by 2002:a05:600c:1c25:b0:3d0:a768:a702 with SMTP id
 j37-20020a05600c1c2500b003d0a768a702mr4808224wms.19.1670592765552; 
 Fri, 09 Dec 2022 05:32:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6MBoJ9GIUijgF53IGcMK4J8y9Qyu2MkufGppWNNfHqz6d/PEbSQPJQWVByvfpt5rFTA4kzaQ==
X-Received: by 2002:a05:600c:1c25:b0:3d0:a768:a702 with SMTP id
 j37-20020a05600c1c2500b003d0a768a702mr4808188wms.19.1670592765228; 
 Fri, 09 Dec 2022 05:32:45 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-15.web.vodafone.de.
 [109.43.177.15]) by smtp.gmail.com with ESMTPSA id
 k7-20020a1ca107000000b003b95ed78275sm1743667wme.20.2022.12.09.05.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 05:32:44 -0800 (PST)
Message-ID: <8c0777d2-7b70-51ce-e64a-6aff5bdea8ae@redhat.com>
Date: Fri, 9 Dec 2022 14:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v13 0/7] s390x: CPU Topology
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20221208094432.9732-1-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221208094432.9732-1-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.288, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 08/12/2022 10.44, Pierre Morel wrote:
> Hi,
> 
> Implementation discussions
> ==========================
> 
> CPU models
> ----------
> 
> Since the S390_FEAT_CONFIGURATION_TOPOLOGY is already in the CPU model
> for old QEMU we could not activate it as usual from KVM but needed
> a KVM capability: KVM_CAP_S390_CPU_TOPOLOGY.
> Checking and enabling this capability enables
> S390_FEAT_CONFIGURATION_TOPOLOGY.
> 
> Migration
> ---------
> 
> Once the S390_FEAT_CONFIGURATION_TOPOLOGY is enabled in the source
> host the STFL(11) is provided to the guest.
> Since the feature is already in the CPU model of older QEMU,
> a migration from a new QEMU enabling the topology to an old QEMU
> will keep STFL(11) enabled making the guest get an exception for
> illegal operation as soon as it uses the PTF instruction.

I now thought that it is not possible to enable "ctop" on older QEMUs since 
the don't enable the KVM capability? ... or is it still somehow possible? 
What did I miss?

  Thomas


> A VMState keeping track of the S390_FEAT_CONFIGURATION_TOPOLOGY
> allows to forbid the migration in such a case.
> 
> Note that the VMState will be used to hold information on the
> topology once we implement topology change for a running guest.


