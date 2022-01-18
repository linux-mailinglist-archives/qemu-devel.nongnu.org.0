Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0A2492994
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 16:22:44 +0100 (CET)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9qJl-0004ht-Si
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 10:22:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>)
 id 1n9oYu-0000xd-3h; Tue, 18 Jan 2022 08:30:13 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:52250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>)
 id 1n9oYr-0004Ew-WB; Tue, 18 Jan 2022 08:30:11 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A35831F3B5;
 Tue, 18 Jan 2022 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642512603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxmpdeBrM6ctsnfl3X+Gfjpo9hYY9ZBWOQACPgZg2cI=;
 b=LjWQlCN7f+Ds0dV7DosplpCLsI7VITFOSO9q0KukFlrxQjLD6WrH1qri/9he46FdoqNBkw
 xGJ9vbyI40C/0ZNFC+8teZR1/d0ekzrX18PmPBnxVl/AWaQqgm6pkiCrIgyVHinHICiudu
 qSBCwoBXZD8mm1AlM0ajw5XjjcffIIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642512603;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxmpdeBrM6ctsnfl3X+Gfjpo9hYY9ZBWOQACPgZg2cI=;
 b=Y1Lxm2oU9SV0imxZVS93p4B3LIjg22WwiSQX+yjsVqV7d5hTkQ3bg+9pIb8uNApiVTSdcu
 ctOwfch6EFKJUDAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D01913AA1;
 Tue, 18 Jan 2022 13:30:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VM7pFNvA5mEIFwAAMHmgww
 (envelope-from <lizhang@suse.de>); Tue, 18 Jan 2022 13:30:03 +0000
Subject: Re: iotest 040, 041, intermittent failure in netbsd VM
To: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA-UKdcTROB7e3jO1qe=WCbuHRuX5WN7HZF2CcdMsmAt=g@mail.gmail.com>
 <YeU/YCUI59f33PBh@redhat.com>
 <CAFn=p-YDo8tTQ1Y8HgtQuCDv3i5EdFEX8-2BAjs-7L5q_b4=Gg@mail.gmail.com>
 <CAFEAcA_uBfCyJVq24p1jt5gaRmcMCZsjXae4y69QZ5dXpYX_Pg@mail.gmail.com>
 <CAFn=p-Zba+Ge6EckjRzkKsH4vU18RkspBaJvpSVE9H6gEU=r+Q@mail.gmail.com>
From: Li Zhang <lizhang@suse.de>
Message-ID: <6598f1de-dd7d-254d-9a60-2df7c9fe7396@suse.de>
Date: Tue, 18 Jan 2022 14:30:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFn=p-Zba+Ge6EckjRzkKsH4vU18RkspBaJvpSVE9H6gEU=r+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lizhang@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 12:08 AM, John Snow wrote:
> On Mon, Jan 17, 2022 at 3:49 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Mon, 17 Jan 2022 at 20:35, John Snow <jsnow@redhat.com> wrote:
>>
>>> Can you please try applying this temporary patch and running `./check
>>> -qcow2 040 041` until you see a breakage and show me the output from
>>> that?
>>
>> With this temporary patch the VM doesn't launch at all:
> 
> "Works for me", but I found out why.
> 
>>
>> peter.maydell@hackbox2.linaro.org:~/qemu-netbsd$ make -C build/
>> vm-build-netbsd J=8 V=1 2>&1 | tee netbsd.log
>> make: Entering directory '/home/peter.maydell/qemu-netbsd/build'
>> /usr/bin/python3 -B /home/peter.maydell/qemu-netbsd/meson/meson.py
>> introspect --targets --tests --benchmarks | /usr/bin/python3 -B
>> scripts/mtest2m
>> ake.py > Makefile.mtest
>> { \
>>    echo 'ninja-targets = \'; \
>>    /usr/bin/ninja -t targets all | sed 's/:.*//; $!s/$/ \\/'; \
>>    echo 'build-files = \'; \
>>    /usr/bin/ninja -t query build.ninja | sed -n '1,/^  input:/d; /^
>> outputs:/q; s/$/ \\/p'; \
>> } > Makefile.ninja.tmp && mv Makefile.ninja.tmp Makefile.ninja
>> (GIT="git" "/home/peter.maydell/qemu-netbsd/scripts/git-submodule.sh"
>> update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
>> tests/fp/berkeley-softfloat-3 dtc capstone slirp)
>> (GIT="git" "/home/peter.maydell/qemu-netbsd/scripts/git-submodule.sh"
>> update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
>> tests/fp/berkeley-softfloat-3 dtc capstone slirp)
>> /usr/bin/python3 -B /home/peter.maydell/qemu-netbsd/tests/vm/netbsd
>> --debug  --jobs 8 --verbose    --image
>> "/home/peter.maydell/.cache/qemu-vm/images/netbsd.img"  --snapshot
>> --build-qemu /home/peter.maydell/qemu-netbsd --
>> DEBUG:root:Creating archive
>> /home/peter.maydell/qemu-netbsd/build/vm-test-72ra6_8s.tmp/data-f706c.tar
>> for src_dir dir: /home/peter.maydell/qemu-netbsd
>> DEBUG:root:QEMU args: -nodefaults -m 4G -cpu max -netdev
>> user,id=vnet,hostfwd=:127.0.0.1:0-:22,ipv6=no -device
>> virtio-net-pci,netdev=vnet -vnc 127.0.0.1:0,to=20 -smp 8 -enable-kvm
>> -drive file=/home/peter.maydell/.cache/qemu-vm/images/netbsd.img,snapshot=on,if=none,id=drive0,cache=writeback
>> -device virtio-blk,drive=drive0,bootindex=0 -drive
>> file=/home/peter.maydell/qemu-netbsd/build/vm-test-72ra6_8s.tmp/data-f706c.tar,if=none,id=data-f706c,cache=writeback,format=raw
>> -device virtio-blk,drive=data-f706c,serial=data-f706c,bootindex=1
>> DEBUG:asyncio:Using selector: EpollSelector
>> DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Registering
>> <qemu.aqmp.events.EventListener object at 0x7f3b76bfc9b0>.
>> DEBUG:qemu.machine.machine:VM launch command: 'qemu-system-x86_64
>> -display none -vga none -chardev
>> socket,id=mon,path=/var/tmp/qemu-machine-0m15ou19/qemu-2335-7f3b78d7f128-monitor.sock
>> -mon chardev=mon,mode=control -machine pc -chardev
>> socket,id=console,path=/var/tmp/qemu-machine-0m15ou19/qemu-2335-7f3b78d7f128-console.sock,server=on,wait=off
>> -serial chardev:console -nodefaults -m 4G -cpu max -netdev
>> user,id=vnet,hostfwd=:127.0.0.1:0-:22,ipv6=no -device
>> virtio-net-pci,netdev=vnet -vnc 127.0.0.1:0,to=20 -smp 8 -enable-kvm
>> -drive file=/home/peter.maydell/.cache/qemu-vm/images/netbsd.img,snapshot=on,if=none,id=drive0,cache=writeback
>> -device virtio-blk,drive=drive0,bootindex=0 -drive
>> file=/home/peter.maydell/qemu-netbsd/build/vm-test-72ra6_8s.tmp/data-f706c.tar,if=none,id=data-f706c,cache=writeback,format=raw
>> -device virtio-blk,drive=data-f706c,serial=data-f706c,bootindex=1'
>> DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Transitioning from
>> 'Runstate.IDLE' to 'Runstate.CONNECTING'.
>> DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Awaiting connection
>> on /var/tmp/qemu-machine-0m15ou19/qemu-2335-7f3b78d7f128-monitor.sock
>> ...
>> DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Connection accepted.
>> DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Awaiting greeting ...
>> DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:<-- {
>>    "QMP": {
>>      "version": {
>>        "qemu": {
>>          "micro": 1,
>>          "minor": 11,
>>          "major": 2
>>        },
>>        "package": "(Debian 1:2.11+dfsg-1ubuntu7.38)"
>>      },
>>      "capabilities": []
>>    }
>> }
> 
> Well, today I learned that:
> 
> (1) vm-build-XXX targets use your host system's QEMU to run that VM
> (2) my QMP library cannot talk to QEMU 2.11.
> 
> That doesn't explain the intermittent netbsd failure yet, though.
> (I guess this wasn't a failure point for you due to the aggressive
> caching of the VM images? Unlucky.)
> 
> Here's another hotfix, this one I cannot easily test quickly (I don't
> have 2.11 handy and it no longer builds for me),
> but I think it'll fix the VM installation problem against older QEMU versions:
> 
> diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
> index 8105e29fa8..6b43e1dbbe 100644
> --- a/python/qemu/aqmp/qmp_client.py
> +++ b/python/qemu/aqmp/qmp_client.py
> @@ -292,9 +292,9 @@ async def _negotiate(self) -> None:
>           """
>           self.logger.debug("Negotiating capabilities ...")
> 
> -        arguments: Dict[str, List[str]] = {'enable': []}
> +        arguments: Dict[str, List[str]] = {}
>           if self._greeting and 'oob' in self._greeting.QMP.capabilities:
> -            arguments['enable'].append('oob')
> +            arguments.setdefault('enable', []).append('oob')
>           msg = self.make_execute_msg('qmp_capabilities', arguments=arguments)
> 
>           # It's not safe to use execute() here, because the reader/writers
> 

I also found that iotest 040, 041 fail sometimes (not always) on X86
when I run the test cases in my environment.

> 




