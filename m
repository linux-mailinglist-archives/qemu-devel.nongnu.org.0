Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520FE4ADFE5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:50:29 +0100 (CET)
Received: from localhost ([::1]:38758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUdH-0001fy-DY
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:50:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nHS3R-0005Wh-0Y
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:05:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nHS3J-0005U6-PL
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644332708;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=vKPPCFRmmcIf6NWOhQcqEjdqZT2VEGESWhQmL1Cfmks=;
 b=crSC0DeLy+gpSzVd/VgUH69fIpx8BkcSvuqETPS4rqIeKLkSmn0AlHtRvwEsXMEoV/m81Y
 zxrvYM7SW9SUUz4xzdB8ohDsdnTwwnJjPluP77jggfd0/023f+D0fp8lKeVK8pNsYjy0Hz
 V984+WmcpZ1viCLDpFl+uqUEMqEMsC4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-BjATb1fZMSaqrg-pfrjPtQ-1; Tue, 08 Feb 2022 10:05:06 -0500
X-MC-Unique: BjATb1fZMSaqrg-pfrjPtQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 7-20020a1c1907000000b003471d9bbe8dso245054wmz.0
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:05:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:user-agent:reply-to:date
 :message-id:mime-version;
 bh=vKPPCFRmmcIf6NWOhQcqEjdqZT2VEGESWhQmL1Cfmks=;
 b=3gY/E7QfiAxqP88/V4A9UWi7oEwmyxIDnkZM5e0IzYU/nTuD2/oksJXSb4ZsJ/kNi9
 ecAMTDlGUK1VvfRiUF9dZNIuYl4fz13wfNMuok3k9suzvpYL+GHXDtIRzfZMB2PL3wyA
 e2CiFYkVUqNPcigX8CepsB/dnUvABrHXppQPpLjZqzup3/nNZPNXY+JL3EiFMOu5/m56
 nJ/MSyEGtKUX0tlW7brCLdDPgwd8P8ATQ6/zAKANeqBIFzGdZW10i/zkqArg6tIByPX3
 6egHrx65e+A7xStn+kH/rR3mHBbIAMu3oJNzcDOXEs8GPD6szxVnl50Wbt7SRODCDVr/
 /Otg==
X-Gm-Message-State: AOAM531ZVeFTmt0ywDweExOqfy8BkYdmlEA25uTKXEvCXyrQDRkUvxYD
 8hJCj71Bl15YTFR4xUdGAvgRKRKQB9qDZLROeIh75uA7ybt+q1XOA+4TrqexBGvvMlitq9x6H0Z
 jFC42hznrmy4+Ekk=
X-Received: by 2002:adf:ee46:: with SMTP id w6mr3771893wro.451.1644332705493; 
 Tue, 08 Feb 2022 07:05:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeXGFqT/OAm+pEcv7Ihk1SCLekWypHtrByqRNPYLdX+s27Nc67BWakMrixmd8U6atIVjjzow==
X-Received: by 2002:adf:ee46:: with SMTP id w6mr3771880wro.451.1644332705305; 
 Tue, 08 Feb 2022 07:05:05 -0800 (PST)
Received: from localhost ([94.248.65.38])
 by smtp.gmail.com with ESMTPSA id z17sm2396671wml.38.2022.02.08.07.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 07:05:04 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: KVM call minutes for 2022-02-08
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 08 Feb 2022 16:05:03 +0100
Message-ID: <87fsot761s.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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



Minutes for 2022-02-08
----------------------

- Greensocs have patches to convert it as a library
  Are upstream intersted?

  Phillipe has some patches to allow to load architectures at runtime,
  so he only has one binary.

- Greensocs is finishing the patches to do the configuration
  They are rebasing

- Changes to startup to allow QMP to start sooner

  * Create a new binary to experiment
    Once something is done, we can decide what to do
  * Make QMP available the sooner possible
  * Copying the current one and remove stuff also takes too long
  * Markus started and posted an RFC
  * He asks to create a new binary
  * What should the new binary done
  * Idea is that we will do the minimal possible thing on the new
    binary, have it on parallel with current one, and we will decide
    later to/if remove the current one.

- Paolo will post patches that just create a binary than setup a qmp
  socket

- Markus will rebase its RFC on top of that

- Greensocks will post his series to convert QEMU into one library

- PhilMD will post his RFC to enable a single binary for all
  architectures


