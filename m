Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659EF672633
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 19:03:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIClX-0001uo-4W; Wed, 18 Jan 2023 13:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pIClO-0001pu-9h
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:02:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pIClM-0006Td-Dm
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:02:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674064935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F2NrJV6RTYwta+BxH74/v8JJyDh7ttUK4aSR9z3oV8k=;
 b=bYhR35bKjsyW2QBE6858dMaxuUWmxA/DwcO9B64BuVrcS5qhMwCL9IKh+SbbRSEZUJZAxn
 2UGIPSzEp9azvrn0mxKUxikd4ag/812BCqn0Q9WkkYs0zTfZ6ph5poKgI91hRcFpIGPA2y
 /OUsY0ezpUkQVN7kfetLlREz2CXr2Qw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-360-UKvt1HBxO--qFs2S8oQnEA-1; Wed, 18 Jan 2023 13:02:13 -0500
X-MC-Unique: UKvt1HBxO--qFs2S8oQnEA-1
Received: by mail-wr1-f69.google.com with SMTP id
 g24-20020adfa498000000b002bbeb5fc4b7so6602945wrb.10
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 10:02:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F2NrJV6RTYwta+BxH74/v8JJyDh7ttUK4aSR9z3oV8k=;
 b=kQE8X7TQMBrr3xuc/F8sU+em7vRPMBCYvWux+Kkd4EZxQ8SRd3n7Csvbp8nlQ05zMw
 8xSR8ZSg21G02ei3x69GUCsE/kv3luLqDjh39ppje2XrFDOTNGRbDiyP/zPoKYQZgjEN
 zev/PbAnRS0bEVR1tyQtVGWHcH7Usu3KgYce+r9zCsM7s22FGDvbbucM6FpbvQOQvdb4
 c1mPEhti13Jf7MLoVI12ga4zOxKCS+yS8GVcGNS76pR9HSOLINzRSxZ9pCujzQIhg5SV
 Cx3GxZzRgrIhD3thtaMeqwdZgVBDqSSEaylkpaJuE07TDvjyferCNixL///Oxk3Dx8YW
 WD/Q==
X-Gm-Message-State: AFqh2kp8IB79UnR3xRuOzVg4s9nl1Jc6VA+TwqMKA+pvtyvi3xFHsjXd
 L+1U31owycaptf5+xAVsfTvRk+wk70xO4aH/SshadVeRR1O09VNDOuHihIqyVn/sFTHggOwwrne
 kXGHEdUElU86g+1A=
X-Received: by 2002:a05:6000:16ce:b0:2bd:d9cc:920a with SMTP id
 h14-20020a05600016ce00b002bdd9cc920amr8210745wrf.45.1674064932271; 
 Wed, 18 Jan 2023 10:02:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvz7ofhc0l2fyIMg/IlaNFS9Ac3h44OIDQ9GCUZBdjrSIsZhFGu9vWjgIPYqpydyP4VN4EIAg==
X-Received: by 2002:a05:6000:16ce:b0:2bd:d9cc:920a with SMTP id
 h14-20020a05600016ce00b002bdd9cc920amr8210729wrf.45.1674064932097; 
 Wed, 18 Jan 2023 10:02:12 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a05600001d100b00241d21d4652sm31510326wrx.21.2023.01.18.10.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 10:02:11 -0800 (PST)
Date: Wed, 18 Jan 2023 18:02:09 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: QEMU iotest 267 failure / assertion in migration code
Message-ID: <Y8g0IcL14twkHQBu@work-vm>
References: <c4677b0e-87eb-beca-d9fb-050c9315d316@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4677b0e-87eb-beca-d9fb-050c9315d316@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Thomas Huth (thuth@redhat.com) wrote:
> 
>  Hi!
> 
> I just ran "make check" in a build directory where I did
> not compile qemu-system-x86_64, and got a failure with
> iotest 267.
> 
> Re-running the "check" script directly got me some more
> information:
> 
> $ ./check -qcow2 267
> QEMU          -- "/tmp/qemu/tests/qemu-iotests/../../qemu-system-alpha" -nodefaults -display none -accel qtest
> QEMU_IMG      -- "/tmp/qemu/tests/qemu-iotests/../../qemu-img"
> QEMU_IO       -- "/tmp/qemu/tests/qemu-iotests/../../qemu-io" --cache writeback --aio threads -f qcow2
> QEMU_NBD      -- "/tmp/qemu/tests/qemu-iotests/../../qemu-nbd"
> IMGFMT        -- qcow2
> IMGPROTO      -- file
> PLATFORM      -- Linux/x86_64 thuth 4.18.0-425.3.1.el8.x86_64
> TEST_DIR      -- /tmp/qemu/tests/qemu-iotests/scratch
> SOCK_DIR      -- /tmp/tmp_qbcjhsu
> GDB_OPTIONS   --
> VALGRIND_QEMU --
> PRINT_QEMU_OUTPUT --
> 
> 267   fail       [18:39:41] [18:39:44]   3.5s                 output mismatch (see /tmp/qemu/tests/qemu-iotests/scratch/267.out.bad)
> --- .../qemu/tests/qemu-iotests/267.out
> +++ /tmp/qemu/tests/qemu-iotests/scratch/267.out.bad
> @@ -31,23 +31,23 @@
>  Testing: -drive driver=IMGFMT,file=TEST_DIR/t.IMGFMT,if=none
>  QEMU X.Y.Z monitor - type 'help' for more information
>  (qemu) savevm snap0
> -(qemu) info snapshots
> -List of snapshots present on all disks:
> -ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
> ---        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
> -(qemu) loadvm snap0
> -(qemu) quit
> +QEMU_PROG: ../../qemu/migration/ram.c:874: pss_find_next_dirty: Assertion `pss->host_page_end' failed.

I don't understand how that can trigger - it needs investigating as a
bug.

> +./common.rc: line 181: 1903770 Aborted                 (core dumped) ( if [ -n "${QEMU_NEED_PID}" ]; then
> +    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
> +fi; GDB=""; if [ -n "${GDB_OPTIONS}" ]; then
> +    GDB="gdbserver ${GDB_OPTIONS}";
> +fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec "${VALGRIND_LOGFILE}" $GDB "$QEMU_PROG" $QEMU_OPTIONS "$@" )
> 
> 
> Looks like this test does not work if the main machine
> of the selected QEMU binary does not support migration?

Why doesn't it support migration?

> Should we remove this test from the "auto" group?
> 
> Anyway, QEMU should also not trigger an assertion, so this
> sounds like another bug?

Yeh; that's a weird failure.

(Alpha page size seems to be 8k from what I can tell; which should be
fine, if you're running on an x86 host)

Dave

>  Thomas
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


