Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AC96658A2
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 11:11:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFY3p-0008C8-MC; Wed, 11 Jan 2023 05:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFY3Z-0008BO-Dd
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:10:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFY3X-0003LL-Rx
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:10:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673431803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgAIilrzXCmhW589ew6P3EryZK4P7T++tZG8TP6MYqg=;
 b=YSpviTYnxim3dRmNvNNwZu2E0cQJ35LQYr8ddBpzHVIx1nraKxKCDOQDAuWxPJtyQSEftv
 L9BjFMdzIK0a8YFTyzChMb6EFmH3n/386/2+SuYcrXkkWSH+bLWiBwtWupCSVwJ/5IM5U3
 I783eMVQjQECq3y9hlgYj89NX00Vzio=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-uMuImZYyMzyKDLamahQSEw-1; Wed, 11 Jan 2023 05:10:01 -0500
X-MC-Unique: uMuImZYyMzyKDLamahQSEw-1
Received: by mail-qk1-f198.google.com with SMTP id
 bl3-20020a05620a1a8300b0070240ff36a0so10667877qkb.19
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 02:10:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cgAIilrzXCmhW589ew6P3EryZK4P7T++tZG8TP6MYqg=;
 b=SA4OhNhMYOe3TnoVPQps3Ngleqp7fco7I6zvJgJKvSJ1PmO4HxmCxL3rXUDOF3Z+l4
 8W14y7C984IwTeh9G8Fjn4ZLL4GDdLT/Dkuq3gRmmrRzlyojRO7IOCoGFWFYHILdprmE
 OMVOPwunapbTrZMHJ8di6cbtPOi6DneCwqJ7idDLMWWbnIfZXFp3Y7VNvg689g67rXK2
 /DWEjqIPPjI3FTljBCGE8LZ2Hw2i3oZnxPds5Kr+095VJu0HhB+5kGU4D/swhpvVVAOY
 jmMenx7DwY8U4HYwh/hkvcxuF3xBnPsYXhTUOq2rhVhmfjuEjuOjd+HWMHKEVSfUQuv/
 IuUQ==
X-Gm-Message-State: AFqh2kqQtQ1VDARq9o3/KERwbVIKrvIQfnf2cvGNSrabrbxWQdUxTSl0
 PIMVGBhUbDKWSW76NyJHMTRfAFHTrhPkIZ4umja43imTV/VukLeyS2zO6ljwoVVhJZZURhLMqrr
 EvAX36EHgJRUQGc0=
X-Received: by 2002:ac8:5247:0:b0:3ad:197b:3cab with SMTP id
 y7-20020ac85247000000b003ad197b3cabmr14933115qtn.38.1673431801331; 
 Wed, 11 Jan 2023 02:10:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsHLuaZ8+H3PYyz71FQ5kzq/WKSy/DxU8he4MkNygDXal96MqMw/K+YfgribeC4WfAiDRujMw==
X-Received: by 2002:ac8:5247:0:b0:3ad:197b:3cab with SMTP id
 y7-20020ac85247000000b003ad197b3cabmr14933084qtn.38.1673431801094; 
 Wed, 11 Jan 2023 02:10:01 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-91.web.vodafone.de.
 [109.43.176.91]) by smtp.gmail.com with ESMTPSA id
 y2-20020a05620a44c200b006f87d28ea3asm8696546qkp.54.2023.01.11.02.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:10:00 -0800 (PST)
Message-ID: <999a31e0-56f4-6d14-f264-320f51f259af@redhat.com>
Date: Wed, 11 Jan 2023 11:09:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v14 08/11] qapi/s390/cpu topology: change-topology monitor
 command
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-9-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230105145313.168489-9-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 05/01/2023 15.53, Pierre Morel wrote:
> The modification of the CPU attributes are done through a monitor
> commands.

s/commands/command/

> It allows to move the core inside the topology tree to optimise
> the cache usage in the case the host's hypervizor previously

s/hypervizor/hypervisor/

> moved the CPU.
> 
> The same command allows to modifiy the CPU attributes modifiers

s/modifiy/modify/

> like polarization entitlement and the dedicated attribute to notify
> the guest if the host admin modified scheduling or dedication of a vCPU.
> 
> With this knowledge the guest has the possibility to optimize the
> usage of the vCPUs.

Hmm, who is supposed to call this QMP command in the future? Will there be a 
new daemon monitoring the CPU changes in the host? Or will there be a 
libvirt addition for this? ... Seems like I still miss the big picture here...

  Thomas


