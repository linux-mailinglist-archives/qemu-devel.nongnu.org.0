Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695B34192E9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 13:14:44 +0200 (CEST)
Received: from localhost ([::1]:50846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUoap-0007jj-0y
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 07:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mUoTH-0000jS-Nj; Mon, 27 Sep 2021 07:06:56 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:57496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mUoT8-0005EV-Mh; Mon, 27 Sep 2021 07:06:54 -0400
Received: from [192.168.15.164] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id AD9632077D;
 Mon, 27 Sep 2021 11:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632740802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1LjfrHuXtfr19HXWbNpzr/bWUJRrYziuL+JVEEdOPDE=;
 b=bBWch/jc39GiMlXq+0azY7pTN6yUgsLXXwyrcYizd+ObBBvrPOrcmxT2xh87KXUMqzg/dY
 0cO5inCF6JEhplgQCuhcvCuhyzIXNa+HU/5mLTQ5jlPqibbiCxk5hwDpcJQTez2vq9qRXI
 vYGjoJEX5Ln2jyfN7fJ8LD6E1bGfqho=
Message-ID: <89bbeed4-dec6-007a-175e-38a12e5bbfa1@greensocs.com>
Date: Mon, 27 Sep 2021 13:06:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 09/11] qdev: Avoid QemuOpts in QMP device_add
Content-Language: en-US-large
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-10-kwolf@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20210924090427.9218-10-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.136,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, armbru@redhat.com,
 its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/24/21 11:04, Kevin Wolf wrote:
> Directly call qdev_device_add_from_qdict() for QMP device_add instead of
> first going through QemuOpts and converting back to QDict.
> 
> Note that this changes the behaviour of device_add, though in ways that
> should be considered bug fixes:
> 
> QemuOpts ignores differences between data types, so you could
> successfully pass a string "123" for an integer property, or a string
> "on" for a boolean property (and vice versa).  After this change, the
> correct data type for the property must be used in the JSON input.
> 
> qemu_opts_from_qdict() also silently ignores any options whose value is
> a QDict, QList or QNull.
> 
> To illustrate, the following QMP command was accepted before and is now
> rejected for both reasons:
> 
> { "execute": "device_add",
>    "arguments": { "driver": "scsi-cd",
>                   "drive": { "completely": "invalid" },
>                   "physical_block_size": "4096" } }
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   softmmu/qdev-monitor.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index c09b7430eb..8622ccade6 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -812,7 +812,8 @@ void hmp_info_qdm(Monitor *mon, const QDict *qdict)
>       qdev_print_devinfos(true);
>   }
>   
> -void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
> +static void monitor_device_add(QDict *qdict, QObject **ret_data,
> +                               bool from_json, Error **errp)
>   {
>       QemuOpts *opts;
>       DeviceState *dev;
> @@ -825,7 +826,9 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
>           qemu_opts_del(opts);
>           return;
>       }
> -    dev = qdev_device_add(opts, errp);
> +    qemu_opts_del(opts);
> +
> +    dev = qdev_device_add_from_qdict(qdict, from_json, errp);
>   

Hi Kevin,

I'm wandering if deleting the opts (which remove it from the "device" 
opts list) is really a no-op ?
The opts list is, eg, traversed in hw/net/virtio-net.c in the function
failover_find_primary_device_id() which may be called during the 
virtio_net_set_features() (a TYPE_VIRTIO_NET method).
I do not have the knowledge to tell when this method is called. But If 
this is after we create the devices. Then the list will be empty at this 
point now.

It seems, there are 2 other calling sites of 
"qemu_opts_foreach(qemu_find_opts("device"), [...]" in net/vhost-user.c 
and net/vhost-vdpa.c


--
Damien

