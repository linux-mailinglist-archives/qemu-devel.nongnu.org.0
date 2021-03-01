Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ED2328436
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:34:40 +0100 (CET)
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlVH-0006Zu-Ik
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lGlPA-0001Lw-3L
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:28:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lGlP5-0000My-UA
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614616094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3EBYVJZacPv4HOQL2MYMGcpD4UOVwk3EMaXQSSnp+pE=;
 b=UvcpKfXHB7O0QO5OyzlVNxn6MXd4tolSxKwb7TC3ssDHvugkEmwkqNqz6dSHcLSNM8uEoP
 ucFdpgJHwAMK1hRRXKVZe/lByQVbuUXp1M9aEUdm9MmESxsKvcaUD9QRPmhVinY1WSrdMV
 WVbGl9TbWfAzs5DPpuY0SLWZsndg4dI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-ietnFDv_OcK4uD2piHTBXQ-1; Mon, 01 Mar 2021 11:28:12 -0500
X-MC-Unique: ietnFDv_OcK4uD2piHTBXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B8FBCC629;
 Mon,  1 Mar 2021 16:28:11 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-254.ams2.redhat.com
 [10.36.114.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA3C419712;
 Mon,  1 Mar 2021 16:28:05 +0000 (UTC)
Subject: Re: [PATCH 1/2] i386/acpi: fix inconsistent QEMU/OVMF device paths
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20200730155755.188845-1-mst@redhat.com>
 <5b40e1ac-03ca-7954-4d50-f5f96c339772@proxmox.com>
 <20210228154208-mutt-send-email-mst@kernel.org>
 <20210301142819.66b94a4e@redhat.com>
 <20210301111254-mutt-send-email-mst@kernel.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <14c5dafe-ac7c-d1c9-ba51-325a3a0252a7@redhat.com>
Date: Mon, 1 Mar 2021 17:28:05 +0100
MIME-Version: 1.0
In-Reply-To: <20210301111254-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Stefan Reiter <s.reiter@proxmox.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 vit9696 <vit9696@protonmail.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/01/21 17:14, Michael S. Tsirkin wrote:
> On Mon, Mar 01, 2021 at 02:28:19PM +0100, Igor Mammedov wrote:

>> How about:
>>  * buggy ACPI for 5.1 machine types and older
>>  * fixed ACPI for 5.2 and newer?
> 
> Exactly.

Sounds OK to me as well (even though it's quite unfortunate that this is
one of those exceptions that require us to version the ACPI generator).

Thanks
Laszlo


