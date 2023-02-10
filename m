Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295CF691F33
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 13:36:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQScs-0002Es-45; Fri, 10 Feb 2023 07:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pQScp-0002EK-FT
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:35:35 -0500
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pQScm-0003LE-7k
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:35:34 -0500
Received: by mail-il1-x12f.google.com with SMTP id c15so483480ils.12
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 04:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=k4JsESKxobET02ZzvlXD+tt4H2vZnfWs1jld1UQmuok=;
 b=mWvKkV/7CJutvXBTq3mZ37imh0pLfyeRs0sNbumI8MmwgttTF2iK+VCmJZupWA22Sa
 2/9ocJ0mbjo6jKSuXRf/buKzAqlb/K7PVQGlGRi4vPg38HuXfy7koZavdFi92W7WFrBM
 +HGFQM5LBJfG21ULs8brXQJk84DigTc+7x9vLX5m6sWcoGQ0gbgUS52oBly9BBLP9buf
 0lN5FadheSFYZzccP34Nw2Olk4q3kLkZsmIJdPj/JEiLAqT5WO5+BC6hcwDbzYT/qB6a
 55Di3IqFQnhS+rI0UpxdctvDANZMp1Z3G1WAhvvPn8ZKrsnOChWQNemVLA1wncDX7Z2K
 q3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k4JsESKxobET02ZzvlXD+tt4H2vZnfWs1jld1UQmuok=;
 b=lwOMKRkc7Vz3ZW/i/AceskgIfX12J1V3VBqt8cXowHtb0Rzu429VuVDmOVHp1LWdbl
 LyMgI6kbFmjNP4R+KDdyKvbct4ymgnHwzgzFUFU0NpfY0FWYNteUDTE/gKBDI4PrlZ6k
 DCi2fSM9LKntDdw6i7w3TR4kxFctkIkoYBcQeKmAIKg9/ceZxytMTUPEMO0L69LrKUW5
 vOB6F54457lqXLgqixUhKQj0y8GW9eANDG6yUplUBDcEidpQITkOcGvnLm6TB9OUb759
 TSv7YP3wXaWqLLbsatFg64zRIiA7hsKgn5vf8R0d5PdQGCK8irtL8DYAfZ2AAN7VXtl2
 rmkw==
X-Gm-Message-State: AO0yUKW4S+NVMJgdPSo4EiqLiE+FopToRHz6nZAdIasuVNC6LXEdbGZb
 kFrRyyOxIY9caQ8JGHo1/XugWg==
X-Google-Smtp-Source: AK7set81DMXgzw4u2gAZVvyUe800kRBP+xeQHX5LPFCcp9jsE+iCMgROHuyiuh9Q/SHC2EgDws/kyg==
X-Received: by 2002:a05:6e02:b4e:b0:314:925:e1d3 with SMTP id
 f14-20020a056e020b4e00b003140925e1d3mr5853169ilu.17.1676032530207; 
 Fri, 10 Feb 2023 04:35:30 -0800 (PST)
Received: from localhost (static-198-54-128-102.cust.tzulo.com.
 [198.54.128.102]) by smtp.gmail.com with ESMTPSA id
 a5-20020a056638018500b003c379d61e67sm1341602jaq.143.2023.02.10.04.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 04:35:29 -0800 (PST)
Date: Fri, 10 Feb 2023 07:35:26 -0500
From: Emilio Cota <cota@braap.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH 00/27] tcg: Simplify temporary usage
Message-ID: <Y+Y6Dt03hwfWLd5J@cota-l14>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
Received-SPF: softfail client-ip=2607:f8b0:4864:20::12f;
 envelope-from=cota@braap.org; helo=mail-il1-x12f.google.com
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

Hi Richard,

On Mon, Jan 30, 2023 at 10:59:07 -1000, Richard Henderson wrote:
(snip)
> With this, and by not recycling TEMP_LOCAL, we can get identical code
> out of the backend even when changing the front end translators are
> adjusted to use TEMP_LOCAL for everything.
> 
> Benchmarking one test case, qemu-arm linux-test, the new liveness pass
> comes in at about 1.6% on perf, but I can't see any difference in
> wall clock time before and after the patch set.

I ran yesterday linux-user SPEC06 benchmarks from your tcg-life branch.
I do see perf regressions for two workloads (sjeng and xalancbmk).
With perf(1) I see liveness_pass* are at 0.00%, so I wonder: is it
possible that the emitted code isn't quite the same?

Happy to run more tests if helpful. Results below.

Thanks,
		Emilio

- bar chart, png: https://postimg.cc/ZCTkbYS9
- bar chart, txt:

                                                       Speedup of tcg-life (de6361f6) over master (ae2b5d83)
                                                           Host: AMD Ryzen 7 PRO 5850U. Compiler: gcc12
  1.03 +----------------------------------------------------------------------------------------------------------------------------------------------------+
  1.02 |-+.............................................................................................|..................................................+-|
       |                                                                                               |                                                    |
  1.01 |-+.............................................................................................|..................................................+-|
     1 |-+.....**+-+*.....*+-+**......+-+...........................**+-+**..............**+-+**....***|**...............**+-+**..........................+-|
       |       *    *     *+-+ *    **+-+**      +-+       +-+      * +-+ *              *     *    *  | *               * +-+ *                +-+         |
  0.99 |-+.....*....*.....*....*....*.....*....***|**.....**|***....*.....*..............*.....*....*..|.*......+-+......*.....*...............*+-+**.....+-|
  0.98 |-+.....*....*.....*....*....*.....*....*.+-+*.....*+-+.*....*.....*....**+-+*....*.....*....*..|.*.......|.......*.....*...............*....*.....+-|
       |       *    *     *    *    *     *    *    *     *    *    *     *    * +-+*    *     *    * +-+*     **|***    *     *               *    *       |
  0.97 |-+.....*....*.....*....*....*.....*....*....*.....*....*....*.....*....*....*....*.....*....*....*.....*.|..*....*.....*......+-+......*....*.....+-|
  0.96 |-+.....*....*.....*....*....*.....*....*....*.....*....*....*.....*....*....*....*.....*....*....*.....*+-+.*....*.....*.......|.......*....*.....+-|
       |       *    *     *    *    *     *    *    *     *    *    *     *    *    *    *     *    *    *     *    *    *     *    ***|**     *    *       |
  0.95 |-+.....*....*.....*....*....*.....*....*....*.....*....*....*.....*....*....*....*.....*....*....*.....*....*....*.....*....*.+-+*.....*....*.....+-|
  0.94 +----------------------------------------------------------------------------------------------------------------------------------------------------+
     400.perlbench 401.bzip2    403.gcc    429.mcf 445.gobmk  456.hmmer  458.s462.libquantum464.h264re471.omnetpp  473.ast483.xalancbmk   geomean

- Raw data for the bar chart:

  + baseline:
# benchmark	mean	stdev	raw
400.perlbench	94.4343747333333	0.331828752549838	94.131272,94.421923,94.34074,94.747239,94.982504,94.602928,93.743109,94.077325,94.220688,94.505739,94.598781,94.779386,94.177626,94.811701,94.37466
401.bzip2	83.0563643333333	0.270338451882521	83.603378,82.784967,82.766427,83.703505,83.018864,82.859924,83.128875,83.052816,82.921046,82.809962,83.027326,83.122502,83.099782,83.005817,82.940274
403.gcc	2.8751204	0.0183794528241263	2.872445,2.886974,2.884226,2.877824,2.871482,2.927202,2.864385,2.86503,2.855154,2.856129,2.86079,2.861818,2.887109,2.867046,2.889192
429.mcf	13.527965	0.0849965442919382	13.498908,13.494126,13.469952,13.606229,13.604864,13.513806,13.472737,13.572454,13.407602,13.70441,13.487249,13.562176,13.503575,13.39053,13.630857
445.gobmk	279.017610333333	1.91925368167126	279.808944,278.057813,278.831984,279.388752,276.801944,280.078062,278.675088,277.094009,279.452037,278.832294,278.843473,279.407613,275.879438,284.430909,279.681795
456.hmmer	103.296133533333	0.38166706019324	103.33233,102.944119,103.083766,103.001765,104.302275,103.329573,103.720265,103.537909,102.931565,103.008669,102.974703,103.5448,103.484963,102.958228,103.287073
458.sjeng	332.387649666667	0.868297133920158	331.71233,333.413204,333.367836,332.57489,331.818019,331.14369,333.848697,333.135605,332.878587,332.069454,332.003468,332.692292,331.01894,331.426129,332.711604
462.libquantum	4.12260253333333	0.00508688019554322	4.121422,4.116031,4.131564,4.113532,4.117144,4.124039,4.128896,4.118079,4.121929,4.124027,4.125302,4.124549,4.119102,4.125368,4.128054
464.h264ref	244.092639533333	13.3464074285764	239.569243,240.187437,240.760271,241.483515,240.772044,241.492141,240.530232,240.449723,240.679955,240.464527,241.3703,292.302111,240.254072,240.490477,240.583545
471.omnetpp	261.340260533333	3.7694119109844	263.463533,259.640839,260.834291,263.816131,256.877675,259.833289,258.708458,261.868763,260.75424,265.656161,257.900388,265.734187,256.747515,270.004887,258.263551
473.astar	142.966170866667	0.481395129184935	142.636087,142.675786,141.895549,143.236359,142.892086,142.325069,143.267024,143.910479,143.279771,142.666683,143.11241,143.15343,143.041394,143.391831,143.008605
483.xalancbmk	401.605619866667	3.99007996364547	401.101824,400.266261,396.474675,406.136427,404.400767,406.339383,397.442574,409.241015,399.084079,399.828507,402.585078,394.89061,404.722299,401.654323,399.916476

  + tcg-life:
# benchmark	mean	stdev	raw
400.perlbench	94.1968828666667	0.352661861692484	94.726037,94.169276,93.893696,94.224617,94.613626,94.471446,94.198829,94.616742,93.845426,93.435601,94.040449,94.574709,94.105065,94.007179,94.030545
401.bzip2	83.0027554666667	0.214192109333076	83.181646,83.299212,83.342217,82.848151,82.808142,82.888099,82.942223,82.777883,82.739787,82.770313,83.01728,83.327844,83.201232,82.905666,82.991637
403.gcc	2.87870153333333	0.0304401106926527	2.860922,2.867219,2.860457,2.888637,2.879031,2.87397,2.882131,2.896422,2.865079,2.870739,2.847357,2.864518,2.901592,2.849287,2.973162
429.mcf	13.6952006666667	0.155876459519191	13.734646,13.746608,13.528171,13.577692,13.534005,13.65201,13.947822,13.541465,13.710553,13.787918,13.521862,13.997184,13.546621,13.848357,13.753096
445.gobmk	282.1855452	1.68500895181812	281.715494,282.875207,282.073035,281.660872,281.96679,278.912804,281.078281,283.777396,283.485664,278.564193,283.900278,283.662609,282.781748,284.176339,282.152468
456.hmmer	103.3804904	0.554303069916862	103.077106,103.013059,103.247046,105.192431,103.221722,102.99502,103.787524,103.086281,103.213953,103.048905,103.042041,103.664296,103.278652,103.445109,103.394211
458.sjeng	339.3596132	3.77963378278808	341.545293,341.249426,336.87165,343.192545,338.087093,339.691087,337.29754,341.586473,336.838538,345.476397,339.196873,342.773593,337.546389,329.312139,339.729162
462.libquantum	4.1225128	0.00546800475754836	4.112292,4.119043,4.119803,4.129127,4.117612,4.122837,4.120172,4.121449,4.127452,4.113505,4.129305,4.128303,4.126079,4.127113,4.1236
464.h264ref	243.447219066667	0.924288945630674	241.71547,242.724405,242.751474,243.730945,243.889673,243.254516,244.328523,244.374465,243.447008,245.45696,243.256098,242.348791,243.440131,242.895642,244.094185
471.omnetpp	268.2971082	5.67916415832786	271.509491,273.656661,274.294363,266.501929,272.7864,267.868119,271.032049,267.085038,256.124737,270.430985,271.586944,256.427087,268.23723,264.012334,272.903256
473.astar	142.842279266667	0.482819143874435	142.820726,142.742386,143.237814,143.241978,142.761549,142.026643,143.042933,142.849644,143.035134,142.150158,142.066603,143.086841,143.701693,142.553374,143.316713
483.xalancbmk	420.324755133333	8.22679014442942	424.925688,433.128404,415.710656,423.156208,428.067657,426.100068,429.6215,412.083569,411.921022,410.749722,407.134107,414.478705,416.110115,430.104758,421.579148

I then ran perf record on xalancbmk before/after:

$ time for suffix in gcc12; do for tag in tcg-life-baseline tcg-life; do perf record -o /tmp/$tag-$suffix.perf.data -k 1 taskset -c 2 ./spec06.pl --iterations=1 --size=train --config=aarch64 --show-raw run ~/src/dbt-bench/out/$tag-$suffix/bin/qemu-aarch64 ~/src/spec/spec06-aarch64 xalancbmk; done; done
483.xalancbmk (#1/1)
run_base_train_aarch64.0068.qemu-aarch64: qemu-aarch64 Xalan_base.aarch64   -v allbooks.xml xalanc.xsl:         410.191153s

# benchmark     mean    stdev   raw
483.xalancbmk   410.191153      0       410.191153
[ perf record: Woken up 251 times to write data ]
[ perf record: Captured and wrote 62.629 MB /tmp/tcg-life-baseline-gcc12.perf.data (1641030 samples) ]
483.xalancbmk (#1/1)
run_base_train_aarch64.0069.qemu-aarch64: qemu-aarch64 Xalan_base.aarch64   -v allbooks.xml xalanc.xsl:         464.428108s

# benchmark     mean    stdev   raw
483.xalancbmk   464.428108      0       464.428108
[ perf record: Woken up 284 times to write data ]
[ perf record: Captured and wrote 70.905 MB /tmp/tcg-life-gcc12.perf.data (1857959 samples) ]

real    14m35.863s
user    14m34.897s
sys     0m0.925s

- perf report (baseline):
# Total Lost Samples: 0
#
# Samples: 1M of event 'cycles'
# Event count (approx.): 1797955092780
#
# Overhead  Command       Shared Object            Symbol                                      
# ........  ............  .......................  ............................................
#
    43.83%  qemu-aarch64  qemu-aarch64             [.] helper_lookup_tb_ptr
     5.56%  qemu-aarch64  qemu-aarch64             [.] cpu_get_tb_cpu_state
     2.23%  qemu-aarch64  qemu-aarch64             [.] qht_lookup_custom
     1.57%  qemu-aarch64  qemu-aarch64             [.] tb_htable_lookup
     1.29%  qemu-aarch64  qemu-aarch64             [.] tb_lookup_cmp
     0.72%  qemu-aarch64  qemu-aarch64             [.] interval_tree_iter_first
     0.28%  qemu-aarch64  qemu-aarch64             [.] helper_vfp_cmpd_a64
     0.27%  qemu-aarch64  [JIT] tid 561758         [.] 0x00007f79244b2a43
     0.24%  qemu-aarch64  [JIT] tid 561758         [.] 0x00007f792449c058
     0.20%  qemu-aarch64  qemu-aarch64             [.] page_get_flags
     0.20%  qemu-aarch64  [JIT] tid 561758         [.] 0x00007f7924349c22
     0.19%  qemu-aarch64  [JIT] tid 561758         [.] 0x00007f7924349c40
     0.18%  qemu-aarch64  [JIT] tid 561758         [.] 0x00007f7924349203
     0.17%  qemu-aarch64  [JIT] tid 561758         [.] 0x00007f7923e09b03
     0.17%  qemu-aarch64  qemu-aarch64             [.] helper_vfp_cmped_a64
     0.15%  qemu-aarch64  [JIT] tid 561758         [.] 0x00007f7923e9f965
     0.15%  qemu-aarch64  [JIT] tid 561758         [.] 0x00007f7924552f2b
     0.15%  qemu-aarch64  qemu-aarch64             [.] float64_hs_compare
     0.14%  qemu-aarch64  [JIT] tid 561758         [.] 0x00007f79244f7003
     0.14%  qemu-aarch64  [JIT] tid 561758         [.] 0x00007f7924552a03
     0.14%  qemu-aarch64  [JIT] tid 561758         [.] 0x00007f7924349243
     0.14%  qemu-aarch64  [JIT] tid 561758         [.] 0x00007f7924546df6
     0.13%  qemu-aarch64  qemu-aarch64             [.] get_page_addr_code_hostp
     0.12%  qemu-aarch64  [JIT] tid 561758         [.] 0x00007f792454de7b
     0.12%  qemu-aarch64  [JIT] tid 561758         [.] 0x00007f7924555a85
     0.12%  qemu-aarch64  [JIT] tid 561758         [.] 0x00007f792454f465
     0.12%  qemu-aarch64  qemu-aarch64             [.] float64_add
     0.12%  qemu-aarch64  [JIT] tid 561758         [.] 0x00007f792439af03
     0.11%  qemu-aarch64  [JIT] tid 561758         [.] 0x00007f7924554b43
     [...]
     0.00%  qemu-aarch64  qemu-aarch64             [.] liveness_pass_1

- perf report (tcg-life):
# Total Lost Samples: 0
#
# Samples: 1M of event 'cycles'
# Event count (approx.): 2035140825489
#
# Overhead  Command       Shared Object            Symbol                                      
# ........  ............  .......................  ............................................
#
    43.00%  qemu-aarch64  qemu-aarch64             [.] helper_lookup_tb_ptr
     5.73%  qemu-aarch64  qemu-aarch64             [.] cpu_get_tb_cpu_state
     2.16%  qemu-aarch64  qemu-aarch64             [.] qht_lookup_custom
     1.58%  qemu-aarch64  qemu-aarch64             [.] tb_htable_lookup
     1.10%  qemu-aarch64  qemu-aarch64             [.] tb_lookup_cmp
     0.40%  qemu-aarch64  qemu-aarch64             [.] interval_tree_iter_first
     0.26%  qemu-aarch64  [JIT] tid 562312         [.] 0x00007fdeb37d4018
     0.25%  qemu-aarch64  qemu-aarch64             [.] helper_vfp_cmpd_a64
     0.22%  qemu-aarch64  [JIT] tid 562312         [.] 0x00007fdeb387ecb6
     0.21%  qemu-aarch64  qemu-aarch64             [.] page_get_flags
     0.19%  qemu-aarch64  [JIT] tid 562312         [.] 0x00007fdeb3141b03
     0.17%  qemu-aarch64  [JIT] tid 562312         [.] 0x00007fdeb3681d62
     0.16%  qemu-aarch64  [JIT] tid 562312         [.] 0x00007fdeb388ae2b
     0.16%  qemu-aarch64  [JIT] tid 562312         [.] 0x00007fdeb37ea9c3
     0.16%  qemu-aarch64  qemu-aarch64             [.] helper_vfp_cmped_a64
     0.15%  qemu-aarch64  qemu-aarch64             [.] get_page_addr_code_hostp
     0.15%  qemu-aarch64  [JIT] tid 562312         [.] 0x00007fdeb3887325
     0.15%  qemu-aarch64  [JIT] tid 562312         [.] 0x00007fdeb389ddc3
     0.14%  qemu-aarch64  [JIT] tid 562312         [.] 0x00007fdeb3681d80
     0.14%  qemu-aarch64  qemu-aarch64             [.] float64_hs_compare
     0.13%  qemu-aarch64  [JIT] tid 562312         [.] 0x00007fdeb36d2f83
     0.12%  qemu-aarch64  [JIT] tid 562312         [.] 0x00007fdeb3885b65
     0.12%  qemu-aarch64  [JIT] tid 562312         [.] 0x00007fdeb37eab43
     0.12%  qemu-aarch64  [JIT] tid 562312         [.] 0x00007fdeb388a903
     0.12%  qemu-aarch64  [JIT] tid 562312         [.] 0x00007fdeb31d7925
     0.11%  qemu-aarch64  qemu-aarch64             [.] parts64_float_to_sint
     0.11%  qemu-aarch64  [JIT] tid 562312         [.] 0x00007fdeb3885d3b
     0.11%  qemu-aarch64  [JIT] tid 562312         [.] 0x00007fdeb3681383
     0.11%  qemu-aarch64  [JIT] tid 562312         [.] 0x00007fdeb388a683
     [...]
     0.00%  qemu-aarch64  qemu-aarch64             [.] liveness_pass_1
     0.00%  qemu-aarch64  qemu-aarch64             [.] liveness_pass_0


