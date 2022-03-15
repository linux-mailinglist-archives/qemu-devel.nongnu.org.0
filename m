Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1084D9785
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 10:20:03 +0100 (CET)
Received: from localhost ([::1]:44314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU3LW-00005L-6y
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 05:20:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nU31s-0006q9-5j
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:59:45 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:34187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nU31o-0007Rt-G3
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:59:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.250])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id BA41223BEC;
 Tue, 15 Mar 2022 08:59:36 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 15 Mar
 2022 09:59:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0044854ad77-95e7-412f-8b16-d36e0a6a28f1,
 5DBA5639B77BD7FE35D3F16CFE7686729AB21D01) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5310d336-2267-f505-3d09-e9e16c91b211@kaod.org>
Date: Tue, 15 Mar 2022 09:59:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 0/2] hw: aspeed_scu: Add AST2600 hpll calculation
 function
Content-Language: en-US
To: Steven Lee <steven_lee@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220315075753.8591-1-steven_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220315075753.8591-1-steven_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 141652f0-9d91-40cc-900f-42117088ccbc
X-Ovh-Tracer-Id: 6158391016882932588
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvledguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgffdtueeftddthffgfeevfeejfeeivdfhhfeggeegleejjeeggfejhffhheffkeenucffohhmrghinheprhgvrgguthhhvgguohgtshdrihhonecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: troy_lee@aspeedtech.com, jamin_lin@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 08:57, Steven Lee wrote:
> AST2600's HPLL register offset and bit definition are different from AST2500.
> The patch series adds a hpll calculation function for ast2600 and modify apb frequency
> calculation function based on SCU200 register description and note in ast2600v11.pdf.
> 
> Changes since v1:
> - introduce ast2400 and ast2600 get_apb_freq class handlers.
> - introduce clkin_25Mhz attribute.
> 

Looks good. They are queued for QEMU 7.1.

Something I never had time to look at is the clock hierarchy in QEMU
Aspeed machines :

   https://qemu.readthedocs.io/en/latest/devel/clocks.html

It would be very useful to start the tree with clkin and the obvious
derived clocks.

Thanks,

C.

# cat  /sys/kernel/debug/clk/clk_summary
                                  enable  prepare  protect                                duty  hardware
    clock                          count    count    count        rate   accuracy phase  cycle    enable
-------------------------------------------------------------------------------------------------------
  fsiclk-gate                          1        1        0           0          0     0  50000         Y
  i3cclk-gate                          0        0        0           0          0     0  50000         N
  emmcclk-gate                         1        1        0           0          0     0  50000         Y
  sdclk-gate                           1        1        0           0          0     0  50000         Y
  rvasclk-gate                         0        0        0           0          0     0  50000         N
  rsaclk-gate                          0        0        0           0          0     0  50000         N
  usb-port2-gate                       1        1        0           0          0     0  50000         Y
  usb-port1-gate                       1        1        0           0          0     0  50000         Y
  usb-uhci-gate                        1        1        0           0          0     0  50000         Y
  espiclk-gate                         0        0        0           0          0     0  50000         N
  yclk-gate                            0        0        0           0          0     0  50000         N
  lclk-gate                            0        0        0           0          0     0  50000         N
  dclk-gate                            1        1        0           0          0     0  50000         Y
  vclk-gate                            0        0        0           0          0     0  50000         N
  gclk-gate                            0        0        0           0          0     0  50000         N
  eclk                                 0        0        0           0          0     0  50000         Y
     eclk-gate                         0        0        0           0          0     0  50000         N
  uartx                                0        0        0     1846153          0     0  50000         Y
     uart13clk-gate                    0        0        0     1846153          0     0  50000         N
     uart12clk-gate                    0        0        0     1846153          0     0  50000         N
     uart11clk-gate                    0        0        0     1846153          0     0  50000         N
     uart10clk-gate                    0        0        0     1846153          0     0  50000         N
     uart9clk-gate                     0        0        0     1846153          0     0  50000         N
     uart8clk-gate                     0        0        0     1846153          0     0  50000         N
     uart7clk-gate                     0        0        0     1846153          0     0  50000         N
     uart6clk-gate                     0        0        0     1846153          0     0  50000         N
  uart                                 1        1        0    24000000          0     0  50000         Y
     uart5clk-gate                     1        1        0    24000000          0     0  50000         Y
     uart4clk-gate                     0        0        0    24000000          0     0  50000         N
     uart3clk-gate                     0        0        0    24000000          0     0  50000         N
     uart2clk-gate                     0        0        0    24000000          0     0  50000         N
     uart1clk-gate                     0        0        0    24000000          0     0  50000         N
  usb-phy-40m                          0        0        0    40000000          0     0  50000         Y
  clkin                                4        4        0    25000000          0     0  50000         Y
     ref1clk-gate                      1        1        0    25000000          0     0  50000         Y
     ref0clk-gate                      1        1        0    25000000          0     0  50000         Y
     apll                              0        0        0   800000000          0     0  50000         Y
     epll                              0        0        0  1000000000          0     0  50000         Y
     dpll                              0        0        0    50000000          0     0  50000         Y
        vclk                           0        0        0    50000000          0     0  50000         Y
     mpll                              2        2        0   400000000          0     0  50000         Y
        mclk-gate                      1        1        0   400000000          0     0  50000         Y
        emmc_extclk_mux                1        1        0   400000000          0     0  50000         Y
           emmc_extclk_gate            1        1        0   400000000          0     0  50000         Y
              emmc_extclk              1        1        0   200000000          0     0  50000         Y
     hpll                              4        4        0  1200000000          0     0  50000         Y
        bclk                           1        1        0   150000000          0     0  50000         Y
           bclk-gate                   1        1        0   150000000          0     0  50000         Y
        lhclk                          0        0        0   150000000          0     0  50000         Y
           lhclk-gate                  0        0        0   150000000          0     0  50000         N
        mac34                          2        2        0   300000000          0     0  50000         Y
           mac4clk-gate                1        1        0   300000000          0     0  50000         Y
           mac3clk-gate                1        1        0   300000000          0     0  50000         Y
        mac12                          2        2        0   200000000          0     0  50000         Y
           mac2clk-gate                1        1        0   200000000          0     0  50000         Y
           mac1clk-gate                1        1        0   200000000          0     0  50000         Y
        mac12rclk                      0        0        0    50000000          0     0  50000         Y
           mac2rclk                    0        0        0    50000000          0     0  50000         N
           mac1rclk                    0        0        0    50000000          0     0  50000         N
        sd_extclk_gate                 0        0        0  1200000000          0     0  50000         N
           sd_extclk                   0        0        0   150000000          0     0  50000         Y
        emmc_extclk_hpll_in            0        0        0   600000000          0     0  50000         Y
        apb1                           0        0        0    37500000          0     0  50000         Y
        ahb                            3        3        0   200000000          0     0  50000         Y
           i3cclk                      0        0        0   200000000          0     0  50000         Y
              i3c6clk-gate             0        0        0   200000000          0     0  50000         N
              i3c5clk-gate             0        0        0   200000000          0     0  50000         N
              i3c4clk-gate             0        0        0   200000000          0     0  50000         N
              i3c3clk-gate             0        0        0   200000000          0     0  50000         N
              i3c2clk-gate             0        0        0   200000000          0     0  50000         N
              i3c1clk-gate             0        0        0   200000000          0     0  50000         N
              i3c0clk-gate             0        0        0   200000000          0     0  50000         N
           apb2                        0        0        0   100000000          0     0  50000         Y
  d1clk                                0        0        0           0          0     0  50000         Y
     d1clk-gate                        0        0        0           0          0     0  50000         N
  mac34rclk                            0        0        0           0          0     0  50000         Y
     mac4rclk                          0        0        0    50000000          0     0  50000         N
     mac3rclk                          0        0        0    50000000          0     0  50000         N


