Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8D9667134
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:48:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFw2p-0007Ij-SU; Thu, 12 Jan 2023 06:46:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFw2f-0007IL-EV
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 06:46:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFw2d-0008L8-6j
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 06:46:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673524002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vrRFOi1a+vsx29obhPeBSNreZJX6hR+A4twRycgNOjY=;
 b=Cl7uZFozQBO2r/T89jNF9X0bM+l39iSsEJ8EN2xjY7ntDW0pI98wxutnWGjEGA/1mEVncu
 e0RyG0Rs4WCN2ywqb/TnQCDaNCTLTkHLyq5vEDi47gFF0R72rzkBqLjta2bUpPdTuuxhQL
 hL7IfgoYLjRpX5xSyNmhLII2TbwL7YA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-25-pwgSymcnNLavu7jqUGrQBg-1; Thu, 12 Jan 2023 06:46:39 -0500
X-MC-Unique: pwgSymcnNLavu7jqUGrQBg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n18-20020a05600c4f9200b003d993e08485so9177093wmq.2
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 03:46:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vrRFOi1a+vsx29obhPeBSNreZJX6hR+A4twRycgNOjY=;
 b=BlDMwr46SpjS3HXWAfD2omospHxF1AmOgp5gwzzWh+ZHmVt3DF8NFNHRLTctSs8/dp
 nzB8HaJdxdBqBQTHuj8ham5VlewV/mw5uxIUEiVxjaqe6KNeYUXk5DnlOfrQyc5YlBUo
 g78JQL+x5/w9l55WETtUOvyTaGCqZbWGfkvkgdepz0/Wl0Szl/GJpF/EXDkJ+tKQapLn
 fnUBCvNKLxbgTiVuP62MBkBYKbN7Y1pntoSRKOR1LXswNPotHpmVrg5cHMlCNykXT8aV
 Eof9su3ePMV3bjt5tDW+XZ0k8nTgek7QlMOJezlWo+TH133HCYDzoucmPu0XD/Pk2322
 6qSg==
X-Gm-Message-State: AFqh2koMjAQd8BGfBQrbyBDc0dBkPNtndrhuDBfV505h+8nD+UkgfuuB
 cq3aukK1wmGcRZpBB/Vq7QsHf89f5bau/1ijc8nvwlH8pdjRvU6/toPiplaFSoCyHVm+tuceuFe
 pTrb1QThAcngR4WA=
X-Received: by 2002:a05:600c:601e:b0:3c6:e61e:ae71 with SMTP id
 az30-20020a05600c601e00b003c6e61eae71mr65675296wmb.1.1673523998050; 
 Thu, 12 Jan 2023 03:46:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt8GWZThzuXKK/kLv64yayDaMGS/QzMweZ+Idk/FUlWpTTwqi89+37776yr0dVds1S4LOJctA==
X-Received: by 2002:a05:600c:601e:b0:3c6:e61e:ae71 with SMTP id
 az30-20020a05600c601e00b003c6e61eae71mr65675252wmb.1.1673523997595; 
 Thu, 12 Jan 2023 03:46:37 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-128.web.vodafone.de.
 [109.43.177.128]) by smtp.gmail.com with ESMTPSA id
 l6-20020a5d4bc6000000b0027323b19ecesm16153572wrt.16.2023.01.12.03.46.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 03:46:36 -0800 (PST)
Message-ID: <df7b8bc3-7731-6af0-e4ca-426cbfc2c074@redhat.com>
Date: Thu, 12 Jan 2023 12:46:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-12-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v14 11/11] docs/s390x/cpu topology: document s390x cpu
 topology
In-Reply-To: <20230105145313.168489-12-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 05/01/2023 15.53, Pierre Morel wrote:
> Add some basic examples for the definition of cpu topology
> in s390x.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   docs/system/s390x/cpu-topology.rst | 292 +++++++++++++++++++++++++++++
>   docs/system/target-s390x.rst       |   1 +
>   2 files changed, 293 insertions(+)
>   create mode 100644 docs/system/s390x/cpu-topology.rst
> 
> diff --git a/docs/system/s390x/cpu-topology.rst b/docs/system/s390x/cpu-topology.rst
> new file mode 100644
> index 0000000000..0020b70b50
> --- /dev/null
> +++ b/docs/system/s390x/cpu-topology.rst
> @@ -0,0 +1,292 @@
> +CPU Topology on s390x
> +=====================
> +
> +CPU Topology on S390x provides up to 5 levels of topology containers:

You sometimes write "Topology" with a capital T, sometimes lower case ... 
I'd suggest to write it lower case consistently everywhere.

> +nodes, drawers, books, sockets and CPUs.

Hmm, so here you mention that "nodes" are usable on s390x, too? ... in 
another spot below, you don't mention these anymore...

> +While the higher level containers, Containers Topology List Entries,
> +(Containers TLE) define a tree hierarchy, the lowest level of topology
> +definition, the CPU Topology List Entry (CPU TLE), provides the placement
> +of the CPUs inside the parent container.
> +
> +Currently QEMU CPU topology uses a single level of container: the sockets.
> +
> +For backward compatibility, threads can be declared on the ``-smp`` command
> +line. They will be seen as CPUs by the guest as long as multithreading
> +is not really supported by QEMU for S390.

Maybe mention that threads are not allowed with machine types >= 7.2 anymore?

> +Beside the topological tree, S390x provides 3 CPU attributes:
> +- CPU type
> +- polarity entitlement
> +- dedication
> +
> +Prerequisites
> +-------------
> +
> +To use CPU Topology a Linux QEMU/KVM machine providing the CPU Topology facility
> +(STFLE bit 11) is required.
> +
> +However, since this facility has been enabled by default in an early version
> +of QEMU, we use a capability, ``KVM_CAP_S390_CPU_TOPOLOGY``, to notify KVM
> +QEMU use of the CPU Topology.

Has it? I thought bit 11 was not enabled by default in the past?

> +Enabling CPU topology
> +---------------------
> +
> +Currently, CPU topology is only enabled in the host model.

add a "by default if support is available in the host kernel" at the end of 
the sentence?

> +Enabling CPU topology in a CPU model is done by setting the CPU flag
> +``ctop`` to ``on`` like in:
> +
> +.. code-block:: bash
> +
> +   -cpu gen16b,ctop=on
> +
> +Having the topology disabled by default allows migration between
> +old and new QEMU without adding new flags.
> +
> +Default topology usage
> +----------------------
> +
> +The CPU Topology, can be specified on the QEMU command line
> +with the ``-smp`` or the ``-device`` QEMU command arguments
> +without using any new attributes.
> +In this case, the topology will be calculated by simply adding
> +to the topology the cores based on the core-id starting with
> +core-0 at position 0 of socket-0, book-0, drawer-0 with default

... here you don't mention "nodes" anymore (which you still mentioned at the 
beginning of the doc).

> +modifier attributes: horizontal polarity and no dedication.
> +
> +In the following machine we define 8 sockets with 4 cores each.
> +Note that S390 QEMU machines do not implement multithreading.

I'd use s390x instead of S390 to avoid confusion with 31-bit machines.

> +.. code-block:: bash
> +
> +  $ qemu-system-s390x -m 2G \
> +    -cpu gen16b,ctop=on \
> +    -smp cpus=5,sockets=8,cores=4,maxcpus=32 \
> +    -device host-s390x-cpu,core-id=14 \
> +
> +New CPUs can be plugged using the device_add hmp command like in:
> +
> +.. code-block:: bash
> +
> +  (qemu) device_add gen16b-s390x-cpu,core-id=9
> +
> +The core-id defines the placement of the core in the topology by
> +starting with core 0 in socket 0 up to maxcpus.
> +
> +In the example above:
> +
> +* There are 5 CPUs provided to the guest with the ``-smp`` command line
> +  They will take the core-ids 0,1,2,3,4
> +  As we have 4 cores in a socket, we have 4 CPUs provided
> +  to the guest in socket 0, with core-ids 0,1,2,3.
> +  The last cpu, with core-id 4, will be on socket 1.
> +
> +* the core with ID 14 provided by the ``-device`` command line will
> +  be placed in socket 3, with core-id 14
> +
> +* the core with ID 9 provided by the ``device_add`` qmp command will
> +  be placed in socket 2, with core-id 9
> +
> +Note that the core ID is machine wide and the CPU TLE masks provided
> +by the STSI instruction will be written in a big endian mask:
> +
> +* in socket 0: 0xf000000000000000 (core id 0,1,2,3)
> +* in socket 1: 0x0800000000000000 (core id 4)
> +* in socket 2: 0x0040000000000000 (core id 9)
> +* in socket 3: 0x0002000000000000 (core id 14)

Hmm, who's supposed to be the audience of this documentation? Users? 
Developers? For a doc in docs/system/ I'd expect this to be a documentation 
for users, so this seems to be way too much of implementation detail here 
already. If this is supposed to be a doc for developers instead, the file 
should likely rather go into doc/devel/ instead. Or maybe you want both? ... 
then you should split the information in here in two files, I think, one in 
docs/system/ and one in docs/devel/ .

> +Defining the topology on command line
> +-------------------------------------
> +
> +The topology can be defined entirely during the CPU definition,
> +with the exception of CPU 0 which must be defined with the -smp
> +argument.
> +
> +For example, here we set the position of the cores 1,2,3 on
> +drawer 1, book 1, socket 2 and cores 0,9 and 14 on drawer 0,
> +book 0, socket 0 with all horizontal polarity and not dedicated.
> +The core 4, will be set on its default position on socket 1
> +(since we have 4 core per socket) and we define it with dedication and
> +vertical high entitlement.
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-s390x -m 2G \
> +    -cpu gen16b,ctop=on \
> +    -smp cpus=1,sockets=8,cores=4,maxcpus=32 \
> +    \
> +    -device gen16b-s390x-cpu,drawer-id=1,book-id=1,socket-id=2,core-id=1 \
> +    -device gen16b-s390x-cpu,drawer-id=1,book-id=1,socket-id=2,core-id=2 \
> +    -device gen16b-s390x-cpu,drawer-id=1,book-id=1,socket-id=2,core-id=3 \
> +    \
> +    -device gen16b-s390x-cpu,drawer-id=0,book-id=0,socket-id=0,core-id=9 \
> +    -device gen16b-s390x-cpu,drawer-id=0,book-id=0,socket-id=0,core-id=14 \
> +    \
> +    -device gen16b-s390x-cpu,core-id=4,dedicated=on,polarity=3 \
> +
> +Polarity and dedication
> +-----------------------

Since you are using the terms "polarity" and "dedication" in the previous 
paragraphs already, it might make sense to move this section here earlier in 
the document to teach the users about this first, before using the terms in 
the other paragraphs?

> +Polarity can be of two types: horizontal or vertical.
> +
> +The horizontal polarization specifies that all guest's vCPUs get
> +almost the same amount of provisioning of real CPU by the host.
> +
> +The vertical polarization specifies that guest's vCPU can get
> +different  real CPU provisions:

Please remove one space between "different" and "real".

> +- a vCPU with Vertical high entitlement specifies that this
> +  vCPU gets 100% of the real CPU provisioning.
> +
> +- a vCPU with Vertical medium entitlement specifies that this
> +  vCPU shares the real CPU with other vCPU.

"with *one* other vCPU" or rather "with other vCPU*s*" ?

> +
> +- a vCPU with Vertical low entitlement specifies that this
> +  vCPU only get real CPU provisioning when no other vCPU need it.
> +
> +In the case a vCPU with vertical high entitlement does not use
> +the real CPU, the unused "slack" can be dispatched to other vCPU
> +with medium or low entitlement.
> +
> +The host indicates to the guest how the real CPU resources are
> +provided to the vCPUs through the SYSIB with two polarity bits
> +inside the CPU TLE.
> +
> +Bits d - Polarization
> +0 0      Horizontal
> +0 1      Vertical low entitlement
> +1 0      Vertical medium entitlement
> +1 1      Vertical high entitlement

That SYSIB stuff looks like details for developers again ... I think you 
should either add more explanations here (I assume the average user does not 
know the term SYSIB), move it to a separate developers file or drop it.

> +A subsystem reset puts all vCPU of the configuration into the
> +horizontal polarization.
> +
> +The admin specifies the dedicated bit when the vCPU is dedicated
> +to a single real CPU.
> +
> +As for the Linux admin, the dedicated bit is an indication on the
> +affinity of a vCPU for a real CPU while the entitlement indicates the
> +sharing or exclusivity of use.
> +
> +QAPI interface for topology
> +---------------------------

A "grep -r QAPI docs/system/" shows hardly any entries there. I think QAPI 
documentation should go into docs/devel instead.

> +Let's start QEMU with the following command:
> +
> +.. code-block:: bash
> +
> + sudo /usr/local/bin/qemu-system-s390x \
> +    -enable-kvm \
> +    -cpu z14,ctop=on \
> +    -smp 1,drawers=3,books=3,sockets=2,cores=2,maxcpus=36 \
> +    \
> +    -device z14-s390x-cpu,core-id=19,polarity=3 \
> +    -device z14-s390x-cpu,core-id=11,polarity=1 \
> +    -device z14-s390x-cpu,core-id=12,polarity=3 \
> +   ...
> +
> +and see the result when using of the QAPI interface.
> +
> +query-topology
> ++++++++++++++++
> +
> +The command cpu-topology allows the admin to query the topology

Not sure if the average admin runs QMP directly ... maybe rather talk about 
the "upper layers like libvirt" here or something similar.

> +tree and modifier for all configured vCPU.
> +
> +.. code-block:: QMP
> +
> + -> { "execute": "query-topology" }
> +    {"return":
> +        [
> +            {
> +            "origin": 0,
> +            "dedicated": false,
> +            "book": 0,
> +            "socket": 0,
> +            "drawer": 0,
> +            "polarity": 0,
> +            "mask": "0x8000000000000000"
> +            },
> +            {
> +                "origin": 0,
> +                "dedicated": false,
> +                "book": 2,
> +                "socket": 1,
> +                "drawer": 0,
> +                "polarity": 1,
> +                "mask": "0x0010000000000000"
> +            },
> +            {
> +                "origin": 0,
> +                "dedicated": false,
> +                "book": 0,
> +                "socket": 0,
> +                "drawer": 1,
> +                "polarity": 3,
> +                "mask": "0x0008000000000000"
> +            },
> +            {
> +                "origin": 0,
> +                "dedicated": false,
> +                "book": 1,
> +                "socket": 1,
> +                "drawer": 1,
> +                "polarity": 3,
> +                "mask": "0x0000100000000000"
> +            }
> +        ]
> +    }
> +
> +change-topology
> ++++++++++++++++
> +
> +The command change-topology allows the admin to modify the topology
> +tree or the topology modifiers of a vCPU in the configuration.
> +
> +.. code-block:: QMP
> +
> + -> { "execute": "change-topology",
> +      "arguments": {
> +         "core": 11,
> +         "socket": 0,
> +         "book": 0,
> +         "drawer": 0,
> +         "polarity": 0,
> +         "dedicated": false
> +      }
> +    }
> + <- {"return": {}}
> +
> +
> +event POLARITY_CHANGE
> ++++++++++++++++++++++
> +
> +When a guest is requesting a modification of the polarity,
> +QEMU sends a POLARITY_CHANGE event.
> +
> +When requesting the change, the guest only specifies horizontal or
> +vertical polarity.
> +The dedication and fine grain vertical entitlement depends on admin
> +to set according to its response to this event.
> +
> +Note that a vertical polarized dedicated vCPU can only have a high
> +entitlement, this gives 6 possibilities for a vCPU polarity:
> +
> +- Horizontal
> +- Horizontal dedicated
> +- Vertical low
> +- Vertical medium
> +- Vertical high
> +- Vertical high dedicated
> +
> +Example of the event received when the guest issues PTF(0) to request

Please mention that PTF is a CPU instruction (and provide the full name).

  Thomas


