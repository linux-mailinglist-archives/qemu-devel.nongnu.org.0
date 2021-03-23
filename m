Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825BB34692A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:37:01 +0100 (CET)
Received: from localhost ([::1]:59906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmpo-0002x3-Ha
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOmlX-0007BB-RM
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:32:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOmlU-0004mY-91
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616527950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5SdpfTrhPzIfzyXFC6KEHznk2zxV6ZsV2A9HAKeN2YE=;
 b=fglZQxxS/JFE3fzxg7AeLy2A2s4rbQWBFSKP2+ANlEOtK++IhE9J7M28SZq9hjdSIQ5cqZ
 0x5ytSarKAIIzTWBLJ4yc74LdSfFMcKsk5B7aGsaZbrOX9K4mArY2QojzpiaTJaKp1O0i/
 N5CDDBK/wPj1G/aDUd9/aAS4glRFiyM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-zZ31M17SNoynv6FuGy_t4w-1; Tue, 23 Mar 2021 15:32:28 -0400
X-MC-Unique: zZ31M17SNoynv6FuGy_t4w-1
Received: by mail-wm1-f72.google.com with SMTP id n2so1138517wmi.2
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 12:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5SdpfTrhPzIfzyXFC6KEHznk2zxV6ZsV2A9HAKeN2YE=;
 b=k6e28Jg1fYtO6hKW/Xe0pjHiOiETLiWjtXtuOTDJXJ38Mi4XrNcQ1Ho/lgSu5+4Xyl
 SW9E/uX4+AfobOudLY4Ab+ANf6+fnnMz/dKqOSpvXr90a3+FfKS/Mh04awOdeedi2Kuy
 Cx7wSRT5lPNoHRAG/7t2qbdxQFj1CIHex4c5BsnN+ja/b4M5TJiRA1w1aqM/x0TFtCkp
 gTrZamatSF7bxRGdTWq1nMYI3LKNufRIxH2R4ROzN7xK81Z4iOAb6WtSVU7Hs7kci0w1
 B6c3khiqz+XM3eEkcKcaMfKB19kGB2cPjgZ5FovDQ2Y/IrKuj8PTFMZjuiLrQh+ANawp
 7bvg==
X-Gm-Message-State: AOAM533PfGEevurTsrIJEhOgnAB3ojtOJxv9/O3Be6R0xTnIlEcwc/5s
 uhDPWjnY7K1sgSXbTCAyiv0a5ZhllsWThxx3ZkyPYhX8zYAvct/1gCGcZn6Bqs1ByhfN3355VZH
 ThjChZ8CwLfgiy78=
X-Received: by 2002:a5d:548c:: with SMTP id h12mr5681259wrv.46.1616527947717; 
 Tue, 23 Mar 2021 12:32:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA4LSXz/kw63aeCOzGqSTQSDUktaf3Vci6+gRwXF6t1p/aMxnEPFovAdIHhfyXZDsePHq+PA==
X-Received: by 2002:a5d:548c:: with SMTP id h12mr5681250wrv.46.1616527947572; 
 Tue, 23 Mar 2021 12:32:27 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id r2sm24294667wrt.8.2021.03.23.12.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 12:32:26 -0700 (PDT)
Date: Tue, 23 Mar 2021 15:32:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: [PATCH] i386/acpi: restore device paths for pre-5.1 vms
Message-ID: <20210323152835-mutt-send-email-mst@kernel.org>
References: <20210301195919.9333-1-cheptsov@ispras.ru>
 <20210322114116-mutt-send-email-mst@kernel.org>
 <B813DBC6-B989-4630-B2DE-8F5825484E78@ispras.ru>
 <20210323104542-mutt-send-email-mst@kernel.org>
 <71AD039B-775A-4DF3-B16D-4BC3768A20AC@ispras.ru>
 <a1a1b783-6217-cb22-0dd8-fab9b7971542@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <a1a1b783-6217-cb22-0dd8-fab9b7971542@proxmox.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Vitaly Cheptsov <cheptsov@ispras.ru>,
 qemu devel list <qemu-devel@nongnu.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 04:04:11PM +0100, Thomas Lamprecht wrote:
> On 23.03.21 15:55, Vitaly Cheptsov wrote:
> >> 23 марта 2021 г., в 17:48, Michael S. Tsirkin <mst@redhat.com> написал(а):
> >>
> >> The issue is with people who installed a VM using 5.1 qemu,
> >> migrated to 5.2, booted there and set a config on a device
> >> e.g. IP on a NIC.
> >> They now have a 5.1 machine type but changing uid back
> >> like we do will break these VMs.
> >>
> >> Unlikley to be common but let's at least create a way for these people
> >> to used these VMs.
> >>
> > They can simply set the 5.2 VM version in such a case. I do not want to 
> let this legacy hack to be enabled in any modern QEMU VM version, as it violates ACPI specification and makes the life more difficult for various other software like bootloaders and operating systems.
> 
> Yeah here I agree with Vitaly, if they already used 5.2 and made some configurations
> for those "new" devices they can just keep using 5.2?

People just create a VM, the machine type gets set in stone then.

> If some of the devices got configured on 5.1 and some on 5.2 there's nothing we can
> do anyway, from a QEMU POV - there the user always need to choose one machine version
> and fix up the device configured while on the other machine.

I think I did not explain it well. Here is an example.


1. start qemu version 5.1 with machine type 5.1

2. reboot with qemu version 5.2 still machine type 5.1

3. set static IP on NIC

4. reboot with qemu version 6.0 still machine type 5.1

   at this point NIC loses the static IP.



What I suggest is that we use a property to at stage 4,
user can set a flag and avoid losing the static IP.
Yes in theory maybe at stage 2 or 4 user can switch to 5.2 machine type
but we were always telling people not to do that, let's not start.

-- 
MST


