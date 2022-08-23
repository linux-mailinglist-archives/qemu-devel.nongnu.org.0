Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC6D59E635
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 17:42:28 +0200 (CEST)
Received: from localhost ([::1]:53596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQW2t-0002x6-Rb
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 11:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oQVnf-00036A-8x
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:26:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oQVnb-0000bJ-5e
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661268397;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=QjnX3wmdIgtFpI8ynDv7BiTpKz9FZ9aszLAG9oIJvIo=;
 b=YJgXLqkEnMUE6QWT98f5E3BZcPBdiXH7Zqp+LZ0bX/6xuSIs4178E0z7rBM46nsF6dHpBM
 ls7AzcyEBCrGZUHWtWvGuFpjTxYX9bNxEwgcMqL2MIhN3hvjU7uMewdPayCDYuclp/oVDW
 fpvIODydMzRMV/MmQWeyRmpe5ZQZNVE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-hYsNG_A6OKmn6uo-QLWpGg-1; Tue, 23 Aug 2022 11:26:36 -0400
X-MC-Unique: hYsNG_A6OKmn6uo-QLWpGg-1
Received: by mail-wr1-f69.google.com with SMTP id
 q7-20020adfab07000000b0022541376ef7so1618181wrc.23
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 08:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:subject:to:from
 :x-gm-message-state:from:to:cc;
 bh=QjnX3wmdIgtFpI8ynDv7BiTpKz9FZ9aszLAG9oIJvIo=;
 b=FIwhZFDQUhg3dA56dyA4IItLxKD5c5B4PSMBcLxuAgxaeCKiw/gBmhroVEBSLmzP5q
 E7DQS1okvP7lnHmJ7oJsLrCkHRCaQBuQ9u8ixUWVRKPLuJrAp8QB528f4RRDh0bb5Vz1
 0Y+Uj5v/gVzntD33Mg7ENzAAU75+Xrw1k3sTM34MadkVU5PlDiXDV5i+mdmHwckrnTum
 4BT5A12JjyM3TRq7qv8aol7zoMLI8mqrLU07R4OUzcR6TOHV6TSWjdRJwc5dH2oREyUK
 QUb6shD0ojGAB7Hmkp2+A+DBLzmuar9HffhjRWzm+fsgb2j6OSEBb356ObmLg+iXuAK7
 hmBg==
X-Gm-Message-State: ACgBeo1vzFfm7Rx5TW2lI0ucKWbBinrel3lqNpcax8VIG/NcGMCJZZT1
 NLD6DEIxKRUQPsaqKmY6d8CRasgTc4sWAunwdnwm6BhbutMprbLsnxdqz/IeIJZi0zuCb43mXZ6
 v0E+IWxiGhkYV1+s=
X-Received: by 2002:adf:f7ca:0:b0:225:2df0:d23 with SMTP id
 a10-20020adff7ca000000b002252df00d23mr13921775wrq.255.1661268395325; 
 Tue, 23 Aug 2022 08:26:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5LbOMosWu9JXp9iYzCDUIlrDKYbksxcBIGQrZXfwxkXWdWKnDVHPQ8hSH6vYNwbUrBtxfQuQ==
X-Received: by 2002:adf:f7ca:0:b0:225:2df0:d23 with SMTP id
 a10-20020adff7ca000000b002252df00d23mr13921762wrq.255.1661268395098; 
 Tue, 23 Aug 2022 08:26:35 -0700 (PDT)
Received: from localhost (static-205-204-7-89.ipcom.comunitel.net.
 [89.7.204.205]) by smtp.gmail.com with ESMTPSA id
 v18-20020adfedd2000000b0021e6277bc50sm17289565wro.36.2022.08.23.08.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 08:26:34 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: KVM call for agenda for 2022-09-06
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Tue, 23 Aug 2022 17:26:33 +0200
Message-ID: <87czcryo9i.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Hi

First of all, I am adding

Please, send any topic that you are interested in covering.

At the end of Monday I will send an email with the agenda or the
cancellation of the call, so hurry up.

After discussions on the QEMU Summit, we are going to have always open a
KVM call where you can add topics.

 Call details:

By popular demand, a google calendar public entry with it

  https://calendar.google.com/calendar/u/0/r/eventedit/copy/NWR0NWppODdqNXFyYzAwbzYza3RxN2dob3VfMjAyMjA4MjNUMTMwMDAwWiBlZ2VkN2NraTA1bG11MXRuZ3ZrbDN0aGlkc0Bn/cXVpbnRlbGFAcmVkaGF0LmNvbQ?scp=ALL&sf=true

  (I updated the entry, I *think* that now everybody can see it, if you
  can't please let me know.)

If you need phone number details,  contact me privately

Thanks, Juan.


