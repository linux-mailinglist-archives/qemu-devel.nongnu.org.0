Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA48355BF94
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:45:19 +0200 (CEST)
Received: from localhost ([::1]:33554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66qT-00027p-4D
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o662s-0001G5-85
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:54:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o662e-0007VF-Bl
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656402827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=99GbBGcqi6vb54iTWcopxWZ63j6WBTbKfrg9bpgH6KU=;
 b=KqeBKW/Z6M+qhqT2/TdiaaehPQmzsnI1PStkSLidq0XaaCNo2lFU3Qbiq6yBCn099KC5xj
 jCl0HK4EK/TuoioRrMcuQ4E6atyhAECBecu+ZxI9wtezG1EkwWghx/i0kkMcvnt85sFBNC
 zS94QJMwzkr8bRTVua0yO+mTxS2Oq1E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-PwRitDQ1PIOf7pPSOfpkJw-1; Tue, 28 Jun 2022 03:53:45 -0400
X-MC-Unique: PwRitDQ1PIOf7pPSOfpkJw-1
Received: by mail-wm1-f71.google.com with SMTP id
 p6-20020a05600c358600b003a0483b3c2eso3381693wmq.3
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 00:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=99GbBGcqi6vb54iTWcopxWZ63j6WBTbKfrg9bpgH6KU=;
 b=8AWb8v9yIzhfpzc0ANpyPXCy1541nHNxXhuvsnEkhbJPVG1i6jjCR1ZYU+Ep0PG2pM
 mCOIePQCB1kSGSZV676cVkFWSaDTymn+Ys1cXO1iB8IPHGGC/anXj0NU5H0dJDv1zVim
 aLjV/nZvfAWHW8lTkxHS+CK3/gzyZ0bk84WNjutwGkAlwWVHEW29YuAobclzWN8+qUgD
 ltThrbxdb4VBwLJ3NtGyPoi2sX8Blkt74tvY3Q4EoeoeHqk/5GFmbOUir/jeVg2PLnJb
 P9T6kj07bZzkJl+TybkTs3L2GDSR0A0gX9XfcYb/hZBoQdr4mZ0J6cl/Nuen9J0rDTnV
 n6TA==
X-Gm-Message-State: AJIora9sUVRzba3L/3G4eAL8jUYYuwppIj92sIsg718tpgwgMgmXU0fI
 5STLObZ2bA9wnDWUv5QBtkzti1PPqE0VB4ZFiUsV74aY/E6X0epF7iNCJbJKZQlIYAp4VltvdPN
 7AdOZr3HTBYJ5fN8=
X-Received: by 2002:a05:600c:3794:b0:39c:61f6:d0f1 with SMTP id
 o20-20020a05600c379400b0039c61f6d0f1mr25003398wmr.206.1656402824506; 
 Tue, 28 Jun 2022 00:53:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1taDLQTV4PJeWP3dL64SyK486vo3Qt7TFyc+GO8s5fQ8xdpGvjEXoO6PZjzcLu7NpVRK6l0Ug==
X-Received: by 2002:a05:600c:3794:b0:39c:61f6:d0f1 with SMTP id
 o20-20020a05600c379400b0039c61f6d0f1mr25003369wmr.206.1656402824242; 
 Tue, 28 Jun 2022 00:53:44 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 bg30-20020a05600c3c9e00b003a04912351fsm8350289wmb.17.2022.06.28.00.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 00:53:43 -0700 (PDT)
Message-ID: <b326b82b-06af-a0be-0cbd-d79fcd458fbb@redhat.com>
Date: Tue, 28 Jun 2022 09:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <20220627072856.1529357-12-ani@anisinha.ca>
 <20220627182027-mutt-send-email-mst@kernel.org>
 <CAARzgwznJUrO-7kjZ+58qj=UG6V9wojP=ZfW7FePyvb6GxdNtA@mail.gmail.com>
 <20220628020017-mutt-send-email-mst@kernel.org>
 <CAARzgwwf_WRWzbwPorpa-4XN7T6f6D7CRo70+07Z8LgZO+5Spg@mail.gmail.com>
 <20220628021757-mutt-send-email-mst@kernel.org>
 <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
 <20220628024810-mutt-send-email-mst@kernel.org>
 <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <CAARzgwzumnYN5LggnfEzoy19nQHv-vhVtQZnHZ=MhiP9+xUfeQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAARzgwzumnYN5LggnfEzoy19nQHv-vhVtQZnHZ=MhiP9+xUfeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 28/06/2022 09.49, Ani Sinha wrote:
> On Tue, Jun 28, 2022 at 12:55 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 28/06/2022 09.10, Michael S. Tsirkin wrote:
>>> On Tue, Jun 28, 2022 at 09:03:33AM +0200, Thomas Huth wrote:
>>>>>>>>>> No problem with that. So that's venv. But do we need pip and pulling
>>>>>>>>>> packages from the net during testing?
>>>>>>>>>
>>>>>>>>> We do that too. See requirements.txt in tests/
>>>>>>>>> Following two are downloaded:
>>>>>>>>> avocado-framework==88.1
>>>>>>>>> pycdlib==1.11.0
>>>>>>>>>
>>>>>>>>> Also see this line in Makefie.include:
>>>>>>>>>
>>>>>>>>> $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
>>>>>>>>
>>>>>>>> Right but that's avocado since it pulls lots of stuff from
>>>>>>>> the net anyway.
>>>>>>>> Are the libraries in question not packaged on major distros?
>>>>>>>
>>>>>>> Currently I only need this:
>>>>>>> https://github.com/python-tap/tappy
>>>>>>> which is the basic TAP processing library for python.
>>>>>>>
>>>>>>> It seems its only installed through pip:
>>>>>>> https://tappy.readthedocs.io/en/latest/
>>>>>>>
>>>>>>> I do not think this is packaged by default. It's such a basic library
>>>>>>> for parsing test output that maybe we can keep this somewhere within
>>>>>>> the python src tree? Not sure ...
>>>>>>
>>>>>> It's pretty small for sure. Another submodule?
>>>>>
>>>>> Unlike BITS, this one is likely going to be maintained for a while and
>>>>> will receive new releases through
>>>>> https://pypi.org/project/tap.py/
>>>>> so forking is OK but someone has to keep this updated.
>>>>>
>>>>> I am open to anything. Whatever feels right is fine to me.
>>>>
>>>> John Snow is currently working on the "Pythonification" of various QEMU
>>>> bits, I think you should loop him into this discussion, too.
>>>>
>>>>    Thomas
>>>
>>> submodule does not mean we fork necessarily. We could have
>>> all options: check for the module and use it if there, if not
>>> use one from system if not there install with pip ..
>>> But yea, I'm not sure what's best either.
>>
>> submodules create a dependency on an internet connection, too. So before you
>> add yet another submodule (which have a couple of other disadvantages), I
>> think you could also directly use the venv here.
> 
> Not sure what you mean by directly using the venv.

I meant installing the dependency via pip in a venv, as you are currently 
doing it via the acpi-bits-test-venv.sh script.

  Thomas


