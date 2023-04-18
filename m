Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC91B6E6038
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 13:46:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pojmo-00061y-Qi; Tue, 18 Apr 2023 07:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pojmk-0005zX-TQ
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:46:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pojmj-0003Pf-6L
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681818368;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=XbreQuBoYv9ZZGyTW4T2aNpyZIOu/GdSAuRn4V8DlOU=;
 b=J5DIdVqAKcXUg9doWCJQ5PIgSJBwhHWHKhf2P6u6Y8q1dq+JNYV5V0GSawK82z8Zt5P5VY
 ox0YIGJxGKnSwrFRkUJ5BVg5NpCWjFHA6YCmF6R3oKbdYXLSeFv5O+T8J1m3NY9yWIFpjY
 pzd4kThjDevMCqA83rYRr3RoUmxdZV0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-RDIwBvxJPcaBV-SSAhGWlA-1; Tue, 18 Apr 2023 07:46:05 -0400
X-MC-Unique: RDIwBvxJPcaBV-SSAhGWlA-1
Received: by mail-wm1-f70.google.com with SMTP id
 d8-20020a05600c3ac800b003edf7d484d4so8978816wms.0
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 04:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681818364; x=1684410364;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XbreQuBoYv9ZZGyTW4T2aNpyZIOu/GdSAuRn4V8DlOU=;
 b=MMVQx+TdYq3l59lGz70Qf1GDxBhaMRWB5HQ1Spv+/m0NxWHIhd5YQAzX+1jEIv4EXU
 uJv7MUCs2ajmHdiUK6GJnSP6IxdwDMaPIBU2oq3LUL8og6GAPl9ZBQUiiJhHX4xIY+vY
 /p2AF4HGH5jQPfvUzRfWXvS6Ze2gGe9epTN2JLH0AlaUQFe6Vmk884a1CNFarA9/cZog
 y4cC8v4n5WZrFJX4QKjENSr7KnhrEm/dNdFWt2rP6IGdXCKNa0cX7E18j/QTBkNQFdO/
 B0M8rFpsrsRXapZCOZXu2EkO+E8fDKOzO5rsgsDr5C9gQvOtHQov+WY/YR0X3j5WjD44
 yyZg==
X-Gm-Message-State: AAQBX9dWB6g6xKCosHduskaZlbfReVN8DeQZfPTcaGwNHRetcPb5LWc+
 XNM+hqIsCKW6AvuJM5TewCfcHA3Vua8krMP5monPr04XTDwlsnlrjT6hwdTqHzT3g0IhjYHh/RX
 EzFmTtd70BdvaSfU=
X-Received: by 2002:a7b:cb44:0:b0:3f0:49b5:f0ce with SMTP id
 v4-20020a7bcb44000000b003f049b5f0cemr13563766wmj.12.1681818364386; 
 Tue, 18 Apr 2023 04:46:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350bSA+qK/6H6UL3NLAOt0raIKpyPkKcUgDiT9BeEn0BIkE99NEBJcPqNzZn+hTg5kXmqYBtZlQ==
X-Received: by 2002:a7b:cb44:0:b0:3f0:49b5:f0ce with SMTP id
 v4-20020a7bcb44000000b003f049b5f0cemr13563747wmj.12.1681818364099; 
 Tue, 18 Apr 2023 04:46:04 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c35cc00b003f175954e71sm4350030wmq.32.2023.04.18.04.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 04:46:03 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 0/2] tests/migration: Fix migration-test slowdown
In-Reply-To: <3a601ee8-15f0-39ec-3436-69ecc5b25886@redhat.com> (Thomas Huth's
 message of "Tue, 18 Apr 2023 12:59:42 +0200")
References: <20230412142001.16501-1-quintela@redhat.com>
 <3a601ee8-15f0-39ec-3436-69ecc5b25886@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 18 Apr 2023 13:46:02 +0200
Message-ID: <87zg751khx.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Thomas Huth <thuth@redhat.com> wrote:
> On 12/04/2023 16.19, Juan Quintela wrote:
>> Since commit:
>> commit 1bfc8dde505f1e6a92697c52aa9b09e81b54c78f
>> Author: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Date:   Mon Mar 6 15:26:12 2023 +0000
>>      tests/migration: Tweek auto converge limits check
>>      Thomas found an autoconverge test failure where the
>>      migration completed before the autoconverge had kicked in.
>>      [...]
>> migration-test has become very slow.
>> On my laptop, before that commit migration-test takes 2min10seconds
>> After that commit, it takes around 11minutes
>> We can't revert it because it fixes a real problem when the host
>> machine is overloaded.  See the comment on test_migrate_auto_converge().
>
> Thanks, your patches decrease the time to run the migration-test from
> 16 minutes down to 5 minutes on my system, that's a great improvement,
> indeed!
>
> Tested-by: Thomas Huth <thuth@redhat.com>
>
> (though 5 minutes are still quite a lot for qtests ... maybe some
> other parts could be moved to only run with g_test_slow() ?)

And once that we are on this topic.  Is there a way to launch several
tests on the same binary on parallel?
i.e. every migration thread uses a maximum of 2 cores, so in a server I
can run several at the same time (I know that migration-test.c tests
need to be modified so they don't interfere, but I have that changes on
my tree), but I don't know of a way to launch them.

Thanks, Juan.

PD, and I don't know why launching a qemu is so slow, the minimal time
that I am able to get for launching the two qemus is around 0.5 seconds.

Later, Juan.


