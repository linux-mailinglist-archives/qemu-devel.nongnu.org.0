Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7771E6C6FBE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 18:54:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfP8d-0006kG-7v; Thu, 23 Mar 2023 13:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pfP8X-0006hq-Ls
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 13:54:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pfP8V-0002fT-Nv
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 13:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679594040;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=AcVaKmUYfRPIzhOHIdyvhx4rya5cRTOl5IuLPMK0XRs=;
 b=YQ8MzKVQp9NfhL0Gdngztmx7Yh79Zz9SKgYoh63o3GQnABleRy8E8Zl1/7MLSCebuZz/Mg
 3VsdWgMpyh3miMXK30A3IU/cpeKg07m+n81usceSxK3n8ZqtWTCjWyVUr81Ya9AoDF3ECF
 q5XdFyORgXhszSin83IhLWWRZBildF0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-FauBXEaAMX6M13Q3nte0jg-1; Thu, 23 Mar 2023 13:53:58 -0400
X-MC-Unique: FauBXEaAMX6M13Q3nte0jg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o37-20020a05600c512500b003edd119ec9eso7242771wms.0
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 10:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679594037;
 h=mime-version:message-id:date:reply-to:user-agent:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AcVaKmUYfRPIzhOHIdyvhx4rya5cRTOl5IuLPMK0XRs=;
 b=mMTSKBWizw2BFeQZeuTYMmRHh5T4viOUMkak1/BA4xg/XUeONXJQVLw9s91sIG1408
 Iz+hB5z5pY9sluw4d0IbWFa4rILttsyTTHqCrmsKVByIOqux6YDIXX7KJ81YecO+xz5+
 bWutdiY8W9NHwJ5HWXlfhUKpUYYbO2U+2UlvW4fbejmteV2fF6fg1rBsgkTSCikZ6nCx
 AQ7UgAbh0ANQqmwMqJcQ37bsFYJgIbAWjMg2jXrXMpumpt2zcIG0ocGqTFIwzJbqwppI
 mdeFI9IX7UWFf9jq60nxGRrpSDmhZN+7oU86FfGJTToEOZ7A6uYz3wCZkQw+oFDsx2Mm
 vjyw==
X-Gm-Message-State: AO0yUKUUc2//RAvG6AgghGJdkSfC7fEbcN2i3BxbCL3mxem/OJqroLoV
 BSjaC9RtzvmBuxWuG8t9br9H1NwLAfKIJY05hBI0MsrGOKxrz8NcrKLhugDrGhD1oSJc03nHdcv
 cPrdGkMGrqPioPuQ=
X-Received: by 2002:a7b:cc98:0:b0:3eb:3945:d405 with SMTP id
 p24-20020a7bcc98000000b003eb3945d405mr334715wma.38.1679594037000; 
 Thu, 23 Mar 2023 10:53:57 -0700 (PDT)
X-Google-Smtp-Source: AK7set+/muTI6EHBcwKMzSGfpd6mGkNFf0hVFu3RXbKRQPHnNEQmVeuKo8kX4qewJldKEM1tQpW4DA==
X-Received: by 2002:a7b:cc98:0:b0:3eb:3945:d405 with SMTP id
 p24-20020a7bcc98000000b003eb3945d405mr334702wma.38.1679594036736; 
 Thu, 23 Mar 2023 10:53:56 -0700 (PDT)
Received: from redhat.com ([77.211.5.130]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05600c0b4b00b003edef091b17sm2510776wmr.37.2023.03.23.10.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 10:53:29 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>
Subject: QEMU fortnightly developers call for agenda for 2023-04-04
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 23 Mar 2023 18:53:14 +0100
Message-ID: <87cz4zmk1h.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Please, send any topic that you are interested in covering.

Topics on the backburner:
- qemu single binary
  On this week call, phillipe said that he wanted to discuss pci irqs
  and default devices?
- The future of icount
  My understanding is that Alex wanted to wait until the openning of 8.1
  to continue discussions/show code.

Anything else?

At the end of Monday I will send an email with the agenda or the
cancellation of the call, so hurry up.

After discussions on the QEMU Summit, we are going to have always open a
QEMU call where you can add topics.

 Call details:

By popular demand, a google calendar public entry with it

  https://calendar.google.com/calendar/event?action=TEMPLATE&tmeid=NWR0NWppODdqNXFyYzAwbzYza3RxN2dob3VfMjAyMjEwMThUMTMwMDAwWiBlZ2VkN2NraTA1bG11MXRuZ3ZrbDN0aGlkc0Bn&tmsrc=eged7cki05lmu1tngvkl3thids%40group.calendar.google.com&scp=ALL

(Let me know if you have any problems with the calendar entry.  I just
gave up about getting right at the same time CEST, CET, EDT and DST).

If you need phone number details,  contact me privately

Thanks, Juan.


