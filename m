Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543485FC2A6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 11:06:38 +0200 (CEST)
Received: from localhost ([::1]:47850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiXhE-0006T4-Cx
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 05:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oiXcf-0002IX-J1
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:01:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oiXca-0000Au-8K
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665565307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GskwvF+l9Jif65tRSXe09vmcCIM/AlXfZb2esdCJY88=;
 b=LEQhidMo4ejNlyt5GRmQSw+n7jiZAMAcVWZmTm/xQA5aSuqE+L3Ms+1QN0+VK3QSCP5KZa
 IRmILLXuEgDGC3T2TNaTrKgUz2NDvcHhvcKW9k/tLVeCQjNN20OE2m2zAf+I0c5AzqNyac
 KrZpYjEvpjB9omZa+qCI4DwbqVPb90w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-ziY_IB5BOaCjvaZ0pJuxSw-1; Wed, 12 Oct 2022 05:01:46 -0400
X-MC-Unique: ziY_IB5BOaCjvaZ0pJuxSw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B16A23806709;
 Wed, 12 Oct 2022 09:01:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 892D520182B3;
 Wed, 12 Oct 2022 09:01:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C18FA18003A8; Wed, 12 Oct 2022 11:01:43 +0200 (CEST)
Date: Wed, 12 Oct 2022 11:01:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: luzhipeng <luzhipeng@cestc.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH] cirrus_vga: fix potential memory overflow
Message-ID: <20221012090143.ra6edj6frfq6xivp@sirius.home.kraxel.org>
References: <20220929122352.1891-1-luzhipeng@cestc.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929122352.1891-1-luzhipeng@cestc.cn>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, Sep 29, 2022 at 08:23:52PM +0800, luzhipeng wrote:
> From: lu zhipeng <luzhipeng@cestc.cn>
> 
> Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>

> -                copy_count = s->cirrus_srcptr_end - end_ptr;
> +                copy_count = MIN(s->cirrus_srcptr_end - end_ptr, CIRRUS_BLTBUFSIZE);

Added to patch queue.

thanks,
  Gerd


