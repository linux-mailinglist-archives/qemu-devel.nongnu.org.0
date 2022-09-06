Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282D85AF489
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 21:41:11 +0200 (CEST)
Received: from localhost ([::1]:39692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVeRZ-000378-Py
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 15:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oVePi-0001Fh-V8
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 15:39:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oVePf-0006Qg-3M
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 15:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662493146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=lzoKw+sU1WBb2iFfdE/eMY0D5KyCHHMi61+m/kl8Qj0=;
 b=BYUv1iKr6CNk+jOLVERkj8l2FUv7rVnfssGi7qetQy35MxumENw016+Bcw+7S/KFVWwyCF
 ARJPIGD7O8+IywE0+Vj6VM4GmHB8p1/kvCIzl6j6i5dwk2e9pitscMLeeBABQapKv7SyO0
 PYwHVrVk4S6kkm7GUAuppkaM7RVU5Zo=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-16-XBwCY9w7PTS7TJqV32hM2w-1; Tue, 06 Sep 2022 15:39:05 -0400
X-MC-Unique: XBwCY9w7PTS7TJqV32hM2w-1
Received: by mail-vk1-f200.google.com with SMTP id
 w187-20020a1fadc4000000b0037ceefea1c7so2253400vke.7
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 12:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=lzoKw+sU1WBb2iFfdE/eMY0D5KyCHHMi61+m/kl8Qj0=;
 b=gFfaIwJowmJqKhVFgeEi3R4LiR6/Pgoez+4A3fmm16b3mAUsyS35HaF5lJFhQU/Q+g
 Z6lKWJCN52EUWNMwTpgWu1UCLqoj9F+05Q8KKgrRqZuiyyVTPTNW9h/PrhITy8cAa08l
 BzuzbARcSk5sz42uRjzaoa2U+qieZyOec+hJe8k0MfAIdUw00BRna5CDLXBv3a9TJSfa
 gT5kLrKQDxlNJGnUy2H83oO7gUhlhZCB/y5/MS5e+wA3ekOqutSow0jv2jL/TxQdXTX5
 DgRlWAIH0bfBf5oDeAbSgUCJt8dcr4c+fAXmnyzvIUdR8kgRqKi6EiNyTkgzfFxo2hZC
 80Jw==
X-Gm-Message-State: ACgBeo2a80JHf8taxDTTJ0ZUpQy+UwFgoLL+J8CoKfeOIYhVOzkgT1V0
 z+60EbZFDFcN8R9UCb2KICihSlLh8e6oGUAOzl61spEEO8nDGv4oRz/QqdE2KveP2FEQKjwoNXW
 ycq5pigxILP8VmLvHQFKrRwxB64qMoBY=
X-Received: by 2002:a05:6102:34d:b0:392:b2c4:e5c2 with SMTP id
 e13-20020a056102034d00b00392b2c4e5c2mr37716vsa.61.1662493145000; 
 Tue, 06 Sep 2022 12:39:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5hCHxX1kERsKTIIGhJ9Ql2QPLWJLcaqTP0l50e+fVSlPrp/a9ZipaFQcVluFeyR/79XWvTQZmIc9wYsXTfgqs=
X-Received: by 2002:a05:6102:34d:b0:392:b2c4:e5c2 with SMTP id
 e13-20020a056102034d00b00392b2c4e5c2mr37709vsa.61.1662493144800; Tue, 06 Sep
 2022 12:39:04 -0700 (PDT)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Tue, 6 Sep 2022 15:38:54 -0400
Message-ID: <CAFn=p-ZkKLQtYAwzkQb7srFf_fF8ij+g5wkZiRofx4U+kSZ7Rw@mail.gmail.com>
Subject: Maximum QMP reply size
To: Markus Armbruster <armbru@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, I suspect I have asked this before, but I didn't write it down in
a comment, so I forget my justification...

In the QMP lib, we need to set a buffering limit for how big a QMP
message can be -- In practice, I found that the largest possible
response was the QAPI schema reply, and I set the code to this:

    # Maximum allowable size of read buffer
    _limit = (64 * 1024)

However, I didn't document if this was a reasonable limit or just a
"worksforme" one. I assume that there's no hard limit for the protocol
or the implementation thereof in QEMU. Is there any kind of value here
that would be more sensible than another?

I'm worried that if replies get bigger in the future (possibly in some
degenerate case I am presently unaware of) that the library default
will become nonsensical.

Any pointers/tips?

--js


