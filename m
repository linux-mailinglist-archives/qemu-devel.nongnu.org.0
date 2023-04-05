Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7B46D796A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:18:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0Cr-0005Hx-US; Wed, 05 Apr 2023 06:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pk0Cq-0005HW-0y
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:17:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pk0Cn-0008Fi-TW
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680689848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bxnc1gRpcN+4GVGBSaR/kYZy2gdzYtnrizkroteUqc8=;
 b=YWINqjk4m8In9qtrr7IGTcHUqdlz5DtSD/4KHe7VP2UB6zA0I3RNr+jptaEgHHvoVRd0uG
 +h/Bb3Xc7QH0TblFPm0d4iUR3JvImGJcDkc6jEpV9V8v6xZ0cFikAX4k6qhmHUJtwAqNOi
 TgMSxHESe3XfSoy6axhe1NvVyEDsZ/A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-80-ZGwJx5bVM8eBIkdvDPlEPA-1; Wed, 05 Apr 2023 06:17:24 -0400
X-MC-Unique: ZGwJx5bVM8eBIkdvDPlEPA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 307E98996E2
 for <qemu-devel@nongnu.org>; Wed,  5 Apr 2023 10:17:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF53C400F57;
 Wed,  5 Apr 2023 10:17:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B954B1800097; Wed,  5 Apr 2023 12:17:22 +0200 (CEST)
Date: Wed, 5 Apr 2023 12:17:22 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, anisinha@redhat.com, 
 jusual@redhat.com
Subject: Re: [PATCH v3] acpi: pcihp: make pending delete blocking action expire
Message-ID: <ospmt6sdtawjpsgk7f7bigrdok5n3orht2awuedf2vlxgeqlro@v62qktfetqlf>
References: <20230405094256.1539122-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405094256.1539122-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Apr 05, 2023 at 11:42:56AM +0200, Igor Mammedov wrote:
> with Q35 using ACPI PCI hotplug by default, user's request to unplug
> device is ignored when it's issued before guest OS has been booted.
> And any additional attempt to request device hot-unplug afterwards
> results in following error:
> 
>   "Device XYZ is already in the process of unplug"
> 
> arguably it can be considered as a regression introduced by [2],
> before which it was possible to issue unplug request multiple
> times.
> 
> Allowing pending delete blocking expire brings ACPI PCI hotplug
> on par with native PCIe unplug behavior [1] and allows user
> to repeat unplug requests at propper times.
> Set expire timeout to arbitrary 1msec so user won't be able to
> flood guest with SCI interrupts by calling device_del in tight loop.
> 
> PS:
> ACPI spec doesn't mandate what OSPM can do with GPEx.status
> bits set before it's booted => it's impl. depended.
> Status bits may be retained (I tested with one Windows version)
> or cleared (Linux since 2.6 kernel times) during guest's ACPI
> subsystem initialization.
> Clearing status bits (though not wrong per se) hides the unplug
> event from guest, and it's upto user to repeat device_del later
> when guest is able to handle unplug requests.
> 
> 1) 18416c62e3 ("pcie: expire pending delete")
> 2)
> Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> CC: mst@redhat.com
> CC: anisinha@redhat.com
> CC: jusual@redhat.com
> CC: kraxel@redhat.com

Acked-by: Gerd Hoffmann <kraxel@redhat.com>


