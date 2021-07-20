Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD273CF5B8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 10:07:16 +0200 (CEST)
Received: from localhost ([::1]:42718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5kmY-0008Qk-TQ
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 04:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1m5kkO-0006o5-Ut
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 04:05:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1m5kkL-0007jB-Pc
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 04:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626768293;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=r+v0bqD/t+DbrDq4Y8RuM0ioacNZvdAtH19/cZPrslI=;
 b=BQNK15dso10i2/qG+98R/s1NRY8FE5b4nN8mD6LdJi/RWZ0kINN25BIj2+ZCmkKaTl25KB
 pQcq1wfd6pcH1ZRYSY+IMbVED1iZm2ZpF5//dEDGaUsuCAT1tI1Tv12falT1jUnH2ejS1a
 lUbG1C7QDxt7NKm7L+HBKvgJYLFOA+c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-uwN3IsZLNGCjayciArCmgA-1; Tue, 20 Jul 2021 04:04:50 -0400
X-MC-Unique: uwN3IsZLNGCjayciArCmgA-1
Received: by mail-wm1-f72.google.com with SMTP id
 n5-20020a05600c3b85b02902152e9caa1dso234393wms.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 01:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=r+v0bqD/t+DbrDq4Y8RuM0ioacNZvdAtH19/cZPrslI=;
 b=D6QVGTl8xmo2gZsuDLawOEk5hsUYzMJpOjNcOc6T/K2clnXJg+UPlSspN2UzOvLg7l
 MjYYpLQx1VC55coc1czmvsjcFCY7XlTP1D88M0RD2KZNFU6AbA//km/E9w8Go90njntg
 EPmYmohE4Fni5HB890UqM7mzfpKWZVRywdj897UonrqeRLH1rnMuGtyujT3otyyIQ6lS
 GlOMWCXrjNLQFy/86nDXjc0smpRRkT03PloxE3triGiBBkW+boB43ZUGKAe7uHU+iO3P
 rn2QDnsUqBO9fsOeg+LFWtYVzlOsQfLiy1kQZR4QrvAACEFSwEvaiDXXJ/6gJRW0UT8I
 SPuw==
X-Gm-Message-State: AOAM533wAes5jCc/lxV5YUyinLcwxrU4dVmN7FnU5/uPE/iixe3f95yy
 ClbYfZ7dTH1XkjgdRdr4haOKyv7lghrQdNhzLIz6TaNME0HZeaK9WYSu9/v9rBHeSvZ1yMtcOdb
 gnMa94A9ickcDPBc=
X-Received: by 2002:adf:ce82:: with SMTP id r2mr34456097wrn.161.1626768289059; 
 Tue, 20 Jul 2021 01:04:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ2lxPWiUrrZjL952c39XTb+JcDsiUK5JLYIhD+iqdsORKHUHNp7HbK6M4ZZej7fbxcqdqqQ==
X-Received: by 2002:adf:ce82:: with SMTP id r2mr34456076wrn.161.1626768288909; 
 Tue, 20 Jul 2021 01:04:48 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id m15sm19164552wmc.20.2021.07.20.01.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 01:04:48 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH] tests/qtest/migration-test.c: use 127.0.0.1 instead of 0
In-Reply-To: <20210719185217.122105-1-dgilbert@redhat.com> (David Alan
 Gilbert's message of "Mon, 19 Jul 2021 19:52:17 +0100")
References: <20210719185217.122105-1-dgilbert@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 20 Jul 2021 10:04:47 +0200
Message-ID: <877dhlfm1s.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: thuth@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> OpenBSD doesn't like :0 as an address, switch to using 127.0.0.1
> in baddest; it's really testing the :0 port number that isn't allowed
> on anything.
>
> (The test doesn't currently run anyway because of the userfault
> problem that Peter noticed, but this gets us closer to being able to
> reenable it)
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Why, o why networkinghas to be so difficult.


