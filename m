Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4719D65CE3E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 09:27:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCz6W-0001Ka-7n; Wed, 04 Jan 2023 03:26:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCz6U-0001K0-4k
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 03:26:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCz6S-0005Tg-Bm
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 03:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672820787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1QiPen7WZGqMK5HDxFClF59zoNXb2WzWmKpofU0zTFo=;
 b=HQhJsj4pNSVpWjprLyeViMUACQoKv67HCb9rUtOygSkx3me83zDPiGmXDnGf54Zvhkk5jD
 lem75GZDIHOe7KRJ0oh8LIcIJ2WgkyZ2KnMzju4iZx1Aus7V4Oygaf+gRsR/dYbL+jTR8k
 jT9B8kbNvtKvZ2a4kW+kML5VFCTBYNs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-196-hWVKpnUCObCO_NKsdu1Prw-1; Wed, 04 Jan 2023 03:26:26 -0500
X-MC-Unique: hWVKpnUCObCO_NKsdu1Prw-1
Received: by mail-qv1-f71.google.com with SMTP id
 i18-20020ad44112000000b00523149d387eso17486901qvp.16
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 00:26:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1QiPen7WZGqMK5HDxFClF59zoNXb2WzWmKpofU0zTFo=;
 b=zlRYTlvnqzlwPdzbkUk8Ci1u5sxhb//aKBOqfk5M1OiUD1WGSEY1XEVtZwfvJ6XgFt
 dl1B0XH5Z3J1/SKTdM+SbHapOgC+rcR9hGWEcnvuq+J1cW0EUJFKY2FYWIbQMkCjxmqE
 xJY1vvRryhX+85fxfq/TSjJotpJxHtCJpoKOfK0TPu2AvAgYxc1oBTh2IOAFl6TTYRlw
 3nSYbrf2GzB4I23lwK8VRTcYK7XW0DgvNEEy3nplXNzmSjbazux0HHCMN3yU4cyuzmBB
 fzssk24a2p+Ty3NG9IwDjc0bbsfEmTWCnrwx4taWSoGahJGrsbUqPBYUBO4WkABRfRdh
 KjZg==
X-Gm-Message-State: AFqh2krD6BlnFNh5C8Hw+JZnhHnCi8g8N3gtLszYy5vhMuoyFDJSEE3v
 /5CGlX6lDUdl0OZpYPdPyPkV0o2S/URGdhK9gxul2JHdOQ0Abm30y3FzvW0P2qnxfaOLdqKMCOZ
 Wb7F8rnyzHjzp4HE=
X-Received: by 2002:ac8:4509:0:b0:3a8:162d:e977 with SMTP id
 q9-20020ac84509000000b003a8162de977mr66271041qtn.58.1672820785684; 
 Wed, 04 Jan 2023 00:26:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs94hD+IKpPnG6wEVr1CbghPXzHZEZkZaBCIrHKTiXNxRnmXMhjdSYWG3IINjjOk/W1XFvfgw==
X-Received: by 2002:ac8:4509:0:b0:3a8:162d:e977 with SMTP id
 q9-20020ac84509000000b003a8162de977mr66271032qtn.58.1672820785434; 
 Wed, 04 Jan 2023 00:26:25 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-239.web.vodafone.de.
 [109.43.176.239]) by smtp.gmail.com with ESMTPSA id
 i17-20020a05620a405100b006fcb77f3bd6sm24185544qko.98.2023.01.04.00.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 00:26:24 -0800 (PST)
Message-ID: <84588ab8-2d22-3cf1-cc63-cf9bcbbc068a@redhat.com>
Date: Wed, 4 Jan 2023 09:26:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20221223172135.3450109-1-alex.bennee@linaro.org>
 <CAFEAcA_4BWu79sK6_CVYjqpYumHoRHTxRJgyQKPiS1q3O_bf6Q@mail.gmail.com>
 <874jt7qzb0.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL v2 0/6] testing updates
In-Reply-To: <874jt7qzb0.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.103, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 03/01/2023 18.47, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Fri, 23 Dec 2022 at 17:21, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>> The following changes since commit 222059a0fccf4af3be776fe35a5ea2d6a68f9a0b:
>>>
>>>    Merge tag 'pull-ppc-20221221' of https://gitlab.com/danielhb/qemu
>>> into staging (2022-12-21 18:08:09 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-231222-1
>>>
>>> for you to fetch changes up to 3b4f911921e4233df0ba78d4acd2077da0b144ef:
>>>
>>>    gitlab-ci: Disable docs and GUIs for the build-tci and
>>> build-tcg-disabled jobs (2022-12-23 15:17:13 +0000)
>>>
>>> ----------------------------------------------------------------
>>> testing updates:
>>>
>>>    - fix minor shell-ism that can break check-tcg
>>>    - turn off verbose logging on custom runners
>>>    - make configure echo call in CI
>>>    - fix unused variable in linux-test
>>>    - add binary compiler docker image for hexagon
>>>    - disable doc and gui builds for tci and disable-tcg builds
>>>
>>> ----------------------------------------------------------------
>>
>> The msys2-64bit job failed with a weird 'missing terminating "'
>> compiler error on ui/shader/texture-blit-vert.h:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/3547023328
>>
>> as did msys2-32-bit:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/3547023329
>>
>> Any idea? Is this just an existing error that's been masked
>> by the msys2 jobs consistently timing out before they get
>> to it ?
> 
> It ran fine when I pushed the branch:
> 
>    https://gitlab.com/stsquad/qemu/-/jobs/3519255299
> 
> but I can't see it building the object file ui_shader.c.obj in my build
> so I wonder if the builder has updated its development libraries since?
> I think it is a generated file.

FWIW, I also ran into this problem independently from this pull request 
while trying to increase the timeout of the jobs to 80 minutes:

  https://gitlab.com/thuth/qemu/-/jobs/3546685202
  https://gitlab.com/thuth/qemu/-/jobs/3546685203

So I don't think it is related to this pull request but something different.

Diff'ing the output between Alex' and my run, I can see that Alex log has:

  Has header "epoxy/egl.h" with dependency epoxy: NO
  ...
  OpenGL support (epoxy)       : NO

While my broken run has:

  Has header "epoxy/egl.h" with dependency epoxy: YES
  ...
  OpenGL support (epoxy)       : YES 1.5.10

So seems like something changed in the build environment, so that epoxy is 
now enabled there.

I guess we should disable it manually there again for the time being, until 
someone has figured out the real fix?

  Thomas


