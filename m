Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A745616CD
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 11:51:18 +0200 (CEST)
Received: from localhost ([::1]:54386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6qpR-0002TW-8z
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 05:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6qnp-0001UP-Ki
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 05:49:37 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6qnn-0005bi-BP
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 05:49:37 -0400
Received: by mail-wm1-x333.google.com with SMTP id m184so10977038wme.1
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 02:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=OX4iRhi+Gc70+IzQtwkkJaCKlk8+XuLJtyedp1I4+KI=;
 b=KZpsSjy6psajUIgQsDIkrLO0JdyiE3Zc6Z4jZVem8P4OgLLic2/7a5vdsoIN/sozid
 ibvVrjyi6XDznAUF0SE9WiEa9ZqzqV+oMEGQtj63AfITXoPKVCl6DWEIf6xNLwMXt6xW
 P8eWZ3dY2HUrM9aImDwT98mQFWs343k9FHQsZkJXYPookdtWCg7Jp/Yi4f0NN17gWT9q
 +jsZ1gycBmliz0XI72jrdyN7tJ48ROnDWrkhSeuw/kuTm3iwLMV4FwiZi69rq/TdJah/
 1Cnl7sTpTZV1yuT6xBMYeNlIGOiqpaMEEzgdToruK/mKE0zVyhHdjQvWbofHrY1Ph2WJ
 1vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=OX4iRhi+Gc70+IzQtwkkJaCKlk8+XuLJtyedp1I4+KI=;
 b=MBIdE5d/EZeyWhRzB2QE/lJr7fX8UQDDvv51Xe99arij+CT2o6irOoHdcWUuCID7+M
 4d/0NsR1iw+xrQpKo87+SjmXV+9zvSlDKcBpyZYmV3NY0jbwaGl7qhiWmbdxJEHSBEMC
 kfulq/aVqeIsD9P45E8nKHJKCg0hSP+Ii3mwyH+PkYMXDcd4rPhBLek/AfmhNlASv/Jy
 HbLtbMBQaIhBs5u9Gj4fgctMClFSjKnLqTAs4D9YycDT5jVU6sKQAWvh/bgqBbnnyv48
 o5cVCSETprjVgx4xIuhU4NF1IblMIbIqkqPHEYBO5wasDxMFRoEqqHfWC1QeymakmMZ9
 JhWA==
X-Gm-Message-State: AJIora+NXvhzz1y0NMslscUosbGwZo2Ez3mtJDL9/Yr4M/Qqz2YRKhwy
 W+949AjyCd8+OXFaux1bPfOPzg==
X-Google-Smtp-Source: AGRyM1uvO10XBOPxYKRW6QpPauzT8A9t4qJLr3CCOhzMljizSzjOpv+2Old7SSoAHknF9ahOueIMzA==
X-Received: by 2002:a05:600c:2051:b0:3a0:3c58:6ff6 with SMTP id
 p17-20020a05600c205100b003a03c586ff6mr10653903wmg.98.1656582573566; 
 Thu, 30 Jun 2022 02:49:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c204f00b0039c5cecf206sm6048192wmg.4.2022.06.30.02.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 02:49:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 733441FFB7;
 Thu, 30 Jun 2022 10:49:31 +0100 (BST)
References: <20220623102617.2164175-1-pdel@fb.com>
 <20220623102617.2164175-13-pdel@fb.com>
 <e5f51f14-fe75-0d55-6588-a3ca2565f760@kaod.org>
 <EC44C0BD-7BC0-4BDE-9A41-CB1EAA90EC87@fb.com>
 <e07ec4fe-6968-b19a-e649-298a9aaccba5@kaod.org>
 <07128acf-329a-f372-c48c-0c3cb498d3d0@kaod.org>
 <87zghvh7rt.fsf@linaro.org>
 <8072cd96-a032-55f2-0417-1989a7bbeca0@kaod.org>
 <87edz7gwff.fsf@linaro.org>
 <a35ac443-c93e-fb2b-6da9-2a3dc16f7d8c@kaod.org>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Peter Delevoryas <pdel@fb.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "eduardo@habkost.net"
 <eduardo@habkost.net>, "marcel.apfelbaum@gmail.com"
 <marcel.apfelbaum@gmail.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
 "ani@anisinha.ca" <ani@anisinha.ca>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH 12/14] aspeed: Make aspeed_board_init_flashes public
Date: Thu, 30 Jun 2022 10:43:31 +0100
In-reply-to: <a35ac443-c93e-fb2b-6da9-2a3dc16f7d8c@kaod.org>
Message-ID: <87a69uh45w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 6/29/22 20:24, Alex Benn=C3=A9e wrote:
>> C=C3=A9dric Le Goater <clg@kaod.org> writes:
>>=20
>>> On 6/29/22 16:14, Alex Benn=C3=A9e wrote:
>>>> C=C3=A9dric Le Goater <clg@kaod.org> writes:
>>>>
>>>>> On 6/24/22 18:50, C=C3=A9dric Le Goater wrote:
>>>>>> On 6/23/22 20:43, Peter Delevoryas wrote:
>>>>>>>
>>>>>>>
>>>>>>>> On Jun 23, 2022, at 8:09 AM, C=C3=A9dric Le Goater <clg@kaod.org> =
wrote:
>>>>>>>>
>>>>>>>> On 6/23/22 12:26, Peter Delevoryas wrote:
>>>>>>>>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>>>>>>>>
>>>>>>>> Let's start simple without flash support. We should be able to
>>>>>>>> load FW blobs in each CPU address space using loader devices.
>>>>>>>
>>>>>>> Actually, I was unable to do this, perhaps because the fb OpenBMC
>>>>>>> boot sequence is a little weird. I specifically _needed_ to have
>>>>>>> a flash device which maps the firmware in at 0x2000_0000, because
>>>>>>> the fb OpenBMC U-Boot SPL jumps to that address to start executing
>>>>>>> from flash? I think this is also why fb OpenBMC machines can be so =
slow.
>>>>>>>
>>>>>>> $ ./build/qemu-system-arm -machine fby35 \
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0 -device loader,file=3Dfby35.mtd,addr=3D0=
,cpu-num=3D0 -nographic \
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0 -d int -drive file=3Dfby35.mtd,format=3D=
raw,if=3Dmtd
>>>>>> Ideally we should be booting from the flash device directly using
>>>>>> the machine option '-M ast2600-evb,execute-in-place=3Dtrue' like HW
>>>>>> does. Instructions are fetched using SPI transfers. But the amount
>>>>>> of code generated is tremendous.
>>>> Yeah because there is a potential race when reading from HW so we
>>>> throw
>>>> away TB's after executing them because we have no way of knowing if it
>>>> has changed under our feet. See 873d64ac30 (accel/tcg: re-factor non-R=
AM
>>>> execution code) which cleaned up this handling.
>>>>
>>>>>> See some profiling below for a
>>>>>> run which barely reaches DRAM training in U-Boot.
>>>>>
>>>>> Some more profiling on both ast2500 and ast2600 machines shows :
>>>>>
>>>>>
>>>>> * ast2600-evb,execute-in-place=3Dtrue :
>>>>>
>>>>> Type               Object  Call site                Wait Time (s)    =
     Count  Average (us)
>>>>> ---------------------------------------------------------------------=
------------------------
>>>>> BQL mutex  0x564dc03922e0  accel/tcg/cputlb.c:1365       14.21443
>>>>> 32909927          0.43
>>>> This is unavoidable as a HW access needs the BQL held so we will go
>>>> through this cycle every executed instruction.
>>>> Did I miss why the flash contents are not mapped into the physical
>>>> address space? Isn't that how it appear to the processor?
>>>
>>>
>>> There are two modes :
>>>            if (ASPEED_MACHINE(machine)->mmio_exec) {
>>>              memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
>>>                                       &fl->mmio, 0, size);
>>>              memory_region_add_subregion(get_system_memory(), FIRMWARE_=
ADDR,
>>>                                          boot_rom);
>>>          } else {
>>>              memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
>>>                                     size, &error_abort);
>>>              memory_region_add_subregion(get_system_memory(), FIRMWARE_=
ADDR,
>>>                                          boot_rom);
>>>              write_boot_rom(drive0, FIRMWARE_ADDR, size, &error_abort);
>>>          }
>>>
>>> The default boot mode uses the ROM. No issue.
>>>
>>> The "execute-in-place=3Dtrue" option creates an alias on the region of
>>> the flash contents and each instruction is then fetched from the flash
>>> drive with SPI transactions.

I wonder if we were keeping the code before?

>>>
>>> With old FW images, using an older U-boot, the machine boots in a couple
>>> of seconds. See the profiling below for a witherspoon-bmc machine using
>>> U-Boot 2016.07.
>>>
>>>    qemu-system-arm -M witherspoon-bmc,execute-in-place=3Dtrue  -drive f=
ile=3D./flash-witherspoon-bmc,format=3Draw,if=3Dmtd -drive file=3D./flash-w=
itherspoon-bmc2,format=3Draw,if=3Dmtd -nographic -nodefaults -snapshot -ser=
ial mon:stdio -enable-sync-profile
>>>    ...
>>>    U-Boot 2016.07-00040-g8425e96e2e27-dirty (Jun 24 2022 - 23:21:57 +02=
00)
>>>              Watchdog enabled
>>>    DRAM:  496 MiB
>>>    Flash: 32 MiB
>>>    In:    serial
>>>    Out:   serial
>>>    Err:   serial
>>>    Net:
>>>    (qemu) info sync-profile
>>>    Type               Object  Call site                Wait Time (s)   =
      Count  Average (us)
>>>    --------------------------------------------------------------------=
-------------------------
>>>    BQL mutex  0x56189610b2e0  accel/tcg/cputlb.c:1365        0.25311   =
   12346237          0.02
>>>    condvar    0x5618970cf220  softmmu/cpus.c:423             0.05506   =
          2      27530.78
>>>    BQL mutex  0x56189610b2e0  util/rcu.c:269                 0.04709   =
          2      23544.26
>>>    condvar    0x561896d0fc78  util/thread-pool.c:90          0.01340   =
         83        161.47
>>>    condvar    0x56189610b240  softmmu/cpus.c:571             0.00005   =
          1         54.93
>>>    condvar    0x56189610b280  softmmu/cpus.c:642             0.00003   =
          1         32.88
>>>    BQL mutex  0x56189610b2e0  util/main-loop.c:318           0.00003   =
         34          0.76
>>>    mutex      0x561896eade00  tcg/region.c:204               0.00002   =
        995          0.02
>>>    rec_mutex  [           2]  util/async.c:682               0.00002   =
        493          0.03
>>>    mutex      [           2]  chardev/char.c:118             0.00001   =
        404          0.03
>>>    --------------------------------------------------------------------=
-------------------------
>>>
>>>
>>> However, with recent U-boots, it takes quite a while to reach DRAM trai=
ning.
>>> Close to a minute. See the profiling below for an ast2500-evb machine u=
sing
>>> U-Boot 2019.04.
>>>
>>>   qemu-system-arm -M ast2500-evb,execute-in-place=3Dtrue  -net nic,maca=
ddr=3DC0:FF:EE:00:00:03,netdev=3Dnet0  -drive file=3D./flash-ast2500-evb,fo=
rmat=3Draw,if=3Dmtd  -nographic -nodefaults -snapshot -serial mon:stdio  -e=
nable-sync-profile
>>>    qemu-system-arm: warning: Aspeed iBT has no chardev backend
>>>    qemu-system-arm: warning: nic ftgmac100.1 has no peer
>>>    QEMU 7.0.50 monitor - type 'help' for more information
>>>       U-Boot 2019.04-00080-g6ca27db3f97b-dirty (Jun 24 2022 - 23:22:03
>>>      +0200)
>>>       SOC : AST2500-A1
>>>    RST : Power On
>>>    LPC Mode : SIO:Enable : SuperIO-2e
>>>    Eth : MAC0: RGMII, , MAC1: RGMII,
>>>    Model: AST2500 EVB
>>>    DRAM:  448 MiB (capacity:512 MiB, VGA:64 MiB, ECC:off)
>>>    MMC:   sdhci_slot0@100: 0, sdhci_slot1@200: 1
>>>    Loading Environment from SPI Flash... SF: Detected mx25l25635e with =
page size 256 Bytes, erase size 64 KiB, total 32 MiB
>>>    *** Warning - bad CRC, using default environment
>>>       In:    serial@1e784000
>>>    Out:   serial@1e784000
>>>    Err:   serial@1e784000
>>>    Net:   eth0: ethernet@1e660000
>>>    Warning: ethernet@1e680000 (eth1) using random MAC address - 4a:e5:9=
a:4a:c7:c5
>>>    , eth1: ethernet@1e680000
>>>    Hit any key to stop autoboot:  2
>>>    (qemu) info sync-profile
>>>    Type               Object  Call site                Wait Time (s)   =
      Count  Average (us)
>>>    --------------------------------------------------------------------=
-------------------------
>>>    condvar    0x561f10c9ef88  util/thread-pool.c:90         10.01196   =
         28     357570.00
>>>    BQL mutex  0x561f102362e0  accel/tcg/cputlb.c:1365        0.29496   =
   14248621          0.02
>>>    condvar    0x561f110325a0  softmmu/cpus.c:423             0.02231   =
          2      11152.57
>>>    BQL mutex  0x561f102362e0  util/rcu.c:269                 0.01447   =
          4       3618.60
>>>    condvar    0x561f10236240  softmmu/cpus.c:571             0.00010   =
          1        102.19
>>>    mutex      0x561f10e9f1c0  tcg/region.c:204               0.00007   =
       3052          0.02
>>>    mutex      [           2]  chardev/char.c:118             0.00003   =
       1486          0.02
>>>    condvar    0x561f10236280  softmmu/cpus.c:642             0.00003   =
          1         29.38
>>>    BQL mutex  0x561f102362e0  accel/tcg/cputlb.c:1426        0.00002   =
        973          0.02
>>>    BQL mutex  0x561f102362e0  util/main-loop.c:318           0.00001   =
         34          0.41
>>>    --------------------------------------------------------------------=
-------------------------
>>>    Something in the layout of the FW is making a big difference. One
>>> that could be relevant is that the recent versions are using a device
>>> tree.
>>>
>>> There might be no good solution to this issue but I fail to analyze
>>> it correctly. Is there a way to collect information on the usage of
>>> Translation Blocks ?
>> You could expand the data we collect in tb_tree_stats and expose it
>> via
>> info jit.
>
> The "fast" run, U-Boot 2016.07, gives :
>
>
>   Translation buffer state:
>   gen code size       254880371/1073736704
>   TB count            1089
>   TB avg target size  16 max=3D356 bytes
>   TB avg host size    278 bytes (expansion ratio: 17.2)
>   cross page TB count 0 (0%)
>   direct jump count   501 (46%) (2 jumps=3D372 34%)
>   TB hash buckets     1025/8192 (12.51% head buckets used)
>   TB hash occupancy   3.32% avg chain occ. Histogram: [0.0,7.5)%|=E2=96=
=88  =E2=96=81  =E2=96=81  =E2=96=81|[67.5,75.0]%
>   TB hash avg chain   1.000 buckets. Histogram: 1|=E2=96=88|1
>      Statistics:
>   TB flush count      0
>   TB invalidate count 0
>   TLB full flushes    0
>   TLB partial flushes 2
>   TLB elided flushes  2338
>   JIT cycles          2221788409 (0.926 s at 2.4 GHz)
>   translated TBs      738520 (aborted=3D0 0.0%)
>   avg ops/TB          15.7 max=3D459
>   deleted ops/TB      2.72
>   avg temps/TB        32.89 max=3D88
>   avg host code/TB    113.7
>   avg search data/TB  5.2
>   cycles/op           192.0
>   cycles/in byte      748.7
>   cycles/out byte     26.4
>   cycles/search byte     582.8
>     gen_interm time   57.6%
>     gen_code time     42.4%
>   optim./code time    19.4%
>   liveness/code time  26.1%
>   cpu_restore count   0
>     avg cycles        0.0
>   and the "slow", U-Boot 2019.04 :
>
> Translation buffer state:
> gen code size       368603795/1073736704
> TB count            3052
> TB avg target size  16 max=3D360 bytes
> TB avg host size    293 bytes (expansion ratio: 17.6)
> cross page TB count 0 (0%)
> direct jump count   1431 (46%) (2 jumps=3D1104 36%)
> TB hash buckets     2559/8192 (31.24% head buckets used)
> TB hash occupancy   9.31% avg chain occ. Histogram: [0,10)%|=E2=96=88 =E2=
=96=83  =E2=96=81 =E2=96=81 =E2=96=81|[90,100]%
> TB hash avg chain   1.000 buckets. Histogram: 1|=E2=96=88|1
>
> Statistics:
> TB flush count      3

Something triggers 3 complete TB flushes in the slow run (3x1000 ~ 3000
TBs). This can be the TB overflowing but:

fast: gen code size       254880371/1073736704
slow: gen code size       368603795/1073736704

doesn't look like we are getting close to overflowing. Must be something
else.

> TB invalidate count 0
> TLB full flushes    0
> TLB partial flushes 3
> TLB elided flushes  2367
> JIT cycles          26479044772 (11.033 s at 2.4 GHz)
> translated TBs      10552169 (aborted=3D0 0.0%)
> avg ops/TB          15.0 max=3D464
> deleted ops/TB      2.44
> avg temps/TB        32.43 max=3D89
> avg host code/TB    99.0
> avg search data/TB  5.0
> cycles/op           167.7
> cycles/in byte      626.8
> cycles/out byte     25.4
> cycles/search byte     499.4
>   gen_interm time   50.4%
>   gen_code time     49.6%
> optim./code time    19.5%
> liveness/code time  27.7%
> cpu_restore count   0
>   avg cycles        0.0
>
>
> A lot more TBs.
>   C.


--=20
Alex Benn=C3=A9e

