Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5D86796D9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 12:43:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKHgV-0001VI-BO; Tue, 24 Jan 2023 06:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pKHgT-0001VA-4a
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 06:41:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pKHgR-0007Oj-CL
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 06:41:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674560505;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=+2NFEF7IRIXzVpiGFFgag93HDumbpr+DQPbZrpSfuYk=;
 b=JvWD0TERJEVzogQyTPfwIrpn08MPJSnt2AzJVhucZtZxXFTbQkmV2O5LM0wBh2IVCjPKP1
 ifyeSRRG0+a+QB9dWuoff4B5oBZFwdbHDP1ptpphbOYgmb8S6Qua7lpCAnhw3QEgrSKvUb
 YfiAIj4xlvpGg0PnvQKGFmfS+xVnDLk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-597-AX2sRJOKNeGlSxd9jaTj2A-1; Tue, 24 Jan 2023 06:41:42 -0500
X-MC-Unique: AX2sRJOKNeGlSxd9jaTj2A-1
Received: by mail-wr1-f70.google.com with SMTP id
 k18-20020adfb352000000b002bdd0a7a2b5so2530243wrd.0
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 03:41:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+2NFEF7IRIXzVpiGFFgag93HDumbpr+DQPbZrpSfuYk=;
 b=sUOiLYsFeDNIKTiAv7Evu+A+VYZhkF4OzdKpBYvk8xoVYXmNV0tmnGLvcsCytRU3VW
 Cz8dBZ216Pz5c9Bl7xATWZlt17biRNNcPcesx/sSbPw1/ckn8DYauDxAxqacfaNGA7ez
 T8Z/kshlHPrGzfybqpOiIG6Ygr+WR4QccGYG1MfqNEPE4bOBm1GNlZW6bZFU1kxaUqAw
 wtoqePjDn18ysA6a4nNpE5awZ0pBx5FSGi3zaltwpEy5MAy+i7fV2r4q1EfZOSQkUbwd
 Ne9PTllUHnBugT5lDK3KSmyxVw5gUKcbqnBxPUf9HUtRpiD/LZy385dJlEMuSvAJpZ6T
 k2yw==
X-Gm-Message-State: AFqh2kry+CuO9bbW68HQiZfcYIKeRx7y1jKYFJU0GLOjtOcG8bXSMvvm
 O2bzcRC0EjUOc5phNxMTtO9Cc5pEW1Z8BxC1vk6Eq3dF4oBbhfdLyUp5J5MWJK92VXPU1j214EO
 k03IiIcBmmQatujY=
X-Received: by 2002:a5d:5c10:0:b0:2be:3ccd:7f33 with SMTP id
 cc16-20020a5d5c10000000b002be3ccd7f33mr20356115wrb.27.1674560500704; 
 Tue, 24 Jan 2023 03:41:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvGGtuLQf5OyAI7AkSDGbqG+sSRaqvFyvMgJzPwIxPdW0Wv+2hsmrkdKiqYekgAQ+bDdsh/tg==
X-Received: by 2002:a5d:5c10:0:b0:2be:3ccd:7f33 with SMTP id
 cc16-20020a5d5c10000000b002be3ccd7f33mr20356102wrb.27.1674560500497; 
 Tue, 24 Jan 2023 03:41:40 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 z8-20020a5d4408000000b002b8fe58d6desm1673525wrq.62.2023.01.24.03.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 03:41:39 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: Today KVM call meeting
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 24 Jan 2023 12:41:39 +0100
Message-ID: <878rhsgnws.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Hi

We are having today a call meeting, we are switching to jitsi as
discussed on the previous call.  The "coordinates" are:

Click the following link to join the meeting:
https://meet.jit.si/kvmcallmeeting

=====

Just want to dial in on your phone?

Dial-in: +1.512.647.1431 PIN: 1518845548#

Click this link to see the dial in phone numbers for this meeting
https://meet.jit.si/static/dialInInfo.html?room=kvmcallmeeting

 Call details:

By popular demand, a google calendar public entry with it

  https://calendar.google.com/calendar/event?action=TEMPLATE&tmeid=NWR0NWppODdqNXFyYzAwbzYza3RxN2dob3VfMjAyMjEwMThUMTMwMDAwWiBlZ2VkN2NraTA1bG11MXRuZ3ZrbDN0aGlkc0Bn&tmsrc=eged7cki05lmu1tngvkl3thids%40group.calendar.google.com&scp=ALL

(Let me know if you have any problems with the calendar entry.  I just
gave up about getting right at the same time CEST, CET, EDT and DST).

If you need phone number details,  contact me privately

Thanks, Juan.


