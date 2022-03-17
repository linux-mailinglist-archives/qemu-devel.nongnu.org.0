Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ADC4DCDE1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 19:48:58 +0100 (CET)
Received: from localhost ([::1]:33940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUvBB-00050s-5E
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 14:48:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUupz-0004Ht-56
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:27:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUupx-0006eq-Jk
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:27:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647541621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bqM2XRyMXUY0KWEny9NaI7B8/abSfTVMX6bkyBMyP/c=;
 b=DmoBm140iLTq62wOy4jjls86Qw1UlWP37/Cw5wydlGPvb1nuEOlu4wyOpZaf8cWYHClto9
 x20SWS5Cpgp2IldHvgZmoh6X/Zy8AnAPpNLyBgN9/yMgyK7o88ohIbfDKf7E84O8vMAxfY
 pSrXCyaP8L5+/quqTbx2N1NuWNQHI1E=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-g3GT9XPDPkyb-4u01Gqb2A-1; Thu, 17 Mar 2022 14:26:59 -0400
X-MC-Unique: g3GT9XPDPkyb-4u01Gqb2A-1
Received: by mail-ej1-f69.google.com with SMTP id
 jy20-20020a170907763400b006db62b6f4e0so3354585ejc.11
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 11:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bqM2XRyMXUY0KWEny9NaI7B8/abSfTVMX6bkyBMyP/c=;
 b=wocfdk2ostG+HsJ4SpGKF3sLCxVWqSLljP/W2J7xOkoLESuLUhInZUx1zU/x1wPs9Q
 mt7ZW9OupSMYih8ytYHi8S67QrWrysdu1ob65fouKeh9iyKZBs58X35WX5Q4EHd12HZL
 BBeJv7DP8YQqRY6i92LPhTPlmUvpefEWATmZyp/bLHdkGPgFpILteDYINezqbVoQpohh
 NGX712uvtTjiWik+EPIC4hn5Np6w080QyjwnOLOZUGq5u60jYJEWn+gXK6+1PPBVZlxm
 QDLKvv9soaJkrNK5CL+8lRiOz6xku2k6q14alexxbY6dcFeQv4FIzeBL2QpRe6AWvKWG
 K0tA==
X-Gm-Message-State: AOAM530aTbjL/jpv9sVZu4RzPGdBa530C9cdl1DBLwkR+4ul3PmhnEyQ
 yaH+MexxDcvAv98W3o4V85OhJIgQ6MOTMk3Uk2BTSA27hcdRAoOjmByI7JArsOvFUSgAtOZfgoz
 mjLA+9eqyNEzd+7Q=
X-Received: by 2002:a17:906:a147:b0:6a9:f492:3c4d with SMTP id
 bu7-20020a170906a14700b006a9f4923c4dmr5565695ejb.131.1647541618681; 
 Thu, 17 Mar 2022 11:26:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO+KE9PfbF3fF+h93ABetQqtRtx5wojiLWqVd87pJsSc628geZZuJPqcF58HQOfCAYPiFiCQ==
X-Received: by 2002:a17:906:a147:b0:6a9:f492:3c4d with SMTP id
 bu7-20020a170906a14700b006a9f4923c4dmr5565671ejb.131.1647541618285; 
 Thu, 17 Mar 2022 11:26:58 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a1709065d0d00b006df7dfa2a51sm2550379ejt.132.2022.03.17.11.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 11:26:57 -0700 (PDT)
Message-ID: <c551d045-3e72-2933-2721-b7641edb5b00@redhat.com>
Date: Thu, 17 Mar 2022 19:26:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 14/14] iotests: make img_info_log() call qemu_img_log()
To: John Snow <jsnow@redhat.com>
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-15-jsnow@redhat.com>
 <38910bd4-7f8f-bdf4-29a0-f76f01d75ade@redhat.com>
 <CAFn=p-ab92NRL+E7RytaUo_1S1UB0_eq1EJLjfTGs2Sn_dqSuQ@mail.gmail.com>
 <CAFn=p-YXugb5Qz4VH8OvDMOtqjU=hS54oSo=hjRyn-i02v=dww@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-YXugb5Qz4VH8OvDMOtqjU=hS54oSo=hjRyn-i02v=dww@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.03.22 18:45, John Snow wrote:
> On Thu, Mar 17, 2022 at 1:00 PM John Snow <jsnow@redhat.com> wrote:
>> On Thu, Mar 17, 2022 at 11:39 AM Hanna Reitz <hreitz@redhat.com> wrote:
>>> On 09.03.22 04:54, John Snow wrote:
>>>> Add configurable filters to qemu_img_log(), and re-write img_info_log()
>>>> to call into qemu_img_log() with a custom filter instead.
>>>>
>>>> After this patch, every last call to qemu_img() is now guaranteed to
>>>> either have its return code checked for zero, OR have its output
>>>> actually visibly logged somewhere.
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> ---
>>>>    tests/qemu-iotests/iotests.py | 13 +++++++++----
>>>>    1 file changed, 9 insertions(+), 4 deletions(-)
>>>   From my POV, this is a regression because before this patch (not this
>>> series, though, admittedly), `img_info_log()` would throw an exception
>>> on error, and with patch 12 being as it is, it will revert to its
>>> pre-series behavior of not throwing an exception.  I prefer exceptions
> Oh, actually... patch #12 does this:
>
> -    output = qemu_img_pipe(*args)
> +    output = qemu_img(*args, check=False).stdout

:(

You’re right, I missed that.

> so I never actually toggled error checking on for this function at
> all. This isn't a regression.
>
> At a glance, img_info_log() calls fail as a matter of course in 242
> and 266 and ... hm, I can't quite test 207, it doesn't work for me,
> even before this series.

Ugh, broken in e3296cc796aeaf319f3ed4e064ec309baf5e4da4.

(putting that on my TOFIX list)

> I didn't test *all* qemu_img calls yet either, but ... I'm going to
> gently suggest that "converting logged calls to qemu_img() to be
> checked calls" is "for another series" material.

:C

I mean, adding a `check` parameter to `img_info_log()` and 
`qemu_img_log()` would be something like a 9+/5- diff (including 242 and 
266 changes, but disregarding the necessary comment changes in 
`qemu_img_log()`).  I think that’d be fine, and a bit thin for its own 
“series”. O:)

Hanna


