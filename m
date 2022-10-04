Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718295F40B1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 12:21:43 +0200 (CEST)
Received: from localhost ([::1]:53092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1off3W-0004DO-DI
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 06:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1off16-0000sn-P4
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:19:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1off0w-0001DG-GV
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664878742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sqrfX0TgWILJIiENmB15OBjvH/Ska7zU43OnzRtuTTE=;
 b=Bs61CShpmPvfzq5sdM0bfXUDKn5+dPxNG9S5Cb8iyM/xRgC5LsEaZP8T/NhTZXBSmQtEBF
 sYuaPbk3IxDUmFVpcPlUTVgIXwBxobRhjjzR37r6TRBk8/be4+Bps9Or95bqiow9hdzY2V
 FkM7U3bk6KS7QuBp2oFaxsKjYj3vVbg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-jlo2J32rPCSxl9rsBnxm9w-1; Tue, 04 Oct 2022 06:18:58 -0400
X-MC-Unique: jlo2J32rPCSxl9rsBnxm9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64C1C1C05144;
 Tue,  4 Oct 2022 10:18:58 +0000 (UTC)
Received: from localhost (unknown [10.39.193.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15C632027061;
 Tue,  4 Oct 2022 10:18:57 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v4 3/6] hw/arm/virt: Introduce variable region_base in
 virt_set_high_memmap()
In-Reply-To: <20221004002627.59172-4-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20221004002627.59172-1-gshan@redhat.com>
 <20221004002627.59172-4-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 04 Oct 2022 12:18:56 +0200
Message-ID: <87h70joprj.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Oct 04 2022, Gavin Shan <gshan@redhat.com> wrote:

> This introduces variable 'region_base' for the base address of the
> specific high memory region. It's the preparatory work to optimize
> high memory region address assignment.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


