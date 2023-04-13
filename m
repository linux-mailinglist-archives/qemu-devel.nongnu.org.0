Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867726E162A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 22:56:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn3yb-0000NZ-Iu; Thu, 13 Apr 2023 16:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pn3yY-0000NC-D9
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 16:55:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pn3yE-0001BX-9P
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 16:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681419303;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qyFTmv8B9Q2ZebQ5VyUiyE3lYybh2qt9vq9LjX5mk08=;
 b=Pddnnb2uXx2l8BiOqizChOwsFh1t+hRd0Y0ycDFK8UrKXjQ/OfLjcuH2E1nJS+oDE1i+wU
 2pxen4OVlRkLoNUpX3chxctTJE+GpWwvDIKS7Z5K0o2ufzQ0Z8aJt5F5KhQN6YrnB6xpYd
 AJ2Hx/VZZh85iJHaGwcveh4JX9681f8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-hmwRKRjIO7CBTzuOcF3plQ-1; Thu, 13 Apr 2023 16:55:01 -0400
X-MC-Unique: hmwRKRjIO7CBTzuOcF3plQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 fm19-20020a05600c0c1300b003f0a9e986bcso650228wmb.1
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 13:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681419300; x=1684011300;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qyFTmv8B9Q2ZebQ5VyUiyE3lYybh2qt9vq9LjX5mk08=;
 b=GpUHJhHOye+ulzxFO8c8St+3KtwfTHEkSqw1w6SPETQ2Ol2LThBhFEriySljkG0MWn
 QZBHeHvF8ofSZXTlVkslP3itYjTHX3ZLnCUToUXI2eLxYynzanPPwfhqLX+Icc0iSn7R
 C3p4MKzxRw0dw5RPFt9ZAinUXXG5YqVb+IdvhEugwctNtSDcJ2rslOWHhZVxJR7Yrqwz
 7X/pEG9rO2p0vnHL6JKzp0SycEVqVJj/gJG+Ncgyb4nVqp+SIVLI7DHWW7kKXdtDJRQW
 BJXz7BORFAKqnveDNvbWsC7sHDT02sRUoAAQbZJWoWK4e0HA2p8bY2YxYrKdp95Q2kIr
 M/SQ==
X-Gm-Message-State: AAQBX9dRMTOfkv7fMxYK3et7aSLa5QuCOuYZVn60hd47JaIM1mRj9Abx
 gu4YwWiV23jjS89Fst/ZOs0paNOHejJLUbN8OBDRJ5HKr6+8tA2Fzvt6HAC1sUwnVN3LtS03LTB
 qA1ibt3PIJB8soYU=
X-Received: by 2002:a1c:cc05:0:b0:3ef:d8c6:4bc0 with SMTP id
 h5-20020a1ccc05000000b003efd8c64bc0mr2699311wmb.40.1681419300317; 
 Thu, 13 Apr 2023 13:55:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zo143EWZNQSrlA5zw2mZ1NxT1Cye6rNp2MzadTtPGAPSIW66kV+mrpkv/u1nWRc+xOpHIqKQ==
X-Received: by 2002:a1c:cc05:0:b0:3ef:d8c6:4bc0 with SMTP id
 h5-20020a1ccc05000000b003efd8c64bc0mr2699281wmb.40.1681419300048; 
 Thu, 13 Apr 2023 13:55:00 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 v3-20020a1cf703000000b003f04646838esm2707316wmh.39.2023.04.13.13.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 13:54:59 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: afaerber@suse.de, juan.quintela@gmail.com
Cc: ale@rev.ng,  anjo@rev.ng,  bazulay@redhat.com,  bbauman@redhat.com,
 chao.p.peng@linux.intel.com,  cjia@nvidia.com,  cw@f00f.org,
 david.edmondson@oracle.com,  Eric Northup <digitaleric@google.com>,
 dustin.kirkland@canonical.com,  eblake@redhat.com,
 edgar.iglesias@gmail.com,  elena.ufimtseva@oracle.com,
 eric.auger@redhat.com,  f4bug@amsat.org,  Felipe Franciosi
 <felipe.franciosi@nutanix.com>,  "iggy@theiggy.com" <iggy@kws1.com>,
 Warner Losh <wlosh@bsdimp.com>,  jan.kiszka@web.de,  jgg@nvidia.com,
 jidong.xiao@gmail.com,  jjherne@linux.vnet.ibm.com,
 joao.m.martins@oracle.com,  konrad.wilk@oracle.com,  kvm@vger.kernel.org,
 mburton@qti.qualcomm.com,  mdean@redhat.com,  mimu@linux.vnet.ibm.com,
 peter.maydell@linaro.org,  qemu-devel@nongnu.org,
 richard.henderson@linaro.org,  shameerali.kolothum.thodi@huawei.com,
 stefanha@gmail.com,  wei.w.wang@intel.com,  z.huo@139.com,
 zwu.kernel@gmail.com
Subject: Re: QEMU developers fortnightly conference call for agenda for
 2023-04-18
In-Reply-To: <calendar-8e6a5123-9421-4146-9451-985bdc6a55b9@google.com> (juan
 quintela's message of "Thu, 13 Apr 2023 20:52:45 +0000")
References: <calendar-8e6a5123-9421-4146-9451-985bdc6a55b9@google.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 13 Apr 2023 22:54:58 +0200
Message-ID: <87r0sn8pul.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Hi

Please, send any topic that you are interested in covering.

[google calendar is very, very bad to compose messages, but getting
everybody cc'd is very complicated otherwise]


At the end of Monday I will send an email with the agenda or the
cancellation of the call, so hurry up.

After discussions on the QEMU Summit, we are going to have always open a
QEMU call where you can add topics.

 Call details:

By popular demand, a google calendar public entry with it

  https://calendar.google.com/calendar/event?action=TEMPLATE&tmeid=NWR0NWppODdqNXFyYzAwbzYza3RxN2dob3VfMjAyMjEwMThUMTMwMDAwWiBlZ2VkN2NraTA1bG11MXRuZ3ZrbDN0aGlkc0Bn&tmsrc=eged7cki05lmu1tngvkl3thids%40group.calendar.google.com&scp=ALL

(Let me know if you have any problems with the calendar entry.  I just
gave up about getting right at the same time CEST, CET, EDT and DST).

If you want to be added to the invite, let me know.

Thanks, Juan.


