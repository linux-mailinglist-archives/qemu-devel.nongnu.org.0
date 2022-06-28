Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A88A55C013
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:07:13 +0200 (CEST)
Received: from localhost ([::1]:47254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o687k-0001gE-Lf
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o681n-0005xv-80
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:01:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o681j-0004ht-6k
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:01:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656410458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lKy4Z0Mh85q0aevnGgq3hEqMO5vdllLV7p4sHvUUlzg=;
 b=cV0rqSEVc69XityAMeYnYqU57m3SB0oKLmaJG0r74hji0Y/mKYP3poBURCujX7/gbLnfgK
 zDaVzqoJuOevDY/Xj8NoEoRzwr8IwVsErf0H8kcSI5D/ych8fpgJoU5JUZZ8lL8pl2aSoM
 Rhzm30NCBP3WOswZ4a/9usEHTXHEqYI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-WVG4RWPANM6Y91AMuMUd9Q-1; Tue, 28 Jun 2022 06:00:57 -0400
X-MC-Unique: WVG4RWPANM6Y91AMuMUd9Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so6907662wmj.0
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lKy4Z0Mh85q0aevnGgq3hEqMO5vdllLV7p4sHvUUlzg=;
 b=Mz6emA4CDcYzdwGvmGBpKRkUxCg4DTIHkyz/+MPYgo7w26byUJFr8Qo0lr7WxuPpjB
 KMWf+j1Xt/mNJ8qKv3gI4gyd0++3gv34Al63cKZvDOFQvDyGsdmy83VFq4ZSEPEDHzt7
 QzwYHCnu3y5u0A6X13DlTj5/Mc70lJoTQke3Ud5IsOkWi191H3KO0zOmGYhnbtc/7D5o
 hHD3JOHLJ8ifIrYsVckijKUlMP7tJ+lK/2Tdr0xA1mB4kenLWmlolYvEaTlmJZLhZVo0
 RKY0YErKRFAFnXYv603+LFXfNELH+hXT9Pcr5B9J15sDWWIJsXQKDwV5dITF2ZqXb7Ts
 oZnQ==
X-Gm-Message-State: AJIora9jX+6YE9KMuCJ8iXkhammh4hvjIdaYbGeYJEw+xGuif0TwFbdn
 h92MswjGckDYE4b4tTUh58fcQ9G4T5ZgbGDkXjt3+wTcSRlwUt1DmsARndZuuaZN5WQa5Q8GHeY
 Os/iX8uOnjVKMdCY=
X-Received: by 2002:adf:f892:0:b0:21b:b85b:588c with SMTP id
 u18-20020adff892000000b0021bb85b588cmr16145351wrp.209.1656410456235; 
 Tue, 28 Jun 2022 03:00:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sQ5guMLZXivkJzkO3vboUhulbS4hr843pcmlNU+6vy5Ex93VZhZNeLX9v9SiCrkc3egDD5Lg==
X-Received: by 2002:adf:f892:0:b0:21b:b85b:588c with SMTP id
 u18-20020adff892000000b0021bb85b588cmr16145328wrp.209.1656410455977; 
 Tue, 28 Jun 2022 03:00:55 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a1c7513000000b0039c18d3fe27sm15760065wmc.19.2022.06.28.03.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 03:00:55 -0700 (PDT)
Message-ID: <75e622ae-c3f2-945c-ffd3-23b32c96881b@redhat.com>
Date: Tue, 28 Jun 2022 12:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 09/12] acpi/tests/bits: add acpi and smbios python tests
 that uses biosbits
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 John Snow <jsnow@redhat.com>
References: <20220627072856.1529357-1-ani@anisinha.ca>
 <20220627072856.1529357-10-ani@anisinha.ca>
 <a9614691-5f79-fb77-1514-876deb487e98@redhat.com>
 <CAARzgwz2oNiR56j7UYstEVweianLUwy8AqC5yRccyR2f4iWipA@mail.gmail.com>
 <20220628055416-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220628055416-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 28/06/2022 11.55, Michael S. Tsirkin wrote:
> On Tue, Jun 28, 2022 at 12:56:52PM +0530, Ani Sinha wrote:
>> On Tue, Jun 28, 2022 at 12:50 PM Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> On 27/06/2022 09.28, Ani Sinha wrote:
>>>> This change adds python based qtest framework that can be used to run
>>>> qtests from within a virtual environment. A bash script creates the virtual
>>>> environment and then runs the python based tests from within that environment.
>>>> All dependent python packages are installed in the virtual environment using
>>>> pip module. QEMU python test modules are also available in the environment for
>>>> spawning the QEMU based VMs.
>>>>
>>>> It also introduces QEMU acpi/smbios biosbits python test script which is run
>>>> from within the python virtual environment.
>>>>
>>>> Signed-off-by: Ani Sinha <ani@anisinha.ca>
>>>> ---
[...]
>>>> +class QEMUBitsMachine(QEMUMachine):
>>>> +    """
>>>> +    A QEMU VM, with isa-debugcon enabled and bits iso passed
>>>> +    using -cdrom to QEMU commandline.
>>>> +    """
>>>> +    def __init__(self,
>>>> +                 binary: str,
>>>> +                 args: Sequence[str] = (),
>>>> +                 wrapper: Sequence[str] = (),
>>>> +                 name: Optional[str] = None,
>>>> +                 base_temp_dir: str = "/var/tmp",
>>>> +                 debugcon_log: str = "debugcon-log.txt",
>>>> +                 debugcon_addr: str = "0x403",
>>>> +                 sock_dir: Optional[str] = None,
>>>> +                 qmp_timer: Optional[float] = None):
>>>> +        # pylint: disable=too-many-arguments
>>>> +
>>>> +        if name is None:
>>>> +            name = "qemu-bits-%d" % os.getpid()
>>>> +        if sock_dir is None:
>>>> +            sock_dir = base_temp_dir
>>>> +        super().__init__(binary, args, wrapper=wrapper, name=name,
>>>> +                         base_temp_dir=base_temp_dir,
>>>> +                         sock_dir=sock_dir, qmp_timer=qmp_timer)
>>>> +        self.debugcon_log = debugcon_log
>>>> +        self.debugcon_addr = debugcon_addr
>>>> +        self.base_temp_dir = base_temp_dir
>>>> +
>>>> +    @property
>>>> +    def _base_args(self) -> List[str]:
>>>> +        args = super()._base_args
>>>> +        args.extend([
>>>> +            '-chardev',
>>>> +            'file,path=%s,id=debugcon' %os.path.join(self.base_temp_dir,
>>>> +                                                     self.debugcon_log),
>>>> +            '-device',
>>>> +            'isa-debugcon,iobase=%s,chardev=debugcon' %self.debugcon_addr,
>>>> +        ])
>>>> +        return args
>>>
>>> So is this patch series *really* related to qtests? qtests are using a
>>> special "accelerator" mode of QEMU where it gets launched with the "-qtest"
>>> parameter. I can't see that you're using "-qtest" here or anywhere else, so
>>> this rather looks like another framework to me to run python-based QEMU
>>> tests (similar to the avocado tests).
>>
>> yes you are right. This does not use or need the qtest accelerator
>> because we are not inspecting the guest memory for anything.
> 
> Same is true for e.g. ./tests/qtest/bios-tables-test.c ...

No, bios-tables-test still uses functions like qtest_memread() and 
qtest_readb(), so it still uses the qtest framework, even if it's actually 
running code via TCG.

  Thomas


