Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E78C537FCF3
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:54:30 +0200 (CEST)
Received: from localhost ([::1]:44582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhFXZ-0000jI-A0
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhFW5-00079L-RS
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:52:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhFVx-0000rb-VK
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620928367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rAYf6CH9/vW7b88CeiR+EOZwbtNE46HssNOgtHvM7mo=;
 b=M7crmKpB6t+XhROmTlnUc49g7K2/SnandOHkyf3oVKpHAm0lwpzxdRnXcSTLcD9T9IXb4F
 NJkUpxC/dOcOTw6hqzE6aEvPOQ3TxHSv+n3SpmDK731hWjf19LIZkY/F2UyDg1sswYfm/q
 wmJy8S6RFQmvAaw43vMKBws3epbABc0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-GQ_1U3X7Pay8Q3TwH9Vmsw-1; Thu, 13 May 2021 13:52:44 -0400
X-MC-Unique: GQ_1U3X7Pay8Q3TwH9Vmsw-1
Received: by mail-ed1-f71.google.com with SMTP id
 i17-20020a50fc110000b0290387c230e257so15038028edr.0
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 10:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rAYf6CH9/vW7b88CeiR+EOZwbtNE46HssNOgtHvM7mo=;
 b=jZE9+Cyp+h0JUJgycr4QDFVjPIiS9HL0CXfO5htVoYeDk04qGpjC2LEi0xBsKnGvnB
 eTdwktKLffEwQ+jg1omzV97BhyFaIheICQXXli1Tv6nY3r9xsxHjG5p7WziCcnShXBCe
 GUmfT0lmqMD5yd6n4lqa/4ULRQhP+6NbcsYNgsjk7XhFFllx12kM8QZFIhmUdzDLEwA9
 oOWZ0PvCFprnVXj9+eUz3fBkntOvLynz5laHNMlq6Ra0r0tkL5nF/hS3W4UNNRRl+uJM
 B52EDMUp37At+puvoRz8IgiXO5wsN3aJjg4jCFDnK72rEINFZFA7TD4liB8P1t5qoYdw
 E7YA==
X-Gm-Message-State: AOAM533CfNxkDvPqQ0ecig/VobRIazlQSrNT4A5qeb3unm2KTelUeCti
 4JrVpVfQPYeUVUQBWByW+1hfIdtGMV3HfTlElIHNtBaHlQlQ/NpUswBglAJOI0DDiCHHXsWQKPm
 vnYy1BQs5rwhgJDg=
X-Received: by 2002:a17:906:c0c3:: with SMTP id
 bn3mr44807087ejb.498.1620928363105; 
 Thu, 13 May 2021 10:52:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxX25CxHZupee87akxtEc7ytPyxDmvuz4+5d5honSb9fEiZePOMaqybsfLE5vpO6E/2/xS+Ew==
X-Received: by 2002:a17:906:c0c3:: with SMTP id
 bn3mr44807069ejb.498.1620928362877; 
 Thu, 13 May 2021 10:52:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id da25sm2972153edb.38.2021.05.13.10.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 10:52:42 -0700 (PDT)
Subject: Re: [RFC PATCH 0/9] Initial support for machine creation via QMP
To: Mirela Grujic <mirela.grujic@greensocs.com>, qemu-devel@nongnu.org
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <93ae82d3-f9a7-f347-a013-54ae5cdc95f7@redhat.com>
Date: Thu, 13 May 2021 19:52:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513082549.114275-1-mirela.grujic@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 mark.burton@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mirela, this is very interesting!

It's unfortunate that I completely missed the discussions in 
January/February.  You might have noticed that in the 5.2/6.0 timeframe 
I worked on cleaning up the machine initialization phases and qemu_init. 
  The idea behind the cleanup was to identify clearly the steps from one 
phase to the next.  I am very happy that you are already benefitting 
from that work in this series and you were able to make a prototype with 
so little code.

My plan was a bit more ambitious though :) and it is laid out at 
https://wiki.qemu.org/User:Paolo_Bonzini/Machine_init_sequence.

My plan was to have completely different binaries than the current 
qemu-system-*.  These would only have a handful of command line options 
(such as -name, -sandbox, -trace, -L) and would open a QMP connection on 
stdio.

All other command line option would be either considered legacy or 
adjusted to be part of two new QMP commands, machine-set and accel-set, 
which would advance through the phases like this:

PHASE_NO_MACHINE
    -> machine-set -> PHASE_MACHINE_CREATED ->
    -> accel-set -> PHASE_ACCEL_CREATED -> PHASE_MACHINE_INITIALIZED ->
    -> finish-machine-init -> PHASE_MACHINE_READY
    -> cont

I think this idea would work well with your plan below, because the 
preconfiguration that you need to do happens mostly at 
PHASE_MACHINE_INITIALIZED.

Of course, the disadvantage of my approach is that, in the initial 
version, a lot of capabilities of QEMU are not available (especially 
with respect to the UI, since there's no "display-add" command). 
However, the basic implementation of machine-set and accel-set should 
not really be *that* much more work, and it should be doable in parallel 
with the conversion efforts for those options.  For example, today I 
posted a series that maps -smp to -M (and then, SMP configuration would 
automatically become available in machine-set).

I have placed the skeleton of the work I was doing at 
https://gitlab.com/bonzini/qemu/ in the branch qemu-qmp-targets.  You 
can see a sample execution at 
https://asciinema.org/a/TXMX8EZh8Md0fZnuE7uhfv6cO.  I have not touched 
some of the patches in a long time, but I plan to give them a quick test 
tomorrow.  Starting from the code in that branch, it should not be hard 
to implement the machine-set and accel-set commands in the same fashion 
as QEMU 5.2's implementation of object-add.

Thanks for posting these patches, I have started a light review of them.

Paolo

On 13/05/21 10:25, Mirela Grujic wrote:
> The direction for this work has been set in the discussion thread:
> "About creating machines on the command line" in January/February 2021:
> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01839.html
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg01070.html
> 
> To customize a machine via QMP we need the ability to stop QEMU at a specific
> machine initialization phase.
> 
> Currently, machine initialization phases are:
> 1) no-machine: machine does not exist yet (current_machine == NULL)
> 2) machine-created: machine exists, but its accelerator does not
>     (current_machine->accelerator == NULL)
> 3) accel-created: machine's accelerator is configured
>     (current_machine->accelerator != NULL), but machine class's init() has not
>     been called (no properties validated, machine_init_done notifiers not
>     registered, no sysbus, etc.)
> 4) initialized: machine class's init() has been called, thus machine properties
>     are validated, machine_init_done notifiers registered, sysbus realized, etc.
>     Devices added at this phase are considered to be cold-plugged.
> 5) ready: machine_init_done notifiers are called, then QEMU is ready to start
>     CPUs. Devices added at this phase are considered to be hot-plugged.
> 
> QEMU can be stopped today using the -preconfig CLI option at phase 3
> (accel-created). This option was introduced to enable the QMP configuration of
> parameters that affect the machine initialization. We cannot add devices at
> this point because the machine class's init() has not been called, thus sysbus
> does not exist yet (a device cannot be added because there is no bus to attach
> it to).
> 
> QEMU can be also stopped using the -S CLI option at the machine ready phase.
> However, it is too late to add devices at this phase because the machine is
> already configured, and any devices added at this point are considered to be
> hot-plugged.
> 
> Since the existing -preconfig CLI option stops QEMU too early, and the -S option
> stops too late, we need a way to stop QEMU in between (after the machine is
> initialized and before it becomes ready).


