Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327CF7027B4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:58:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyU1g-0005wb-Sq; Mon, 15 May 2023 04:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyU1d-0005qJ-M1
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:57:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyU1b-0006rg-UO
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684141066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+spIdfM7adVFfTpjTGqsknjyFAplDWUobVosj2lT5yY=;
 b=LREgbB6FIjXxhmvZ8dr8Vx7QAgLA6RF5MpKL2GGeI+ElytL/B6KLqKp1gG8XLqKyb0HB+4
 oNUuW5nLGv3Zxuz4Kl3j9dxEafmqtJzHt9PX9Qu4POWPNtyz89tm4v4oW06h7m94T8Pk25
 xALjKg3hEfXo0JsegGKuzg5/cONz3zU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-8xIofdhKOXOrYrtOkpKydQ-1; Mon, 15 May 2023 04:57:45 -0400
X-MC-Unique: 8xIofdhKOXOrYrtOkpKydQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-306281812d6so4855496f8f.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 01:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684141064; x=1686733064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+spIdfM7adVFfTpjTGqsknjyFAplDWUobVosj2lT5yY=;
 b=M8LRHLozad+Nol80AwizF3hIHVYbsHBgbfhERxpHSnAMVlR9FlNChF9WCAfJie53C6
 hX7bkKLxg0OwTrrW+zotyacdDnFMuR5VHSno9wki2Eu5bAS/V2iVg0AKIBVPkue8HLEj
 aoM/rNbk6GFNwd+PKxQQWbQ71B1pOLtqo2qBtznII+lKgyzYXsArHO2pfY6IThGXWWb/
 MLA2KR+EV4eUSV31uyVvTcY/xeemZ9jtX3SHl+Z43BMwtlIXi/skGp1sp+IK0rk6n9W3
 pUbO+gGNx94Qb9cnmKGNAGYTiyUolhWspve6XsPOD0kz7ccYe6nkK/wp6sPIW7qJyxjI
 mKjg==
X-Gm-Message-State: AC+VfDwXxeg6qCiWTwNEag6oV4Q/3R2YGhvoUqIY+Tva4iuYV6w18hgL
 ch4K2izPC0T2wZF2C20NBT695OnaTOORIvXvfPvkq8vbrYhYyO6cFSRr6fwwbHS+YuvS1u2M192
 sClj2dsL5AvPXSlY=
X-Received: by 2002:a05:6000:1b8f:b0:306:2b31:5935 with SMTP id
 r15-20020a0560001b8f00b003062b315935mr18915990wru.55.1684141064420; 
 Mon, 15 May 2023 01:57:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5we4wTnQIpy03l249dp7ymqfebZqT4LfwsOIJcuLd1SK87+8Xu/txBkiKZ8jAxBcAONN9t/A==
X-Received: by 2002:a05:6000:1b8f:b0:306:2b31:5935 with SMTP id
 r15-20020a0560001b8f00b003062b315935mr18915981wru.55.1684141064091; 
 Mon, 15 May 2023 01:57:44 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-139.web.vodafone.de.
 [109.43.176.139]) by smtp.gmail.com with ESMTPSA id
 s18-20020a5d4252000000b00304aba2cfcbsm32043525wrr.7.2023.05.15.01.57.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 01:57:43 -0700 (PDT)
Message-ID: <abd7ff41-ce60-26e6-a863-cf656ae875b2@redhat.com>
Date: Mon, 15 May 2023 10:57:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/1] s390x/pv: Fix spurious warning with asynchronous
 teardown
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, borntraeger@de.ibm.com, nsg@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, pasic@linux.ibm.com,
 mhartmay@linux.ibm.com
References: <20230510105531.30623-1-imbrenda@linux.ibm.com>
 <20230510105531.30623-2-imbrenda@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230510105531.30623-2-imbrenda@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.93, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 10/05/2023 12.55, Claudio Imbrenda wrote:
> Kernel commit 292a7d6fca33 ("KVM: s390: pv: fix asynchronous teardown
> for small VMs") causes the KVM_PV_ASYNC_CLEANUP_PREPARE ioctl to fail
> if the VM is not larger than 2GiB. QEMU would attempt it and fail,
> print an error message, and then proceed with a normal teardown.
> 
> Avoid attempting to use asynchronous teardown altogether when the VM is
> not larger than 2 GiB. This will avoid triggering the error message and
> also avoid pointless overhead; normal teardown is fast enough for small
> VMs.
> 
> Reported-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> Fixes: c3a073c610 ("s390x/pv: Add support for asynchronous teardown for reboot")
> Link: https://lore.kernel.org/all/20230421085036.52511-2-imbrenda@linux.ibm.com/
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
...
> diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
> index 966306a9db..6766557fb7 100644
> --- a/include/hw/s390x/pv.h
> +++ b/include/hw/s390x/pv.h
> @@ -41,7 +41,7 @@ static inline bool s390_is_pv(void)
>   int s390_pv_query_info(void);
>   int s390_pv_vm_enable(void);
>   void s390_pv_vm_disable(void);
> -bool s390_pv_vm_try_disable_async(void);
> +bool s390_pv_vm_try_disable_async(S390CcwMachineState *ms);
>   int s390_pv_set_sec_parms(uint64_t origin, uint64_t length);
>   int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak);
>   void s390_pv_prep_reset(void);

I'll squash this on top to fix a build failure on non-s390x host systems:

diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
--- a/include/hw/s390x/pv.h
+++ b/include/hw/s390x/pv.h
@@ -61,7 +61,7 @@ static inline bool s390_is_pv(void) { return false; }
  static inline int s390_pv_query_info(void) { return 0; }
  static inline int s390_pv_vm_enable(void) { return 0; }
  static inline void s390_pv_vm_disable(void) {}
-static inline bool s390_pv_vm_try_disable_async(void) { return false; }
+static inline bool s390_pv_vm_try_disable_async(S390CcwMachineState *ms) { return false; }
  static inline int s390_pv_set_sec_parms(uint64_t origin, uint64_t length) { return 0; }
  static inline int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak) { return 0; }
  static inline void s390_pv_prep_reset(void) {}

  Thomas


