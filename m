Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3F36F026C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:18:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwpC-0006aM-Ny; Thu, 27 Apr 2023 04:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prwp8-0006Zl-LA
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:17:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prwp2-0007lN-Id
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682583466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XANpfYL3eIPAk1eeS6Vmi90EzxLHXhcMqTqYhiXJQPU=;
 b=Xefo2M8ckIe9VC7V9JGTzRLHHqrReI+eoQXlm1yQVMZQ/6L/8g2V0PvCx7oFXJMXarpunb
 FGObUJXP2nVDNgqLxxcB3ofy2Y02vbNJCoc464EPeLL3OqJfBtWAB9VTj8FJvUphvoSr4f
 8XIh71ln4q3K7v37AWLFc/ce4r39gP8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-FmPsIOwuO2SaVDlf9ofDvQ-1; Thu, 27 Apr 2023 04:17:45 -0400
X-MC-Unique: FmPsIOwuO2SaVDlf9ofDvQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30479b764f9so1738003f8f.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 01:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682583464; x=1685175464;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XANpfYL3eIPAk1eeS6Vmi90EzxLHXhcMqTqYhiXJQPU=;
 b=ZcPrF9V9fUrIgcT8pBlqco0XG/lAT1c//0TInmB1xvsQVfYxGIHJFzSuUHJD6tIdFZ
 76axK1J9fSLOqIIsfFiyokuXTWFgRj8LO5wkk/eciNBE9qi8i86JlbhwQd5kXUdxVmTe
 vj6WBRMBCaghPLiwPCIX2bpiMsEDdizLNMQvQJgMeVRzAhzF/jGIXNKfCQtEAz7+9cQ+
 5KmrjdCloiqV5lOyiPIRI1S77sfN4T8LlS7R438oDOHdU2z9NUNm2ApRROlVuudfu7oB
 Pa8A0x/O05ggvZuVQwJ1ORgtVrMKIbadF/PvEv9T01zd5MH9Q56IvKn5LL+jF3M87EDX
 eayw==
X-Gm-Message-State: AC+VfDwkHbiUr3C+hmehjvPdNKAXoMUCRAPcae6atTwhvKQvIFris4lN
 HPIoBP9NDi97YbjslwN71kueHoLWflLqaOeujaQ+3BCzVQkPvDnCFmhXEqholTaVAkbnf6g5KCb
 xogVCHrCXtqhVTUQ=
X-Received: by 2002:adf:e6d2:0:b0:2fa:1c3b:ca51 with SMTP id
 y18-20020adfe6d2000000b002fa1c3bca51mr640270wrm.71.1682583463976; 
 Thu, 27 Apr 2023 01:17:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ46g63pcSLtnRl+42gqLAN0PpDM/Mm6ShmCrFyhibcuma7BKtuDchwaLIo0YOfRMXUsorDqaQ==
X-Received: by 2002:adf:e6d2:0:b0:2fa:1c3b:ca51 with SMTP id
 y18-20020adfe6d2000000b002fa1c3bca51mr640254wrm.71.1682583463665; 
 Thu, 27 Apr 2023 01:17:43 -0700 (PDT)
Received: from [10.32.181.74] (nat-pool-mxp-t.redhat.com. [149.6.153.186])
 by smtp.googlemail.com with ESMTPSA id
 y11-20020adfe6cb000000b002f81b4227cesm17963386wrm.19.2023.04.27.01.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 01:17:43 -0700 (PDT)
Message-ID: <8124b04e-b9ca-b52c-6177-1aebdd0f9204@redhat.com>
Date: Thu, 27 Apr 2023 10:17:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 1/2] migration: Make dirty_pages_rate atomic
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230426201002.15414-1-quintela@redhat.com>
 <20230426201002.15414-2-quintela@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230426201002.15414-2-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 4/26/23 22:10, Juan Quintela wrote:
> In this case we use qatomic operations instead of Stat64 wrapper
> because there is no stat64_set().  Defining the 64 bit wrapper is
> trivial. The one without atomics is more interesting.

This does not work if CONFIG_ATOMIC64 is not defined.

I actually have stat64_set in a patchset that I still have to submit, so 
you can reuse it:

diff --git a/include/qemu/stats64.h b/include/qemu/stats64.h
index 802402254b6f..99b5cb724a89 100644
--- a/include/qemu/stats64.h
+++ b/include/qemu/stats64.h
@@ -40,6 +40,11 @@ static inline uint64_t stat64_get(const Stat64 *s)
      return qatomic_read__nocheck(&s->value);
  }

+static inline void stat64_set(Stat64 *s, uint64_t value)
+{
+    qatomic_set__nocheck(&s->value, value);
+}
+
  static inline void stat64_add(Stat64 *s, uint64_t value)
  {
      qatomic_add(&s->value, value);
@@ -62,6 +67,7 @@ static inline void stat64_max(Stat64 *s,
  }
  #else
  uint64_t stat64_get(const Stat64 *s);
+void stat64_set(Stat64 *s, uint64_t value);
  bool stat64_min_slow(Stat64 *s, uint64_t value);
  bool stat64_max_slow(Stat64 *s, uint64_t value);
  bool stat64_add32_carry(Stat64 *s, uint32_t low, uint32_t high);
diff --git a/util/stats64.c b/util/stats64.c
index 897613c94965..efa04d5759f0 100644
--- a/util/stats64.c
+++ b/util/stats64.c
@@ -57,6 +57,17 @@ uint64_t stat64_get(const Stat64 *s)
      return ((uint64_t)high << 32) | low;
  }

+void stat64_set(Stat64 *s, uint64_t val)
+{
+    while (!stat64_wrtrylock(s)) {
+        cpu_relax();
+    }
+
+    qatomic_set(&s->high, val >> 32);
+    qatomic_set(&s->low, val);
+    stat64_wrunlock(s);
+}
+
  bool stat64_add32_carry(Stat64 *s, uint32_t low, uint32_t high)
  {
      uint32_t old;


Paolo


