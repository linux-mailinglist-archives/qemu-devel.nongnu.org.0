Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C3249B701
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:56:55 +0100 (CET)
Received: from localhost ([::1]:34230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCNFe-0000ev-BS
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:56:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nCLeF-00047d-8J
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:14:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nCLeC-00042k-0Q
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:14:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643116437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EJ2RoCCHw0iEYJKh5Pl0+R5jmzTmOENS7idwYfPTh+w=;
 b=OMAdoYpjLZMU6rIFNwwr9ElmVP65AsVaXqaY/qAfa0vHutPzC1050A5cM40XC3YziN48bb
 Qpx2a5BGAmuaxTBmhLLqwwiUktHs+xDJ5vDYoPS/HNhzy8UwQeltaCCebNRNDwKk3/UjR0
 xabMfVLD+niWzv2ozLGUlUYQXb3POL4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-zGnOlQ09PmiuAit7uPLEzg-1; Tue, 25 Jan 2022 08:13:55 -0500
X-MC-Unique: zGnOlQ09PmiuAit7uPLEzg-1
Received: by mail-ej1-f72.google.com with SMTP id
 rl11-20020a170907216b00b006b73a611c1aso2815400ejb.22
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 05:13:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EJ2RoCCHw0iEYJKh5Pl0+R5jmzTmOENS7idwYfPTh+w=;
 b=7dZhTl17znAQuEGJbCf6tc+Nl53nxnq6YpNUsFpMNGETYqBLnNCedAXKXO8mpVEGBz
 27owk0BL/v7BKE0JX14RqgCEqt37MlsF/HGEncv9BwBGx2Qoo4bNxeH8WWfJnonANY8+
 fsR/DNMpEjqm1he4WeDwJl8Qtxu0RUIytKBkWziQwDzmOxRF3qfDnagbIgt+Y52o0kp6
 Whu/pKOl38dCLgMfgYu2ECRegGP7l1/h/utDYn/QC+AayRLXoYvPTLm3lzhv988VQeL1
 zU9iW14Y7TVamTND9WI7l+5AT6Bil60+c3vC0jcn+yEVl43OI2n+U+35mdYWLtQXKZFg
 EMCQ==
X-Gm-Message-State: AOAM530U1nK5T1f7BR+bAekvq85xcJus0zdCqb4+h3lVJCxbGqly9m9S
 R0j19rJldIFyH/OfBInsL+2IwSftDE8pF5DS0ZIRLmE+d3X52SeJ8MZlfIzm4rQQaLu4Xj5cNVk
 I0OdOeb2pkoKeVDw=
X-Received: by 2002:aa7:d541:: with SMTP id u1mr20021011edr.205.1643116433809; 
 Tue, 25 Jan 2022 05:13:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzceNfHm5lPSxQ3MW0l4VoMp2F+3V9e9ADWPrkIZ5wSE0xUiaxRKV7PcWyLIMFLykYJK0XLMA==
X-Received: by 2002:aa7:d541:: with SMTP id u1mr20020995edr.205.1643116433519; 
 Tue, 25 Jan 2022 05:13:53 -0800 (PST)
Received: from ?IPV6:2003:cb:c70f:8000:9797:8f:1ed9:7596?
 (p200300cbc70f80009797008f1ed97596.dip0.t-ipconnect.de.
 [2003:cb:c70f:8000:9797:8f:1ed9:7596])
 by smtp.gmail.com with ESMTPSA id k4sm7821815edo.55.2022.01.25.05.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 05:13:52 -0800 (PST)
Message-ID: <9a888391-1020-89b0-65ed-5c93f2cc8642@redhat.com>
Date: Tue, 25 Jan 2022 14:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH qemu] s390x: sck: load into a temporary not into in1
To: Nico Boehr <nrb@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220125122914.567599-1-nrb@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220125122914.567599-1-nrb@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: linux-s390@vger.kernel.org, thuth@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.01.22 13:29, Nico Boehr wrote:
> We previously loaded into in1, but in1 is not filled during
> disassembly and hence always zero. This leads to an assertion failure:
> 
>   qemu-system-s390x: /home/nrb/qemu/include/tcg/tcg.h:654: temp_idx:
>   Assertion `n >= 0 && n < tcg_ctx->nb_temps' failed.`
> 
> Instead, load into a temporary and pass that to the helper.
> 
> This fixes the SCK test I sent here under TCG:
> <https://www.spinics.net/lists/kvm/msg265169.html>
> 
> Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
> ---
>  target/s390x/tcg/translate.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 46dea733571e..dc0baec5a5f4 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -4290,9 +4290,16 @@ static DisasJumpType op_stcke(DisasContext *s, DisasOps *o)
>  #ifndef CONFIG_USER_ONLY
>  static DisasJumpType op_sck(DisasContext *s, DisasOps *o)
>  {
> -    tcg_gen_qemu_ld_i64(o->in1, o->addr1, get_mem_index(s), MO_TEUQ | MO_ALIGN);
> -    gen_helper_sck(cc_op, cpu_env, o->in1);
> +    TCGv_i64 t1;
> +
> +    t1 = tcg_temp_new_i64();
> +
> +    tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_TEUQ | MO_ALIGN);
> +    gen_helper_sck(cc_op, cpu_env, t1);
>      set_cc_static(s);
> +
> +    tcg_temp_free_i64(t1);
> +
>      return DISAS_NEXT;
>  }
>  

I think you can actually just reuse in2_m2_64a, similar as we handle SCKC


diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index f0af458aee..3a78606866 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -1317,7 +1317,7 @@
 /* SET ADDRESS SPACE CONTROL FAST */
     F(0xb279, SACF,    S,     Z,   0, a2, 0, 0, sacf, 0, IF_PRIV)
 /* SET CLOCK */
-    F(0xb204, SCK,     S,     Z,   la2, 0, 0, 0, sck, 0, IF_PRIV | IF_IO)
+    F(0xb204, SCK,     S,     Z,   0, m2_64a, 0, 0, sck, 0, IF_PRIV | IF_IO)
 /* SET CLOCK COMPARATOR */
     F(0xb206, SCKC,    S,     Z,   0, m2_64a, 0, 0, sckc, 0, IF_PRIV | IF_IO)
 /* SET CLOCK PROGRAMMABLE FIELD */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f180853e7a..c18011920e 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -4295,8 +4295,7 @@ static DisasJumpType op_stcke(DisasContext *s, DisasOps *o)
 #ifndef CONFIG_USER_ONLY
 static DisasJumpType op_sck(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_ld_i64(o->in1, o->addr1, get_mem_index(s), MO_TEUQ | MO_ALIGN);
-    gen_helper_sck(cc_op, cpu_env, o->in1);
+    gen_helper_sck(cc_op, cpu_env, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }


-- 
Thanks,

David / dhildenb


