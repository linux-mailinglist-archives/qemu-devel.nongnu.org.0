Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E942161176D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:22:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooS73-00015Q-Ss; Fri, 28 Oct 2022 12:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ooS71-000145-1v
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 12:21:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ooS6y-0001HD-0e
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 12:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666974095;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=h1IpVPQmelOzExrKI7Q1wX5nVXwi3nwXWMr9RzFeuk8=;
 b=C08SUtgeYs4h2vIuXEr/swgpgflZJDLP6lQ0jorPvOqqw3zG/ex1H5ELYtELVPdi6AgQXP
 /L0JS58PeeL+ivhNhKEL6SFviOC5DeVlrHRpBA0dC+P1jpwCm37/DBUyptUDMMo1PfQA3x
 X5pAIdmpbzyllmZQaO71mEAwv01mvLY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-136-MSvnrDSLPCuKH_6s-xyKHw-1; Fri, 28 Oct 2022 12:21:34 -0400
X-MC-Unique: MSvnrDSLPCuKH_6s-xyKHw-1
Received: by mail-wm1-f70.google.com with SMTP id
 v125-20020a1cac83000000b003bd44dc5242so4682981wme.7
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 09:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h1IpVPQmelOzExrKI7Q1wX5nVXwi3nwXWMr9RzFeuk8=;
 b=T6Mvzk2CXivysRkwiafitoOjs6KjuTlPEf2Y862LJZGJx/3a+dAq2CrykpHwGJHd30
 ocHPxnoE2AARkotfzNQCBdKEULEreZJp8lIciVgRh+vZ1Hu6/4K01IyZlkwhzVBowkmz
 dxw5YNp1k7x9LhVv+NdSviH95bbyazZqC4GsZ87hrGrnSYSqvbelfaXR1tIaZ2PTgn8B
 67B4CTuNqJzKJ1GUfKhvfplLflPq+pQFWoZ4JylHVU8wuAFyepYtSkJl6MfHPNaaTt/1
 ymBorMX4I6VjOhqINdprET7xeQwp2kzyzGLFO4i0QzEHMi9Kq7oXagtEYVS6vGyGYQrF
 0Phw==
X-Gm-Message-State: ACrzQf2MAphNkw6x+pzfwl7qKo6ixyYfYyvG/0wdU3RqLpzgNAFZHTt2
 NXeFykKFTIYX/VJz/U1sjsSUccNHYhMJQgwjrNaMgWZPUoIIJlsKoROvAEW3jQJY7NEKJ+3y+KA
 3ABgYOVa7RKJvFIlY7v+PLqUft8xL5tBuj81+MJuuXkoeVmPu9yCXQ8pW4Fy9JJuLWQU=
X-Received: by 2002:a7b:c005:0:b0:3c3:6b2a:33bf with SMTP id
 c5-20020a7bc005000000b003c36b2a33bfmr7405wmb.167.1666974092711; 
 Fri, 28 Oct 2022 09:21:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6U7D4L8Uoj4SveCT/kQkA8Mofy7/aenWFmFnzzO06Zx6XcWrChzydAcomOrPbEdUl7ESv3JQ==
X-Received: by 2002:a7b:c005:0:b0:3c3:6b2a:33bf with SMTP id
 c5-20020a7bc005000000b003c36b2a33bfmr7383wmb.167.1666974092277; 
 Fri, 28 Oct 2022 09:21:32 -0700 (PDT)
Received: from localhost (255.4.26.77.dynamic.reverse-mundo-r.com.
 [77.26.4.255]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b002206203ed3dsm4030546wrq.29.2022.10.28.09.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:21:31 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org, kvm-devel <kvm@vger.kernel.org>
Subject: KVM call for agenda for 2022-11-01
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Fri, 28 Oct 2022 18:21:31 +0200
Message-ID: <87tu3nvrzo.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Reply-To: quintela@redhat.com
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Hi

Please, send any topic that you are interested in covering.

At the end of Monday I will send an email with the agenda or the
cancellation of the call, so hurry up.

Call details: By popular demand, a google
calendar public entry with it:

https://www.google.com/url?q=https://calendar.google.com/calendar/event?action%3DTEMPLATE%26tmeid%3DNWR0NWppODdqNXFyYzAwbzYza3RxN2dob3VfMjAyMjExMDFUMTMwMDAwWiBlZ2VkN2NraTA1bG11MXRuZ3ZrbDN0aGlkc0Bn%26tmsrc%3Deged7cki05lmu1tngvkl3thids%2540group.calendar.google.com%26scp%3DALL&sa=D&source=calendar&ust=1667405630835374&usg=AOvVaw3LYcQS3PjgGMlWJ-anZdRM

(Let me know if you have any problems with the calendar entry. I just
gave up about getting right at the same time CEST, CET, EDT and
DST).

If you contact details, contact me privately

Thanks, Juan.

PD. I am trying to setup this calendar entry again. If you are
    interested to be in the invite, please send your information to
    me. I added all the people that I had for the previous invite, but
    probably there are still people left.


