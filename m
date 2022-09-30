Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED5F5F0EBB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 17:23:34 +0200 (CEST)
Received: from localhost ([::1]:43492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeHrR-0007eg-Qn
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 11:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeHla-0002jF-3J
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:17:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeHlW-0007BQ-Vj
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:17:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664551044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cyowAirPuNzj+ALZtfpz6WhGBRLOJ1VymIuV+uxwhNQ=;
 b=iMcfakdHqH8IujNtggjxjx7jkcPbcGow2grLyEaj1jC6drbmhlK88jp/jaIBWUYF1Hylo7
 aQszNufA9ctGsvBuHJ5e+8qIa7Fs3PUKHa4hHErTSwNy7d+8KW3D3ea4qTtzqolOuOTnnZ
 zdcW2Li6OkUM9WuEVsYU+nwFwrar8hQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-Cam9vVyjMp2Kp0aPK7ms7Q-1; Fri, 30 Sep 2022 11:17:21 -0400
X-MC-Unique: Cam9vVyjMp2Kp0aPK7ms7Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 112753817975;
 Fri, 30 Sep 2022 15:17:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F18282166B26;
 Fri, 30 Sep 2022 15:17:19 +0000 (UTC)
Date: Fri, 30 Sep 2022 17:17:18 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Lev Kujawski <lkujaw@member.fsf.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 1/7] piix_ide_reset: Use pci_set_* functions instead
 of direct access
Message-ID: <YzcIfokJyBmjji+D@redhat.com>
References: <20220707031140.158958-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707031140.158958-1-lkujaw@member.fsf.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Am 07.07.2022 um 05:11 hat Lev Kujawski geschrieben:
> Eliminate the remaining TODOs in hw/ide/piix.c by:
> * Using pci_set_{size} functions to write the PIIX PCI configuration
>   space instead of manipulating it directly as an array; and
> * Documenting the default register values by reference to the
>   controlling specification.
> 
> Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>

Thanks, dropped patches 5 and 6 because I see that you have posted a
newer version of them, and applied the rest to the block branch.

Kevin


