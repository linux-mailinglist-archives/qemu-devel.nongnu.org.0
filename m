Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BCAB8E6B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 12:23:02 +0200 (CEST)
Received: from localhost ([::1]:57434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBG45-0007bq-5A
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 06:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58698)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iBG2Y-0006TR-Rq
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 06:21:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iBG2X-0004p1-PZ
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 06:21:26 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38442)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iBG2X-0004oj-Ka
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 06:21:25 -0400
Received: by mail-wr1-x441.google.com with SMTP id l11so6179652wrx.5
 for <qemu-devel@nongnu.org>; Fri, 20 Sep 2019 03:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=2kt1zxq82W6y6A9RMuXxe96/M7CQYy0TYMscclSRYNE=;
 b=hdGy653MfgdE0EA6J1+ItuG6Qtd0fSjxqy/uoDMhkA8nVWzT3KyyKGCz8nBZuRHSZd
 ur0nOOBmzW3AxoKl6qF1R6GRkYNxQKt8u3ium+TaDhDHtcjjfURGaq+qMdG3mPvm1xVy
 qzeFhSB6pf5OBR+s3IO/bUJGI5fURuS+boWEd3tVMu3KbgOLzvYQ/TqL5EOlrPEnWDwN
 kbknMxA2B9qX61clIUn0hsu2zo9kZPjWSzh8m1zAiZtkTDSlaXJtot90OFs5xvVY9Wa4
 vGR3IhNE3oZFVtCSkRTazda3FQfY+XCSLPHirOZpfgBdg5iYkYer2fGk3cxyAjruRhbe
 Reug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=2kt1zxq82W6y6A9RMuXxe96/M7CQYy0TYMscclSRYNE=;
 b=YhtCgaxbFTogHyXg7nGh+SvM17/MYCBxFPaOzkyUl+BdvGWkhaBb9XOlkYEFdm2FW0
 pP50d2tvkdDeK7MVuK1RNFBoobPkr72oL5nV1YkyCHEBpxVXYOz5znQbx9JM7squWO5q
 vWPO+YOzuqb2NHCeMlo3qeT9CBg/8FzpS8istUEUT0eb9pMxoOEm7tSQ5VO/fk8+Y5Kn
 yIp6g9KAQRlK2sy7hH3TlmEom1l4M3XMh1Rog2q2YKwVwAkjfTQhE22F+nOAYgUeJdkx
 DKTdS3AjdmEvAH04Ue60x6CepLxvUXS2f1eZJ7AwDObpYk/Yf6trRFtolCuTMxH4KXrK
 VZ3A==
X-Gm-Message-State: APjAAAW6Ch2M4SOcJlcgg7sNv1Y4SovBUctZZME5SvaFjUQ9UnM6iCH0
 Yf9vZdc0ubeq91/Zp3L8HqOH6pu8
X-Google-Smtp-Source: APXvYqwVy4jD78dcqjmf6gDDDTuJWTkE5kasDLc41mG+yPf2Aq/8mjcgTDVT6XYUmnEsdn0OTsRV1A==
X-Received: by 2002:adf:db06:: with SMTP id s6mr8664275wri.41.1568974884212;
 Fri, 20 Sep 2019 03:21:24 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id u10sm1331274wmm.0.2019.09.20.03.21.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Sep 2019 03:21:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] kvm: clear dirty bitmaps from all overlapping memslots
Date: Fri, 20 Sep 2019 12:21:20 +0200
Message-Id: <1568974882-7419-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: dgilbert@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A single ram_addr (representing a host-virtual address) could be aliased
to multiple guest physical addresses.  Since the KVM dirty page reporting
works on guest physical addresses, we need to clear all of the aliases
when a page is migrated, or there is a risk of losing writes to the
aliases that were not cleared.

Paolo

Paolo Bonzini (2):
  kvm: extract kvm_log_clear_one_slot
  kvm: clear dirty bitmaps from all overlapping memslots

 accel/kvm/kvm-all.c | 114 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 66 insertions(+), 48 deletions(-)

-- 
1.8.3.1


