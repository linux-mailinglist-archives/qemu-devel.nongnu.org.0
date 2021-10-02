Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A18441FA25
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 08:43:08 +0200 (CEST)
Received: from localhost ([::1]:51050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWYjj-0005iA-KK
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 02:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mWYi2-0004SD-Eq
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 02:41:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mWYhy-0003vW-PU
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 02:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633156877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3YwzyCfrWdbxV2jLlz9OuKZz7WRdWtIr5Uc/2COSU0=;
 b=I83KwTrWFxQ+g7uKSXg+aqlar7Uk0EHzC0PGCy3ooV8Bnb/VsnF7mC3ZvYACSYaIm/vvg+
 Zej+Kus1tczxL+uCyq3uO14jQOIaMejSvzeJc2knyrTwoOY4qGMW3+M0QNwTwR1RhPaoWW
 EX80c8GdrNSMBoZzFQgwqzORRMvrv88=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-8CnzhfKTNpefzxqN4XkojQ-1; Sat, 02 Oct 2021 02:41:15 -0400
X-MC-Unique: 8CnzhfKTNpefzxqN4XkojQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 2-20020a508e02000000b003d871759f5dso12438457edw.10
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 23:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k3YwzyCfrWdbxV2jLlz9OuKZz7WRdWtIr5Uc/2COSU0=;
 b=yGRdeEpZODrMiJ1bmxMn7fBPlAYNuXoJhwcTuWelS+eju+21pi7qvtXhczOlQL3pr3
 h4VJQ+vaWqJh6LpMe0zXCGFij5EbG21BYnlNCxYtB4h6vPOu8kvqYnzrn8QNLB8eJaG3
 cnuLzgQ4gdQBgZ3ggpU0J1borCjgTt/QWphzox953zxm6ygZB7IsQwz4NDBKjTJzLSFt
 FlLeQAi12MVCYfmp4+Y3KbPk3DInmccebYxpXmlIHesSef2OmRrfJil3n6ARne9Dh9wu
 UZdim6tAlwlKRga8Ry9SPQrZF6/f/7qpe/OGiynY5RuFWC20/054kbjysQSp91jzThEl
 m3WQ==
X-Gm-Message-State: AOAM531JtmdSdBhkTvRl7Y7KrdNvpklXrua006EXzvHxuhcvJ7hpiof3
 XxPF9OzXR+i47gEN8hfGLLPUzz7RUtK6EZeSisNFBdLcThYZ2tOs9ErqU5an6DEz5GD50Fcphqy
 vs+YbOfQCKd2vzJI=
X-Received: by 2002:a17:906:aad9:: with SMTP id
 kt25mr2494528ejb.516.1633156874497; 
 Fri, 01 Oct 2021 23:41:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy/wRufJq2rNJbw84V6fTp/EOIA9DQeQWdlXxVpkihutUSBRsNQJU/lQlUGMSE4o2lQArvfw==
X-Received: by 2002:a17:906:aad9:: with SMTP id
 kt25mr2494512ejb.516.1633156874311; 
 Fri, 01 Oct 2021 23:41:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id k19sm1175977ejg.13.2021.10.01.23.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 23:41:13 -0700 (PDT)
Message-ID: <afa63e10-2999-4073-e440-a5d87fd6da49@redhat.com>
Date: Sat, 2 Oct 2021 08:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v12 16/16] machine: Make smp_parse return a boolean
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <20210929025816.21076-17-wangyanan55@huawei.com>
 <0343d17f-bb46-a266-7ba4-20bdf30631d0@redhat.com>
 <YVdCRYvRHIio6MZe@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YVdCRYvRHIio6MZe@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.127, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, wanghaibin.wang@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/10/21 19:15, Daniel P. Berrangé wrote:
> On Fri, Oct 01, 2021 at 07:08:51PM +0200, Paolo Bonzini wrote:
>> On 29/09/21 04:58, Yanan Wang wrote:
>>> @@ -933,8 +935,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>>>            return;
>>>        }
>>> -    smp_parse(ms, config, errp);
>>> -    if (*errp) {
>>> +    if (!smp_parse(ms, config, errp)) {
>>>            qapi_free_SMPConfiguration(config);
>>>        }
>>>    }
>>>
>>
>> This is actually a leak, so I'm replacing this patch with
> 
> This patch isn't adding a leak, as there's no change in
> control flow / exit paths.  AFAICT, the leak was introduced
> in patch 15 instead, so the code below shoudl be squashed
> into that, and this patch left as-is.

Yes, even better make it a separate patch and fix the conflict in patch
15.  But I'm still not sure of the wisdom of this patch.

At this point smp_parse has exactly one caller and it doesn't care about
the return value.  The "return a boolean" rule adds some complexity (and
a possibility for things to be wrong/inconsistent) to the function for
the benefit of the callers.  If there is only one caller, as is the case
here or for virtual functions, the benefit can well be zero (this case)
or negative (virtual functions).

Paolo

---------------- 8< ----------------
 From e7f944bb94a375e8ee7469ffa535ea6e11ce59e1 Mon Sep 17 00:00:00 2001
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 1 Oct 2021 19:04:03 +0200
Subject: [PATCH] machine: Use g_autoptr in machine_set_smp

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
  hw/core/machine.c | 7 ++-----
  1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 54f04a5ac6..d49ebc24e2 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -897,7 +897,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
  {
      MachineClass *mc = MACHINE_GET_CLASS(obj);
      MachineState *ms = MACHINE(obj);
-    SMPConfiguration *config;
+    g_autoptr(SMPConfiguration) config = NULL;
      ERRP_GUARD();
  
      if (!visit_type_SMPConfiguration(v, name, &config, errp)) {
@@ -920,7 +920,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
  
      smp_parse(ms, config, errp);
      if (*errp) {
-        goto out_free;
+        return;
      }
  
      /* sanity-check smp_cpus and max_cpus against mc */
@@ -935,9 +935,6 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
                     ms->smp.max_cpus,
                     mc->name, mc->max_cpus);
      }
-
-out_free:
-    qapi_free_SMPConfiguration(config);
  }
  
  static void machine_class_init(ObjectClass *oc, void *data)
-- 
2.31.1


