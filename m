Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283FD10226D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 11:58:45 +0100 (CET)
Received: from localhost ([::1]:43850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX1DY-0001zO-7N
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 05:58:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43849)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iX1CN-0000w1-9T
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 05:57:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iX1CM-0006Qq-Bf
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 05:57:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29910
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iX1CM-0006Q6-83
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 05:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574161049;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jmYPUkXaQB8q/+GsVmeOhqxnzbdcX9hf0iZ9Hvm0NRc=;
 b=DbY5y7Vjd50IFHK55KT9zP/QjxHKVIqTJXIHBbVHMqS8ulmRE4ZOVt9oMuFMroIexS1SZD
 r6iMJ6OcOhPGtG9CyVGsMsB/UbGzHVmyDj1ozVKcG/4ZIZQ3ydUGvzUQqbZX7dzdqR6NQT
 j/j8ALmpKgYppVC+uDQsd3I58QO6Fh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-dewJFJtbNw-UirybPTR_YA-1; Tue, 19 Nov 2019 05:57:26 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66F42801E5D;
 Tue, 19 Nov 2019 10:57:25 +0000 (UTC)
Received: from redhat.com (ovpn-116-161.ams2.redhat.com [10.36.116.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F174466095;
 Tue, 19 Nov 2019 10:57:24 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH v2 1/6] migration/multifd: move Params update and pages
 cleanup into multifd_send_fill_packet()
In-Reply-To: <20191026004520.5515-2-richardw.yang@linux.intel.com> (Wei Yang's
 message of "Sat, 26 Oct 2019 08:45:15 +0800")
References: <20191026004520.5515-1-richardw.yang@linux.intel.com>
 <20191026004520.5515-2-richardw.yang@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Tue, 19 Nov 2019 11:57:22 +0100
Message-ID: <878socgmlp.fsf@trasno.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: dewJFJtbNw-UirybPTR_YA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wei Yang <richardw.yang@linux.intel.com> wrote:
> Fill data and update/cleanup related field in one place. Also make the
> code a little clean.
>
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

right cleanup.


