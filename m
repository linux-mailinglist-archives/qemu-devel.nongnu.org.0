Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5A55EC706
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:57:15 +0200 (CEST)
Received: from localhost ([::1]:44378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odC1H-00056v-5Y
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odAQ6-0008Mu-Or
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:14:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odAQ5-000424-7S
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:14:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664284479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9rXxLIQnWrMqUt+pmfF/ecM0Ncb+G5tyNjeW9seWiqs=;
 b=bHUg6JA7GfUMQ0D1XoEpwxeXXo173Q4cvUruk36Ab3eqcAP8S0fTBIEzZVCPU99kPx7qTo
 3U3WZ5O0DgsZKpusW4Bblzz97kU1abrvDf0+ud8JfDANknLDcknO5Faj+GdgJND53R+8JB
 7MkD/gqxhm39OKZiXyA9n893Qo6SRUg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-pYqL63qQO7-UPNvqC1Z3Eg-1; Tue, 27 Sep 2022 09:14:37 -0400
X-MC-Unique: pYqL63qQO7-UPNvqC1Z3Eg-1
Received: by mail-ej1-f72.google.com with SMTP id
 dm10-20020a170907948a00b00781fa5e140fso3893461ejc.21
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 06:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=9rXxLIQnWrMqUt+pmfF/ecM0Ncb+G5tyNjeW9seWiqs=;
 b=itZLgjvurEEDZlRlbJdgpLykdS4UbYzY6j/QFDOiWwJRTvNLzUZhv8ixWznS7Ultwm
 YNgKDTMooSjeeH80ns7xHbAHzNtG5AxDVPdGDwisNb2Qnqu0HGJjWqtoLho7gGwGFrRs
 Obv/puC8fRVNRQpmIXYSCVFf2bMzm4gJfoVpmzHbolUmCA39OJXS8tR8Dp+guMf39pyr
 IYAXyCS3seuTR4M3kNC3/BMB/HuUiBeaOEC/kbgjoGhXUdUPBL43ZRj8PvOANy2r76N1
 TXhqAtaZsuQqS5bi6+6pTF885pKRmqK/voZTmCVyK5ewrtvALXxevmCrI8IB7Fv/JZi1
 5SWg==
X-Gm-Message-State: ACrzQf3aznts9JqPVgduAAdS7IAm0cHOEP3LbTC75ctNykC/HG/GaK7I
 C690D4xKYcyf1JmXJo3ECcmBA8FCUFxSxTglGYDo1oVFhSWQQ9GQIJ3wDBCDdDB0rYpacX5wwrk
 srh5S6VMFK+YkU7A=
X-Received: by 2002:a17:907:868c:b0:782:d6b3:33bc with SMTP id
 qa12-20020a170907868c00b00782d6b333bcmr15867026ejc.134.1664284476082; 
 Tue, 27 Sep 2022 06:14:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5fFe8Bs1L7keuFtSr+WCTkDKpB3RdTwfJQJSn6gB6nIRYHX3+H22gzBbraORNQ2KD+c1aIdg==
X-Received: by 2002:a17:907:868c:b0:782:d6b3:33bc with SMTP id
 qa12-20020a170907868c00b00782d6b333bcmr15866946ejc.134.1664284475054; 
 Tue, 27 Sep 2022 06:14:35 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 p24-20020a170906141800b0077ab3ca93efsm747188ejc.223.2022.09.27.06.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 06:14:34 -0700 (PDT)
Message-ID: <c773b5aa-19b0-20de-5818-67360307abd9@redhat.com>
Date: Tue, 27 Sep 2022 15:14:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v7 1/2] i386: kvm: extend kvm_{get, put}_vcpu_events to
 support pending triple fault
Content-Language: en-US
To: Chenyi Qiang <chenyi.qiang@intel.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220923073333.23381-1-chenyi.qiang@intel.com>
 <20220923073333.23381-2-chenyi.qiang@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220923073333.23381-2-chenyi.qiang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 9/23/22 09:33, Chenyi Qiang wrote:
> For the direct triple faults, i.e. hardware detected and KVM morphed
> to VM-Exit, KVM will never lose them. But for triple faults sythesized
> by KVM, e.g. the RSM path, if KVM exits to userspace before the request
> is serviced, userspace could migrate the VM and lose the triple fault.
> 
> A new flag KVM_VCPUEVENT_VALID_TRIPLE_FAULT is defined to signal that
> the event.triple_fault_pending field contains a valid state if the
> KVM_CAP_X86_TRIPLE_FAULT_EVENT capability is enabled.

Note that you are not transmitting the field on migration.  You need
this on top:

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index b97d182e28..d4124973ce 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1739,7 +1739,7 @@ typedef struct CPUArchState {
      uint8_t has_error_code;
      uint8_t exception_has_payload;
      uint64_t exception_payload;
-    bool triple_fault_pending;
+    uint8_t triple_fault_pending;
      uint32_t ins_len;
      uint32_t sipi_vector;
      bool tsc_valid;
diff --git a/target/i386/machine.c b/target/i386/machine.c
index cecd476e98..310b125235 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1562,6 +1562,25 @@ static const VMStateDescription vmstate_arch_lbr = {
      }
  };
  
+static bool triple_fault_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return env->triple_fault_pending;
+}
+
+static const VMStateDescription vmstate_triple_fault = {
+    .name = "cpu/triple_fault",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = triple_fault_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(env.triple_fault_pending, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
  const VMStateDescription vmstate_x86_cpu = {
      .name = "cpu",
      .version_id = 12,
@@ -1706,6 +1725,7 @@ const VMStateDescription vmstate_x86_cpu = {
          &vmstate_amx_xtile,
  #endif
          &vmstate_arch_lbr,
+        &vmstate_triple_fault,
          NULL
      }
  };


