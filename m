Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8583155BF4C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:00:26 +0200 (CEST)
Received: from localhost ([::1]:57774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6693-00009K-AA
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o65GE-0005PO-1k
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:03:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o65G6-0000Fb-Oh
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656399818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ux0yL2Imv8r8+jOqxJWAcBgtUZMmX8ELQLh0AzUju4=;
 b=A+SShmJJDqtxGnA2O/wVmrKDBwcqIIegs7Ddeb+s/FSAjYgh9TVjuEBeCmzKhhCW6Rftnt
 TJo1BHPwtvPpZLZosxdebd+Up0HBWnC6RVUNzBWxlZfgCTfJUdCChlYZyg13xli9/mnr5S
 iJzMaT2JVm1ULtywk/sMJlFabBkKuLI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-KAMgIJmWM-Wmc1dSopxj1Q-1; Tue, 28 Jun 2022 03:03:36 -0400
X-MC-Unique: KAMgIJmWM-Wmc1dSopxj1Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 z11-20020adfc00b000000b0021a3ab8ec82so1535221wre.23
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 00:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1ux0yL2Imv8r8+jOqxJWAcBgtUZMmX8ELQLh0AzUju4=;
 b=4o7iBwDj3Znkt32D+GJfSpuY440ry0FxdVuJXXEvPtew1Kp6jzDZHQyqKg8pWggoXe
 ZTOWiH1OnraqhJddm8r77l7grBrKXwKGl9vvyo28K9IljHlNHuucsmYbmrFs1S7/7Vvv
 gcPXdD5pxNFjpdb+woK3jj1YnttNQAdRicQireaFN9eBoSiBtml0XeNo5ng1dhpTI4wS
 sbgV54Aj7L5Hs7GptI5ugWJiA8mszdixoh9Y1C6jPeKlHmIEL+neCuv9H3VnpE8J+RUR
 bhX1qppmdqXMN+OD8b/A7sM+h47tZsSs/QlLB36XWiA5mGggUA3SD/vUL7rwYVo2rzv4
 YKLw==
X-Gm-Message-State: AJIora/Aud0bR9pCM2Has2GUcxS0f916unxdkwH9225K24zdRfNV9Krd
 e6zy0Anfy4z+cNmK6UyPBNz5vqz58R39A9iVyH2Cerh8fhsVK5N1151NPH2AwiqEflr7GIQlCGU
 Ns6hIswyxMAnwAbI=
X-Received: by 2002:a5d:4c8a:0:b0:21b:9f3a:c002 with SMTP id
 z10-20020a5d4c8a000000b0021b9f3ac002mr15982513wrs.182.1656399815313; 
 Tue, 28 Jun 2022 00:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tm9UMxjW/vQ99GitUBKigmfnapJUEbRUejUEg6Du4/ZHQWhpQGlKcRP/0fVLkbF2v/yvDwnw==
X-Received: by 2002:a5d:4c8a:0:b0:21b:9f3a:c002 with SMTP id
 z10-20020a5d4c8a000000b0021b9f3ac002mr15982483wrs.182.1656399815003; 
 Tue, 28 Jun 2022 00:03:35 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 e7-20020adfe7c7000000b0021b9100b844sm12991499wrn.91.2022.06.28.00.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 00:03:34 -0700 (PDT)
Message-ID: <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
Date: Tue, 28 Jun 2022 09:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: venv for python qtest bits? (was: Re: [PATCH 11/12] acpi/tests/bits:
 add README file for bits qtests)
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
References: <20220627072856.1529357-1-ani@anisinha.ca>
 <20220627072856.1529357-12-ani@anisinha.ca>
 <20220627182027-mutt-send-email-mst@kernel.org>
 <CAARzgwznJUrO-7kjZ+58qj=UG6V9wojP=ZfW7FePyvb6GxdNtA@mail.gmail.com>
 <20220628020017-mutt-send-email-mst@kernel.org>
 <CAARzgwwf_WRWzbwPorpa-4XN7T6f6D7CRo70+07Z8LgZO+5Spg@mail.gmail.com>
 <20220628021757-mutt-send-email-mst@kernel.org>
 <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
 <20220628024810-mutt-send-email-mst@kernel.org>
 <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 28/06/2022 08.57, Ani Sinha wrote:
> On Tue, Jun 28, 2022 at 12:20 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> On Tue, Jun 28, 2022 at 12:06:31PM +0530, Ani Sinha wrote:
>>> On Tue, Jun 28, 2022 at 11:50 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>>
>>>> On Tue, Jun 28, 2022 at 11:46:13AM +0530, Ani Sinha wrote:
>>>>> On Tue, Jun 28, 2022 at 11:36 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>>>>
>>>>>> On Tue, Jun 28, 2022 at 10:27:38AM +0530, Ani Sinha wrote:
>>>>>>> On Tue, Jun 28, 2022 at 3:56 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>>>>>>
>>>>>>>> On Mon, Jun 27, 2022 at 12:58:55PM +0530, Ani Sinha wrote:
>>>>>>>>> The README file is added describing the directory structure and the purpose
>>>>>>>>> of every file it contains. It also describes how to add new tests, make changes
>>>>>>>>> to existing tests or bits config files or regenerate the bits software.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Ani Sinha <ani@anisinha.ca>
>>>>>>>>> ---
>>>>>>>>>   tests/qtest/acpi-bits/README | 168 +++++++++++++++++++++++++++++++++++
>>>>>>>>>   1 file changed, 168 insertions(+)
>>>>>>>>>   create mode 100644 tests/qtest/acpi-bits/README
>>>>>>>>>
>>>>>>>>> diff --git a/tests/qtest/acpi-bits/README b/tests/qtest/acpi-bits/README
>>>>>>>>> new file mode 100644
>>>>>>>>> index 0000000000..97b15f1665
>>>>>>>>> --- /dev/null
>>>>>>>>> +++ b/tests/qtest/acpi-bits/README
>>>>>>>>> @@ -0,0 +1,168 @@
>>>>>>>>> +=============================================================================
>>>>>>>>> +ACPI/SMBIOS QTESTS USING BIOSBITS
>>>>>>>>> +=============================================================================
>>>>>>>>> +
>>>>>>>>> +Biosbits is a software written by Josh Triplett that can be downloaded by
>>>>>>>>> +visiting https://biosbits.org/. The github codebase can be found here:
>>>>>>>>> +https://github.com/biosbits/bits/tree/master. It is a software that exercizes
>>>>>>>>> +the bios components such as acpi and smbios tables directly through acpica
>>>>>>>>> +bios interpreter (a freely available C based library written by Intel,
>>>>>>>>> +downloadable from https://acpica.org/ and is included with biosbits) without an
>>>>>>>>> +operating system getting involved in between.
>>>>>>>>> +There are several advantages to directly testing the bios in a real physical
>>>>>>>>> +machine or VM as opposed to indirectly discovering bios issues through the
>>>>>>>>> +operating system. For one thing, the OSes tend to hide bios problems from the
>>>>>>>>> +end user. The other is that we have more control of what we wanted to test
>>>>>>>>> +and how by directly using acpica interpreter on top of the bios on a running
>>>>>>>>> +system. More details on the inspiration for developing biosbits and its real
>>>>>>>>> +life uses can be found in (a) and (b).
>>>>>>>>> +This directory contains QEMU qtests written in python that exercizes the QEMU
>>>>>>>>> +bios components using biosbits and reports test failures.
>>>>>>>>> +
>>>>>>>>> +These tests use python virtual environment. In debian/ubuntu system, the tests
>>>>>>>>> +would require python3.8-venv and python3-pip packages to be installed.
>>>>>>>>
>>>>>>>> Why do we mess with venv and pip? Certainly possible but
>>>>>>>> what's wrong with using distro provided packages?
>>>>>>>
>>>>>>> There are two things:
>>>>>>> (a) We are already using pip and venv for our avocado based
>>>>>>> integration tests. Look for TESTS_VENV_DIR in Makefile.include under
>>>>>>> tests.
>>>>>>> (b) the venv is primarily needed because I wanted to take advantage of
>>>>>>> our rich python library that handles QEMU based machines. There are
>>>>>>> python qtest libraries as well. These are well tested and used with
>>>>>>> integration tests and I wanted to keep the test part of the code
>>>>>>> simple by simply reusing them. however, in order to use them, we need
>>>>>>> a venv environment within which these qemu python libraries are
>>>>>>> installed. Integration tests does the same thing.
>>>>>>>
>>>>>>> A note about my language of choice - python. I gave a lot of thoughts
>>>>>>> on this. We do not do a lot of stuff here. All we do is:
>>>>>>> (a) generate bits iso.
>>>>>>> (b) spawn a QEMU vm with the iso which then runs a bunch of tests within the vm.
>>>>>>> (c) collect and analyze logs.
>>>>>>>
>>>>>>> We are not inspecting guest memory or manipulating devices or pci
>>>>>>> buses. We do not need the power of C here. We need something that is
>>>>>>> simple to write, easy to maintain and understand and can deal with
>>>>>>> things like manipulating text files and configs easily. Python seems a
>>>>>>> better fit for the role.
>>>>>>
>>>>>> No problem with that. So that's venv. But do we need pip and pulling
>>>>>> packages from the net during testing?
>>>>>
>>>>> We do that too. See requirements.txt in tests/
>>>>> Following two are downloaded:
>>>>> avocado-framework==88.1
>>>>> pycdlib==1.11.0
>>>>>
>>>>> Also see this line in Makefie.include:
>>>>>
>>>>> $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
>>>>
>>>> Right but that's avocado since it pulls lots of stuff from
>>>> the net anyway.
>>>> Are the libraries in question not packaged on major distros?
>>>
>>> Currently I only need this:
>>> https://github.com/python-tap/tappy
>>> which is the basic TAP processing library for python.
>>>
>>> It seems its only installed through pip:
>>> https://tappy.readthedocs.io/en/latest/
>>>
>>> I do not think this is packaged by default. It's such a basic library
>>> for parsing test output that maybe we can keep this somewhere within
>>> the python src tree? Not sure ...
>>
>> It's pretty small for sure. Another submodule?
> 
> Unlike BITS, this one is likely going to be maintained for a while and
> will receive new releases through
> https://pypi.org/project/tap.py/
> so forking is OK but someone has to keep this updated.
> 
> I am open to anything. Whatever feels right is fine to me.

John Snow is currently working on the "Pythonification" of various QEMU 
bits, I think you should loop him into this discussion, too.

  Thomas


