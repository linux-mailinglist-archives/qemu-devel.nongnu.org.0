Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE646417693
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:08:25 +0200 (CEST)
Received: from localhost ([::1]:51418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTlsG-0004kR-UA
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTlls-00046b-Hq
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:01:50 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTllq-00006u-SJ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:01:48 -0400
Received: by mail-wr1-x42b.google.com with SMTP id r23so2504929wra.6
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 07:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lMSbXjWzpcTd0cgiB7J9W78MVBZzIA1fk2Ux6yFF71c=;
 b=w+f2R/pBzTE32rGz4r8vB7vasYgaXGFXpOBdMi3cU0eHftsBqFfHZTtTvZslhtT6nk
 b2RPUQLA7vkBg21Uy27P04PZye7JSslfLI/ikyCSAmKhuZIVSYuuCHL36BZ8wRNI7B0a
 BiRNTYriL+BkIIBlmBedlzeuTTWDR4EBS5k6KUQh0l8EMlGZpJLdsa48HXEHq7UDrR3B
 1WUidZT0xo10Wx7AY8WimqfqKEFAUMkuGtuDPz+x5iOxQByEc5OtoZW3M8/PgliSGwXb
 JLQ+HCug2n7a759nV98z2Mftubs+7GQg4wvvpHm2W6d6KZUJ1AFzpj+gHkgzo52FiBH6
 au/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lMSbXjWzpcTd0cgiB7J9W78MVBZzIA1fk2Ux6yFF71c=;
 b=LehmE/vV70AywWQ5lnwsiw6Q/3ZPDqxXHpN0tLmXiw3fLLyyKG+jMx9/Xno9AOcAEs
 D1V7Z6cZA0H9AArUJfb1cJJvyyJF+nGyIx+MxazARnaHLOSDCS+Q4lStDVDFBIGmjjOV
 TrCbBtUHWyT4TbDTetbZCgirZ2p36vflX0hH6367qXCuRirsi9vSvIQDzbjRhIkO6SbV
 uFwdlSxfGmI6X1O12KG4pWYKL/OoIbeRUoyD2xkiwd2Ts1DJwRnch0xoQzEef7S7gFFd
 3GXr1H+c1ScElQVV9Cn6Q6Dgkb0fO6hHoxl+txsV8W0oeYhhCA2ThlbEvMUHfessRRPd
 piGw==
X-Gm-Message-State: AOAM533hizGvuxAnCd0KU1/Y5wsfM9TtuJseQoUCi1ZceQYf47+2V8My
 Qlp/Oso7+5TaWJ8iImFlhZY2yur6GXXiRA==
X-Google-Smtp-Source: ABdhPJy9sdzD89LXZanr2W6p/hqxlIt8piSk3cWJcmWNaGvDTLrrJjihPGHK+71oowb5q/g3k+8ptA==
X-Received: by 2002:a1c:f713:: with SMTP id v19mr2259024wmh.188.1632492104824; 
 Fri, 24 Sep 2021 07:01:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y64sm9292673wmc.38.2021.09.24.07.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 07:01:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] qapi: Move RTC_CHANGE back out of target schema
Date: Fri, 24 Sep 2021 15:01:40 +0100
Message-Id: <20210924140142.31398-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset moves RTC_CHANGE back to misc.json, effectively
reverting commit 183e4281a30962, which moved the RTC_CHANGE event to
the target schema.  That change was an attempt to make the event
target-specific to improve introspection, but the event isn't really
target-specific: it's machine or device specific.  Putting RTC_CHANGE
in the target schema with an ifdef list reduces maintainability (by
adding an if: list with a long list of targets that needs to be
manually updated as architectures are added or removed or as new
devices gain the RTC_CHANGE functionality) and increases compile time
(by preventing RTC devices which emit the event from being "compile
once" rather than "compile once per target", because
qapi-events-misc-target.h uses TARGET_* ifdefs, which are poisoned in
"compile once" files.)

Patch 2 fixes a minor documentation issue that I noticed while
I was doing this -- we didn't document that the units used in
the RTC_CHANGE event are seconds.

thanks
-- PMM

Peter Maydell (2):
  qapi: Move RTC_CHANGE back out of target schema
  qapi: Document the units for the offset argument to RTC_CHANGE

 qapi/misc-target.json | 33 ---------------------------------
 qapi/misc.json        | 22 ++++++++++++++++++++++
 hw/ppc/spapr_rtc.c    |  2 +-
 hw/rtc/mc146818rtc.c  |  2 +-
 4 files changed, 24 insertions(+), 35 deletions(-)

-- 
2.20.1


