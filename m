Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADB3462FF5
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 10:42:48 +0100 (CET)
Received: from localhost ([::1]:45068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrzex-0000iy-Ot
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 04:42:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mrze7-0008Vd-KX
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 04:41:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mrze5-0002IN-IZ
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 04:41:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638265312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uehv7rXZKny80of3QXFJWfzuZujshN7DXPmLPkBwqRA=;
 b=G31O6btfFx2OF6mG4bU8WPpUduJH0OR67y89cicxQAH2utzr8+KhkcbxMWlnYjrvzY9d3m
 LCk+TMP6vnvau3CZo8jztZkHDB6SELMXQ/lX61lEui/AYPkxB2OEB6qI8qsGY8ZGLayhoD
 GM69AAICqI6Iei7+VjgxMneqcdbRmZg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-9eAsx5ztNLi3RyutLxJvRA-1; Tue, 30 Nov 2021 04:41:51 -0500
X-MC-Unique: 9eAsx5ztNLi3RyutLxJvRA-1
Received: by mail-ed1-f69.google.com with SMTP id
 eg20-20020a056402289400b003eb56fcf6easo16335557edb.20
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 01:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Uehv7rXZKny80of3QXFJWfzuZujshN7DXPmLPkBwqRA=;
 b=eWrLv2MJAn0xsvXwEeDDMLrHrEpfPoXcdtsL9coKKKRo1MtIs0uon+qzNB27ZeBUj/
 Vly58kQ7DU39JBzD4iXt/9GSbNMbbUxkFZXRGaDfe2sblt2ztOZRgGvk9bkbOKlBuMW7
 4Dh8RoaSEi728di13e9OUjBJFmGgTowDjN80jgE6/enguXrPXQNuikv7bbEdz5XPSr/m
 iOlZ7NeGV2LNhkOy6KzEZ+rcl4bKvficZN9C36CrNQNZIqIKmxlEy0Hus6UFLvpD9QCE
 a5cLBD8KWVY5HmXWFifEP8r00g8256XAAgzxreI5yQTHFyXOez8i64DaOyXxIWATQLWS
 byDQ==
X-Gm-Message-State: AOAM531IcAwhTFZXFIyAZsyRF8M8HNbeyiimZoJsnu3t2KeblcE2oHVM
 HtHLY+Yvm+BMEqtT3BmQ0QtWvpQ4/mLm1xAkbgrpkL1CYRIQJX1ysKNNV/fSOE0mDuTKQFhBz4S
 NN1wvy+YB19/RPu4=
X-Received: by 2002:a05:6402:3496:: with SMTP id
 v22mr80009239edc.177.1638265309647; 
 Tue, 30 Nov 2021 01:41:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxELU+3Nghcqi5ZrcjvNFvYnyT4zIEkqP1PR6cvPhwEk+W0I5e58iBMflV173MISTzgPLvRCA==
X-Received: by 2002:a05:6402:3496:: with SMTP id
 v22mr80009203edc.177.1638265309393; 
 Tue, 30 Nov 2021 01:41:49 -0800 (PST)
Received: from [10.43.2.64] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id h10sm11393169edr.95.2021.11.30.01.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 01:41:49 -0800 (PST)
Message-ID: <fec32eb4-3b7b-e2b7-29f9-b1795dfeb2eb@redhat.com>
Date: Tue, 30 Nov 2021 10:41:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: Odd square bracket encoding in QOM names
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>
References: <32fd9815-11b1-686f-5c2b-9d31c72a64c6@ilande.co.uk>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <32fd9815-11b1-686f-5c2b-9d31c72a64c6@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/30/21 09:35, Mark Cave-Ayland wrote:
> Hi all,
> 
> Has there been a recent change as to how square brackets are encoded
> within QOM names? I noticed that the output has changed here in the
> "info qom-tree" output in qemu-system-m68k for the q800 machine.
> 
> The q800 machine has a set of 256 memory region aliases that used to
> appear in the "info qom-tree" output as:
> 
>     /mac_m68k.io[100] (memory-region)
>     /mac_m68k.io[101] (memory-region)
>     /mac_m68k.io[102] (memory-region)
> 
> but they now appear as:
> 
>     /mac_m68k.io\x5b100\x5d[0] (memory-region)
>     /mac_m68k.io\x5b101\x5d[0] (memory-region)
>     /mac_m68k.io\x5b102\x5d[0] (memory-region)
> 
> Is there something that could cause the names to be double-encoded
> before being displayed?

I see the same behavior on x86_64 and qemu-system-x86_64 but with a
different member:

/machine (pc-i440fx-4.0-machine)
  /device-memory[0] (memory-region)
  /fw_cfg (fw_cfg_io)
    /\x2from@etc\x2facpi\x2frsdp[0] (memory-region)
    /\x2from@etc\x2facpi\x2ftables[0] (memory-region)
    /\x2from@etc\x2ftable-loader[0] (memory-region)

And the same happens over QMP too:

virsh qemu-monitor-command $dom qom-list '"path":"/machine/fw_cfg"'

{"return":[{"name":"type","type":"string"},{"name":"parent_bus","type":"link<bus>"},{"name":"realized","type":"bool"},{"name":"hotplugged","type":"bool"},{"name":"hotpluggable","type":"bool"},{"name":"acpi-mr-restore","type":"bool"},{"name":"x-file-slots","type":"uint16"},{"name":"dma_enabled","type":"bool"},{"name":"\\x2from@etc\\x2facpi\\x2ftables[0]","type":"child<memory-region>"},{"name":"fwcfg.dma[0]","type":"child<memory-region>"},{"name":"fwcfg[0]","type":"child<memory-region>"},{"name":"\\x2from@etc\\x2facpi\\x2frsdp[0]","type":"child<memory-region>"},{"name":"\\x2from@etc\\x2ftable-loader[0]","type":"child<memory-region>"}],"id":"libvirt-455"}

Michal


