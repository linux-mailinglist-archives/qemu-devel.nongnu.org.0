Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7AE2CA313
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 13:49:16 +0100 (CET)
Received: from localhost ([::1]:46302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk55n-0000Ya-Fz
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 07:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk54p-0008VR-Ds
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:48:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk54m-0008M7-S9
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:48:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606826891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6p473BSSa0ZsSCqJG0psi+PSIwcU39UTv2RU/R6V1ew=;
 b=Ejm+JdGPl0gm+RDGRSBS4FLQXTGuNEFvQ1u4xroBuZNt+KY6kEBBMU/uYVa431LyYtT7oE
 JAJIgnNsJYU4PVH0bZSjtrsp/43yEYm2xp3/4F1CYeLQ7AGlvpyCsYuYoYkMtnQGEB7x+M
 qAXWCBRl99tfQ40LdhAYCeW37sO+9Bg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-r0lbzm49PXS43p7X9MF3KA-1; Tue, 01 Dec 2020 07:48:10 -0500
X-MC-Unique: r0lbzm49PXS43p7X9MF3KA-1
Received: by mail-wr1-f69.google.com with SMTP id m2so1005411wro.1
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 04:48:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=6p473BSSa0ZsSCqJG0psi+PSIwcU39UTv2RU/R6V1ew=;
 b=kZmUPmgniB9WJJlTpTPVZGTOq23zm9qImLmAKpJ1bj2MQ9XC9Ch2MmpjXn8RH5ozAL
 f9H3EXpvTPZiObuUjqok5/rQVW1KBKsupbcHVY8XYacDe56XVVlOjHAuXrnOJzW8Og60
 5qlwNcZUWBAA4ruKsG5TJq7pBnF75UCjpI46+l6yqXClejTox+xQsXIBQW8p8lyJ0HCb
 haU7vXZMpZMBflnujCpU3qSH+6wGH6iT563QcqOlp1GvBTnLtb5rNvYJUhefouSHxOIt
 KeOwAHrcZoLCy4AgbtqEt2z7B9YAX7GmKe2MuZvkWz4UGeO6AVlAvHZbr9fkaIkGEvXf
 PqWg==
X-Gm-Message-State: AOAM532M+rky2lB9QUCTFxGaU3NaRzrfCCVvk73GkyU/iSm+IncuViWt
 jQt+NXphE+xe4NlFZl7m6rj4ZLACHOOnGuxoJ30qJpTNB0dHEZ6nvpQ6UKvoG9w5OBx4v9mkzN/
 L1OYKKd3tvUhgaqk=
X-Received: by 2002:a05:600c:242:: with SMTP id
 2mr2586794wmj.144.1606826888823; 
 Tue, 01 Dec 2020 04:48:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAeJoqWYMHJKbdv+2YabK2O5fgWYMnbcxMyydyW7070Xjz5QQVosBdWr6zty+jCeU1VFk9XA==
X-Received: by 2002:a05:600c:242:: with SMTP id
 2mr2586775wmj.144.1606826888660; 
 Tue, 01 Dec 2020 04:48:08 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id o83sm2753172wme.21.2020.12.01.04.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 04:48:08 -0800 (PST)
To: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: configure: --extra-cflags are passed along C++ linker via QEMU_LDFLAGS
Message-ID: <ca9969ca-49f4-b25b-8a4d-f3b89b42d696@redhat.com>
Date: Tue, 1 Dec 2020 13:48:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I rebased an old series I started more than 1 year ago and tried
to build it using '../configure --extra-cflags=-Wint-conversion'
but got:

cc1plus: error: command-line option ‘-Wint-conversion’ is valid for
C/ObjC but not for C++ [-Werror]

QEMU_CXXFLAGS are sanitized in update_cxxflags() but when linking
with the C++ linker the C specific flags are propagated via
QEMU_LDFLAGS:

  --extra-cflags=*) QEMU_CFLAGS="$QEMU_CFLAGS $optarg"
                    QEMU_LDFLAGS="$QEMU_LDFLAGS $optarg"
  ;;
  --extra-cxxflags=*) QEMU_CXXFLAGS="$QEMU_CXXFLAGS $optarg"
  ;;
  --extra-ldflags=*) QEMU_LDFLAGS="$QEMU_LDFLAGS $optarg"
                     EXTRA_LDFLAGS="$optarg"

Maybe the change comes from commit db5adeaa84d:
("build-sys: clean up flags included in the linker command line").

Any suggestion where to filter EXTRA_LDFLAGS for C++?
Should I add a filtered EXTRA_LDXXFLAGS (similar to QEMU_CXXFLAGS)?

Thanks,

Phil.


