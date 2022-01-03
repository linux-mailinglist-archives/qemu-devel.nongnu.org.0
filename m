Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7288348345E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 16:43:20 +0100 (CET)
Received: from localhost ([::1]:41774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4PUV-00008A-2n
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 10:43:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n4PTA-0007ke-Me
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 10:41:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n4PT7-0002zE-TG
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 10:41:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641224512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ETO8hU13ChAgjsAPqwowabNr8l9w0NxSSAXaHFh7iA=;
 b=g2r4iQy7mtmv5vrKaEXty0omOV6/N1Fq0ASnI1yZSKl9Duf2Q2oN7dTC72aeeae3ta4cGU
 4snLNlloa6dokwbhq1jQsjOkJQ6HskS/rpAsOY3i8Di5aMwn/SD1rm5DBD2nJBKaaMDYtj
 0gM7JH51doZDIqqFL9FrQd676CJfJ+Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-6QI5U168N0uVeTOeaQEfpQ-1; Mon, 03 Jan 2022 10:41:50 -0500
X-MC-Unique: 6QI5U168N0uVeTOeaQEfpQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 b75-20020a1c804e000000b0034569bde713so16680754wmd.9
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 07:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9ETO8hU13ChAgjsAPqwowabNr8l9w0NxSSAXaHFh7iA=;
 b=jN4PFe/yb7P+c9KoPOfzdphVIdnkZXaVLyxFBsuB1ntDktQtFBLwQdqM6gWmoCWbre
 0InNGMVK2raNg1+/orFPnnaCAG66KIsmGVgimYmu82/BcV2agiF4Bi1+U5H5H/TG7o5l
 J/FTXWC/DMaJTXSYTGFMi1ZQ4FmwkEqcifCjjd0cUKm6mf4emI2qbSDkAP9obQeb0Hgc
 wBX307BwkEK4dnpuvv0aw6QSJIiYwmQpACBVUFZGCD0oyTwFPp5JyXOHup07Ua6TSG83
 /h/s1CeMRHLmV0PbzwP2C/fOhJA1IluPQIc1dkCTXZqiFyCAIB6A0fW4kxjiasN45Zge
 V2LQ==
X-Gm-Message-State: AOAM531Uc62SrHbKIcy+7X2mOdMtBM2dYr92LPdWuVc1EzRfdXXAHAhw
 5LksWw2iR0fUke3wtfNYtsxXBPc8p2emeKhuySSadzJPoCue6l6Cd+9yviSNDlhbWYgiF1MvS8N
 PeCbOFTn4QXhXwKw=
X-Received: by 2002:adf:c445:: with SMTP id a5mr21194424wrg.631.1641224509373; 
 Mon, 03 Jan 2022 07:41:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyrKF2E9vh6GHAnAAIL153LuUGPm/qZlJEZjw4j2X/cNOpnvBnXPhKSfKgHezNCFJHUXXdqA==
X-Received: by 2002:adf:c445:: with SMTP id a5mr21194404wrg.631.1641224509081; 
 Mon, 03 Jan 2022 07:41:49 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id j17sm35241139wrp.68.2022.01.03.07.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 07:41:48 -0800 (PST)
Message-ID: <656148be-0a1c-8983-5dec-4f19c068d11d@redhat.com>
Date: Mon, 3 Jan 2022 16:41:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] iotests/MRCE: Write data to source
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211223165308.103793-1-hreitz@redhat.com>
 <ec50682f-a421-797c-a436-085f00ccda35@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <ec50682f-a421-797c-a436-085f00ccda35@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.12.21 18:50, Vladimir Sementsov-Ogievskiy wrote:
> 23.12.2021 19:53, Hanna Reitz wrote:
>> This test assumes that mirror flushes the source when entering the READY
>> state, and that the format level will pass that flush on to the protocol
>> level (where we intercept it with blkdebug).
>>
>> However, apparently that does not happen when using a VMDK image with
>> zeroed_grain=on, which actually is the default set by testenv.py.  Right
>> now, Python tests ignore IMGOPTS, though, so this has no effect; but
>> Vladimir has a series that will change this, so we need to fix this test
>> before that series lands.
>>
>> We can fix it by writing data to the source before we start the mirror
>> job; apparently that makes the (VMDK) format layer change its mind and
>> pass on the pre-READY flush to the protocol level, so the test passes
>> again.  (I presume, without any data written, mirror just does a 64M
>> zero write on the target, which VMDK with zeroed_grain=on basically just
>> ignores.)
>>
>> Without this, we do not get a flush, and so blkdebug only sees a single
>> flush at the end of the job instead of two, and therefore does not
>> inject an error, which makes the block job complete instead of raising
>> an error.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
> Hmm, relying on flush requests sequence doesn't seem reliable..
> Maybe, it's better to insert blockdev-add filter after JOB_READY? 
> blockdev-reopen should work now for "file" link changing.

Oh, yes, that would be nice, good idea!

But, on the other hand...  I tried, but unfortunately blockdev-reopen 
doesn’t seem to work that well with vmdk in particular:

$ ./qemu-img create -f vmdk /tmp/test.vmdk 64M
Formatting '/tmp/test.vmdk', fmt=vmdk size=67108864 compat6=off 
hwversion=undefined

$ ./qemu-system-x86_64 \
     -qmp stdio \
     -blockdev file,node-name=file,filename=/tmp/test.vmdk \
     -blockdev vmdk,node-name=vmdk,file=file \
     -blockdev raw,node-name=raw,file=file \
     <<EOF
{"execute": "qmp_capabilities"}
{"execute": "blockdev-reopen",
  "arguments": {
    "options": [{
      "node-name": "vmdk",
      "driver": "vmdk",
      "file": "raw"}]}}
{"execute": "quit"}
EOF
{"QMP": {"version": {"qemu": {"micro": 50, "minor": 2, "major": 6}, 
"package": "v6.2.0-428-g572068bc87"}, "capabilities": ["oob"]}}
{"return": {}}
{"return": {}}
{"return": {}}
{"timestamp": {"seconds": 1641223501, "microseconds": 865524}, "event": 
"SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
[1]    21585 segmentation fault (core dumped)  ./qemu-system-x86_64 -qmp 
stdio -blockdev  -blockdev  -blockdev  <<<''


I don’t quite know what’s wrong, seems to me like some strong reference 
may be missing:

(gdb) bt
#0  0x00005643a784bb93 in bdrv_unset_inherits_from 
(root=root@entry=0x5643a898d990, child=child@entry=0x5643a89856c0, 
tran=tran@entry=0x0) at ../block.c:3172
#1  0x00005643a78524d0 in bdrv_unref_child (child=0x5643a89856c0, 
parent=0x5643a898d990) at ../block.c:3199
#2  bdrv_unref_child (parent=parent@entry=0x5643a898d990, 
child=0x5643a89856c0) at ../block.c:3193
#3  0x00005643a78b0c31 in vmdk_free_extents (bs=0x5643a898d990) at 
../block/vmdk.c:277
#4  0x00005643a78b0c5a in vmdk_close (bs=<optimized out>) at 
../block/vmdk.c:2810
#5  0x00005643a785260c in bdrv_close (bs=0x5643a898d990) at ../block.c:4790
#6  bdrv_delete (bs=<optimized out>) at ../block.c:5248
#7  bdrv_unref (bs=bs@entry=0x5643a898d990) at ../block.c:6675
#8  0x00005643a78436c5 in blockdev_close_all_bdrv_states () at 
../blockdev.c:675
#9  0x00005643a784f24f in bdrv_close_all () at ../block.c:4846
#10 0x00005643a77032de in qemu_cleanup () at ../softmmu/runstate.c:816
#11 0x00005643a7412823 in main (argc=<optimized out>, argv=<optimized 
out>, envp=<optimized out>) at ../softmmu/main.c:51
(gdb) p *child->bs
Cannot access memory at address 0x5646ccad4005


Valgrind points to vmdk_free_extents(), which makes me believe that the 
problem is that changing vmdk’s file child would need some cooperation 
from it to update its s->extents[...].file pointers:

==23055== Invalid read of size 8
==23055==    at 0x194CD0: bdrv_unset_inherits_from (block.c:3172)
==23055==    by 0x19B60F: bdrv_unref_child (block.c:3199)
==23055==    by 0x19B60F: bdrv_unref_child (block.c:3193)
==23055==    by 0x1F9D70: vmdk_free_extents (vmdk.c:277)
==23055==    by 0x1F9D99: vmdk_close (vmdk.c:2810)
==23055==    by 0x19B74B: bdrv_close (block.c:4790)
==23055==    by 0x19B74B: bdrv_delete (block.c:5248)
==23055==    by 0x19B74B: bdrv_unref (block.c:6675)
==23055==    by 0x18C804: blockdev_close_all_bdrv_states (blockdev.c:675)
==23055==    by 0x19838E: bdrv_close_all (block.c:4846)
==23055==    by 0x17F235: main (qemu-storage-daemon.c:354)
==23055==  Address 0x11259770 is 0 bytes inside a block of size 96 free'd
==23055==    at 0x48440E4: free (vg_replace_malloc.c:872)
==23055==    by 0x4AE0DAC: g_free (gmem.c:199)
==23055==    by 0x2ACE21: tran_commit (transactions.c:87)
==23055==    by 0x19D109: bdrv_reopen_multiple (block.c:4325)
==23055==    by 0x18FCB7: qmp_blockdev_reopen (blockdev.c:3599)
==23055==    by 0x272B0D: qmp_marshal_blockdev_reopen 
(qapi-commands-block-core.c:1086)
==23055==    by 0x295238: do_qmp_dispatch_bh (qmp-dispatch.c:129)
==23055==    by 0x2AD8A3: aio_bh_call (async.c:141)
==23055==    by 0x2AD8A3: aio_bh_poll (async.c:169)
==23055==    by 0x29E61D: aio_dispatch (aio-posix.c:381)
==23055==    by 0x2AD4ED: aio_ctx_dispatch (async.c:311)
==23055==    by 0x4ADF12F: UnknownInlinedFun (gmain.c:3381)
==23055==    by 0x4ADF12F: g_main_context_dispatch (gmain.c:4099)
==23055==    by 0x2B8E07: glib_pollfds_poll (main-loop.c:232)
==23055==    by 0x2B8E07: os_host_main_loop_wait (main-loop.c:255)
==23055==    by 0x2B8E07: main_loop_wait (main-loop.c:531)
==23055==  Block was alloc'd at
==23055==    at 0x484186F: malloc (vg_replace_malloc.c:381)
==23055==    by 0x4AE44A8: g_malloc (gmem.c:106)
==23055==    by 0x19A52F: bdrv_attach_child_common (block.c:2912)
==23055==    by 0x19A878: bdrv_attach_child_noperm (block.c:3002)
==23055==    by 0x19BC90: bdrv_attach_child (block.c:3095)
==23055==    by 0x1FC72E: vmdk_open (vmdk.c:1265)
==23055==    by 0x19B1D9: bdrv_open_driver (block.c:1566)
==23055==    by 0x19EAE3: bdrv_open_common (block.c:1858)
==23055==    by 0x19EAE3: bdrv_open_inherit (block.c:3865)
==23055==    by 0x19FB02: bdrv_open (block.c:3958)
==23055==    by 0x18FA9D: qmp_blockdev_add (blockdev.c:3540)
==23055==    by 0x17F1CA: process_options (qemu-storage-daemon.c:216)
==23055==    by 0x17F1CA: main (qemu-storage-daemon.c:338)


So we can’t use blockdev-reopen until this is fixed™, and because this 
kind of is a blocker for your series, I think I’ll just take the patch 
as-is then.

Hanna


