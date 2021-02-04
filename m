Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C39330F773
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:17:41 +0100 (CET)
Received: from localhost ([::1]:36560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hK8-000894-Gm
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7h7O-0003pp-2C
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:04:31 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7h7J-0004mp-Tq
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:04:27 -0500
Received: by mail-ed1-x532.google.com with SMTP id l12so4827490edt.3
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 08:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KVmQylqT581RNaSQSJkWdl0p2krp15uffVcXFlWpVjM=;
 b=nZjWZBQ4IELXWvmwoYk+8SA0NUvj4YRrf/VF9mvayvGOfipD/VyAJ2ej4lAOHLXaCK
 ylujVTDsBxO/SmanxXb7INAkg6Ahj8vpDSZTNtgvSN2gJHHcwOHtDRtR1gYJNEdf+EuL
 3dhgMWKIcYsvO8J4mILOWLprSqs3BYi5r9V/4C3GohZQMgRTi5SkG7Q8wZKPk6O/nrCr
 g9iGY8dM5qi1rG/ruSs037mw8ECIOj3g9NyHzfkcbWoqAluvBv0rf20fvn4nIkOYuSki
 8i+hTZGOd3PobTRllrlyGyc3CeWvXFPUBF/Ixce5Utz6B+aliodjsfdXJwwXexfdeLh2
 AJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KVmQylqT581RNaSQSJkWdl0p2krp15uffVcXFlWpVjM=;
 b=iFYmo7qmJJ1vBSkH9IhZxdrAZR9JSqp+jt+1txitKv4lnfc0Ywbsw5eePkpU0erVIi
 HjqMT7h6Kcriw4x5h0GfMll9/G+atFIsTHZUuetdZBOdbVAFwlmjJsuk8DtmA3agMBlu
 V9gPjsUKxoeFDSbQ4qQCBA7/cdXIWqEObRZiN6PPskYtJc6Dok0A6dpLs1lr2pJHcOvc
 xhVGOX5/tz2mTw2hqdejFgSbSTm0a0vT3My8bmTmbQfFFclt0y3QjJeL07dLtkNla70m
 TDzRC4JU0u8pxU5aXb4K125AiLMN3ax1LJPWOp8MBPdYjfIs5Rlvx5xTvBzWFq+fLuGB
 YdYQ==
X-Gm-Message-State: AOAM530VVNZ2n/WaP4hbolRV3+kl3HgO5yMYcu5GMhth+c04PSe/oCEe
 sADHc15FI1XeI/D0w6Bzjkg=
X-Google-Smtp-Source: ABdhPJy/sr/FyBl82DEXHLGCfgnf2c3A+zJdFdPHhf1YemHHvGxpAg6qAxlGUwoon89/s951PE1epQ==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr8507677edd.52.1612454664096; 
 Thu, 04 Feb 2021 08:04:24 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id lo26sm2646201ejb.106.2021.02.04.08.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 08:04:23 -0800 (PST)
Subject: Re: [PULL 11/24] tcg/optimize: Use tcg_constant_internal with
 constant folding
To: David Hildenbrand <david@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <28457ae1-7e9b-4428-cb10-3b79ebeac8d0@linaro.org>
 <19D304C1-6401-4D16-AB54-DD19C978D04D@redhat.com>
 <db32a1f5-ad73-a341-f5e7-1c8f592d3d5b@redhat.com>
 <bd7154e1-4d6c-5b98-9e80-ec04f8476373@redhat.com>
 <20210204090351.GN30079@redhat.com> <20210204092916.GS27779@redhat.com>
 <b94570e3-9f87-d259-a338-adef1d552d1a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e1bc591d-009f-3b0f-83a0-36095efff7ee@amsat.org>
Date: Thu, 4 Feb 2021 17:04:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <b94570e3-9f87-d259-a338-adef1d552d1a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.182,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 10:37 AM, David Hildenbrand wrote:
> On 04.02.21 10:29, Richard W.M. Jones wrote:
>>>> commit 8f17a975e60b773d7c366a81c0d9bbe304f30859
>>>> Author: Richard Henderson <richard.henderson@linaro.org>
>>>> Date:   Mon Mar 30 19:52:02 2020 -0700
>>>>
>>>>      tcg/optimize: Adjust TempOptInfo allocation
>>>>
>>>> The image boots just fine on s390x/TCG as well.
>>>
>>> Let me try this in a minute on my original test machine.
>>
>> I got the wrong end of the stick as David pointed out in the other email.
>>
>> However I did test things again this morning (all on s390 host), and
>> current head (1ed9228f63ea4b) fails same as before ("mount" command
>> fails).
>>
>> Also I downloaded:
>>
>>   
>> https://dl.fedoraproject.org/pub/fedora-secondary/releases/33/Cloud/s390x/images/Fedora-Cloud-Base-33-1.2.s390x.qcow2
>>
>>
>> and booted it on 1ed9228f63ea4b using this command:
>>
>>    $ ~/d/qemu/build/s390x-softmmu/qemu-system-s390x -machine accel=tcg
>> -m 2048 -drive
>> file=Fedora-Cloud-Base-33-1.2.s390x.qcow2,format=qcow2,if=virtio
>> -serial stdio
>>
>> Lots of core dumps inside the guest, same as David saw.
>>
>> I then reset qemu back to 8f17a975e60b773d ("tcg/optimize: Adjust
>> TempOptInfo allocation"), rebuilt qemu, tested the same command and
>> cloud image, and that booted up much happier with no failures or core
>> dumps.
>>
>> Isn't it kind of weird that this would only affect an s390 host?  I
>> don't understand why the host would make a difference if we're doing
>> TCG.
> 
> I assume an existing BUG in the s390x TCG backend ... which makes it
> harder to debug :)

This seems to fix it:

-- >8 --
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index 8517e552323..32d03dbfbaf 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -1094,10 +1094,16 @@ static int tgen_cmp(TCGContext *s, TCGType type,
TCGCond c, TCGReg r1,
                 op = (is_unsigned ? RIL_CLFI : RIL_CFI);
                 tcg_out_insn_RIL(s, op, r1, c2);
                 goto exit;
-            } else if (c2 == (is_unsigned ? (uint32_t)c2 : (int32_t)c2)) {
-                op = (is_unsigned ? RIL_CLGFI : RIL_CGFI);
-                tcg_out_insn_RIL(s, op, r1, c2);
-                goto exit;
+            } else if (is_unsigned) {
+                if (c2 == (uint32_t)c2) {
+                    tcg_out_insn_RIL(s, RIL_CLGFI, r1, c2);
+                    goto exit;
+                }
+            } else {
+                if (c2 == (int32_t)c2) {
+                    tcg_out_insn_RIL(s, RIL_CGFI, r1, c2);
+                    goto exit;
+                }
             }
         }
---


