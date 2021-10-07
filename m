Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9982424F51
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 10:33:51 +0200 (CEST)
Received: from localhost ([::1]:46728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYOqc-0003c9-Ka
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 04:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYOnO-0000V8-QV
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 04:30:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYOnI-0003L3-Tf
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 04:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633595422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n73ZjtKUTg6zPo7MIbmbXxplgJbEGVrFoNYtidJvC7c=;
 b=S7/L0BA6JG8Oa/q6xx9Nqns/1VrvUFIJtyk563o10XNDMzP/WSNDoFiAA2z1KAGyC+2AqB
 DpknN99oKhj7JRcs6dKA7cphjiNp/fBAr45q0kcUpjgFr0suMPC0ADGN7IRE0VGrbhuafq
 Py00uaPf683mW1bPAKD3kQVKLa/oXSg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-GCyzx5D2PzaEDK6js6xhjQ-1; Thu, 07 Oct 2021 04:30:21 -0400
X-MC-Unique: GCyzx5D2PzaEDK6js6xhjQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 2-20020a508e02000000b003d871759f5dso5178347edw.10
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 01:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n73ZjtKUTg6zPo7MIbmbXxplgJbEGVrFoNYtidJvC7c=;
 b=fK+0x5TXy8EHwQs44IFbeg9uXXvJALGiXlcExmSWI2oNDQ23TVQYbDmNEIAvow5kSa
 EYGFga/5m6se/MSFZZmLp73I1fPTKFnh3c+r9+FHxCWDM319kxJzrICqj/wgUk+j+j8L
 EeCeb0GcThCjV6ms6XsFyjJWNxV2X+OGDRtCr3O/J39hgkmvuEIehcj3jOvbZjmcRdKm
 1dltxx3OVIyZSoGm6NAVPEwYiHuIdD0vup5OirBMAAbxr428ZXzBJhzF3dOGuZiQ56lW
 uJgGTLeEae5Ix7nEVZcvTJo8jVQHWELfGVVHOckXktzwp9bALn0YVuThpB4t3IyZBeT9
 A9iA==
X-Gm-Message-State: AOAM532o+G9/sZR8T1+wcQeQ4xuHDszsen4egIyD8NoHpbO4xVfJg97H
 D2866rR+zQx7r0RgRIM86yR+durk8MbAKQo2vw5rNr6QhUrE2awLNil8nbFhMGuR3Gu7/PcPv/2
 3W2v/cuO8kIPQ2Mk=
X-Received: by 2002:a50:9dc4:: with SMTP id l4mr4374087edk.208.1633595420343; 
 Thu, 07 Oct 2021 01:30:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoCuMqluUHmAlUjIdIGmrnoDQYPip3XpCoNkzKGnVYj5/IugC5aAvyGOPMsLY3yFCLbZo+Yw==
X-Received: by 2002:a50:9dc4:: with SMTP id l4mr4374064edk.208.1633595420185; 
 Thu, 07 Oct 2021 01:30:20 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z8sm9895103ejd.94.2021.10.07.01.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 01:30:19 -0700 (PDT)
Message-ID: <da4821ff-892a-2de5-ce5b-e11080ef820a@redhat.com>
Date: Thu, 7 Oct 2021 10:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v12 16/16] machine: Make smp_parse return a boolean
To: "wangyanan (Y)" <wangyanan55@huawei.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <20210929025816.21076-17-wangyanan55@huawei.com>
 <0343d17f-bb46-a266-7ba4-20bdf30631d0@redhat.com>
 <YVdCRYvRHIio6MZe@redhat.com>
 <afa63e10-2999-4073-e440-a5d87fd6da49@redhat.com>
 <87bl47ll9l.fsf@dusky.pond.sub.org>
 <0c458d28-563a-1c12-3b9e-2fd86ae576a6@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <0c458d28-563a-1c12-3b9e-2fd86ae576a6@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, wanghaibin.wang@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/10/21 05:44, wangyanan (Y) wrote:
> 
> I notice that with Paolo's fix applied first and then Patch15 removing
> the sanity checks out, machine_set_smp() at last simply becomes:
> 
> static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>                              void *opaque, Error **errp)
> {
>      MachineState *ms = MACHINE(obj);
>      g_autoptr(SMPConfiguration) config = NULL;
> 
>      if (!visit_type_SMPConfiguration(v, name, &config, errp)) {
> return;
> }
> 
>      smp_parse(ms, config, errp);
> }
> 
> It looks good currently, neither the returned boolean nor the errp needs to
> be checked here now, and smp_parse is only called here. So in this case,
> we may avoid the boolean until we need to use it and honor the rule. :）

Even inlining smp_parse is a possibility now.

Paolo


