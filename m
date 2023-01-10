Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FB5663755
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 03:27:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF4KU-0004ch-Cs; Mon, 09 Jan 2023 21:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pF4KM-0004cQ-Vb
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 21:25:27 -0500
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pF4KJ-0003rS-Be
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 21:25:25 -0500
Received: by mail-qt1-x833.google.com with SMTP id fa5so4472577qtb.11
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 18:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bNVDcY9bUAR5U/WJGuOSHHOHWwOySJoHSLzhA+f9kBU=;
 b=PN7e7Gi8LrQvs3avCodYVxQuFzixWIC4BpbZ4bW0t1/UoTfm9obfyjncHb6eVsroGw
 8GYj/Vd/FeMZ3/yx0ZkuYEVDalF3eM2jNtYGocOiiVcQvSmecZJtAjTWFmoAplNcZ6Vd
 hcc+yfudIgOyx0xigPgPzkbR2+1cdvw08S+3ylQCvyrzYvLGBeKRVe/KGUjZiiIsgesU
 BV3Q7MWLV6oMkWuHv5oFy767RYuBYh7r/5+N/fnF5Lb+tdGoxqKXKkFE1fNr0BdjWgxx
 Fy+Ej0LHXXbm+5y0ncpkWaPL2D64miiibAFepm2MXacdg2wKjQPIwxufP8dp7TFAIm9N
 vNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bNVDcY9bUAR5U/WJGuOSHHOHWwOySJoHSLzhA+f9kBU=;
 b=4lrTbgJLzcDrMwEAgNQznF97zQroXTQ1kDK6XFxH7ER1NPx9G/MpCJS16g93YKfHsl
 Q8rhYrpnEBEDqJZ4pWjJE4SxsdnD1srO0bCCcdC6oO7C3/4hAJ4dc7XZ7V7T8xqILfCs
 GYwA0fe2sqiK8CtMfYcR5/LX4jdhdSoncPWlfCtaMGB+EcedUcos1ogWe47Mp5j5Hth/
 vIDWd9U4osBfTDpjPNL32zkU0a2kJSdz1Mv2DZtN0Pzf2J5+XoJO6a5H/eg5wwOrXdWg
 Zrx0MFsK/jAQ+HUk4Ub6ten2xuxpKHb7RQJ4rcax9gPYAd42zorSlK9u85hNT7rA+8br
 0kmw==
X-Gm-Message-State: AFqh2koXDBsEgUsuic3gEJSG9X5wWILoaxLi5AaabNg/zFr7B+QDmRY/
 kkbfTcY0t4pXwJpB1Zo07rdX3Q2L1nGastJk52Y=
X-Google-Smtp-Source: AMrXdXs3p1Vgx2wReHPb7CN3KpaAr7bdqKs0OGLM5ZbatVLFQHP2U2N6tCYmHV7EUdcDmi1uXMHU5Q==
X-Received: by 2002:a05:622a:4f:b0:3ab:b632:e64c with SMTP id
 y15-20020a05622a004f00b003abb632e64cmr60642936qtw.18.1673317521834; 
 Mon, 09 Jan 2023 18:25:21 -0800 (PST)
Received: from localhost (pool-100-2-99-22.nycmny.fios.verizon.net.
 [100.2.99.22]) by smtp.gmail.com with ESMTPSA id
 x10-20020ac87a8a000000b003a7eb5baf3csm5351725qtr.69.2023.01.09.18.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 18:25:21 -0800 (PST)
Date: Mon, 9 Jan 2023 21:16:58 -0500
From: Emilio Cota <cota@braap.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH 4/4] cpu-exec: assert that plugin_mem_cbs is NULL after
 execution
Message-ID: <Y7zKmmCHbMWj3KdO@cota-l14>
References: <20230108164731.61469-1-cota@braap.org>
 <20230108165107.62488-1-cota@braap.org> <87k01voluy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k01voluy.fsf@linaro.org>
Received-SPF: softfail client-ip=2607:f8b0:4864:20::833;
 envelope-from=cota@braap.org; helo=mail-qt1-x833.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

On Mon, Jan 09, 2023 at 13:52:36 +0000, Alex Bennée wrote:
> Emilio Cota <cota@braap.org> writes:
> > --- a/accel/tcg/cpu-exec.c
> > +++ b/accel/tcg/cpu-exec.c
> > @@ -504,6 +504,7 @@ static void cpu_exec_exit(CPUState *cpu)
> >      if (cc->tcg_ops->cpu_exec_exit) {
> >          cc->tcg_ops->cpu_exec_exit(cpu);
> >      }
> > +    g_assert(cpu->plugin_mem_cbs == NULL);
(snip)
> > +            g_assert(cpu->plugin_mem_cbs == NULL);
> 
> Can we assert this anywhere else? This fails with non-plugin enabled
> builds:
> 
>   https://gitlab.com/stsquad/qemu/-/pipelines/741478109/failures

Ouch. Fixed in v2 with:

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index de4ba6e23c..0010b2d31e 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -504,7 +504,7 @@ static void cpu_exec_exit(CPUState *cpu)
     if (cc->tcg_ops->cpu_exec_exit) {
         cc->tcg_ops->cpu_exec_exit(cpu);
     }
-    g_assert(cpu->plugin_mem_cbs == NULL);
+    QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
 }
 
 void cpu_exec_step_atomic(CPUState *cpu)
@@ -1032,7 +1032,7 @@ int cpu_exec(CPUState *cpu)
 
             cpu_loop_exec_tb(cpu, tb, pc, &last_tb, &tb_exit);
 
-            g_assert(cpu->plugin_mem_cbs == NULL);
+            QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
             /* Try to align the host and virtual clocks
                if the guest is in advance */
             align_clocks(&sc, cpu);
diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index e0ebedef84..fb338ba576 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -59,6 +59,8 @@ get_plugin_meminfo_rw(qemu_plugin_meminfo_t i)
 #ifdef CONFIG_PLUGIN
 extern QemuOptsList qemu_plugin_opts;
 
+#define QEMU_PLUGIN_ASSERT(cond) g_assert(cond)
+
 static inline void qemu_plugin_add_opts(void)
 {
     qemu_add_opts(&qemu_plugin_opts);
@@ -250,6 +252,8 @@ void qemu_plugin_user_postfork(bool is_child);
 
 #else /* !CONFIG_PLUGIN */
 
+#define QEMU_PLUGIN_ASSERT(cond)
+
 static inline void qemu_plugin_add_opts(void)
 { }

Thanks,
		Emilio

