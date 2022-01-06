Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59199486762
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 17:09:43 +0100 (CET)
Received: from localhost ([::1]:56936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5VKg-00018X-0o
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 11:09:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1n5VIt-0000CY-UW
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 11:07:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1n5VIk-00034y-Ci
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 11:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641485261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oq0ZYNEWv05QgZ2ulzFybJmZTsc1Zcs14l8IHQyWXp4=;
 b=CROde50KwDZ8ekaSJ4Syeo/iZB8h7JxbhdLRIG16Jmdh3DMZVmmnIs8eSjxjGegtPWKDew
 J0kONJ0wCODqtWxnHQismScYGMwTPxsSUGjWX7Cb0lsZMO1B5vc1gK3xVNfYU5fOd2fK9B
 GbdS3kbhrbTkthM7DGSnIczJP/Ny2tk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-7MEq4A_POYWlMeDD6-WiNw-1; Thu, 06 Jan 2022 11:07:37 -0500
X-MC-Unique: 7MEq4A_POYWlMeDD6-WiNw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8CAA10144E0;
 Thu,  6 Jan 2022 16:07:35 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94E3E10911BE;
 Thu,  6 Jan 2022 16:06:52 +0000 (UTC)
Subject: Re: [RFC PATCH v2 20/44] i386/tdx: Parse tdx metadata and store the
 result into TdxGuestState
To: Xiaoyao Li <xiaoyao.li@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 isaku.yamahata@gmail.com
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <acaf651389c3f407a9d6d0a2e943daf0a85bb5fc.1625704981.git.isaku.yamahata@intel.com>
 <20210826111838.fgbp6v6gd5wzbnho@sirius.home.kraxel.org>
 <a97a75ad-9d1c-a09f-281b-d6b0a7652e78@intel.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <4eb6a628-0af6-409b-7e42-52787ee3e69d@redhat.com>
Date: Thu, 6 Jan 2022 17:06:50 +0100
MIME-Version: 1.0
In-Reply-To: <a97a75ad-9d1c-a09f-281b-d6b0a7652e78@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: isaku.yamahata@intel.com, cohuck@redhat.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, seanjc@google.com, alistair@alistair23.me,
 qemu-devel@nongnu.org, mtosatti@redhat.com, "Min M . Xu" <min.m.xu@intel.com>,
 erdemaktas@google.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/04/22 14:08, Xiaoyao Li wrote:

> + Laszlo,
> 
> Regarding laoding TDVF as pflash, I have some questions:
> 
> - pflash requires KVM to support readonly mmeory. However, for TDX, it
> doesn't support readonly memory. Is it a must? or we can make an
> exception for TDX?
> 
> - I saw from
> https://lists.gnu.org/archive/html/qemu-discuss/2018-04/msg00045.html,
> you said when load OVMF as pflash, it's MMIO. But for TDVF, it's treated
> as private memory. I'm not sure whether it will cause some potential
> problem if loading TDVF with pflash.
> 
> Anyway I tried changing the existing pflash approach to load TDVF. It
> can boot a TDX VM and no issue.

I have no comments on whether TDX should or should not use pflash.

If you go without pflash, then you likely will not have a
standards-conformant UEFI variable store. (Unless you reimplement the
variable arch protocols in edk2 on top of something else than the Fault
Tolerant Write and Firmware Volume Block protocols.) Whether a
conformant UEFI varstore matters to you (or to TDX in general) is
something I can't comment on.

(I've generally stopped commenting on confidential computing topics, but
this message allows for comments on just pflash, and how it impacts OVMF.)

Regarding pflash itself, the read-only KVM memslot is required for it.
Otherwise pflash cannot work as a "ROMD device" (= you can't flip it
back and forth between ROM mode and programming (MMIO) mode).

Thanks
Laszlo


