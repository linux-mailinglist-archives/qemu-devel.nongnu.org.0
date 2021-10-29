Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2058B44015B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:39:13 +0200 (CEST)
Received: from localhost ([::1]:36040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVqS-0006l9-3O
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mgVON-0006gj-UU
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:10:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mgVOJ-0002wd-JH
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:10:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635527405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3htYhkj2rn4CBUaENG2bkbo4znsC+kjKwumMADKc51o=;
 b=KwAI56Nw49ttbEWz2HQMVBprI+rfrVENyjZv3wo4WR5LxP0TYbPMwFc55OmGl7ZmgoeYBG
 7F597Mx41KsXLBw3KiQ913XLJvjyIszYk5yqbveWmt941qh8eBVx+qYQzV7wEQescilPKH
 pesQ5F1PqSzZwxFdbkhrWeSxLC+fr00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-YI9qM3H3NnCZRZFgSTZeWw-1; Fri, 29 Oct 2021 13:10:02 -0400
X-MC-Unique: YI9qM3H3NnCZRZFgSTZeWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EFD58030AF;
 Fri, 29 Oct 2021 17:09:59 +0000 (UTC)
Received: from localhost (unused-10-15-17-6.yyz.redhat.com [10.15.17.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8ECF1045E98;
 Fri, 29 Oct 2021 17:09:57 +0000 (UTC)
Date: Fri, 29 Oct 2021 13:09:57 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/4] hw/core: Restrict qdev-hotplug to sysemu
Message-ID: <20211029170957.urmtp5frbjyvb345@habkost.net>
References: <20211028150521.1973821-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211028150521.1973821-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ehabkost@redhat.com;
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 28, 2021 at 05:05:17PM +0200, Philippe Mathieu-Daudé wrote:
> Restrict various hw/core/ files to sysemu,
> add stubs for qdev-hotplug.
> 
> Philippe Mathieu-Daudé (4):
>   hw/core: Restrict sysemu specific files
>   hw/core: Declare meson source set
>   hw/core: Extract hotplug-related functions to qdev-hotplug.c
>   hw/core: Restrict hotplug to system emulation

Acked-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


