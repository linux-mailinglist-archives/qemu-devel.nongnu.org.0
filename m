Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB91669DEE0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:34:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQtz-00064Q-Ve; Tue, 21 Feb 2023 06:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUQtx-00062R-NZ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:33:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUQtv-0006Ci-VQ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676979219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFCMDJaEZGpAhm8i8iJXJSz1nsR0PNTOBgZ3nFmGL94=;
 b=A6x5GHqxHIdCS0YmB5HuOb1pnTEqo68gIAfIop4eUJpZsRLc/XMB/CzoNyZaM5TYokbjY5
 9sFHddZxbNFIWOYNrK/Lu1nR8iHcyN0Cmr3Z8SeqnhcTD0fk8zoHcQQgoffrGUHOw0OSeQ
 HWPMKtUnPW8oMvh9oNx5PAyp+XGYV+A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-491-JgBze8pyMbuIWfL_b0gUpQ-1; Tue, 21 Feb 2023 06:33:38 -0500
X-MC-Unique: JgBze8pyMbuIWfL_b0gUpQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 v12-20020a056402174c00b004acb5c6e52bso5351601edx.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 03:33:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HFCMDJaEZGpAhm8i8iJXJSz1nsR0PNTOBgZ3nFmGL94=;
 b=MKdK/92F5Y+U6FOIOC2wZRRxxtdNjPKQ/X888kmo4RBzB2duf3/gJbnNCnO+Bjw3qU
 Q/Cgq/HP3VhM01/tSoXo+Jab1cEmT5J1CYVofR8U2Iosa0r/6tq+5QL3XlHO/SVtcHgv
 C+gfR2bDpXM4FPEanb2l+cj3ZLBUMC8CPi2uPfU6cmR4J9PxiWI+2w8PtGvBp1ToTCXq
 0Qc/eIe7zTQStWoR/2mFKjY2yLMy+bynB66yQFt7E4NO8Y2V53lX+7Mrsf4wJ5P3+/UZ
 uK39Gememta+KDJMHnPTfqCNu/3DLyX59MYifQObu5dvSW+CzOdWcjrQE1TALnxs16vt
 KFJg==
X-Gm-Message-State: AO0yUKWqpxyL4UbcDUUqijaCiNgbAs8cVcykYwlQpkb5mLAJL8nztePl
 5baM7xq+7SmrabPXherzSEz/v6SA9Gtxb/TXVqO0ibd3DMYZUDPNOXofV6jKEE2TiGEjvqGzbM6
 mTF+ubvk479HsWxs=
X-Received: by 2002:a17:907:6d0a:b0:8af:4418:8700 with SMTP id
 sa10-20020a1709076d0a00b008af44188700mr16680128ejc.47.1676979217102; 
 Tue, 21 Feb 2023 03:33:37 -0800 (PST)
X-Google-Smtp-Source: AK7set8JwoWTNWH/zHQXKr5oMNs38nwtrE7z0Z2UrAfb/I6zH4JMm4z0m1RgtgKoNeKztr88b+mYHw==
X-Received: by 2002:a17:907:6d0a:b0:8af:4418:8700 with SMTP id
 sa10-20020a1709076d0a00b008af44188700mr16680096ejc.47.1676979216763; 
 Tue, 21 Feb 2023 03:33:36 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 mm26-20020a170906cc5a00b008b31e317c04sm5612230ejb.89.2023.02.21.03.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 03:33:36 -0800 (PST)
Message-ID: <81b5a975-d8de-b4d5-a93b-1f8dcff36f29@redhat.com>
Date: Tue, 21 Feb 2023 12:33:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 0/6] Python: Drop support for Python 3.6
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
References: <20230221012456.2607692-1-jsnow@redhat.com>
 <87h6vfzemu.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87h6vfzemu.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/21/23 08:00, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> CI: https://gitlab.com/jsnow/qemu/-/pipelines/783612696
>>      [Updated for v3, still all green.]
>> GL: https://gitlab.com/jsnow/qemu/-/commits/python-require-37
>>
>> Hi, discussion about this series is ongoing. This series (v3) is not
>> meant to address all of that discussion, but rather is an updated
>> baseline for what we are capable of right now, today, without much
>> additional engineering. It's meant to serve as a reference for further
>> discussion.
> 
> Misses the RFC tag then :)
> 
>> To my knowledge, the inconveniences caused by this patchset as currently
>> written are:
>>
>> (1) Users of CentOS 8 and OpenSUSE 15.4 would need to install an
>>      additional python package that will exist side-by-side with their
>>      base platform's Python 3.6 package.
>>
>>      "zypper install python39" or "dnf install python38" is enough;
>>      configure will do the rest of the work.
>>
>>      It's my understanding that this is largely a non-issue.
>>
>> (2) Due to our Sphinx plugin that imports QAPI code from the tree,
> 
> I can read this as "Due to our Sphinx plugin (which by the way imports
> some QAPI code)" or as "Due to out Sphinx plugin importing QAPI code".
> The former is more accurate.  We need a newer Sphinx because we use a
> plugin, the plugin is written in Python, so our new Python requirement
> applies.  Fine print: the code the plugin imports from QAPI is going to
> break first.
> 
>>      distro-provided versions of Sphinx that are installed and tied to
>>      Python 3.6 will no longer be suitable. Users may forego building
>>      docs or install a suitable sphinx using "pip".
>>
>>      It's my understanding that this one is "kind of a bummer".
>>
>> I feel that the inconvenience caused by (1) is minimized as is possible;
>> the inconvenience caused by (2) is slightly worse and I concede the
>> workaround has some complexities that I would otherwise seek to avoid.
>>
>> As far as I am aware, the way forward is to work with Paolo to implement
>> a proper venv solution for the build tree that will help mitigate the
>> fallout from (2) by automating the use of a pip-provided Sphinx in the
>> cases where the distro-provided version is insufficient.
> 
> So, your current plan is to rebase this series less its DO-NOT-MERGE
> parts, on top of Paolo's.  Correct?

Yes, I will post a non-RFC v4 once all the feedback is gathered.

Paolo


