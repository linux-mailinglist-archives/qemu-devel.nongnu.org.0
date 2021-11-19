Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E779C4574FD
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:02:45 +0100 (CET)
Received: from localhost ([::1]:34988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7Hg-0007b1-DI
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:02:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7EG-0005Ir-6x
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7ED-00036P-D9
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637341147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DRWGgHMghjxCYfAjIwBU6b3QgQVsN3kzBM2luUn1uq4=;
 b=fyqgfVBtrEpcXCmeIo3X6CUQxtQJibpeeQ1eKSHjzrldKNGjLcQBJWdIQfWGwv2JvnLRBk
 y58qkNEwM4SPgl5/gmHv5pS/q387fwn82seKYOp/L1Maa2g28Wlumvx6AAI+lts3RmUa1v
 zufoyP52l+D63vpTs/pO0NXRK4ZhJEY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-v0IxnOWgP3eLPvkAi6B7eQ-1; Fri, 19 Nov 2021 11:59:06 -0500
X-MC-Unique: v0IxnOWgP3eLPvkAi6B7eQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so4344981wmb.3
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:59:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H1xXEOPU0gj8U6OxokLDEFoPZgo+bfzFkPRA9ZvVGtI=;
 b=fJ565sMIsh2TYt/FQqM7eRLmL5xNTBWuCfmZaQ3j8e87wzfP7eohR0+wJTHomLZWX9
 ju3no8QLjoXltrcNNqxG5lhJ+lB66OuU6qGQbLE7/v72jrWUWMzhpeNP9Dlm9/1l07E9
 WmNbdTHeSvCF8NMnTVAS4/o60fjYDLrr4GUIn+WRrTUTpwTFtxdLsgpDl4NTv/UAfFxj
 1uBO60otyqEI9BOIIDKi9Xfi7z+01Uk1MQR+81Ja62AWLrhjU5BV6/2O5qEwX5HnCBYo
 pD3NpLfULvlfM9xSpJmw0LMEZyb+Zh/xOZxnIBKR9YQFCY14iZ5LB75hIplVA3KkbyUf
 5TUg==
X-Gm-Message-State: AOAM5336EfKH59ndYPNckRzKkw3JsV7OQKqNgB15kKh3/JW9Vlx1ym8f
 Ky0UojYonRT7FfYH9GD0o52V2RAc6ugg9ZMpO5QAYQ/EsaXcMwZAo+IXBlu2DB1u0jl9JP8m+8i
 c2U7/u2exN2tPPW68csNdMDj2MX/JYanqB0swYRIcBxM7w3ktc8q1wsW1PX+XbCSQlsE=
X-Received: by 2002:adf:fe88:: with SMTP id l8mr9342828wrr.208.1637341144755; 
 Fri, 19 Nov 2021 08:59:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjuInZfjWk/+EO/K7BFyiKxlfQhnZaa0SMermzrjtE9FaDSEogTEhP9RPaZdaDFzBzStNnHA==
X-Received: by 2002:adf:fe88:: with SMTP id l8mr9342777wrr.208.1637341144435; 
 Fri, 19 Nov 2021 08:59:04 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id b197sm185126wmb.24.2021.11.19.08.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:59:03 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] migration: Make multifd use only one write on the send
 path
Date: Fri, 19 Nov 2021 17:58:52 +0100
Message-Id: <20211119165903.18813-1-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi=0D
=0D
Right now, multifd does a write() for the header and a writev() for=0D
each group of pages.  Simplify it so we send the header as another=0D
member of the IOV.=0D
=0D
Once there, I got several simplifications:=0D
* is_zero_range() was used only once, just use its body.=0D
* same with is_zero_page().=0D
* Be consintent and use offset insed the ramblock everywhere.=0D
* Now that we have the offsets of the ramblock, we can drop the iov.=0D
* Now that nothing uses iov's except NOCOMP method, move the iovs=0D
  from pages to methods.=0D
* Now we can use iov's with a single field for zlib/zstd.=0D
* send_write() method is the same in all the implementaitons, so use=0D
  it directly.=0D
* Now, we can use a single writev() to write everything.=0D
=0D
ToDo: Move zero page detection to the multifd thrteads.=0D
=0D
With RAM in the Terabytes size, the detection of the zero page takes=0D
too much time on the main thread.=0D
=0D
Last patch on the series removes the detection of zero pages in the=0D
main thread for multifd.  In the next series post, I will add how to=0D
detect the zero pages and send them on multifd channels.=0D
=0D
Please review.=0D
=0D
Later, Juan.=0D
=0D
Juan Quintela (11):=0D
  migration: Remove is_zero_range()=0D
  dump: Remove is_zero_page()=0D
  multifd: Fill offset and block for reception=0D
  multifd: Make zstd compression method not use iovs=0D
  multifd: Make zlib compression method not use iovs=0D
  migration: Move iov from pages to params=0D
  multifd: Make zlib use iov's=0D
  multifd: Make zstd use iov's=0D
  multifd: Remove send_write() method=0D
  multifd: Use a single writev on the send side=0D
  migration: Use multifd before we check for the zero page=0D
=0D
 migration/multifd.h      | 10 ++++---=0D
 dump/dump.c              | 10 +------=0D
 migration/multifd-zlib.c | 40 ++++++++------------------=0D
 migration/multifd-zstd.c | 41 ++++++++------------------=0D
 migration/multifd.c      | 62 ++++++++++++++++++----------------------=0D
 migration/ram.c          | 31 +++++++++-----------=0D
 6 files changed, 72 insertions(+), 122 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


