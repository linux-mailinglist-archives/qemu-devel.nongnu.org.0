Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3754C6721
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 11:33:26 +0100 (CET)
Received: from localhost ([::1]:37398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOdLJ-0005EM-5Q
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 05:33:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOdJr-0004Xp-5n
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 05:31:55 -0500
Received: from [2a00:1450:4864:20::336] (port=54981
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOdJo-0004GB-6P
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 05:31:54 -0500
Received: by mail-wm1-x336.google.com with SMTP id c192so5391488wma.4
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 02:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=gwgp7wLG9kIx79hvY9bj4eswH2ds2PLXlq56waJ8kdE=;
 b=anl0p+sAxl5pLFjg98iFrfd3Fm+p1tC44zdPmfe6WVDltO19g7VFPzbacu7HqloDKr
 +kXivAT6x7P/Y2yAf0Yka3+CO/IcKCujsgbGfr1g1Bt7HjKuAhy5L7rPMvKHrLl9gwxO
 dbbMhAQ8RLCJbpSPLc3I7TTXivO2vYzgMJ7Uiv3t42m7diKl/9M1Ppl7pZLwiJGb2Zuf
 M0Ddq5BMrG3YjrsrqoTqyvrnskWzLb7H4fKYQ8C9xS9stWX7VXiC0sEuHKbmsS/IqIcQ
 78rg8hWWvGFkncNQVlyB8HLgA+ChVf6d8U8+cn3yt9OBhQwhEG3u8SE8S2iiEWvMjE0m
 ATYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=gwgp7wLG9kIx79hvY9bj4eswH2ds2PLXlq56waJ8kdE=;
 b=1AfAUAN2A+4eDPl0wzWgHD/QXUFHDxiI63TZNspknd0yG8FkaHu9xFGTNB74MBQs5F
 CHNMz0JBeVy61QBYNloB9/pUgo5/LwvRrZ2A0zuws+c5SU0FCVsUsLx8JA4jUx5PopXk
 FD7aDFBJPOiH6aMeHiTOEMho17AL/yxx7SD2Rv/yB08kQDVSESxbdn8hsjEDOU6po95y
 1hG697CDNXHEDKpIMa7DtvRQZU7nRCZAwXAeA0Iw91AZ3WpOYRQAF1yakmdlmHpJKxCV
 8FIHKlYoNgpSX1GYlf9UoUdePiTOJdRCd/wCpVjx5BtWv0Zpq84B6z6qzyYjEkVYfXoG
 LNqA==
X-Gm-Message-State: AOAM531LxSuS9z+hpAHnCr31v6xAVHkdUBpEIEB0MLi6o5KsiVFO6vRV
 mWWtp0lwd1RqYh8D+bOmciMd8w==
X-Google-Smtp-Source: ABdhPJzCuOjZj+X9q1ZpvMesvHiOOzJPotMM2lZNpQ4Ud5KuFw0GdEhPPLmHywLgrcQNv7pLEaauOA==
X-Received: by 2002:a1c:4b17:0:b0:380:e44f:426e with SMTP id
 y23-20020a1c4b17000000b00380e44f426emr12594810wma.150.1646044310204; 
 Mon, 28 Feb 2022 02:31:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r2-20020adff702000000b001efd7eb7c37sm2070338wrp.34.2022.02.28.02.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 02:31:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 496121FFB7;
 Mon, 28 Feb 2022 10:31:48 +0000 (GMT)
References: <010e01d82875$d3cc0ec0$7b642c40$@sysprogs.com>
 <93318cc1-bf62-34dd-190c-1961a4716f75@redhat.com>
 <01e801d828f0$b58a6e40$209f4ac0$@sysprogs.com>
 <CAFEAcA_y=xRhBoStyxa+UZcyibAzgcJSf+kQO4e0BMrdq4j6Jg@mail.gmail.com>
 <87v8x433o2.fsf@linaro.org> <030301d82996$c385f900$4a91eb00$@sysprogs.com>
 <096b01d82c5c$04a0f3a0$0de2dae0$@sysprogs.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ivan Shcherbakov <ivan@sysprogs.com>
Subject: Re: [PATCH 3/3] whpx: Added support for breakpoints and stepping
Date: Mon, 28 Feb 2022 10:28:12 +0000
In-reply-to: <096b01d82c5c$04a0f3a0$0de2dae0$@sysprogs.com>
Message-ID: <87czj7nuy3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: 'Peter Maydell' <peter.maydell@linaro.org>, mst@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com,
 'Paolo Bonzini' <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Ivan Shcherbakov" <ivan@sysprogs.com> writes:

> Hi Alex and Peter,
>
> It would be great to hear your feedback on handling the WHPX stepping
> via an added argument to vm_prepare_start(). It is only called from 2
> places, so the changes will be minimal. I this works for you, I will
> gladly send an updated patch.

Is the limitation that whpx_set_exception_exit_bitmap needs to be set
before any vCPU can be run or that it cannot be set if any vCPUs are
currently running?

If it is the later wouldn't adding a hook into the vm_change_state_head
callbacks be enough?

> I am also fully open to other suggestions. You obviously know the QEMU
> codebase much better, so I'm happy to refactor it so that it blends in
> well with the rest of the code.
>
> Best,
> Ivan
>
> -----Original Message-----
> From: Qemu-devel <qemu-devel-bounces+ivan=3Dsysprogs.com@nongnu.org> On B=
ehalf Of Ivan Shcherbakov
> Sent: Thursday, February 24, 2022 7:54 AM
> To: 'Alex Benn=C3=A9e' <alex.bennee@linaro.org>; 'Peter Maydell' <peter.m=
aydell@linaro.org>
> Cc: 'Paolo Bonzini' <pbonzini@redhat.com>; qemu-devel@nongnu.org; armbru@=
redhat.com; mst@redhat.com
> Subject: RE: [PATCH 3/3] whpx: Added support for breakpoints and stepping
>
>> I haven't looked at the rest of the patch -- but can you explain where=20
>> whpx is different from how other accelerators handle debug such that=20
>> it needs to know whether gdb is connected or not ?
> This mainly comes from the way single-stepping is handled. WHPX needs to =
know whether you want to trap INT1 before starting the first VCPU. The curr=
ent gdbstub implementation doesn=E2=80=99t make it easy. Assume the scenari=
o:
>
> 1. You have 2 VCPUs. You run the first one and step the second one.
> 2. gdb_continue_partial() calls cpu_resume(0) 3. gdb_continue_partial() c=
alls cpu_single_step(1).
>
> WHPX needs to know whether to trap INT1 at step #2 (starting the first CP=
U), but it won't know it until step #3. So, the current logic simply checks=
 if gdb is connected at all in step #2.
>
>>Just the fact you have connected to the gdbserver shouldn't affect how yo=
u run WHPX up until the point there are things you need to trap - i.e.
>>handling installed breakpoints.
>
> This can be addressed by adding a "bool stepping_expected" argument to
>> vm_prepare_start(). It will be set to true if gdb_continue_partial()
>> expects ANY thread to be stepped, and will be false otherwise. It
>> will also require a new callback in AccelOpsClass (e.g.
>> on_vm_starting(bool stepping_expected)) that will be called from
>> vm_prepare_start(). The WHPX implementation will then check if any
>> breakpoints are set, and if the last call to this function expected
>> stepping, and use it to decide whether to trap INT1.
>
> Let me know if this will work better.
>
> Best,
> Ivan


--=20
Alex Benn=C3=A9e

