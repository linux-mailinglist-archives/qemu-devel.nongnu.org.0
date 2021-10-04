Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5174207A7
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:58:00 +0200 (CEST)
Received: from localhost ([::1]:48354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJnL-0000gt-PT
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJTM-00082x-SH
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:37:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJTK-0002n3-SZ
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633336637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9AherXXR3M0AsNEDdWKDkZ9tr7g0wobdbgE8ijvuKrc=;
 b=YwrfJliaIl/e8DJ3w78OqTNfm4K9W/cIvAvmNuUzlX2/Xuq7JFQqUtzkGa6yZBOGYZC9eA
 wKZ8RVDB0IHh5B4WSpMugoHjIs8HK94VxWpeaxMIRasnsKYITB8FkDIVsRLQqcK7oT5gxS
 S2HzNBtXe1ZgrJaFwifDVXO/AzMo2Ug=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-0AIhgyVoOEePLB2DcQGZsQ-1; Mon, 04 Oct 2021 04:37:16 -0400
X-MC-Unique: 0AIhgyVoOEePLB2DcQGZsQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 y15-20020a50ce0f000000b003dab997cf7dso12921086edi.9
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9AherXXR3M0AsNEDdWKDkZ9tr7g0wobdbgE8ijvuKrc=;
 b=asqxZq6dFk5bTQuU/JrkFK8/T08dRuyzYbPzy+gm5C76nOsCDGdUAIIF7fzhYKpqvi
 3TOgGoI9pkUJUVgiN8E7EeuLa7+80GaD67FhKFOmElrm2STW2wdJKl6wy9QbuNmK3ZoZ
 A8F1RoVARX13aqAXWKOLHHdB7rr43UlDA/fngZObs62XRyeMwmcS60A1WfgIX1MjBi5c
 9XfPetbt1I1mZvwJFseMY5f8A9bKB1ZVyc6ROa96B/HPYl/l+GF8GIDK9IinR5K0GhKa
 v4QUzPYrU5SU0BjAnk0rHUYLekI2GvDNAkM4/B7RL7uBX6Fj/lLYgPCDNFxs4R2Y3K81
 vgpQ==
X-Gm-Message-State: AOAM531gH8cKgOVuFqhjiknTCyZR81YtW0bAhO5E/mPFyqp5xBhMnKwf
 r++xBiQ847R8yp+wniBJpAoLu0DyzQMR7NBv5bTAGWW6eU7VJVGpbSQ51dqLJAu4pLS512MuAm5
 eoC1p3gx2IDsaCaU=
X-Received: by 2002:aa7:d802:: with SMTP id v2mr13204343edq.271.1633336635722; 
 Mon, 04 Oct 2021 01:37:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXib1I74rAVDkPL99QZYlYGeRKrNzCkyo97joQCbM7x3dKjh6PW5lHNRBZ+5fugBz+fWDipQ==
X-Received: by 2002:aa7:d802:: with SMTP id v2mr13204316edq.271.1633336635507; 
 Mon, 04 Oct 2021 01:37:15 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dn10sm6777909edb.84.2021.10.04.01.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:37:15 -0700 (PDT)
Message-ID: <1cc980de-cf9e-b579-9d23-ea46bc9f551c@redhat.com>
Date: Mon, 4 Oct 2021 10:37:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hw/misc: applesmc: use host osk as default on macs
To: =?UTF-8?Q?Pedro_To=cc=82rres?= <t0rr3sp3dr0@gmail.com>,
 qemu-devel@nongnu.org
References: <4E271071-0799-4948-A445-134E7FAAD48D@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <4E271071-0799-4948-A445-134E7FAAD48D@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: phil@philjordan.eu, rene@exactcode.de, jan.kiszka@siemens.com,
 agraf@suse.de, f4bug@amsat.org, gsomlo@gmail.com, suse@csgraf.de,
 afaerber@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/21 22:24, Pedro Tôrres wrote:
> #define APPLESMC_DEFAULT_IOBASE        0x300
> @@ -332,7 +497,27 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
>                          s->iobase + APPLESMC_ERR_PORT);
> 
>      if (!s->osk || (strlen(s->osk) != 64)) {
> +#if defined(__APPLE__) && defined(__MACH__)
> +        IOReturn ret;
> +        IOByteCount size = 32;
> +
> +        ret = smc_read_key('OSK0', (uint8_t *) default_osk, &size);
> +        if (ret != kIOReturnSuccess) {
> +            goto failure;
> +        }
> +
> +        ret = smc_read_key('OSK1', (uint8_t *) default_osk + size, &size);
> +        if (ret != kIOReturnSuccess) {
> +            goto failure;
> +        }
> +
> +        warn_report("Using AppleSMC with host key");
> +        goto success;
> +#endif
> +failure:
>          warn_report("Using AppleSMC with invalid key");
> +
> +success:
>          s->osk = default_osk;
>      }
> 
> -- 

I think it is incorrect to use host key if strlen(s->osk) != 64.  So I
would change this code to something like this:

@@ -315,6 +480,7 @@ static const MemoryRegionOps applesmc_err_io_ops = {
  static void applesmc_isa_realize(DeviceState *dev, Error **errp)
  {
      AppleSMCState *s = APPLE_SMC(dev);
+    bool valid_key = false;
  
      memory_region_init_io(&s->io_data, OBJECT(s), &applesmc_data_io_ops, s,
                            "applesmc-data", 1);
@@ -331,7 +497,31 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
      isa_register_ioport(&s->parent_obj, &s->io_err,
                          s->iobase + APPLESMC_ERR_PORT);
  
-    if (!s->osk || (strlen(s->osk) != 64)) {
+    if (s->osk) {
+        valid_key = strlen(s->osk) == 64;
+    } else {
+#if defined(__APPLE__) && defined(__MACH__)
+        IOReturn ret;
+        IOByteCount size = 32;
+
+        ret = smc_read_key('OSK0', (uint8_t *) default_osk, &size);
+        if (ret != kIOReturnSuccess) {
+            goto failure;
+        }
+
+        ret = smc_read_key('OSK1', (uint8_t *) default_osk + size, &size);
+        if (ret != kIOReturnSuccess) {
+            goto failure;
+        }
+
+        warn_report("Using AppleSMC with host key");
+        valid_key = true;
+        s->osk = default_osk;
+failure:
+#endif
+    }
+
+    if (!valid_key) {
          warn_report("Using AppleSMC with invalid key");
          s->osk = default_osk;
      }

Otherwise looks good, so I queued it (haven't yet compile-tested it, but I
will before sending out my pull request).

Thanks,

Paolo


