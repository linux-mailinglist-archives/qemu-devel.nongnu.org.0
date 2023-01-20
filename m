Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482F56754F7
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:48:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqoS-0001Wp-3z; Fri, 20 Jan 2023 07:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIqoQ-0001UR-1o
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:48:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIqoN-0003x4-Ir
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674218881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nb9h/z+BKlVCArg6Tby/eW6/Nm7OwozPclzhz7e84rc=;
 b=LFg+dWa2VbgUaCStduP/VB1YxR7EiC5zKqcPw0dvuFTXEUN8k/u7IjJ7ayKHCw79f+deMW
 AjOrHBtCt2nuQKkE9ZrT4Ahic2QZd1Qvx1KhirR9Nj0r9unZVZWWHatk5yMHhzLtti6FhB
 Hx1cN1G35YzSbsr1J0PxcOFR+NHj/Oo=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-2-nlWTlOoZPBueZeRW2DmIag-1; Fri, 20 Jan 2023 07:48:00 -0500
X-MC-Unique: nlWTlOoZPBueZeRW2DmIag-1
Received: by mail-vk1-f197.google.com with SMTP id
 d130-20020a1f9b88000000b003b87d0db0d9so1641466vke.15
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 04:48:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nb9h/z+BKlVCArg6Tby/eW6/Nm7OwozPclzhz7e84rc=;
 b=Uu4uV/eh6IKR1M8kfTke+rT+dikmQjzWlfuy37d4eDQtAv4hKAkct4N290p9JDkqlm
 T0BZDjjNeUjISQBWBh67tG3KD2D0aarLRzOg5T5Y5DDt02ryh7ViXc6B4feLK2bmv/Ha
 Yxf8MtTi4tc+2xqBPacRtlNyN4XRQWzGTgy9o9rBeQ2fxN8dBsjqbnMSPXq2HmhJiAUz
 aSq0PBQrUpC8ZW5e+/0UzOMUu7sGYIZ5yGWF9OlHPtmoSvWc46C+gNdKZoAagFNU7fnA
 631hJCdnfkN4g97TUTfdRzTheypI/oQNREeuubD4AbijNvNo0/y/0o1D9Z9M8WdQ57Wg
 oykw==
X-Gm-Message-State: AFqh2koUEMMrQrtNFB8X0OQkL7YAOmdNOGqRxMoisJTKgELkcebLpz95
 E7O05WCdT5m9Oe1WS1YjR40pIh3/OUDaEMkcrWR0horFcb4KtYtwjpoCvdqdt1M/dUrzjzotvEY
 jNX8Njcb4Lsldce0=
X-Received: by 2002:a05:6102:11f4:b0:3d4:540:7876 with SMTP id
 e20-20020a05610211f400b003d405407876mr8224312vsg.12.1674218879956; 
 Fri, 20 Jan 2023 04:47:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsTllU1zsJaRND8zKZzbol84KvC6toZKM8IsPfYjRKFwu6nEWAJwl4uRDEK7lln2CVNm22FEA==
X-Received: by 2002:a05:6102:11f4:b0:3d4:540:7876 with SMTP id
 e20-20020a05610211f400b003d405407876mr8224284vsg.12.1674218879694; 
 Fri, 20 Jan 2023 04:47:59 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 v23-20020ae9e317000000b006fbbdc6c68fsm1634004qkf.68.2023.01.20.04.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 04:47:58 -0800 (PST)
Message-ID: <b4700f8a-b0d3-dca5-d3af-89b1b738f104@redhat.com>
Date: Fri, 20 Jan 2023 13:47:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: QEMU iotest 267 failure / assertion in migration code
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Juan Quintela
 <quintela@redhat.com>, Richard Henderson <richard.henderson@linaro.org>
References: <c4677b0e-87eb-beca-d9fb-050c9315d316@redhat.com>
 <Y8g0IcL14twkHQBu@work-vm>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Y8g0IcL14twkHQBu@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=216.145.221.124;
 envelope-from=thuth@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_SBL_CSS=3.335, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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

On 18/01/2023 19.02, Dr. David Alan Gilbert wrote:
> * Thomas Huth (thuth@redhat.com) wrote:
>>
>>   Hi!
>>
>> I just ran "make check" in a build directory where I did
>> not compile qemu-system-x86_64, and got a failure with
>> iotest 267.
>>
>> Re-running the "check" script directly got me some more
>> information:
>>
>> $ ./check -qcow2 267
>> QEMU          -- "/tmp/qemu/tests/qemu-iotests/../../qemu-system-alpha" -nodefaults -display none -accel qtest
>> QEMU_IMG      -- "/tmp/qemu/tests/qemu-iotests/../../qemu-img"
>> QEMU_IO       -- "/tmp/qemu/tests/qemu-iotests/../../qemu-io" --cache writeback --aio threads -f qcow2
>> QEMU_NBD      -- "/tmp/qemu/tests/qemu-iotests/../../qemu-nbd"
>> IMGFMT        -- qcow2
>> IMGPROTO      -- file
>> PLATFORM      -- Linux/x86_64 thuth 4.18.0-425.3.1.el8.x86_64
>> TEST_DIR      -- /tmp/qemu/tests/qemu-iotests/scratch
>> SOCK_DIR      -- /tmp/tmp_qbcjhsu
>> GDB_OPTIONS   --
>> VALGRIND_QEMU --
>> PRINT_QEMU_OUTPUT --
>>
>> 267   fail       [18:39:41] [18:39:44]   3.5s                 output mismatch (see /tmp/qemu/tests/qemu-iotests/scratch/267.out.bad)
>> --- .../qemu/tests/qemu-iotests/267.out
>> +++ /tmp/qemu/tests/qemu-iotests/scratch/267.out.bad
>> @@ -31,23 +31,23 @@
>>   Testing: -drive driver=IMGFMT,file=TEST_DIR/t.IMGFMT,if=none
>>   QEMU X.Y.Z monitor - type 'help' for more information
>>   (qemu) savevm snap0
>> -(qemu) info snapshots
>> -List of snapshots present on all disks:
>> -ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>> ---        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>> -(qemu) loadvm snap0
>> -(qemu) quit
>> +QEMU_PROG: ../../qemu/migration/ram.c:874: pss_find_next_dirty: Assertion `pss->host_page_end' failed.
> 
> I don't understand how that can trigger - it needs investigating as a
> bug.

I've created a ticket so we don't forget:

https://gitlab.com/qemu-project/qemu/-/issues/1456

>> +./common.rc: line 181: 1903770 Aborted                 (core dumped) ( if [ -n "${QEMU_NEED_PID}" ]; then
>> +    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
>> +fi; GDB=""; if [ -n "${GDB_OPTIONS}" ]; then
>> +    GDB="gdbserver ${GDB_OPTIONS}";
>> +fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec "${VALGRIND_LOGFILE}" $GDB "$QEMU_PROG" $QEMU_OPTIONS "$@" )
>>
>>
>> Looks like this test does not work if the main machine
>> of the selected QEMU binary does not support migration?
> 
> Why doesn't it support migration?

Hmm, maybe I just got that wrong and it's really just the problem that the 
qemu-system-alpha is crashing.

  Thomas


