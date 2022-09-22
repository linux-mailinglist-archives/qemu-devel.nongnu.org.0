Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ECC5E67D9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:58:18 +0200 (CEST)
Received: from localhost ([::1]:52386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOaf-0006GZ-9E
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obOFg-0000HH-PC
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:36:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obOFb-0000rr-Eb
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663860989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TDR3d81nArABlbrlt/KP7A8NXUJLSgVwg6Wwcw+6jKQ=;
 b=Q09Awf3g9K9QPvPYMbhF4vgI5B4uVAOAYPvzMg4aLGGelPRmsnMhN1BPZPbr2Lvk1+iHKY
 8fZpyEkXRlQ/Y+lrm8kZFHwL8yUDjVF51QHfKB7JXj9hPDy34uz08wVLWSj55kQKsaA92R
 LrdFAZ6qie5fmb2ubEm9MrdbyyaCw+I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-167-xZh0j2ciNEWzcXpoojL0_w-1; Thu, 22 Sep 2022 11:36:27 -0400
X-MC-Unique: xZh0j2ciNEWzcXpoojL0_w-1
Received: by mail-ed1-f71.google.com with SMTP id
 dz21-20020a0564021d5500b0045217702048so6872766edb.5
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 08:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=TDR3d81nArABlbrlt/KP7A8NXUJLSgVwg6Wwcw+6jKQ=;
 b=i/pgSSSVt9deLlfl0B5vl+TA5CHcBxah7/6UeZVBFKFCzKcNCUjKMntsDOON0hPJtu
 A5q2+njpDgS9WZ72uCI2zoLTyOidbZjyVy4cJG4EGD/d7lpv3UJE0xHu+OWcyWrVewU+
 2qZ4UmegWQCGkCZGB9L9gwku0E5O7Ba7sI1+Iq2kffu3Dd9d2A3INz/Qdx+eyl+pCQ3P
 bfTvMkt5xQaJSXFfLkwi4xq3ekGjwNzn7OZQyRe0AGWkz915/JNaPTAGnLK7SaRNah2S
 7Ou3FQTaZ056G2FQqloBV5N5OaJMXZeJlRHcYZZdCew5IMQDbP1Tmi+Xn2i9IhwGMBnh
 zKjg==
X-Gm-Message-State: ACrzQf0Qqhhl972axm0hnzjooH8fTjq66r1Afx/zq1dScTdMFMDUhSVP
 j5lI7VLJIv7XY7d0BfA/OEuQ9mfzbfMlB8jPWENmNPCAkFxqbgUUFv1T/3DspyHMv3wenrgtOYj
 E+PC3Bjh1ascuP2I=
X-Received: by 2002:a17:907:b1b:b0:772:1dcc:a512 with SMTP id
 h27-20020a1709070b1b00b007721dcca512mr3273978ejl.247.1663860986015; 
 Thu, 22 Sep 2022 08:36:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4pz/L5wXJEvtjocPpSl29aM9mc/852jtksPS73JY79WusHbE1lkk/tvTYKB1LBvD94DU0r4A==
X-Received: by 2002:a17:907:b1b:b0:772:1dcc:a512 with SMTP id
 h27-20020a1709070b1b00b007721dcca512mr3273957ejl.247.1663860985761; 
 Thu, 22 Sep 2022 08:36:25 -0700 (PDT)
Received: from [192.168.45.94] ([37.85.29.70])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a1709061bb200b0077205dd15basm2769966ejg.66.2022.09.22.08.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 08:36:25 -0700 (PDT)
Message-ID: <cd8de41e-3401-5e24-4112-47a5a6f8cbb4@redhat.com>
Date: Thu, 22 Sep 2022 17:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8 1/2] target/s390x: support SHA-512 extensions
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <793e6018-da21-2247-1348-ad0e62030e25@redhat.com>
 <YyxyxCZH4X5n7Rdy@zx2c4.com>
 <5a8f56a5-50ec-01f3-094f-b1213bb29e56@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <5a8f56a5-50ec-01f3-094f-b1213bb29e56@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/09/2022 16.51, David Hildenbrand wrote:
[...]
> Thanks. I'll resend this patch only as reply to your original one,
> so Thomas can easily pick it up (or add more feedback :)).

We're also missing the machine compat handling ... could you
add something like this on top:

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -803,8 +803,11 @@ DEFINE_CCW_MACHINE(7_2, "7.2", true);
  
  static void ccw_machine_7_1_instance_options(MachineState *machine)
  {
+    static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V7_1 };
+
      ccw_machine_7_2_instance_options(machine);
      s390_cpudef_featoff_greater(16, 1, S390_FEAT_PAIE);
+    s390_set_qemu_cpu_model(0x8561, 15, 1, qemu_cpu_feat);
  }
  
  static void ccw_machine_7_1_class_options(MachineClass *mc)
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -744,13 +744,16 @@ static uint16_t qemu_V7_0[] = {
      S390_FEAT_MISC_INSTRUCTION_EXT3,
  };
  
+static uint16_t qemu_V7_1[] = {
+    S390_FEAT_VECTOR_ENH2,
+};
+
  /*
   * Features for the "qemu" CPU model of the latest QEMU machine and the "max"
   * CPU model under TCG. Don't include features that are not part of the full
   * feature set of the current "max" CPU model generation.
   */
  static uint16_t qemu_MAX[] = {
-    S390_FEAT_VECTOR_ENH2,
      S390_FEAT_MSA_EXT_5,
      S390_FEAT_KIMD_SHA_512,
      S390_FEAT_KLMD_SHA_512,
@@ -876,6 +879,7 @@ static FeatGroupDefSpec QemuFeatDef[] = {
      QEMU_FEAT_INITIALIZER(V6_0),
      QEMU_FEAT_INITIALIZER(V6_2),
      QEMU_FEAT_INITIALIZER(V7_0),
+    QEMU_FEAT_INITIALIZER(V7_1),
      QEMU_FEAT_INITIALIZER(MAX),
  };
  
(otherwise I can also add it when picking up the patch)

  Thomas



