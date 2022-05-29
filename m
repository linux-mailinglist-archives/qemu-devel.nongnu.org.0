Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AC453716C
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 16:54:19 +0200 (CEST)
Received: from localhost ([::1]:39348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvKJ8-0001pZ-3P
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 10:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvKI7-00019M-Ga
 for qemu-devel@nongnu.org; Sun, 29 May 2022 10:53:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvKI4-0004cR-C1
 for qemu-devel@nongnu.org; Sun, 29 May 2022 10:53:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653835990;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=aHw0WHUDjplHhyM2x7z49ozQEApYFi2qNDHdSE7wkJ4=;
 b=h4CXS4z/hE9EEi14r/Oc3YhA8NQKX7Qu4LdxA+KlvdKTfbvvlmoGiLhqYdvm7ztwbK8vsj
 UJQXygeupTZd+8Pdk4eGo1o8JdHJpYa0FUR4d26AVLmObA7VoxzHEKYNFEhPX0iezSW/oF
 FRNjGRmrHqGqS2ckBge9zTUliyYZeUk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-szzgwXONNMiBxtsG1nxzsw-1; Sun, 29 May 2022 10:53:09 -0400
X-MC-Unique: szzgwXONNMiBxtsG1nxzsw-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg13-20020a05600c3c8d00b003974d0ff917so5521620wmb.3
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 07:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:user-agent:reply-to:date
 :message-id:mime-version;
 bh=aHw0WHUDjplHhyM2x7z49ozQEApYFi2qNDHdSE7wkJ4=;
 b=OF8CPIuyrn41WinWHQMr+AxRX+GxIPy12kPR40bAFKSEMoLTw4LHEf+xOumzUncMW0
 Uv0a5sygxqYTVOvi7jFAu8Yux0p+gHlyTq9uRmhRPkuXVJfW2pr0t/vkEhSpZ+M+lrGm
 FRLV1Ukx0CdUM+a3gbde546xd4VB2VF7xk1zwsDsrGCVA89esaESwok42Dz3dzqpUwBB
 WivHYQk16Jkm6LB2ZmviOA/VcwV4ADlrv+evMU8SsPgCvnMAPR8ynGfouZZrcOJosh84
 5CCfNUhLFPcULS1pGzp9aJp7Lc9rMrD9fYZH39YjD0WhcGVTxaT3iAbB0aUYEOi3d4Uf
 gLww==
X-Gm-Message-State: AOAM533izxtu7pa4iZXEvXnGY+HIv5bTrRZt2p6+6+BEIoDGLjqDurU5
 03SX0w15jWpCLgeJCGyXg+VDmJZ7g9aNozFAph40rha7Y0x2uRxWpzLS26v7OydRfL48pF+NGWD
 H+ZwECQuOpqx8BMQ=
X-Received: by 2002:a5d:59ae:0:b0:20f:d007:be25 with SMTP id
 p14-20020a5d59ae000000b0020fd007be25mr30091470wrr.336.1653835987998; 
 Sun, 29 May 2022 07:53:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJHLa5IQXJOpjPT3PaFLOeAKuYrTO/3jsZLnuHRK8spE53SE7hxPZhAcvED7dDPT87NfAYnQ==
X-Received: by 2002:a5d:59ae:0:b0:20f:d007:be25 with SMTP id
 p14-20020a5d59ae000000b0020fd007be25mr30091451wrr.336.1653835987759; 
 Sun, 29 May 2022 07:53:07 -0700 (PDT)
Received: from localhost (static-110-87-86-188.ipcom.comunitel.net.
 [188.86.87.110]) by smtp.gmail.com with ESMTPSA id
 l1-20020a5d6d81000000b0020e63ab5d78sm6568872wrs.26.2022.05.29.07.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 07:53:07 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: KVM call for 2022-05-31
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Sun, 29 May 2022 16:53:06 +0200
Message-ID: <87v8toxuel.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Please, send any topic that you are interested in covering.

At the end of Monday I will send an email with the agenda or the
cancellation of the call, so hurry up.

After discussions on the QEMU Summit, we are going to have always open a
KVM call where you can add topics.

 Call details:

By popular demand, a google calendar public entry with it

  https://www.google.com/calendar/embed?src=dG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ

(Let me know if you have any problems with the calendar entry.  I just
gave up about getting right at the same time CEST, CET, EDT and DST).

If you need phone number details,  contact me privately

Thanks, Juan.


