Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE82629C24E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 18:34:59 +0100 (CET)
Received: from localhost ([::1]:37936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXSs7-0004Tz-31
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 13:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kXSqu-0003kM-8r
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 13:33:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kXSqq-0002oR-C9
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 13:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603820019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dATPPZUtxMzSsqvmFfOPsvEK9lRRyGz7oGYFhobA3XI=;
 b=T+VyBg1XezJDxpm4Qo+W381bNGGlRC9Z4vJiNknVipU9U0z9W26V8gp90OPrOQQ8kzNTuD
 VG41Q55gLqnW0mHuB8FjubwNJUEt/so8y5VP6Y3qWj3bhDRE14Uaqk7ZolIELp5sGq2iuE
 zZ8QyKO+q4uihIU6qReVxIUN7oIpkYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-JZIthewNMpaw6In7Th7euw-1; Tue, 27 Oct 2020 13:33:35 -0400
X-MC-Unique: JZIthewNMpaw6In7Th7euw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A86EA0BDC;
 Tue, 27 Oct 2020 17:33:34 +0000 (UTC)
Received: from [10.10.118.238] (ovpn-118-238.rdu2.redhat.com [10.10.118.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D1C519C4F;
 Tue, 27 Oct 2020 17:33:33 +0000 (UTC)
Subject: Re: [PATCH v2] xen: rework pci_piix3_xen_ide_unplug
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
References: <20201027154058.495112-1-anthony.perard@citrix.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <e7d2fef8-a697-398e-4b3b-bf247aac01a5@redhat.com>
Date: Tue, 27 Oct 2020 13:33:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201027154058.495112-1-anthony.perard@citrix.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.167, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/20 11:40 AM, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> This is to allow IDE disks to be unplugged when adding to QEMU via:
>      -drive file=/root/disk_file,if=none,id=ide-disk0,format=raw
>      -device ide-hd,drive=ide-disk0,bus=ide.0,unit=0
> 
> as the current code only works for disk added with:
>      -drive file=/root/disk_file,if=ide,index=0,media=disk,format=raw
> 
> Since the code already have the IDE controller as `dev`, we don't need
> to use the legacy DriveInfo to find all the drive we want to unplug.
> We can simply use `blk` from the controller, as it kind of was already
> assume to be the same, by setting it to NULL.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: John Snow <jsnow@redhat.com>

Do you need me to send a PR for this?

--js

> 
> ---
> v2: coding style
> 
> CC: Paul Durrant <paul@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> ---
>   hw/ide/piix.c | 27 +++++++++++++--------------
>   1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index b402a936362b..b9860e35a5c4 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -164,30 +164,29 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>   int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
>   {
>       PCIIDEState *pci_ide;
> -    DriveInfo *di;
>       int i;
>       IDEDevice *idedev;
> +    IDEBus *idebus;
> +    BlockBackend *blk;
>   
>       pci_ide = PCI_IDE(dev);
>   
>       for (i = aux ? 1 : 0; i < 4; i++) {
> -        di = drive_get_by_index(IF_IDE, i);
> -        if (di != NULL && !di->media_cd) {
> -            BlockBackend *blk = blk_by_legacy_dinfo(di);
> -            DeviceState *ds = blk_get_attached_dev(blk);
> +        idebus = &pci_ide->bus[i / 2];
> +        blk = idebus->ifs[i % 2].blk;
>   
> -            blk_drain(blk);
> -            blk_flush(blk);
> -
> -            if (ds) {
> -                blk_detach_dev(blk, ds);
> -            }
> -            pci_ide->bus[di->bus].ifs[di->unit].blk = NULL;
> +        if (blk && idebus->ifs[i % 2].drive_kind != IDE_CD) {
>               if (!(i % 2)) {
> -                idedev = pci_ide->bus[di->bus].master;
> +                idedev = idebus->master;
>               } else {
> -                idedev = pci_ide->bus[di->bus].slave;
> +                idedev = idebus->slave;
>               }
> +
> +            blk_drain(blk);
> +            blk_flush(blk);
> +
> +            blk_detach_dev(blk, DEVICE(idedev));
> +            idebus->ifs[i % 2].blk = NULL;
>               idedev->conf.blk = NULL;
>               monitor_remove_blk(blk);
>               blk_unref(blk);
> 


