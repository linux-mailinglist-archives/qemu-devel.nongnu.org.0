Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC25528821
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:12:00 +0200 (CEST)
Received: from localhost ([::1]:45358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcO7-0008AM-DE
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqbzl-0004Ra-S7
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:46:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqbkJ-00052u-Ha
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652711435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eGaT+iIi33bHegl1VlhSG2IEYJ8InUoDXpiKk3o1SrY=;
 b=GWxlXpMcanV0w5ykiXxM/3HFYMdZKAO4cdb7fL3lEzQigPuP+qno/jIx4CLE4pYjNjkWCm
 BY1X8FJd41bNCet8eDPWwsYsNtY/5ZHvqi3oeGc+muO949PhLZuJ5NIxjh6aqkR/8YbXNK
 lWBWqGJn2g7nLldnoAMRD9UjvODjbIM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-zFCQh9-OOPy7xVrMBz4tFg-1; Mon, 16 May 2022 10:30:34 -0400
X-MC-Unique: zFCQh9-OOPy7xVrMBz4tFg-1
Received: by mail-wr1-f69.google.com with SMTP id
 u11-20020a056000038b00b0020c9ea8b64fso3925826wrf.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 07:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=eGaT+iIi33bHegl1VlhSG2IEYJ8InUoDXpiKk3o1SrY=;
 b=D+jFvfiPPFa1iMc5iIj/w8c8YSpTLPH+g5MsaqJ8PXwyPVzxyX5VE2wd5UFgMHt930
 +i0fTJvznVIpHtXMHU9snpEBtEKHXv9BLyLqSCNl9Gah+7UdbzEPkmoG0nrptHGEHUq8
 OVZ6zRBB/Bow9gxx+7h9EDSycuWS16pDolLqybWgOFDykPXUGEl0yYJzm1wyGD5hI/YH
 QK2cFeYjQFxGftXvcu+LnJqm+RhLaPV/a8+W2/YNilwLOfQqXITi1x9hKcx6pTEcrfzq
 4HE/ykXu7wrPeslayfwDyd4TX+B6rkyuBprx3frfiJL+vUSwXPJBGTaj7sa5O8ndJdKL
 E27Q==
X-Gm-Message-State: AOAM532afzbOFI6/rxfVZTFVKaVdkPsTPix61NXqkZNyvlXUqksQex5h
 nG2fkWvBI65c+Jabrvkz/NLiZoCefD6gdz3tppSWh2fYaNUh+szhudcPQF723AMgItVsvl5WD5S
 281OFoMDs3zjexN0=
X-Received: by 2002:a05:6000:381:b0:20c:5e07:f75f with SMTP id
 u1-20020a056000038100b0020c5e07f75fmr14867643wrf.678.1652711433033; 
 Mon, 16 May 2022 07:30:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOZI6FAh1lKKWX5tvdOxkX9qCKk5Tk/J49QH7CxMnaBRAef83E07pahDWSZkkVPsWtgFuQ3w==
X-Received: by 2002:a05:6000:381:b0:20c:5e07:f75f with SMTP id
 u1-20020a056000038100b0020c5e07f75fmr14867632wrf.678.1652711432847; 
 Mon, 16 May 2022 07:30:32 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-178-142.web.vodafone.de.
 [109.43.178.142]) by smtp.gmail.com with ESMTPSA id
 z21-20020a05600c0a1500b003942a244f2fsm13574256wmp.8.2022.05.16.07.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 07:30:32 -0700 (PDT)
Message-ID: <5132a3d1-de12-a306-c64e-56cfd2c40a42@redhat.com>
Date: Mon, 16 May 2022 16:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <CAFEAcA_SSJ9BBryV0iuXi1G30e6HoMeuNbSpKDh4_+y2oxTLJw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Getting rid of the last bits of QEMU's 'ad-hoc CI' for merges
In-Reply-To: <CAFEAcA_SSJ9BBryV0iuXi1G30e6HoMeuNbSpKDh4_+y2oxTLJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/05/2022 14.43, Peter Maydell wrote:
> We've made pretty good progress on transitioning our pre-merge CI
> from running ad-hoc on machines the person doing the merge has access to
> to all CI being driven by the Gitlab CI infrastructure. For this (7.1) release
> cycle I think ideally we should try to get rid of the last few bits
> of ad-hoc CI so that for 7.2 we are using only the gitlab CI. (This
> will help in handing over merge request management to Stefan for 7.2.)
> 
> I think the last setups I have been using ad-hoc scripting for are:
> 
> (1) PPC64 big-endian Linux
> (2) NetBSD (x86)
> (3) OpenBSD (x86)
> 
> I think we can get away with just dropping ppc64be -- we have
> coverage for it as a cross-compile setup, and hopefully the
> s390x CI runner will catch the various "fails tests on big-endian host"
> issues. (Alternatively if anybody has a ppc64be machine they'd like
> to let us run a gitlab CI runner on, we could do that :-))

Ack, that should cover most scenarios already. (tcg backend is the only one 
that would not get any coverage anymore)

> For the BSDs, the ad-hoc CI is just running the tests/vm
> "make vm-build-netbsd" etc. Is there some way we can get
> coverage of this into the gitlab CI setup? (I think we
> have FreeBSD via Cirrus CI, so I have not listed that one.)

A simple setup is already there, running NetBSD and OpenBSD via KVM on the 
Cirrus-CI, see e.g.:

  https://gitlab.com/thuth/qemu/-/jobs/2411943817#L1973

Caveats:
- The jobs are currently marked as "manual only" since the double
   indirect setup (via cirrus-run and KVM) is not that reliable.
   Also we can not run that many cirrus-ci jobs in parallel, so
   we likely don't want to enable these by default.
- Compilation is not very fast, the jobs often run longer than
   1h, though the --target-list is very short already.

Anyway, this should show that running NetBSD and OpenBSD is very well 
possible in our CI - we just need a more powerful x86 host with KVM enabled 
for this.

  Thomas


