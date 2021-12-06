Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2465D46A95B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 22:13:39 +0100 (CET)
Received: from localhost ([::1]:38944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muLIm-00025G-SQ
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 16:13:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1muLHn-0001On-Ad
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 16:12:35 -0500
Received: from [2a00:1450:4864:20::432] (port=43986
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1muLHl-0003qB-RK
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 16:12:34 -0500
Received: by mail-wr1-x432.google.com with SMTP id v11so25058603wrw.10
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 13:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZKzw3dsGZo6gdN0kQOcWtcW2vIvNlZG3iQ2xzxvZ89Q=;
 b=xorTmqHQqG5GvLgSmPw+lVBQ9zevGqeHhQsokHM2wiC2FASPZs7lelVrI1HmBAa8a9
 9OjG8q/VCvxOrRTbCMHGW3TEM+HPG9/bAi1PxKYX17/7CQ9JhULUCv9cVWekC8tfg7XN
 /z+uJ0pikIsU4qGTyYLt//HSi7Zefu6uZ4TqHXL9aCOOeWyKGt8ou4kSZUYd1UG+a+I1
 84xBqixoFo979ws3X3fAfbtAs7GsTJFsMDr301x8O9aIPT2TOXV19R7JawRsWQ1FEwsw
 u2s7iBZ+Nl0XH/VVPziei7jN72JQI/wpM/4R2Zrac3BlvzS7yUHODbOXypZNKt0WHI8c
 5v6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZKzw3dsGZo6gdN0kQOcWtcW2vIvNlZG3iQ2xzxvZ89Q=;
 b=E8CkdI6fQXTvQjifl6o1HyaOFQ6o4GF8QopJ1XWqEn2uJlcJdMfGHYg+++QjG7+BYI
 O6LGg2Md82jqD2lkYyiI53+d0Fk1BbPCujvG1cdGIk1/qoBUOLYS0V2HGvbqPEqraFJZ
 Xl2qfzK/GQxpUmf39QrFhULOkbzrdtgGZjRCQY5C0EIGQ8h20dO44nAOJf/Zh7qsFJIr
 sQGBkEKFfa2C3ZJKYJUd88jxH3gj6g5Rmsm119/J01GjDgbmYfIHyN2T3vTfmoVgxdwj
 PLd3tl13eCC+eQyosLas0hxriWBM60UWuPoimE/9pOZDB8HavLBOKvS0atANsqjV7A/J
 8s8g==
X-Gm-Message-State: AOAM531FmH7J+XDNzY5Jkn+PDjiQCw4KMCc7QkQPvNwYiGyTYUFU9Mtm
 MnofpGt7/xdrAd2AuoZdjptW5Q==
X-Google-Smtp-Source: ABdhPJy8ZGVt+M+xfKNgEFY1ccWwiX4yhY8hkb6rUNmgf07CaGpj0bUQjfTubl3ccRC51LqNBSo5HQ==
X-Received: by 2002:a5d:47c7:: with SMTP id o7mr24445318wrc.101.1638825152264; 
 Mon, 06 Dec 2021 13:12:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k27sm478316wms.41.2021.12.06.13.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 13:12:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 575EC1FF96;
 Mon,  6 Dec 2021 21:12:30 +0000 (GMT)
References: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>
 <87bl1zxaeu.fsf@linaro.org> <7d137a2403be43b7a1c5857e96866403@huawei.com>
 <87v905wq6d.fsf@linaro.org> <35631f7cceb141879aa7475ccaf81acb@huawei.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vasilev Oleg <vasilev.oleg@huawei.com>
Subject: Re: Suggestions for TCG performance improvements
Date: Mon, 06 Dec 2021 21:09:38 +0000
In-reply-to: <35631f7cceb141879aa7475ccaf81acb@huawei.com>
Message-ID: <87a6hdmo8x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Konobeev Vladimir <konobeev.vladimir@huawei.com>, "Chengen \(William,
 FixNet\)" <chengen@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andrey Shinkevich <andrey.shinkevich@huawei.com>,
 "Emilio G. Cota" <cota@braap.org>,
 Plotnik Nikolay <plotnik.nikolay@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Vasilev Oleg <vasilev.oleg@huawei.com> writes:

> On 12/3/2021 8:32 PM, Alex Benn=C3=A9e wrote:
>> Vasilev Oleg <vasilev.oleg@huawei.com> writes:
>>
>>> On 12/2/2021 7:02 PM, Alex Benn=C3=A9e wrote:
>>>
>>>> Vasilev Oleg <vasilev.oleg@huawei.com> writes:
> ...skipped...
>>>> I did ponder a debug mode which would keep the last N tables dropped by
>>>> tlb_mmu_resize_locked and then measure the differences in the entries
>>>> before submitting the free to an rcu tasks.
>>>>> The mentioned paper[4] also describes other possible improvements.
>>>>> Some of those are already implemented (such as victim TLB and dynamic
>>>>> size for TLB), but others are not (e.g. TLB lookup uninlining and
>>>>> set-associative TLB layer). Do you think those improvements
>>>>> worth trying?
>>>> Anything is worth trying but you would need hard numbers. Also its all
>>>> too easy to target micro benchmarks which might not show much differen=
ce
>>>> in real world use.=20
>>> The  mentioned paper presents some benchmarking, e. g. linux kernel
>>> compilation and some other stuff. Do you think those shouldn't be
>>> trusted?
>> No they are good. To be honest it's the context switches that get you.
>> Look at "info jit" between a normal distro and a initramfs shell. Places
>> where the kernel is switching between multiple maps means a churn of TLB
>> data.
>>
>> See my other post with a match of "msr ttrb"
> Sorry, couldn't find what you are referring to. Could you, please, share
> a link?

It was an enhancement to the libinsns.so plugin to gauge how often
certain instructions are run:

  Subject: [RFC PATCH  0/2] insn plugin tweaks for measuring frequency
  Date: Fri,  3 Dec 2021 14:44:19 +0000
  Message-Id: <20211203144421.1445232-1-alex.bennee@linaro.org>

I think the msr ttrb[10]_el1 is a key instruction because that triggers
a flush if the ASID changes. On my initramfs setup with a simple login
shell that doesn't happen, on a full distro there is context switching
all the time which causes extra flushes.

--=20
Alex Benn=C3=A9e

