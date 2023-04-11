Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123596DD576
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 10:29:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm9Ma-00051m-Kd; Tue, 11 Apr 2023 04:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pm9MS-00051M-Tp
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 04:28:21 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pm9MQ-0006Ce-Ru
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 04:28:20 -0400
Received: by mail-wr1-x434.google.com with SMTP id s2so3387516wra.7
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 01:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681201697; x=1683793697;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MQ0drIWzBl8+TPE9EFtuKvjJ26MgcK8N50RWv3O5VHo=;
 b=ldfLULADu6snRA2bB6QD6/b5ZvdowkwKJ9mCRSCCor0CJsRGit0mkSUUgRNbHxI+zW
 S8oBv3MHt8hnRiHrJ99DyAaUKGIX7y3LM9tGoNu6/LbGOZ6/B5F/IVxaZzN4ZwA0VdlD
 NhVYVo0cdvq6D4nwF1coVzR5MDIyDeDV1cRwSohYBOpPeQr/OsukVL6jHy2rN8FSKk6U
 /EQOt7CJYz+bPZXdpu20FGaVVDt8k/ccDfrSS4zcupundRRjGiEfRuSJUTuhC/caH8Fm
 QCmEMARYZSiUeHq1Y5bbztc9Z4xNxOkk96v5v1+Hrt8EpArblKBOFERxzbQt78pohk0x
 eTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681201697; x=1683793697;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MQ0drIWzBl8+TPE9EFtuKvjJ26MgcK8N50RWv3O5VHo=;
 b=qjGMLVIoFDwtSNDAD7BddAhoFD75s3rnT/CrFggYtK+w8wdQaJDxc/Xbl4ytbCFhbK
 sacE17RqeCwQuaTgB7UE1VCsIJ5iMGQOhx4bV2KGXd+82jG7/1k9NTozQqyuACm6iD5c
 q+v43v//SXWr0QnG078uwSUTp1ZHvfEFbnDhwAVsVfXd/WRALHJcnCr+muMKHSx+S+Oa
 7iZaoAj8xLmbBweKyy1KjFKz7zj6OdRmpC10mVC7Vz8dS/7VV0SEneyLIuD1rcjwYX1f
 Yb873Du/gzAnWHm43QpfAOuBZ+ALrUl/ObLEmowtjlOUJAQKzdJn0VK2sB36dqh494I9
 6WLQ==
X-Gm-Message-State: AAQBX9chdhG0KbOcxD49mf0Ksh/CmhAbrzCaGWRV6/n73GolApr9vW/1
 yx8QYMX+MHdth8O8X5fGP6to+Q==
X-Google-Smtp-Source: AKy350ZqH49K+BAAmm735ZwwqN+arqWQEaqXtjDVehw3IW1uBc6FBRptmMKZQ89c1AY3FMzFcvegGw==
X-Received: by 2002:a5d:4204:0:b0:2cf:f04b:fb23 with SMTP id
 n4-20020a5d4204000000b002cff04bfb23mr9173789wrq.59.1681201695275; 
 Tue, 11 Apr 2023 01:28:15 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a5d4a0d000000b002efebaf3571sm7327060wrq.64.2023.04.11.01.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 01:28:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 732391FFB7;
 Tue, 11 Apr 2023 09:28:14 +0100 (BST)
References: <20230307112845.452053-1-alex.bennee@linaro.org>
 <20230307112845.452053-5-alex.bennee@linaro.org>
 <20230321150220.mfrvgxg3ebju5e6k@orel>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, kvmarm@lists.linux.dev, qemu-arm@nongnu.org, Mark
 Rutland <mark.rutland@arm.com>
Subject: Re: [kvm-unit-tests PATCH v10 4/7] arm/tlbflush-code: TLB flush
 during code execution
Date: Tue, 11 Apr 2023 09:26:56 +0100
In-reply-to: <20230321150220.mfrvgxg3ebju5e6k@orel>
Message-ID: <87ile2rffl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Andrew Jones <andrew.jones@linux.dev> writes:

> On Tue, Mar 07, 2023 at 11:28:42AM +0000, Alex Benn=C3=A9e wrote:
>> This adds a fairly brain dead torture test for TLB flushes intended
>> for stressing the MTTCG QEMU build. It takes the usual -smp option for
>> multiple CPUs.
>>=20
<snip>
>
> BTW, have you tried running these tests as standalone? Since they're
> 'nodefault' it'd be good if they work that way.

It works but I couldn't get it to skip pass the nodefault check
automaticaly:

  env run_all_tests=3D1 QEMU=3D$HOME/lsrc/qemu.git/builds/arm.all/qemu-syst=
em-aarch64 ./tests/tcg.computed=20
  BUILD_HEAD=3Dc9cf6e90
  Test marked not to be run by default, are you sure (y/N)?

>
>> +file =3D tlbflush-code.flat
>> +smp =3D $(($MAX_SMP>4?4:$MAX_SMP))
>> +groups =3D nodefault mttcg
>> +
>> +[tlbflush-code::page_other]
>> +file =3D tlbflush-code.flat
>> +smp =3D $(($MAX_SMP>4?4:$MAX_SMP))
>> +extra_params =3D -append 'page'
>> +groups =3D nodefault mttcg
>> +
>> +[tlbflush-code::all_self]
>> +file =3D tlbflush-code.flat
>> +smp =3D $(($MAX_SMP>4?4:$MAX_SMP))
>> +extra_params =3D -append 'self'
>> +groups =3D nodefault mttcg
>> +
>> +[tlbflush-code::page_self]
>> +file =3D tlbflush-code.flat
>> +smp =3D $(($MAX_SMP>4?4:$MAX_SMP))
>> +extra_params =3D -append 'page self'
>> +groups =3D nodefault mttcg
>> +
>> --=20
>> 2.39.2
>>
>
> Thanks,
> drew


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

