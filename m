Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8461E1AD3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 07:52:43 +0200 (CEST)
Received: from localhost ([::1]:44946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdSW2-0006wH-R9
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 01:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdSVM-0006WH-3i
 for qemu-devel@nongnu.org; Tue, 26 May 2020 01:52:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21415
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdSVK-0005d5-OI
 for qemu-devel@nongnu.org; Tue, 26 May 2020 01:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590472317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TCixJM7tPAL2dPQW2SGhYQBk0YXHHxQ8hcvrxOH7do8=;
 b=Kp667os9EldmG/wVY/NAK4xtUwZCY7p/xvrdfdKANGFvVcTJ+TbnPsMoXizVzzjkLAA1kD
 +NhB2gkXtQfSqU6yAuZlBI9Rl+0RV4LfFn491YYMclyfXGfMA5QBBAD25yY00WpLwohCu9
 dajXUB4/kTJMtQULu9/8KBigTlncaVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-tJ-qSozEPWGq7JlXe7oZRg-1; Tue, 26 May 2020 01:51:13 -0400
X-MC-Unique: tJ-qSozEPWGq7JlXe7oZRg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBA658B429F;
 Tue, 26 May 2020 05:51:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E9815C1BB;
 Tue, 26 May 2020 05:51:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8AB2E1753B; Tue, 26 May 2020 07:51:10 +0200 (CEST)
Date: Tue, 26 May 2020 07:51:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH] audio/mixeng: fix clang 10+ warning
Message-ID: <20200526055110.xhqlolr4l6on2wya@sirius.home.kraxel.org>
References: <6231bee7-8d72-fe5c-9b73-cf27f57ff379@t-online.de>
 <20200523201712.23908-1-vr_qemu@t-online.de>
MIME-Version: 1.0
In-Reply-To: <20200523201712.23908-1-vr_qemu@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 01:51:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, May 23, 2020 at 10:17:12PM +0200, Volker Rümelin wrote:
> The code in CONV_NATURAL_FLOAT() and CLIP_NATURAL_FLOAT()
> seems to use the constant 2^31-0.5 to convert float to integer
> and back. But the float type lacks the required precision and
> the constant used for the conversion is 2^31. This is equiva-
> lent to a [-1.f, 1.f] <-> [INT32_MIN, INT32_MAX + 1] mapping.
> 
> This patch explicitly writes down the used constant. The
> compiler generated code doesn't change.
> 
> The constant 2^31 has an exact float representation and the
> clang 10 compiler stops complaining about an implicit int to
> float conversion with a changed value.
> 
> A few notes:
> - The conversion of 1.f to INT32_MAX + 1 doesn't overflow. The
>   type of the destination variable is int64_t.
> - At a later stage one of the clip_* functions in
>   audio/mixeng_template.h limits INT32_MAX + 1 to the integer
>   range.
> - The clip_natural_float_* functions in audio/mixeng.c convert
>   INT32_MAX and INT32_MAX + 1 to 1.f.
> 
> Buglink: https://bugs.launchpad.net/bugs/1878627
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>

Added to audio queue.

thanks,
  Gerd


