Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2FF4E3A0F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 09:04:02 +0100 (CET)
Received: from localhost ([::1]:47060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWZUn-0000bX-Tf
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 04:04:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWZN9-00048Y-Ld
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 03:56:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWZN3-0004yE-NP
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 03:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647935759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQomBelJml2XR98hGWQJ8d6sE4kkicChe9tcHdrVXmg=;
 b=iS2J3N0Hm0XozvtrP3V6C4j20Bk719w+VQU4Ui7MGiKIbOqS1Y3okx9F5W4oqJ13c/zc8P
 i0ihalS2rIaHK/xh0MHiRURznuukft/Pfig692L6E1gjXRqNxTMrhEUPDS9HexPy8gtEST
 OpU4FCntO2AMIcaY6Cj3VZ6LF5Sj3qw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-wlB0T7LRPMmS-vzucP-s2Q-1; Tue, 22 Mar 2022 03:55:58 -0400
X-MC-Unique: wlB0T7LRPMmS-vzucP-s2Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so497963wmj.5
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 00:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rQomBelJml2XR98hGWQJ8d6sE4kkicChe9tcHdrVXmg=;
 b=ybuRux7j92x5UokjV3Sr9DsDgQmAsposMm9e8LwRP0icoY5YshFDx2M0SMCxZkyWgT
 58x8ufTql6K+wo7t9PL4uXKHkw2PikN1inkJUd3b5qOnIKDDLvR0QKKLQk5vSTB4EqIM
 oVfO+yeY19JyfW5Xs55ksfb4ID/fzI6+i85tbkbfhmDGbEzdlOj22IDqkBzl1CXXTrgD
 4J0fReP2pRatfjX9Spyu2+8dG1NgwW5AZh7YezSXFEyp6Q3lKTw3T0g7L2xW3sRYZd2e
 VStKAnatjwxayXIUqusU0TjA4+EF7FMCK/MVAA34pRcIKUnotjebmiBTAbxOp7FxUrJ5
 c0qg==
X-Gm-Message-State: AOAM533PFn54bP+PiQBoicewrp7akQ4E0J9/adh653/nvg0ZDJocc99C
 VVdU48zR5xJuKYjC69KozzvST1CaZZUEm23x2ll50fyzv+rX4oUE0210s0q3EJPS1QOJV2syZam
 wMMuuDUN2/FpRcIc=
X-Received: by 2002:a7b:c1d3:0:b0:38c:5b15:de91 with SMTP id
 a19-20020a7bc1d3000000b0038c5b15de91mr2543039wmj.40.1647935757307; 
 Tue, 22 Mar 2022 00:55:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHcoVt3Syt248ZBxsUy+plbVYFgu1PXcl0AiP/TqZyUHrG6cqmX/45KkXGlsXyTRXUc27o1Q==
X-Received: by 2002:a7b:c1d3:0:b0:38c:5b15:de91 with SMTP id
 a19-20020a7bc1d3000000b0038c5b15de91mr2543029wmj.40.1647935757041; 
 Tue, 22 Mar 2022 00:55:57 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a05600c3b9700b0038b7c4c0803sm1322586wms.30.2022.03.22.00.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 00:55:56 -0700 (PDT)
Message-ID: <6a46e965-f65c-6793-28d5-fb35f06cb43b@redhat.com>
Date: Tue, 22 Mar 2022 08:55:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: Memory leak in via_isa_realize()
To: Peter Maydell <peter.maydell@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
 <CAFEAcA-jEqnpUdtfgqMFUn_ghwoYM+8UyceLUz+Uo07FuH+S-Q@mail.gmail.com>
 <ab9c9599-2021-42df-7bfe-4f2f3842cb84@eik.bme.hu>
 <CAFEAcA_CMXyq2t4XL58mTfH255LZp4BHuV9_jDvzgkAT56D1BQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA_CMXyq2t4XL58mTfH255LZp4BHuV9_jDvzgkAT56D1BQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/03/2022 13.59, Peter Maydell wrote:
> On Mon, 21 Mar 2022 at 12:11, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>
>> On Mon, 21 Mar 2022, Peter Maydell wrote:
>>> On Mon, 21 Mar 2022 at 10:31, Thomas Huth <thuth@redhat.com> wrote:
>>>> FYI, I'm seeing a memory leak in via_isa_realize() when building
>>>> QEMU with sanitizers enabled or when running QEMU through valgrind:
>>>> Same problem happens with qemu-system-ppc64 and the pegasos2 machine.
>>>>
>>>> No clue how to properly fix this... is it safe to free the pointer
>>>> at the end of the function?
>>>
>>> This is because the code is still using the old function
>>> qemu_allocate_irqs(), which is almost always going to involve
>>> it leaking memory. The fix is usually to rewrite the code to not use
>>> that function at all, i.e. to manage its irq/gpio lines differently.
>>> Probably the i8259 code should have a named GPIO output line
>>> rather than wanting to be passed a qemu_irq in an init function,
>>> and the via code should have an input GPIO line which it connects
>>> up to the i8259. It looks from a quick glance like the i8259 and
>>> its callers have perhaps not been completely QOMified.
>>
>> Everything involving ISA emulation in QEMU is not completely QOMified and
>> this has caused some problems before but I did not want to try to fix it
>> both becuase it's too much unrelated work and because it's used by too
>> many things that could break that I can't even test. So I'd rather
>> somebody more comfortable with this would look at ISA QOMification.
> 
> Yeah, there's usually a reason that these things haven't been more
> thoroughly QOMified, and that reason is often because it's a pile of
> work for not very clear benefit.
> 
> In this particular case, although there is a "leak", it happens exactly
> once at QEMU startup and in practice we need that memory to hang around
> until QEMU exits anyway.

Yes. I guess as a workaround (to silence Valgrind et al. here), it would
be sufficient to store the pointer in the ViaISAState stucture.

> The only real reason to fix this kind of leak in
> my opinion is because it clutters up the output of valgrind or clang/gcc
> address sanitizer runs and prevents us from having our CI do a
> leak-sanitizer test run that would guard against new leaks being added
> to the codebase.

Yes, that's my concern, too. It's hard to spot real problems if the output
is cluttered with a lot of these not-so-serious leaks.

> We still have a fair number of this sort of one-off
> startup leak in various arm boards/devices, for instance -- I occasionally
> have a look through and fix some of the more tractable ones.

Hmm, yes, running the device-introspect-test shows a lot of leaks for the
arm devices...

$ QTEST_QEMU_BINARY="valgrind --leak-check=full \
   --show-leak-kinds=definite ./qemu-system-aarch64" \
   tests/qtest/device-introspect-test \
  -p /aarch64/device/introspect/concrete/defaults/none

...
==377771== 112,629 (66,304 direct, 46,325 indirect) bytes in 13 blocks are definitely lost in loss record 7,800 of 7,810
==377771==    at 0x4C360A5: malloc (vg_replace_malloc.c:380)
==377771==    by 0x6364475: g_malloc (in /usr/lib64/libglib-2.0.so.0.5600.4)
==377771==    by 0xB207C3: object_new_with_type (object.c:722)
==377771==    by 0xB20864: object_new (object.c:744)
==377771==    by 0xB1C731: qmp_device_list_properties (qom-qmp-cmds.c:153)
==377771==    by 0xC900BC: qmp_marshal_device_list_properties (qapi-commands-qdev.c:59)
==377771==    by 0xCA4DBE: do_qmp_dispatch_bh (qmp-dispatch.c:110)
==377771==    by 0xCDF19D: aio_bh_call (async.c:136)
==377771==    by 0xCDF2A7: aio_bh_poll (async.c:164)
==377771==    by 0xCA9D08: aio_dispatch (aio-posix.c:381)
==377771==    by 0xCDF6DA: aio_ctx_dispatch (async.c:306)
==377771==    by 0x635E95C: g_main_context_dispatch (in /usr/lib64/libglib-2.0.so.0.5600.4)
==377771==
==377771== 530,646 (88 direct, 530,558 indirect) bytes in 1 blocks are definitely lost in loss record 7,806 of 7,810
==377771==    at 0x4C360A5: malloc (vg_replace_malloc.c:380)
==377771==    by 0x6364475: g_malloc (in /usr/lib64/libglib-2.0.so.0.5600.4)
==377771==    by 0x637C086: g_slice_alloc (in /usr/lib64/libglib-2.0.so.0.5600.4)
==377771==    by 0x634CBE1: g_hash_table_new_full (in /usr/lib64/libglib-2.0.so.0.5600.4)
==377771==    by 0xB20122: object_initialize_with_type (object.c:513)
==377771==    by 0xB2080D: object_new_with_type (object.c:729)
==377771==    by 0xB20864: object_new (object.c:744)
==377771==    by 0xB1C731: qmp_device_list_properties (qom-qmp-cmds.c:153)
==377771==    by 0x78F83C: qdev_device_help (qdev-monitor.c:283)
==377771==    by 0x791001: qmp_device_add (qdev-monitor.c:801)
==377771==    by 0x79145D: hmp_device_add (qdev-monitor.c:916)
==377771==    by 0x60EC48: handle_hmp_command (hmp.c:1100)
==377771==
==377771== 536,518 (704 direct, 535,814 indirect) bytes in 8 blocks are definitely lost in loss record 7,807 of 7,810
==377771==    at 0x4C360A5: malloc (vg_replace_malloc.c:380)
==377771==    by 0x6364475: g_malloc (in /usr/lib64/libglib-2.0.so.0.5600.4)
==377771==    by 0x637C086: g_slice_alloc (in /usr/lib64/libglib-2.0.so.0.5600.4)
==377771==    by 0x634CBE1: g_hash_table_new_full (in /usr/lib64/libglib-2.0.so.0.5600.4)
==377771==    by 0xB20122: object_initialize_with_type (object.c:513)
==377771==    by 0xB201B5: object_initialize (object.c:534)
==377771==    by 0xB202F3: object_initialize_child_with_propsv (object.c:564)
==377771==    by 0xB2028E: object_initialize_child_with_props (object.c:547)
==377771==    by 0xB203DC: object_initialize_child_internal (object.c:601)
==377771==    by 0x8349DC: bcm2835_peripherals_init (bcm2835_peripherals.c:122)
==377771==    by 0xB1FC1B: object_init_with_type (object.c:375)
==377771==    by 0xB20140: object_initialize_with_type (object.c:515)
...

Looks like we're leaking memory in the object initializiation
some times?

  Thomas


