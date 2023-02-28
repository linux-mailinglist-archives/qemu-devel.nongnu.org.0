Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1136A56F3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 11:41:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWxQQ-0003aT-74; Tue, 28 Feb 2023 05:41:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pWxQ8-0002zv-D9
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:41:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pWxQ6-0002Je-70
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:41:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677580877;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zZLxkk/+Fxnac0UIuP0ocLDm59ZrskqVHYe2uBcJwlc=;
 b=MvR0nugfdRCl/m3VISqqiUlZJDJXo/I2kyH6eEjMWLFITYfDciKeDfNRfUnlJLmvVY9Zeb
 H0nSqxg7lloNPDKzuGb9oUYqndVxIFj0TIqzn8eSbwk1QEMWOKPdFMlzbfvWyoNBDlz/sg
 VVfiKvBnCrDYMOclIp8hoSnFqvOx4vs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-6XFJkCKnOYmkfDP5KtEczQ-1; Tue, 28 Feb 2023 05:41:16 -0500
X-MC-Unique: 6XFJkCKnOYmkfDP5KtEczQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 s18-20020a7bc392000000b003deaf780ab6so4089292wmj.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 02:41:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zZLxkk/+Fxnac0UIuP0ocLDm59ZrskqVHYe2uBcJwlc=;
 b=zjuIdyf0gWJVD57Ii85aXgqtPScKlMV1WoN1QZBxAULZGwPk6Zka6JAIuCGnAGXkep
 tDWbNr98uyISw4f0H4xlZk15lgsIvtgnaj7/0ICeA+JHciHHa1cPFEBf+fKshKEus+eR
 dNvCaixmh990u1UTlTSCEWYHp83J3stRH5y/CSTxKnOKUMMnqfURULqP4UxqgmU6WRh3
 l698UaKH9khtUxZpckFQxIEsP9FL5HwMqtX9J4QOud/MC0dL3Z9Z5budaNERAeauGDVa
 XWAYXPXei6v7Xy8aTjawHXc3hF/XKDCIeZ/wMNY5oSzxixwhDrRnc3YqCznwjG2V7xff
 oesw==
X-Gm-Message-State: AO0yUKX4n3CDpsNn1oZJLpAlkTeTc5HdOBWWE66+ANZ7ErpXruMsDjZN
 pI+q0PWX/Q9/0bPyB+lh9CNWIF4PJcHgUdE9L1En4aGwNfmDs5YmEo5YpjNMtNVHOtWcGzGwycI
 zH+HT5/1TjRSaaRs=
X-Received: by 2002:a05:600c:35c6:b0:3eb:4501:6c60 with SMTP id
 r6-20020a05600c35c600b003eb45016c60mr1988356wmq.5.1677580875067; 
 Tue, 28 Feb 2023 02:41:15 -0800 (PST)
X-Google-Smtp-Source: AK7set8Dl2Kbu5AHZ8uR91gcNXrhQNDtX9+peXYYUHiiw4UWuWYpqSRJAtbN/JluouinA8owg83QZw==
X-Received: by 2002:a05:600c:35c6:b0:3eb:4501:6c60 with SMTP id
 r6-20020a05600c35c600b003eb45016c60mr1988339wmq.5.1677580874712; 
 Tue, 28 Feb 2023 02:41:14 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a1cf20a000000b003dfe5190376sm11832931wmc.35.2023.02.28.02.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 02:41:14 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com,  dgilbert@redhat.com,  qemu-devel@nongnu.org,
 rjones@redhat.com,  marcandre.lureau@redhat.com,  armbru@redhat.com,
 philmd@linaro.org,  berrange@redhat.com
Subject: Re: [PATCH v4] test-vmstate: fix bad GTree usage, use-after-free
In-Reply-To: <20230228092944.341317-1-eric.auger@redhat.com> (Eric Auger's
 message of "Tue, 28 Feb 2023 10:29:44 +0100")
References: <20230228092944.341317-1-eric.auger@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 28 Feb 2023 11:41:12 +0100
Message-ID: <87fsaqm5rr.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Eric Auger <eric.auger@redhat.com> wrote:
> According to g_tree_foreach() documentation:
> "The tree may not be modified while iterating over it (you can't
> add/remove items)."
>
> compare_trees()/diff_tree() fail to respect this rule.
> Historically GLib2 used a slice allocator for the GTree APIs
> which did not immediately release the memory back to the system
> allocator. As a result QEMU's use-after-free bug was not visible.
> With GLib > 2.75.3 however, GLib2 has switched to using malloc
> and now a SIGSEGV can be observed while running test-vmstate.
>
> Get rid of the node removal within the tree traversal. Also
> check the trees have the same number of nodes before the actual
> diff.
>
> Fixes: 9a85e4b8f6 ("migration: Support gtree migration")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1518
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Tested-by: Richard W.M. Jones <rjones@redhat.com>
> Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


