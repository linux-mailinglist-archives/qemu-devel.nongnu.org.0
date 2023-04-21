Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AF56EB3EE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 23:53:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppygB-0005jW-46; Fri, 21 Apr 2023 17:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppyg4-0005j5-FL
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 17:52:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppyfy-0005nk-N1
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 17:52:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682113937;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MvX8zvl7ygmt1lFuB/lHj6JYO5LKgR1tlqPz91YfP4U=;
 b=f+9mZKhrYk3expJUXV1tDhvb6gI5dvUpNByONUjJ/psqzW0G+WHcPbT9PiGIWQ3pIRv8aO
 AwPbA+8cNCOLOJlDe9uaFhIWNXRCPeaWXvivaJmbSMo2k4odnIzj9yqolHdzeMGxeaDeyn
 AVL2yDqwv04exgz9JI5armjsha7bfSk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-1lFliAldMbCig_CqMaAVHA-1; Fri, 21 Apr 2023 17:52:15 -0400
X-MC-Unique: 1lFliAldMbCig_CqMaAVHA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2fcec825133so717890f8f.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 14:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682113934; x=1684705934;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MvX8zvl7ygmt1lFuB/lHj6JYO5LKgR1tlqPz91YfP4U=;
 b=bLtEU2FAW08xrLN7Mpci+2rMIQ6mYCB/GrZV8DSKDgeSwQhxQorsVYma6N8Ua9YBOf
 ip2tUsEUI8pTkjD++iey2k0r3U4yxZ5YKwDvhVIWU2lI6FLiXqdoXp5R8EomkuyHtwao
 cj9RkUaO3XkXqDSNYmk3cK6RZVm59PMprHu0230YIs84KPu2phi9rdUjyx/AsKRKy5Nt
 Sq4BuKGL4OmxOkqKLgk8A5feOda/Gna3IVLbrwScaFoYKbCwXHWIZANbJ9eNXBFffjxz
 UtyN7SDXDcw1jgL68mbUkWpDKLU30tWYtMdWGOku2rRD5VbmEd668rrP2evsW1GgiuFb
 RaGA==
X-Gm-Message-State: AAQBX9fNraLUxIRYTEZ5/3ii1VQ2fsZlP/OUY1/fBrBVzbdBq6/Fk/5r
 u3gKCLdI95/MdEYx47lNyVMagm1pasNzo50q3Dn3W42rLue4hv0WvZwvtfnIXDIXLQpn7Wrlw2o
 mzQxNUBMAxgUUlc4=
X-Received: by 2002:a5d:5488:0:b0:2f7:be02:e977 with SMTP id
 h8-20020a5d5488000000b002f7be02e977mr5006908wrv.19.1682113934619; 
 Fri, 21 Apr 2023 14:52:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350bk2R8N4OnwgxEJVlqWPzapfXU3b+SaE+syNhl2f2bnIgHlA/ZUUJkVpQNTMxUmGCQyLvWSzQ==
X-Received: by 2002:a5d:5488:0:b0:2f7:be02:e977 with SMTP id
 h8-20020a5d5488000000b002f7be02e977mr5006892wrv.19.1682113934310; 
 Fri, 21 Apr 2023 14:52:14 -0700 (PDT)
Received: from redhat.com ([31.4.212.142]) by smtp.gmail.com with ESMTPSA id
 i11-20020adfe48b000000b002c3f81c51b6sm5236065wrm.90.2023.04.21.14.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 14:52:13 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Li Zhijian <lizhijian@fujitsu.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Zhang Chen <chen.zhang@intel.com>,  Laurent Vivier
 <lvivier@redhat.com>
Subject: Re: [PATCH v2 1/6] tests/qtest: replace qmp_discard_response with
 qtest_qmp_assert_success
In-Reply-To: <20230421171411.566300-2-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Fri, 21 Apr 2023 18:14:06
 +0100")
References: <20230421171411.566300-1-berrange@redhat.com>
 <20230421171411.566300-2-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 21 Apr 2023 23:52:12 +0200
Message-ID: <87v8hogayb.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> The qmp_discard_response method simply ignores the result of the QMP
> command, merely unref'ing the object. This is a bad idea for tests
> as it leaves no trace if the QMP command unexpectedly failed. The
> qtest_qmp_assert_success method will validate that the QMP command
> returned without error, and if errors occur, it will print a message
> on the console aiding debugging.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  tests/qtest/ahci-test.c              | 31 ++++++++++++++--------------
>  tests/qtest/boot-order-test.c        |  5 +----
>  tests/qtest/fdc-test.c               | 15 +++++++-------
>  tests/qtest/ide-test.c               |  5 +----
>  tests/qtest/migration-test.c         |  5 +----
>  tests/qtest/test-filter-mirror.c     |  5 +----
>  tests/qtest/test-filter-redirector.c |  7 ++-----
>  tests/qtest/virtio-blk-test.c        | 24 ++++++++++-----------
>  8 files changed, 40 insertions(+), 57 deletions(-)

Reviewed-by: Juan Quintela <quintela@redhat.com>

> -/* TODO actually test the results and get rid of this */
> -#define qmp_discard_response(s, ...) qobject_unref(qtest_qmp(s, __VA_ARG=
S__))

As it couldn't be otherwise, all bad patterns are copied.


