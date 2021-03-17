Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A079A33F4E6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:02:41 +0100 (CET)
Received: from localhost ([::1]:45744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYd6-0001QQ-5w
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMYGN-0000VU-J9; Wed, 17 Mar 2021 11:39:18 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMYGK-0000yf-3l; Wed, 17 Mar 2021 11:39:10 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso3626012wmi.3; 
 Wed, 17 Mar 2021 08:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lf9bpR7MdJMQaWq1ugevlKFytT0CViJcoKgPB4Z2M+0=;
 b=ejnBB+enYBNTE2HbLcRpNFmhmHbChbMWjwD2h1GQSY7EpP2zpjDyfqTsVUxImhHhx7
 fLJ5AslfsFeafXrpXBjit0yUaFu8rIgKSNChL1OLGmr9EkMVyIuTC1jv2Hfl9IX5gga4
 vePpIgagW1zmwXH6M5/iWnl5mqm5NvOJI0WEbubifSXcbbKPGlvVOuS2kghOrgKUrjkA
 4EihQjIuano/CplV4tOz/GYhJ08XnLHvY3vgCLo/Ka3X0jetfI10XKezg575rLJHi2dG
 Kr/BfYWc0YTIDPLKTxFnvkhYWat873XXDvC62lxs2Pu18ZG3IO+uGKPPUwmP9tFGmwZe
 txIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lf9bpR7MdJMQaWq1ugevlKFytT0CViJcoKgPB4Z2M+0=;
 b=XkHe8nFvgHkCxUOpmt50Cy1Nz7LUGTkCiaI0MWFq/6kwLpmna89mEiiLmg1+1DnUYc
 82PnIQdNVveU4Cb14iCjDm0Wi1SwNgwulr6SjYd23CSDArtsrQJSyejq6BpKBmrTqRTI
 clehYU/114Cv+77CtcvSoN+l9Ga8SoNIE0OHvqmUkDu3BexFz10v3FUWYinibU9WgsKo
 qvhOrFVWPVA7j50KyP27lOQXqmi4FpGyn9OdcECXn6olQ7FNUcMXhmZLqayxLJtopm+a
 LkoakAKDDA9MMUP1IKb6UrjVbPHGqCVeQ5i3tOA9dtdMIBSJ9NTGmtpYe3T/U81N0IF/
 yNsw==
X-Gm-Message-State: AOAM533w5JyOAiqbNTUGqrN9BxHYHCmWPmzd0x7uP1ex3x6FnNkujKvm
 IhjmbPMlYawV/AfWz3zH73Q=
X-Google-Smtp-Source: ABdhPJxOZYp0UX+6tjs0AeAifRczuYxw+wWpMhgm3clbDsm/bPizFy1yddWedxOQ5scYIk8l8KdaXg==
X-Received: by 2002:a05:600c:252:: with SMTP id
 18mr4200731wmj.67.1615995545337; 
 Wed, 17 Mar 2021 08:39:05 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h6sm2771188wmi.6.2021.03.17.08.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 08:39:04 -0700 (PDT)
Subject: Re: [PATCH] target/ppc/kvm: Cache timebase frequency
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <161599468311.1752480.3413807875011702040.stgit@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b10f7706-204b-6bb0-895a-c6e680acd2c3@amsat.org>
Date: Wed, 17 Mar 2021 16:39:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <161599468311.1752480.3413807875011702040.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 4:24 PM, Greg Kurz wrote:
> Each vCPU core exposes its timebase frequency in the DT. When running
> under KVM, this means parsing /proc/cpuinfo in order to get the timebase
> frequency of the host CPU.
> 
> The parsing appears to slow down the boot quite a bit with higher number
> of cores:
> 
> # of cores     seconds spent in spapr_dt_cpus()
>       8                  0.550122
>      16                  1.342375
>      32                  2.850316
>      64                  5.922505
>      96                  9.109224
>     128                 12.245504
>     256                 24.957236
>     384                 37.389113
> 
> The timebase frequency of the host CPU is identical for all
> cores and it is an invariant for the VM lifetime. Cache it
> instead of doing the same expensive parsing again and again.
> 
> With this patch applied:
> 
>     384                 0.518382
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  target/ppc/kvm.c |   11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 298c1f882c67..9ad3dae29132 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -1819,7 +1819,13 @@ uint32_t kvmppc_get_tbfreq(void)
>  {
>      char line[512];
>      char *ns;
> -    uint32_t retval = NANOSECONDS_PER_SECOND;
> +    static uint32_t retval = -1;

Please document why in the code ...

> +
> +    if (retval != -1) {
> +        return retval;
> +    }
> +
> +    retval = NANOSECONDS_PER_SECOND;
>  
>      if (read_cpuinfo("timebase", line, sizeof(line))) {
>          return retval;
> @@ -1832,7 +1838,8 @@ uint32_t kvmppc_get_tbfreq(void)
>  
>      ns++;
>  
> -    return atoi(ns);
> +    retval = atoi(ns);
> +    return retval;
>  }

... or alternatively use self-documented code:

-- >8 --
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 298c1f882c6..2b2fe5d8148 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1815,7 +1815,7 @@ static int read_cpuinfo(const char *field, char
*value, int len)
     return ret;
 }

-uint32_t kvmppc_get_tbfreq(void)
+static uint32_t kvmppc_get_tbfreq_procfs(void)
 {
     char line[512];
     char *ns;
@@ -1835,6 +1835,17 @@ uint32_t kvmppc_get_tbfreq(void)
     return atoi(ns);
 }

+uint32_t kvmppc_get_tbfreq(void)
+{
+    static uint32_t cached_tbfreq;
+
+    if (!cached_tbfreq) {
+        cached_tbfreq = kvmppc_get_tbfreq_procfs();
+    }
+
+    return cached_tbfreq;
+}
+
 bool kvmppc_get_host_serial(char **value)
 {
     return g_file_get_contents("/proc/device-tree/system-id", value, NULL,
---

