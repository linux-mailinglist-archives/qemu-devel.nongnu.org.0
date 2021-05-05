Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE19C373885
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:25:50 +0200 (CEST)
Received: from localhost ([::1]:45824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEiz-0003Em-UA
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leEgm-0002U5-S9
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:23:32 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:34567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leEgl-0007ur-6s
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:23:32 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso2735652wmc.1
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 03:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=r1SmcrpQkzlZ6yN+zd0kJHCF3Eq/8XBFHirYFzhrq80=;
 b=M5JXTsfnDYkhihvHA3pIk59tb+lnYeB5G+b2lbhreRhdNvh9rteHT8ubwJE1SSbRHb
 TlmO8f2KIwmdKKiXN8drtsuCVOYTExudm438SMGK0IK2urjxE+MsFZmR6YpZaoILHQHk
 i0KKakah+V3l9Z/qED8qt92f1b5OMB4o+Y6jFi9qZC8/3HDh74CkPUKRZ7dFCNITg2Kk
 Zk1q/1Gta6Mkjy2hMpEYLV3zENvR6zxwDHabe5Pd7Rv/4hYY/2nHa1uTBXtmBm95zc2d
 8r6rsV6fuM+c6A9wQ//iqFkQRwgUzq5VJynlh2ZwWMxrRPuFSsTGKe9mSjPHNPQAXsov
 QJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=r1SmcrpQkzlZ6yN+zd0kJHCF3Eq/8XBFHirYFzhrq80=;
 b=KcYnhFBrRf1MgMolcJq0sLjScDXXfrv1bp8omxbuDs2QlzDI0Fnw6serXnQSArMSZc
 W8pNW6SqFwJsjNww2Oopu9300EcoX5/+2TVCvdGP//kvpvzirB0UNKrBthWa9u8a8AIo
 PQih/QMlMRmemI4jMdJ87WXBF/8Mbsnx0hnCYetbREC4+NOdMkA1pkFF5B52i6uVejUa
 ZDU33pZnhy/ONoikemq8M67x5dIomj7lXmF/sAR944/h71hO12WMCnHp0QNVs78n9hBP
 B8QtPAZpyZr7mbBLFeoKEF1ifvrjJmXiFqijQTTGsPY0BKaolLSuOPsRRLv64mOvehRL
 LGFQ==
X-Gm-Message-State: AOAM532MMyjdklLm+C5FMOF6KdtAmeJLTVTH4LxpgL1o6xoZ4JvpPwUv
 rC/KZmue/xkHfvP38tSN7+MUuw==
X-Google-Smtp-Source: ABdhPJxL8eFupumSeejUZKBA1ri0KVt1IyMDNB0xtl5DakxFbKweYcO8iRR8u9ji1a1JkcAeZVj4yQ==
X-Received: by 2002:a05:600c:228b:: with SMTP id
 11mr8965399wmf.6.1620210209545; 
 Wed, 05 May 2021 03:23:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l22sm5019025wmq.28.2021.05.05.03.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 03:23:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E59811FF7E;
 Wed,  5 May 2021 11:23:27 +0100 (BST)
References: <20210301085450.1732-1-cfontana@suse.de>
 <cfeead83-4890-bdd8-c5cb-9bdb2ca24abb@suse.de> <875z21aghn.fsf@linaro.org>
 <50c3c1e6-cc62-ee50-874b-72615d7bfac7@suse.de>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v26 00/20] i386 cleanup PART 2
Date: Wed, 05 May 2021 11:04:37 +0100
In-reply-to: <50c3c1e6-cc62-ee50-874b-72615d7bfac7@suse.de>
Message-ID: <87o8dpo4ww.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 3/8/21 3:02 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Claudio Fontana <cfontana@suse.de> writes:
>>=20
>>> Hi,
>>>
>>> anything else for me to do here?
>>=20
>> It looks to me that this series is looking pretty good. Every patch has
>> at least one review so I think it's just waiting on the maintainers to
>> pick it up.
>>=20
>> Paolo/Richard - are you intending to take the series as is or are you
>> waiting for something else? I'd like to see the patch delta reduced for
>> the ARM cleanup work which is still ongoing.
>
> I am a bit at a loss here, as this has been reviewed for a while, but not=
hing is happening.
> Rebasing is starting to become more and more draining;

This is still the latest re-factor right?

  Subject: [PATCH v28 00/23] i386 cleanup PART 2
  Date: Mon, 22 Mar 2021 14:27:36 +0100
  Message-Id: <20210322132800.7470-1-cfontana@suse.de>

> I am seeing some changes from Phil that redo some of the patches here (li=
ke target arch user),
> maybe you would like to drive this?

AIUI his changes where to get qtest passing. I've just been chatting to
Paolo on IRC so I think we are almost ready to go.

  > bonzini_: what's currently holding up getting Claudio's re-factoring
      work merged?
  > f4bug: also ^ - I'm a little worried we have splintering
      re-factoring forks
  *** First activity: f4bug joined 2 hours 8 minutes 6 seconds ago.
  <f4bug> stsquad: the qtests series is pending imammedo review then
      could go in
  <f4bug> stsquad: which would simplify a bit Claudio's series (on
      respin he could drop a pair of patches)
  <f4bug> stsquad: my understanding was bonzini_ would merge the x86
      series, then pm215 could merge the arm one on top
  *** First activity: bonzini_ joined 1 hour 17 minutes 25 seconds ago.
  <bonzini_> ok i can queue it in my next PR
  <f4bug> the only blocking part is qtest not passing, but Claudio's
      refactor series is not the culprit
  <bonzini_> ok

--=20
Alex Benn=C3=A9e

