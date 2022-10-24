Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEDB60B483
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 19:49:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on1ZR-0005sH-D6; Mon, 24 Oct 2022 13:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1on1ZM-0005l4-Tu
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 13:49:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1on1ZL-0008Pz-23
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 13:49:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666633735;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type: content-transfer-encoding:content-transfer-encoding;
 bh=E8U2lwzte2ArrE93NNq5YpgdgKlqmYf52lAguACgFO8=;
 b=aRAsLjTNaJGEVf6oghdlTI4QjUtlHUJsaFGibeOVV/NuNSbAuez8K3sWCiDMD9MgHSPQrQ
 zh105NtoMMnnUdZJ7rZ7g0N813tzYUKxsOW75j6OhsiSVWAwgsXeUJiieBMErk+dg/ZG/Z
 w64LwNhllFYFPBHFns4lwzSvdzEqB64=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-JFwL5aSrNkCcfFYye4Yvkg-1; Mon, 24 Oct 2022 13:48:53 -0400
X-MC-Unique: JFwL5aSrNkCcfFYye4Yvkg-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay12-20020a05600c1e0c00b003c6e18d9aa8so7800840wmb.8
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 10:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:subject:to:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=E8U2lwzte2ArrE93NNq5YpgdgKlqmYf52lAguACgFO8=;
 b=RNO0K5kVndEELEXmXpp1sGYxA5lGxYOTVErCulLDZ8EDkfXoOnt/rYEFmA1roJO+y3
 j96T8QoJFW2NilML5KdhBZtpKyXzlT/5rGluF3S+uz5MGqy0AzMJjVK6BsLYwS3Owfcm
 ZIu5QrRzphG6oZsQ4mzYbZu5CIfrI2Qaxw54JP4EHze9KTrif2MpDqXlYgLUfPQa56Zf
 nGnR/UA01vKVdUErVpdzFdYNpN+Us+WVmiQBzSKGwQw8CNXXaTXMv/Wwud2cnknkHNON
 My3ru+wfy9JT46DCIj05U5aFAYzyQaIonEplzBRHyd/wEby7N7B2RybfLQFsHUXvZ/A5
 PNEA==
X-Gm-Message-State: ACrzQf3ff5mQeYl7cFJ3dJ89/nKVp8XkwmBwAieWaQsAMpwZvPIdjMu4
 NbK2mCO/rIdV9+m1MxeBMJJW4It4nMiHnzy7re/3Ndt9Z32LlUbq86Q9OvbHj+vis+77TJSzpaJ
 UsE+p94WNuyPLdg8=
X-Received: by 2002:a05:600c:1616:b0:3cd:f079:e34a with SMTP id
 m22-20020a05600c161600b003cdf079e34amr5691051wmn.11.1666633732743; 
 Mon, 24 Oct 2022 10:48:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6VUFD1ubAUWM5rvcmZeECVQ2fG/57AQF6qClJnt6APdhHCkm5ct9f3+wtxhJ2SYgP5uKxaVw==
X-Received: by 2002:a05:600c:1616:b0:3cd:f079:e34a with SMTP id
 m22-20020a05600c161600b003cdf079e34amr5691041wmn.11.1666633732548; 
 Mon, 24 Oct 2022 10:48:52 -0700 (PDT)
Received: from localhost (static-28-206-230-77.ipcom.comunitel.net.
 [77.230.206.28]) by smtp.gmail.com with ESMTPSA id
 e12-20020adfdbcc000000b002258235bda3sm246170wrj.61.2022.10.24.10.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 10:48:38 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org, Adam Williamson
 <awilliam@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Subject: (Extra) KVM call for 2022-10-25
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 24 Oct 2022 19:48:29 +0200
Message-ID: <87a65l9kpe.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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

As discussed on last week KVM call, we repeate this Tuesday to
continue talking about vfio migration. So far we need to discuss:

- My RFC series, if they are enough for vfio devices (i.e. they are able
  to get a cheap call to calculate the size of the device state)

- My (not yet s ent) way of sending data through new channels. I lost
  the calendar entry for all calls during this years.

KVM developers conference call
Tuesday 2022-10-25 =E2=8B=85 15:00 =E2=80=93 16:00 Central European Time - =
Madrid

Location: http://bluejeans.com/quintela

If you need call details or want to be on the calendar entry, please contac=
t me: quintela@redhat.com

url:
https://calendar.google.com/calendar/event?action=3DTEMPLATE&tmeid=3DNWpzcz=
hmMThzY29tNDJwY3I3dmEzbzE3cjcgZWdlZDdja2kwNWxtdTF0bmd2a2wzdGhpZHNAZw&tmsrc=
=3Deged7cki05lmu1tngvkl3thids%40group.calendar.google.com

Later, Juan.

PD. The conference is on: https://bluejeans.com/quintela google calendar
decides that it is a good idea to add a google link entry by
default. I think that I removed it this time (who knows).

PD2: The entry should be public, if you can't access, just let me know
     to figure it out what is going on.

PD3: No, I have no clue how to convince google calendar to let someone
     that is not logged somehow on gmail to show the entry.  I tried to
     put it public everywhere.


