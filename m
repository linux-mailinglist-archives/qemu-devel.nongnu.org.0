Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4A56EE120
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 13:37:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prGyD-00085y-Hl; Tue, 25 Apr 2023 07:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prGyB-00085p-QZ
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 07:36:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prGyA-00044V-AO
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 07:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682422580;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type: content-transfer-encoding:content-transfer-encoding;
 bh=Jb8fJ7UPHUQKAoPYGaUBfjo5f040yhkq7ajr9HgBcuc=;
 b=LrbMhOcy0T7OUIh0QULwYPW980dq1e+kIeqH1JaiRDPiHjzBBABnZunXCse9/kYQ2+PJwq
 ml6su8j5VXrgLrTb9pjS7FbdCe+O4pA8gxAynFm95picl90IZfCgnVMPTMvNLqg3ri5ePS
 XLz747vIXPgSS8QcbMIbiPwFHKZ6Ywo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-byTkFZS_Ns66qRU8c1M7oA-1; Tue, 25 Apr 2023 07:36:18 -0400
X-MC-Unique: byTkFZS_Ns66qRU8c1M7oA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-301a3715507so2982043f8f.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 04:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682422577; x=1685014577;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:subject:to:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Jb8fJ7UPHUQKAoPYGaUBfjo5f040yhkq7ajr9HgBcuc=;
 b=gFbEp1bxy5oKO1mYBk+WD977mB5ec1W+zSnkDDiQ1Sj6aoDxK0X/eMsNOBCBVusFtg
 FrvTGEam4sgxjFJl+1RzLLKridt51F+gDX3gnd/e5nrYY1EMfUQBA/UmZHea/wd9t1nE
 u4QDwXqqhw93MU+E/gZz/wJ8Gc8gLSUYWMSZRFasc1MIeLRA4d9b6EXK1wdJXdmOx1zb
 xR1zBLLO8sLHYTKhzvKB3o/ftQ/5HLCka+zRB8rd6JGTWjuOgPG2+EWyP9mFu2KbemD6
 nuTfKPas6mqtnDo0yXH4GSgVHp3FMyJwD97sgkqHSEbRSYolp/oeiQbhRqmcfOUEx4+I
 I3vA==
X-Gm-Message-State: AAQBX9cuxeayrJBETcRt8zVNbSrg7XfO9yMmYx3bIPfZh1oq64xK6DlV
 fgOWTop9kSbZQSdHO6xSt/OGoGYZstTFmle7kC2WMZJ60zypxpMztRXy9prkJWxAushuQ4ctXs8
 lAW0BD+F5AWDm9f6C2hUDid0PI/Grcd5mJ3LC3DurgrH6nHQA+Iw+78lcKh1z+702IrZ8hTAz30
 57mNIr
X-Received: by 2002:a05:6000:1c9:b0:2fb:ad8:288f with SMTP id
 t9-20020a05600001c900b002fb0ad8288fmr11870976wrx.11.1682422577113; 
 Tue, 25 Apr 2023 04:36:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y98dmZv/Y1NL/MKjP9CJRIQbZzusJVI4SK7uwWF9QGYqS036BB0sEPDV3UXLhRcOsyfXAWcw==
X-Received: by 2002:a05:6000:1c9:b0:2fb:ad8:288f with SMTP id
 t9-20020a05600001c900b002fb0ad8288fmr11870963wrx.11.1682422576749; 
 Tue, 25 Apr 2023 04:36:16 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 j8-20020adff008000000b002f6176cc6desm12912280wro.110.2023.04.25.04.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 04:36:16 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Warning on Fedora 38
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 25 Apr 2023 13:36:15 +0200
Message-ID: <87mt2wgpn4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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


Hi

I got this warning/error when switching to F38:

In file included from /mnt/code/qemu/full/include/block/aio.h:21,
                 from ../../../../mnt/code/qemu/full/util/async.c:28:
../../../../mnt/code/qemu/full/util/async.c: In function =E2=80=98aio_bh_po=
ll=E2=80=99:
/mnt/code/qemu/full/include/qemu/queue.h:303:22: error: storing the address=
 of local variable =E2=80=98slice=E2=80=99 in =E2=80=98*ctx.bh_slice_list.s=
qh_last=E2=80=99 [-Werror=3Ddangling-pointer=3D]
  303 |     (head)->sqh_last =3D &(elm)->field.sqe_next;                   =
       \
      |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
../../../../mnt/code/qemu/full/util/async.c:167:5: note: in expansion of ma=
cro =E2=80=98QSIMPLEQ_INSERT_TAIL=E2=80=99
  167 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
      |     ^~~~~~~~~~~~~~~~~~~~
../../../../mnt/code/qemu/full/util/async.c:161:17: note: =E2=80=98slice=E2=
=80=99 declared here
  161 |     BHListSlice slice;
      |                 ^~~~~
../../../../mnt/code/qemu/full/util/async.c:161:17: note: =E2=80=98ctx=E2=
=80=99 declared here
cc1: all warnings being treated as errors

compiler is right that slice is a local variable.
on the other hand, I *think* that the list is fully consumed on that
function, so this shouldn't be a problem.

g_new() is a posibility.
I can't think of an easy way to convince gcc that using a local varible
there is correct.

How to go from here?  Any good ideas?

Later, Juan.


