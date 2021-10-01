Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD37141F2B8
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:11:31 +0200 (CEST)
Received: from localhost ([::1]:47662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWM4F-0003aE-Lh
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mWM1t-0001DS-6Y
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:09:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mWM1p-0002J4-VD
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633108136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFYj8tMR3LV+DDeWXB2T23z8D1+YVTTqU/iTD59oPMo=;
 b=IXdt6LVfuuc4TFqAOiUUJttJpnTND2p95nZVrrF+dR0xxiefxnoeF7fy8BIcK7IC3nKkco
 NMfV9QZJxtz2u6ocanbf1jB57aamJoG98mtWukp5x9eQaX33cL7j2/ElXBkbil7Xt2AZuz
 juh/Aj2OVrH4c0gFckQHgt6cE/yCrII=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-nDzMjt88PO6WMBH76YNjfQ-1; Fri, 01 Oct 2021 13:08:55 -0400
X-MC-Unique: nDzMjt88PO6WMBH76YNjfQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 c8-20020a50d648000000b003daa53c7518so10740891edj.21
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LFYj8tMR3LV+DDeWXB2T23z8D1+YVTTqU/iTD59oPMo=;
 b=h8PUZgZK+KM/zStqjRybrRj9ZRPkGqhamblS+nPW3rY8GyU7kF/Wc28LRBfXUXlKzn
 lg8bpZrbRZoBSNqiAi5fDN8/feYdwdqPHr7akVndqgxwUwNZXBSI+xE3C4g2egq4JVvp
 XaiJn/sOWwcKLIQd7JPZB2LU579YU5sNE5nyuhq/4zlQJHhdyxHnLzxVkJ6QPYWKgT/k
 VTw8wSV8VGSYgQ3cFtLHKPmrOJacxf5C81mPeGwul4ThUndTyC31As9Am3WZXLklulO0
 6JJEeHCdhLesVqmsRlA+BPKi7/rVQDKedg4fTYT4eTJVXqisga4DeEgu/LVQp//M8PGf
 80mA==
X-Gm-Message-State: AOAM53108fxYvEm8aDK11x14ExvbToyOoRh15Gd0wDYIxwMAnzGor5kW
 E5t+G5huBJT8tYfVXzqhg6+dNhLQ/v+TMihSLOJGF6d6hMRDdwqXMwweS3gxFCsIljC4Co51OoP
 8hJd2/csCHrjXE4k=
X-Received: by 2002:aa7:d99a:: with SMTP id u26mr15539475eds.320.1633108134422; 
 Fri, 01 Oct 2021 10:08:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqtzPx6FJ3K9MNh1XEom+uV30uA713FZIMoOL0VNlYexJLd3H60ClJKdz4TImi3hfngks4Dw==
X-Received: by 2002:aa7:d99a:: with SMTP id u26mr15539425eds.320.1633108134061; 
 Fri, 01 Oct 2021 10:08:54 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id s15sm3516327edu.91.2021.10.01.10.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 10:08:53 -0700 (PDT)
Message-ID: <0343d17f-bb46-a266-7ba4-20bdf30631d0@redhat.com>
Date: Fri, 1 Oct 2021 19:08:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v12 16/16] machine: Make smp_parse return a boolean
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <20210929025816.21076-17-wangyanan55@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210929025816.21076-17-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/09/21 04:58, Yanan Wang wrote:
> @@ -933,8 +935,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>           return;
>       }
>   
> -    smp_parse(ms, config, errp);
> -    if (*errp) {
> +    if (!smp_parse(ms, config, errp)) {
>           qapi_free_SMPConfiguration(config);
>       }
>   }
> 

This is actually a leak, so I'm replacing this patch with

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

which removes the need.

Paolo


