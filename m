Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A90319744
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 01:02:22 +0100 (CET)
Received: from localhost ([::1]:48888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lALuf-0005Ey-1W
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 19:02:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lALry-0004d3-2f
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:59:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lALrv-0006M4-RI
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:59:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613087969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VYHesEVSWnpnVuWnw9Rxv/+IiMskU1AFlZOtcozrQOA=;
 b=PzaioRhv0IzvMPsoZg/4ISKIQbDsE4Sg/Bb4Vp7CO+vGriQipT0lzyLJHhbO0SBUUPk6es
 yGOvbiZbClpvpZ62z9Kmo3LDvi7XhN7NwqrGiv5wPEp5rPETZzOlYt5geZsb55HOWaem/V
 9kc7fk0s4j/9fwv7ICYqveG//YcSpLw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-aeMrE0IWO0ilkckEi1nrzw-1; Thu, 11 Feb 2021 18:59:26 -0500
X-MC-Unique: aeMrE0IWO0ilkckEi1nrzw-1
Received: by mail-wm1-f72.google.com with SMTP id z67so4040788wme.3
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 15:59:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VYHesEVSWnpnVuWnw9Rxv/+IiMskU1AFlZOtcozrQOA=;
 b=W4qbJ+3+t5dCUqvU/fKcgBX5LkFBDoe2xoM0bsCz+ARBLrNmtkEbsOANYcrET2n+ae
 CHi4/32POrWTMpAqrljBZ61I5pO8U8LiYJRpRurgrl9ceB4zqkOas+Lxvgzo3CjYj/Q3
 FS7cpwr5l0Enf4dICF3/GKpXMOvkJQ4f9yKF9eiwypkEqpmUPwZLo9rjm2iYOQFdR6y2
 6DxgQLuY4HmHAzs3NWKO10gtZnbAssVAfOyr7f/nQzVBOhCkKtjHvBnT3x+Ijbdu2sQU
 P/ZhrOItt39AlTwUCMgEEn0ibXagCXDcTdaIHbanetBcBpUJTac6FHmNO9PNS3RD6xzb
 9s5A==
X-Gm-Message-State: AOAM531+SAmj/H8tpmRoLcSKOU8rim/PofQH553ypS6hQF5LagrYkHI5
 0xwtH9g6y2Mdp9Yq0LVvZllo4eDF2Foa12RFR3cAxho3QCHrVZYzm0lHPFf/5UEPdvIofaaJjok
 g0xmhImGQzA2HEuI=
X-Received: by 2002:adf:ea87:: with SMTP id s7mr267679wrm.217.1613087965103;
 Thu, 11 Feb 2021 15:59:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3zp+gpcm+mJR3nu7GMxiheKNfT1FTRiOu13eYHIsbdDIPQb40FKH0ZlL+e42DInSDYwCCmA==
X-Received: by 2002:adf:ea87:: with SMTP id s7mr267663wrm.217.1613087964935;
 Thu, 11 Feb 2021 15:59:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k11sm6958501wrv.51.2021.02.11.15.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 15:59:24 -0800 (PST)
Subject: Re: runaway avocado
To: Cleber Rosa <crosa@redhat.com>
References: <CAFEAcA8z=vQ9E6hNKUuzk2EgH8Dpkxo=3YbnQ5iX0DYCQDr6bg@mail.gmail.com>
 <CAFEAcA_S81bnYVcNENW9bFApAc-Ob1uKQncsGPmyFD034p2FOA@mail.gmail.com>
 <20210211172541.GA2316309@localhost.localdomain>
 <CAFEAcA-3M_CaNEiZHohH-RdxYP1Cn=5s+UXYTYE1e7YhoN2+tg@mail.gmail.com>
 <20210211184710.GA2323314@localhost.localdomain>
 <CAFEAcA8twaP2=MGZh1OOHO8EFAVmQYM26i+QN6y26kaVfTNnwQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <22cc2681-b53c-b5b2-d8f0-8307bb514c21@redhat.com>
Date: Fri, 12 Feb 2021 00:59:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8twaP2=MGZh1OOHO8EFAVmQYM26i+QN6y26kaVfTNnwQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 8:21 PM, Peter Maydell wrote:
> On Thu, 11 Feb 2021 at 18:47, Cleber Rosa <crosa@redhat.com> wrote:
>> On Thu, Feb 11, 2021 at 05:37:20PM +0000, Peter Maydell wrote:
>>> I wonder if we could have avocado run all our acceptance cases
>>> under a 'ulimit -f' setting that restricts the amount of disk
>>> space they can use? That would restrict the damage that could
>>> be done by any runaways. A CPU usage limit might also be good.
> 
>> To me that sounds a lot like Linux cgroups.
> 
> ...except that ulimits are a well-established mechanism that
> is straightforward, works for any user and is cross-platform
> for most Unixes, whereas cgroups are complicated, Linux specific,
> and AIUI require root access to set them up and configure them.

I agree with Peter, having being POSIX compliant is better than
restricting to (recent) Linux. But also note we have users interested
running tests for Windows builds. See the Cirrus-CI.

> 
>> We can have a script setting up a cgroup as part of a
>> gitlab-ci.{yml,d} job for the jobs that will run on the non-shared
>> GitLab runners (such as the s390 and aarch64 machines owned by the
>> QEMU project).
>>
>> Does this sound like a solution?
> 
> We want a solution that works for anybody running
> "make check-acceptance" in any situation, not just for
> the CI runners.

Indeed. Public CI time being limited, I expect users to run tests
elsewhere. We don't mind about data loss on CI runners.

FWIW similar complain last year:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg672277.html

Regards,

Phil.


