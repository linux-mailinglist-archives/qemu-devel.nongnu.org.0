Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876AE3477B0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 12:50:20 +0100 (CET)
Received: from localhost ([::1]:40214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP21j-0003i6-JT
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 07:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP20Z-00036F-Pt
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:49:07 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP20X-0004Fb-6H
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:49:07 -0400
Received: by mail-wm1-x334.google.com with SMTP id d191so12717139wmd.2
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 04:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=a9C6+SkXCgAQxL1+f64P7tkBMU79LNh7HmR6YQczt8A=;
 b=D6xsQraMNnLtAJjQWsZRntp8ynEaJw0GdBSVqbU/I0fSFOXYdvY2ZEJTD/0QJTceNE
 2hArhothtjgTn9bR/bgmUbmzceRVY0JlEF/srOrDelmCcvXn17EPGjGgEIZjWbnkqUkz
 t2R8jJCHsc2I+gcOg3tkzIFgsYuqfewzPDdvp/tZ9vo3ww1PFq7varH/HQ1fKGAObwPn
 lQ6EJ7BVD8yYT4lRWeCXRwI9x58wBiLc79ZvXA8Vkj+f7Ob2QQ4Qu/UM3IAgzO5SFU4N
 ZuWGln1vCoXIgJodr3jmCAL5yfA85T4WSo5A2/wzMq2idxu2KBAJN+A1QGhHnhTk+E7j
 dgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=a9C6+SkXCgAQxL1+f64P7tkBMU79LNh7HmR6YQczt8A=;
 b=rHM2bBveWj6SVkGk/pbwAv2NSatW0NbK8RnMI7zoWcANhSbVP3zUSxU3IJhz3VAigx
 8H6at2ALKtPYEEwpxgeFe7oNhu784q/2fCN9ywdtklMcH2m8tMhClHxgdE/qzwQrrlMo
 8Jdv8+zCUkLxh8JzGf6lajcqQN2mtvmg0Bc6Bd51qlUyOhUC0vlPYYkzJYShuwig2VxV
 kWdnvszQUquAvjdN7dVlRUO132RLllpfUgJ3V0g87/Z9OxFjuXe76Ko3NT1Cq5rYPo5H
 OjqFYdBZvU/+P+n366yn2hVdYZw1ZHa/MkeKwJrrmn5ch7xFPdDfiTSZmdrItFpA4IF9
 oxaA==
X-Gm-Message-State: AOAM532CpUHz7xFtdeXPtuwGEkYqfiwZI83zbvO2hDDCn/ipxEgSC8tY
 TYuvltipQbcugK+uQ6ujlPV8lw==
X-Google-Smtp-Source: ABdhPJxyGzA0n9T1hQLCGv3RxIC5vhQqIvZwVcGHl7HGP51rcmq1AWp8o4olV2W9i7c8y2dr8fgR1w==
X-Received: by 2002:a05:600c:203:: with SMTP id 3mr2511848wmi.88.1616586543270; 
 Wed, 24 Mar 2021 04:49:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 91sm3001492wrl.20.2021.03.24.04.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 04:49:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A272E1FF7E;
 Wed, 24 Mar 2021 11:49:01 +0000 (GMT)
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-23-cfontana@suse.de> <87eeg5iivn.fsf@linaro.org>
 <1ba15970-749a-27c5-ef72-6468b5501f46@suse.de> <87blb8ixmw.fsf@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v11 30/55] target/arm: wrap call to aarch64_sve_change_el
 in tcg_enabled()
Date: Wed, 24 Mar 2021 11:48:24 +0000
In-reply-to: <87blb8ixmw.fsf@linaro.org>
Message-ID: <878s6cixg2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Claudio Fontana <cfontana@suse.de> writes:
>
>> On 3/23/21 11:50 PM, Alex Benn=C3=A9e wrote:
<snip>
> Moving up the build chain to the revert I now get:
>
>   ./qemu-system-aarch64 -M virt,gic=3Dhost -cpu host -accel kvm -m 2048
> -net none -nographic -kernel
> ~/lsrc/linux.git/builds/arm64.virt/arch/arm64/boot/Image -append
> "panic=3D-1"
>   --no-reboot
>   qemu-system-aarch64: Property 'virt-6.0-machine.gic' not found

PEBKAC:

The proper command line is "-M virt,gic-version=3Dhost"

--=20
Alex Benn=C3=A9e

