Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCEF44D30E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 09:17:23 +0100 (CET)
Received: from localhost ([::1]:56952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml5Gr-0005V6-M9
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 03:17:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ml5Et-0004ji-E5
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 03:15:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ml5Ep-0003QL-UF
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 03:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636618514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fpxC0i+qveRyXcppPVY1j/wdmWun3OcDqSi2Juoz7r4=;
 b=iEjVdW6EwgQTLaOWJQ6s5+9K1nOlMpMCgCvY406YS+1aUmw1rgy7VVQkdqiW021RWnygnB
 afFiBqI/3Sx8bSLMdY8aJdjSpNlUogeXXkYKYtn9n7KtvdslcNyFFso2ATxST/lzeGkJ0z
 4mOlNQgRXBPpuZF9e9ahqRZiGDNpF0I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-3_E99T_yNEe9LC0XQ0Dh5w-1; Thu, 11 Nov 2021 03:15:13 -0500
X-MC-Unique: 3_E99T_yNEe9LC0XQ0Dh5w-1
Received: by mail-ed1-f71.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso4700439edj.20
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 00:15:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fpxC0i+qveRyXcppPVY1j/wdmWun3OcDqSi2Juoz7r4=;
 b=YE+grvtDoFliNXPvW5Wl9hSxFYyGI3T4XiokyVYEk9Wq9n4k5UUwroBuv+QGBLd6RJ
 un948ShB19iRFxsHJ6r12HHva9hxh21x70TGFvCQy9b9sNWITgbapaeOGjsKfgFtoNFK
 HhMGHPoDmPVSDFDop42aHM5iHktW+ioDpGULgSmFDWT63LIKOJXD824RCS6hLFwu/OEz
 wzTw1Yo3zjJLtebRiN9nL4B5j4dwgm+7yXTJnUgzlZXEVqEu8Yws9Wrpliw2LKA7WDSC
 7Vb1ucV8l/A4WA/tkTImFEbi+uwIH90uIzf/2vdxkyrK20WiLTe1Zz4i9Le2KFJ7dN76
 JqLA==
X-Gm-Message-State: AOAM532sLBLlRgIpz5gF+R5ChD9sIlYfRmGLOF4wDppaIIS1pqEmZEHi
 C04+QTRyFBCnsh0X8D1jfAfb4pegg0S2st39FlaqQDzaCmu0B+8cd7m5fqMVGCd9CmALDA+PEkR
 Rj2o2JuRFyXLfE6Y=
X-Received: by 2002:a17:906:6087:: with SMTP id
 t7mr7073395ejj.206.1636618512147; 
 Thu, 11 Nov 2021 00:15:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5RITT9L11hEtd1bC5JnbnoguudoblRE0NeD3pz/kXO5Jod8mbtTDCS1E6+mG0MdL12oH4VQ==
X-Received: by 2002:a17:906:6087:: with SMTP id
 t7mr7073365ejj.206.1636618511883; 
 Thu, 11 Nov 2021 00:15:11 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id h18sm907646ejt.29.2021.11.11.00.15.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 00:15:11 -0800 (PST)
Message-ID: <bc437ccb-0487-a5ff-8e6a-50067715c4d4@redhat.com>
Date: Thu, 11 Nov 2021 09:15:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] qmp: Stabilize preconfig
To: Markus Armbruster <armbru@redhat.com>
References: <b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com>
 <87bl3dfg9v.fsf@dusky.pond.sub.org>
 <bb896561-9d0c-6c6c-4bdb-5e7ef5ed71d5@redhat.com>
 <YYAATW1JQmzpDPhu@redhat.com> <87zgqlzmxi.fsf@dusky.pond.sub.org>
 <c4ac9bcc-90ae-302f-d5d4-b95f1419a7a0@redhat.com>
 <87pmr7rzls.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87pmr7rzls.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 07:11, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>>> On 11/3/21 09:02, Markus Armbruster wrote:
>>>> I wonder whether we really have to step through three states
>>>>
>>>>            x-exit-preconfig  cont
>>>>       preconfig ---> pre run ---> run
>>>>
>>>> and not two
>>>>
>>>>               cont
>>>>       pre run ---> run
>>
>> Devices would be hotplugged between x-exit-preconfig and cont, and
> 
> Cold plugged!

Nope, hotplugged!  After x-exit-preconfig, the machine is ready to 
start, and that means that the machine will have completed 
initialization via their machine_init_done notifiers.

For example, fw_cfg will have set the bootorder.  Any device created 
after x-exit-preconfig will not be in the bootorder.

>> part of the machine until x-exit-preconfig; so there is a need for
>> something like x-exit-preconfig.
> 
> Can you briefly explain why device_add doesn't work before
> x-exit-preconfig and does after?

The answer to this question is basically the verbose version of the 
coldplug/hotplug thing from above.  There are five stages in the startup 
of QEMU (marked by different values of the MachineInitPhase enum):

1) PHASE_NO_MACHINE - backends can already be created here, but no 
machine exists yet

2) PHASE_MACHINE_CREATED - the machine object has been created.  It's 
not initialized, but it's there.

3) PHASE_ACCEL_CREATED - the accelerator object has been created.  The 
accelerator needs the machine object, because for example KVM might not 
support all machine types.  So the accelerator queries the machine 
object and fails creation in case of incompatibility.  This enables e.g. 
fallback to TCG.  -preconfig starts the monitor here.

4) PHASE_MACHINE_INIT - machine initialization consists mostly in 
creating the onboard devices.  For this to happen, the machine needs to 
learn about the accelerator, because onboard devices include CPUs and 
other accelerator-dependent devices.  Devices plugged in this phase are 
cold-plugged.

5) PHASE_MACHINE_READY - machine init done notifiers have been called 
and the VM is ready.  Devices plugged in this phase already count as 
hot-plugged.  -S starts the monitor here.

x-exit-preconfig goes straight from PHASE_ACCEL_CREATED to 
PHASE_MACHINE_READY.  Devices can only be created after 
PHASE_MACHINE_INIT, so device_add cannot be enabled at preconfig stage. 
  Why does preconfig start at PHASE_ACCEL_CREATED?  Well, the phases 
were not as easy to identify in qemu_init() when it was introduced, so I 
suppose it just seemed like a good place. :)  These days, qemu_init() is 
just a hundred lines of code apart from the huge command line parsing 
switch statement, so we have a clearer idea of the steps and you can 
look deeper at what happens in each phase if you want.  phase_advance() 
is your friend.


With a pure-QMP configuration flow, PHASE_MACHINE_CREATED would be 
reached with a machine-set command (corresponding to the non-deprecated 
parts of -machine) and PHASE_ACCEL_CREATED would be reached with an 
accel-set command (corresponding to -accel).

I haven't yet thought hard enough whether accel-set could go directly 
from PHASE_MACHINE_CREATED to PHASE_MACHINE_INIT.  It probably depends 
on how CPUs would be configured in the QMP flow; if accel-set must 
return at PHASE_ACCEL_CREATED, a separate command is needed to reach 
PHASE_MACHINE_INIT.  But either way, there the monitor would be 
accessible at PHASE_MACHINE_INIT, where device_add works and cold-plugs 
the devices.

Paolo


