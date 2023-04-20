Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9F36E952B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:59:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTsV-0000RZ-0c; Thu, 20 Apr 2023 08:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppTsS-0000Qj-34
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:59:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppTsQ-0005CK-Aj
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681995545;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cs7V/pvQBl/gzjCTtQqlbkPezy/PvNCIw6fPNDg4Wu8=;
 b=Z909MnW3pen3ynLrCE5tgzA9ppkfFL8HfR5USLM7gMATTdow3HXUloGJxwSAxTcNj0mz4V
 7kt2z7tHRVuyHj7EERWP7W5K3RojgvcRkLn0mQqOQYJVSAIqQJ2Wf5bFKVLQBFB2gL4JBg
 vwDbbmMRFskYhS+uuICBOJqQlBkd6mg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-A2koHftKNWqXIB9MVI87Ug-1; Thu, 20 Apr 2023 08:59:03 -0400
X-MC-Unique: A2koHftKNWqXIB9MVI87Ug-1
Received: by mail-wm1-f70.google.com with SMTP id
 l32-20020a05600c1d2000b003f17b89ddfcso606847wms.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 05:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681995542; x=1684587542;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cs7V/pvQBl/gzjCTtQqlbkPezy/PvNCIw6fPNDg4Wu8=;
 b=R09wX6iy7VDh88sJ8x3a6fHFVaXdD7nngJVl2tM5oqEhyJlrAuvxwD08lGY/IrdL+H
 +Jrm9TTFOKJnchhGw2tx1vx9KYsujDs/fBP/a1Fj0pyBcuKSpZ/g3hWxLc1dXoVxYilL
 oFX9m8BeuAw7pR/zGszYnUR6fT4+FcP5lQPB31UPMk/HghMdRag+mbvxZinbZkTHC1aO
 FW7suiADwnn8zbRvooTmaNgqHFW+Q/MC6SlH8/ZkWGsJFE8ku/1wcHrjgpPHde0s52gm
 fRBquFidONAF692nmHdNiRq9RXc+Ht8I0uoYlRNnN3dr0e7LpahGoc4gW5c170D684Am
 xwIg==
X-Gm-Message-State: AAQBX9cWANq+tqle/wfPiSCrj1AcIrZzyUre7HgyDlSvoZPPh+FItpld
 /QBft4Osw1hbPvjnHClaKT9AG2dHqYa89SaMNDadhmEqJQhDeCOuUnTelQGoM1Jx8I86QIo3AhE
 fqU7Vc/fPRYUPqqY=
X-Received: by 2002:a1c:7908:0:b0:3f1:8e33:8c45 with SMTP id
 l8-20020a1c7908000000b003f18e338c45mr497931wme.21.1681995542293; 
 Thu, 20 Apr 2023 05:59:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z/k6xA1p/6l6WcCi6sO04nyMx4HUdy2gzcZ2Skl8iMaabYo8iwJnz6rfojy3eUm0+0pDEeow==
X-Received: by 2002:a1c:7908:0:b0:3f1:8e33:8c45 with SMTP id
 l8-20020a1c7908000000b003f18e338c45mr497920wme.21.1681995541928; 
 Thu, 20 Apr 2023 05:59:01 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003f173987ec2sm5371786wms.22.2023.04.20.05.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 05:59:01 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 2/2] tests/qtest: make more migration pre-copy scenarios
 run non-live
In-Reply-To: <20230418133100.48799-3-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Tue, 18 Apr 2023 14:31:00
 +0100")
References: <20230418133100.48799-1-berrange@redhat.com>
 <20230418133100.48799-3-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 14:59:00 +0200
Message-ID: <87wn26wvzf.fsf@secure.mitica>
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> There are 27 pre-copy live migration scenarios being tested. In all of
> these we force non-convergance and run for one iteration, then let it
> converge and wait for completion during the second (or following)
> iterations. At 3 mbps bandwidth limit the first iteration takes a very
> long time (~30 seconds).
>
> While it is important to test the migration passes and convergance
> logic, it is overkill to do this for all 27 pre-copy scenarios. The
> TLS migration scenarios in particular are merely exercising different
> code paths during connection establishment.
>
> To optimize time taken, switch most of the test scenarios to run
> non-live (ie guest CPUs paused) with no bandwidth limits. This gives
> a massive speed up for most of the test scenarios.
>
> For test coverage the following scenarios are unchanged
>
>  * Precopy with UNIX sockets
>  * Precopy with UNIX sockets and dirty ring tracking
>  * Precopy with XBZRLE
>  * Precopy with multifd

Just for completeness: the other test that is still slow is
/migration/vcpu_dirty_limit.

> -    migrate_ensure_non_converge(from);
> +    if (args->live) {
> +        migrate_ensure_non_converge(from);
> +    } else {
> +        migrate_ensure_converge(from);
> +    }

Looks ... weird?
But the only way that I can think of improving it is to pass args to
migrate_ensure_*() and that is a different kind of weird.

>      } else {
> -        if (args->iterations) {
> -            while (args->iterations--) {
> +        if (args->live) {
> +            if (args->iterations) {
> +                while (args->iterations--) {
> +                    wait_for_migration_pass(from);
> +                }
> +            } else {
>                  wait_for_migration_pass(from);
>              }
> +
> +            migrate_ensure_converge(from);

I think we should change iterations to be 1 when we create args, but
otherwise, treat 0 as 1 and change it to something in the lines of:

        if (args->live) {
            while (args->iterations-- >=3D 0) {
                wait_for_migration_pass(from);
            }
            migrate_ensure_converge(from);

What do you think?


> -        qtest_qmp_eventwait(to, "RESUME");
> +        if (!args->live) {
> +            qtest_qmp_discard_response(to, "{ 'execute' : 'cont'}");
> +        }
> +        if (!got_resume) {
> +            qtest_qmp_eventwait(to, "RESUME");
> +        }
>=20=20
>          wait_for_serial("dest_serial");
>      }

I was looking at the "culprit" of Lukas problem, and it is not directly
obvious.  I see that when we expect one event, we just drop any event
that we are not interested in.  I don't know if that is the proper
behaviour or if that is what affecting this test.

Later, Juan.


