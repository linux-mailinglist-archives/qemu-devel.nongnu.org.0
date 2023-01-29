Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8162680258
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 23:45:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMGPh-0007Yu-3x; Sun, 29 Jan 2023 17:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pMGPe-0007Yf-LS
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 17:44:38 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pMGPd-0000W8-54
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 17:44:38 -0500
Received: by mail-wr1-x435.google.com with SMTP id q10so9518974wrm.4
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 14:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9kBYRCf+P6cKgTg4U2/s4WC5U5cyb9xv72fpxt5Mrdo=;
 b=aQKUVt84TBj/xCx6f1jvlu+h7Lye5vUpi+jibp1h4Rgx5zh0MXLzRVlUMI60io9cT3
 El9cjNkbWzcBgG6M3hArf05MkmxeIV127iCEl29WywpMI+JonvEPdOdv5lRzRsKCq6DQ
 M0RRtcY1s/SaUpFgH2nSrp8qxwt9/fzN1frmnT6y54+FjsJQIh8GTO1JqjyfAOxzSaZL
 lybH/tHAl6LGSkaC21hZkF6p8ddqYC+LJ2vVmZdmjVvD1UlutKMv1DQ5hYMnBUyZ8wV4
 dJJWsIGfriTBmJoEa8tWpCCelhmbWmVYGNEo5/Vg2hbTHXB4KoOfQlLpmiTVpv141KAo
 68mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9kBYRCf+P6cKgTg4U2/s4WC5U5cyb9xv72fpxt5Mrdo=;
 b=Amp+8zYqSUPw13bgpF12LWS53AIL3eDRzG2827aLnYUyHKvLIJ8SolNpTW8wOZZ0RE
 ANN8Y86QdaMYVpR0QIDHsp1xbJXLFMG60KIsdCXHpERxxkhNPba/KEBq70xmv9H1u6K7
 NzmaZjp3qYIgmW6bwzwEa3gL+jWDNEsW+c10x8WhjjY1XkD/KoH71cYDWorcQe0Lrx/o
 dcCy0q2cE/u1kk1AG81ZDPIAHvXg4VOvHhTqW0uCfFM4nA1DvaFW1gAGETbaeqM5Jpn5
 W2KUR9WjPidex8DwnxjyVSmSzrslJQ1wCyuE0OlgfTvMwLVILNegAhW/z+Fl2nxij6aV
 ZNiA==
X-Gm-Message-State: AO0yUKVwELrpOdr2RCFBsj+ZQHGr76xX38JQj66JDya+NeHycOATO0xL
 zlDNoDsgt0nlAS9grmP497HyTA==
X-Google-Smtp-Source: AK7set9xX2Y1vpm5QW1ykddscHqtYAwxJTbvmtSMkeTDdVktYQ72kCcCYk90r61rRUfgZNYNA7PZgw==
X-Received: by 2002:adf:c7d0:0:b0:2bf:b113:8ae2 with SMTP id
 y16-20020adfc7d0000000b002bfb1138ae2mr19281257wrg.15.1675032275663; 
 Sun, 29 Jan 2023 14:44:35 -0800 (PST)
Received: from localhost ([146.70.128.243]) by smtp.gmail.com with ESMTPSA id
 t1-20020adfe441000000b002bfd524255esm7427852wrm.43.2023.01.29.14.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 14:44:35 -0800 (PST)
Date: Sun, 29 Jan 2023 17:28:47 -0500
From: Emilio Cota <cota@braap.org>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] util: import GTree as QTree
Message-ID: <Y9bzH9EGH/+f/0lu@cota-l14>
References: <20230111035536.309885-1-cota@braap.org>
 <20230111035536.309885-2-cota@braap.org>
 <Y76mumSsUDY/hVWu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y76mumSsUDY/hVWu@redhat.com>
Received-SPF: softfail client-ip=2a00:1450:4864:20::435;
 envelope-from=cota@braap.org; helo=mail-wr1-x435.google.com
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

On Wed, Jan 11, 2023 at 12:08:26 +0000, Daniel P. Berrangé wrote:
> First, I find the test to be a little unreliable the first few
> times it is ran. I ran it in a loop 20 times and it got more
> stable results. Looking at just the QTree lines I get something
> typically like:

Agreed, this is a problem in the benchmarks as written. I've
changed them now to run for at least 200ms, which seems to
stabilise results on my machine. (See the appended patch.)

> One thing to bear in mind is that if setting G_SLICE=always-malloc, we
> should in theory see the exact same results for GTree and QTree.

Not quite exact same results.
There are a couple of differences that matter in this context:
- We're comparing a shared library, compiled most likely with -fPIC,
  against a static library without fPIC. I've done some tests and
  indeed using fPIC on qtree makes a difference on the generated code
  and in the resulting benchmark performance.
- With G_SLICE=always-malloc we are still going through g_slice
  to then defer to the system's malloc. Should not matter much
  except in microbenchmarks like these.

That said, I have not been able to get a 1:1 match of perf results
between qtree and gtree, even after compiling fPIC on qtree, compiling
Glib myself, and modifying qtree to use gslice.
I've also tried tcmalloc and glibc.

One thing I didn't try due to lack of time is to make qtree into
a shared library and benchmark that -- I think that would finally
give us identical results.

> So overall if I ignore the unreliable results, my take away is
> that malloc is pretty much always a win over gslice, sometimes
> massively so, but at least shouldn't be worse.
> 
> NB, I'm using Fedora 37 with glibc.  Mileage may vary with different
> libc impls.

I have to agree, I just wanted to be honest by sharing the numbers
I had, but in fairness I didn't put enough time in getting
those numbers for them to be useful, which is tricky when dealing
with microbenchmarks.

Thanks,
		E.

---
diff --git a/tests/bench/qtree-bench.c b/tests/bench/qtree-bench.c
index 9cfaf8820e..ed42e73293 100644
--- a/tests/bench/qtree-bench.c
+++ b/tests/bench/qtree-bench.c
@@ -118,9 +118,9 @@ static inline void remove_all(void *tree, enum impl_type impl)
     }
 }
 
-static double run_benchmark(const struct benchmark *bench,
-                            enum impl_type impl,
-                            size_t n_elems)
+static int64_t run_benchmark(const struct benchmark *bench,
+                             enum impl_type impl,
+                             size_t n_elems)
 {
     void *tree;
     size_t *keys;
@@ -212,7 +212,7 @@ static double run_benchmark(const struct benchmark *bench,
     }
     g_free(keys);
 
-    return (double)n_elems / ns * 1e3;
+    return ns;
 }
 
 int main(int argc, char *argv[])
@@ -232,7 +232,20 @@ int main(int argc, char *argv[])
             const struct tree_implementation *impl = &impls[j];
             for (int k = 0; k < ARRAY_SIZE(benchmarks); k++) {
                 const struct benchmark *bench = &benchmarks[k];
-                res[k][j][i] = run_benchmark(bench, impl->type, size);
+
+                /* warm-up run */
+                run_benchmark(bench, impl->type, size);
+
+                int64_t total_ns = 0;
+                int64_t n_runs = 0;
+                while (total_ns < 2e8 || n_runs < 3) {
+                    total_ns += run_benchmark(bench, impl->type, size);
+                    n_runs++;
+                }
+                double ns_per_run = (double)total_ns / n_runs;
+
+                // Throughput, in Mops/s.
+                res[k][j][i] = size / ns_per_run * 1e3;
             }
         }
     }


