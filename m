Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1FD4E3205
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 21:48:31 +0100 (CET)
Received: from localhost ([::1]:49244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWOx4-0005qx-S8
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 16:48:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1nWOvk-0004QW-9w
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:47:08 -0400
Received: from [2607:f8b0:4864:20::62a] (port=40496
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1nWOvg-0000j0-Kj
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:47:07 -0400
Received: by mail-pl1-x62a.google.com with SMTP id x2so236466plm.7
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 13:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=XTvfFoaUn8XK6PQpLG8EqnovNtzBLW3XDaOJlTvkkSk=;
 b=2hX/uJkY8wNwCIK7IXOjtbx7OH+fGW4zThf4/yw/W1X7j65tk7epq8kFpiWktkaXjY
 JtYXSI52ejeNGNK6T61ZksjFQiHnZY4yBi5uHg2307r7QEAiDntqWdkEdnA/qTHtqSG8
 jpws6MS2nlCS75gUhHDMokSH1pz9kp5w2kSKK6o/WhNnVREARc8DuHZ/srxo9a2O1TKM
 bnSZCzsNHl/WKKsxiX8UrMNWJM0gyFgPdmfLLJD5Zd4ced0HW6jHd5utCPO71AdpdXj5
 4b9pvIAUGZWxgrGt7VEBVyL8Tlr8mgh4cLb0Bl13XUw25UTTzoMT/RuAPUQesC1JS3Fc
 HclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=XTvfFoaUn8XK6PQpLG8EqnovNtzBLW3XDaOJlTvkkSk=;
 b=5xKo7OEdzINGI00v9DBjY7juWzYnMhX3VnC82G6Wx4AJAWDieBFL8jxPgEVBqi5wW0
 VLHkWwHAy31FuYAe4s/Ta+f2wrWBklRY/W7M0HexhiUTQg5HmDsX5fbjlAtHCPC0HI5R
 atkD4vPOIt9QQe8HDNOzLd0GB08MFu/H9a04xXldPuV8qnBR+OqNxk9mPZg66np+zDVC
 1I16yrvR6FarAkI9/PKUyhz35HXLwud3aIQ+VyHfeUh7ouEsKIC8SrmJZZpfr7kl6Qtc
 gKJ44HRLuny8BMd7d+gRW7EXawDRv0nlOOOzuZbvmJumj/6Pa8l0tCUvXm+JERTQ/4Dx
 /RpA==
X-Gm-Message-State: AOAM533kwucDaLba6vmG4clklvFYQvfFdfV83b/1+tXih/OXhxlTKq2x
 QSLOcN0KWSgqwl4eOwG7H2mllw==
X-Google-Smtp-Source: ABdhPJx1kG1Df7QN8ejmoK60t+I+2O2vYqYJ7ykLeVcjAxoE9p5r4GSSAkdAtmqLy0s1bXaxWxr7Mw==
X-Received: by 2002:a17:902:f70d:b0:14f:a1e1:b9b3 with SMTP id
 h13-20020a170902f70d00b0014fa1e1b9b3mr14863116plo.36.1647895621491; 
 Mon, 21 Mar 2022 13:47:01 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 t26-20020a056a00139a00b004faa13ba384sm5263538pfg.162.2022.03.21.13.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 13:47:01 -0700 (PDT)
Date: Mon, 21 Mar 2022 13:47:01 -0700 (PDT)
X-Google-Original-Date: Mon, 21 Mar 2022 13:46:59 PDT (-0700)
Subject: Re: [EXT] Re: QEMU+KVM on RISC-V + Hypervisor Extension
In-Reply-To: <CAKmqyKMGJR8M6MkL5Cer81qbCce0XmdcS8pQEkmH6X9h0SutmQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alistair23@gmail.com
Message-ID: <mhng-274dfa51-81cb-47bc-b31c-1a2dd8efa543@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: apatel@ventanamicro.com, Peter Maydell <peter.maydell@linaro.org>,
 anup@brainfault.org, qemu-devel@nongnu.org, ralf.ramsauer@oth-regensburg.de,
 jiangyifei@huawei.com, stefan.huber@oth-regensburg.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 20 Mar 2022 22:43:07 PDT (-0700), alistair23@gmail.com wrote:
> On Thu, Mar 17, 2022 at 7:46 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Wed, 16 Mar 2022 at 22:23, Alistair Francis <alistair23@gmail.com> wrote:
>> > Hmm... This seems like a bug. We shouldn't allow the user to specify a
>> > `-bios` option if using KVM. Would you mind preparing a patch to catch
>> > this?
>>
>> You don't want to allow the possibility of a bios blob that expects
>> to run in S-mode, the way arm virt can run an EL1 UEFI BIOS ?
>
> Interesting. We could still allow that by using -device loader though.
>
> If we load something in S mode it really is a kernel and not firmware,
> so I think the -bios argument is a little misleading. We could make
> -bios and -enable-kvm a warning instead, to discourage users from
> providing OpenSBI, but still allow them to pass something.

We could handle this in OpenSBI: have it just detect that it's been 
launched in S-mode and just jump to the payload.

> To me not allowing it seems reasonable, and we can always re-allow it
> in the future if there is a good use case.

That also seems fine to me.  There'd be a lot of work involved in doing 
anything useful with S-mode firmware, given that things aren't really 
designed to work that way.  Certainly a lot more work than re-enabling 
this sort of flag, and while it might be a bit of a headache coupling 
that to a QEMU source-level change my guess is that there'd need to be a 
bunch of work done on new HW interfaces to make this useful so there'd 
be QEMU changes to emulate those either way.

Having at least a warning seems prudent, as most users are going to end 
up with a hang here and a silent hang is a headache for everyone.

> Alistair
>
>>
>> thanks
>> -- PMM

