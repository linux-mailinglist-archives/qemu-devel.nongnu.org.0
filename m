Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685134C2AE5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 12:29:32 +0100 (CET)
Received: from localhost ([::1]:47842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNCJP-0004QG-7u
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 06:29:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNCHi-0003Ib-Kz
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:27:46 -0500
Received: from [2a00:1450:4864:20::52e] (port=38523
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNCHg-0003PB-TT
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:27:46 -0500
Received: by mail-ed1-x52e.google.com with SMTP id s24so2347172edr.5
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 03:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=YLzcaRukioTGcQHgHEe89udE+IyAvH9t3DqVtRsNEh4=;
 b=wiMDqQgpdirjGfn5Dxxwz+eZRS7dEBjODYlPPdLf/zL3IuHEq61waRYiHEg6U35fRa
 zbSEHzbhzQsMJtKPvl0cmxHSGgJdiaA47q9Nx5M5fr44C4pMqk1gBOf+t87Wt5NL4o9O
 BMQGgpCAingrrxKwxKfAAr4jp9QGDm6PQAqoyykp+gcTmGo+WLaxwffE5MJevl1ZJmPC
 nRBFT2EJM0J1GUOv04bjdNx1LZrCe87bADQli2no+Lq0IX4BKZoVxW0ArZDKNeNG7vCG
 pLMWKPUDXbVDvt6Ww3+GzcZsQmOKM2AOBam8ImrrLeI3FeAw6oeg28EeWmlpjoYZYR5/
 9ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=YLzcaRukioTGcQHgHEe89udE+IyAvH9t3DqVtRsNEh4=;
 b=1AHMDCJv5vJ69+iAM15R7sURhm89RMc7rzNPomXJOtl9Z670Se2hvq838em1vcoHJP
 +cp3z8XAVmDO7foBcfgVP2KnwVDdbYMtthlWEx2qhg8354p0yYNBCzLMU226ixJy/10v
 QskS2DoKDA6YZ5/9qLFvm/NBdatOGT11mspYHTVgxxtorw064BJGIBTPl5jpwQNZmPGi
 PWv40ex6TumAxmBZyRh/YaYZpQZD6TlCr//qhkUZmUVpVjsiMW1IHbuAUY+B3hvZnOwC
 +2u3rc5HtcA1pVLIA1w0kFsEYTrOQeBa3rFO+OSLHhrSw2Jei19nx16hxje9hAAiq5gF
 U9kA==
X-Gm-Message-State: AOAM530joAiPPHxFhGb+wq39hhdH+a2B8D/FB5Xv0GFk5nPoySS8BXaS
 iLIjiTPhYBdP6OTAKdlLfn43JA==
X-Google-Smtp-Source: ABdhPJwAMIhkXIM1lazN3SUtEEhb8xKwnINuStlmvKPBMcUnSDL8zD+hj3cBSdx+uJACwNxyixjhUQ==
X-Received: by 2002:a05:6402:254b:b0:412:d172:2607 with SMTP id
 l11-20020a056402254b00b00412d1722607mr1877747edb.80.1645702063350; 
 Thu, 24 Feb 2022 03:27:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c1sm1196658ejn.203.2022.02.24.03.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:27:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 748CD1FFB7;
 Thu, 24 Feb 2022 11:27:41 +0000 (GMT)
References: <010e01d82875$d3cc0ec0$7b642c40$@sysprogs.com>
 <93318cc1-bf62-34dd-190c-1961a4716f75@redhat.com>
 <01e801d828f0$b58a6e40$209f4ac0$@sysprogs.com>
 <CAFEAcA_y=xRhBoStyxa+UZcyibAzgcJSf+kQO4e0BMrdq4j6Jg@mail.gmail.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/3] whpx: Added support for breakpoints and stepping
Date: Thu, 24 Feb 2022 11:22:10 +0000
In-reply-to: <CAFEAcA_y=xRhBoStyxa+UZcyibAzgcJSf+kQO4e0BMrdq4j6Jg@mail.gmail.com>
Message-ID: <87v8x433o2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ivan Shcherbakov <ivan@sysprogs.com>,
 qemu-devel@nongnu.org, armbru@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 23 Feb 2022 at 20:08, Ivan Shcherbakov <ivan@sysprogs.com> wrote:
>>
>
>>  static GDBState gdbserver_state;
>> +static bool gdbserver_is_connected;
>> +
>> +bool gdb_is_connected(void)
>> +{
>> +    return gdbserver_is_connected;
>> +}
>
> I haven't looked at the rest of the patch -- but can you explain where
> whpx is different from how other accelerators handle debug such that
> it needs to know whether gdb is connected or not ?

It's backwards from how it should work. I don't know about the other
accelerators but in the KVM case the gdbserver handles the requests for
installing breakpoints and watchpoints and if KVM is enabled passes them
onto the arch specific code.

When QEMU prepares to enter the run loop it checks for the presence of
those things and then can make the arch specific decision about how to
invoke KVM (see kvm_update_guest_debug and friends).

Just the fact you have connected to the gdbserver shouldn't affect how
you run WHPX up until the point there are things you need to trap - i.e.
handling installed breakpoints.

FWIW we rejected a similar patch a few weeks ago that wanted to change
emulation behaviour based on gdbserver connection status.=20

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

