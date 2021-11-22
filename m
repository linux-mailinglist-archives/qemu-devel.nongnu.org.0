Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EADD458F9F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 14:43:27 +0100 (CET)
Received: from localhost ([::1]:49538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp9bR-0004Ue-Go
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 08:43:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mp9X4-0000uh-RN
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:38:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mp9X3-0001ry-FZ
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637588332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rwY3o/VQqo00YePBAj9g+Nv81SqmDpyw3j8pRIXWUUE=;
 b=dHx66hWDQcRIi/pE1Y599sbh99IN67G8jJnfpbrrMOJ9xTCfAQPMtBGB4DzDYhTgN9RGAu
 cOKI/GuoV7yo4D7g+v65k0KN6l8C5vtBx47XcR4zOAl0CbZP2ENRkcfeNLi4tNouYZkC4d
 pStlSq7V9E7c+8R1fY+j1EfTabzQv3w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-DmXzu1seM0qkhythOKZOew-1; Mon, 22 Nov 2021 08:38:51 -0500
X-MC-Unique: DmXzu1seM0qkhythOKZOew-1
Received: by mail-wm1-f72.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so9404474wmr.3
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 05:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rwY3o/VQqo00YePBAj9g+Nv81SqmDpyw3j8pRIXWUUE=;
 b=MToD7gqB7mhzOAvG6YeKJ+jGN9YYtBuYKJoylIDLyWCJD6gO3a+eViuvXZDljPGLeb
 sEQHklTiYaZIxRhQul1KLxStsyZNzLbc/l5ZSp2o7CfwEO9uOXBHv8fIrhoHZm/BsorK
 usB+rPCVA1GlVN2OUKetcZ/Lup0cDK2BnFxwqUI+WrfH1Y6sVj80ISuTcVkNBZwTop53
 ISJJINU89F09B6OefPOTFxY/ePGOGJ8pj/k178MNuReXPb2MYEyogriDWLDt/QAqcnjd
 1gI4VgcLqSzKWv47ko8It2FVio7kmtzK7jaxZGU4icpAVWHgwXnDlNnZYxa4AC01Wy+N
 n0/Q==
X-Gm-Message-State: AOAM530wBO3CbOTxhDFmfT1sXKixjie/7/0X3C4wtWGvp+EsUaDvR8qF
 ww2OAv0zJGlHdTRt3E4UwnyoTPQ8bBEnA5nq5nB29p6C9xJKU+hath+Ah7B1/pL0PWFdWeRtMPs
 NxNJp+g2+bxg/oDw=
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr37405015wrw.116.1637588330454; 
 Mon, 22 Nov 2021 05:38:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxig5J+xFpa/poBSCii3211ZdlSgBulYgpW2WVsXjyTLCvJr4vsBqGq1onnnyzl72RjKxklvg==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr37404987wrw.116.1637588330299; 
 Mon, 22 Nov 2021 05:38:50 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id d9sm8777596wre.52.2021.11.22.05.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 05:38:49 -0800 (PST)
Message-ID: <16f9a181-9398-12f4-4d3b-5c15bee15e35@redhat.com>
Date: Mon, 22 Nov 2021 14:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] docs: Fix botched rST conversion of
 'submitting-a-patch.rst'
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211119193118.949698-1-kchamart@redhat.com>
 <20211119193118.949698-2-kchamart@redhat.com>
 <56026d2a-0b9e-ff83-d953-a284a810a8ed@redhat.com> <YZtu59t8DoZZ15nQ@paraplu>
 <b03ffb0c-0c4f-b792-f6c1-55014a0ae003@redhat.com> <YZuK09xP0I28dvMr@paraplu>
 <c591c571-f922-28a5-e8be-75e6cccb261a@redhat.com>
 <CAFEAcA8QuSsazUZU23DJgXHhU=ez948wQFJkHZGRYWxhiXbuDg@mail.gmail.com>
 <ef4ff222-1053-904a-77c2-39adc9dd929a@redhat.com>
 <YZucJGIZFKM7v3xa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YZucJGIZFKM7v3xa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <Laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/11/2021 14.33, Daniel P. Berrangé wrote:
> On Mon, Nov 22, 2021 at 02:30:10PM +0100, Thomas Huth wrote:
>> On 22/11/2021 14.25, Peter Maydell wrote:
>>> On Mon, 22 Nov 2021 at 12:37, Thomas Huth <thuth@redhat.com> wrote:
>>>> What about simply replacing it with a new sentence below the bullet list,
>>>> saying:
>>>>
>>>> "Please also use a spell checker like `codespell
>>>> https://github.com/codespell-project/codespell` with your patches"
>>>
>>> How many regular contributors actually do that?
>>
>> Considering the typos that we have in the code, not enough ;-)
>>
>> Anyway, it's just a polite recommendation here, not a must-do, so mentioning
>> codespell here doesn't really hurt, does it?
> 
> Well if you run 'codespell' with no args on qemu.git right now, you
> get over 5000 possible mistakes reported. Many (perhaps even most)
> will be false positives, but with that amount of existing report,
> I don't think its credible to request contributors to run this
> and wade through its results to see if they made things worse or
> not.

Ok, then maybe something like this:

"If your patch adds new documentation, then please also consider to use a 
spell checker like `codespell` to avoid typos in the new text" ?

Otherwise, I can also simply drop that sentence about spell checking.

  Thomas


