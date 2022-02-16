Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5344B92A6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:54:01 +0100 (CET)
Received: from localhost ([::1]:56378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKRJI-000282-TS
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:54:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1nKRC4-0005Qj-8K
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 15:46:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1nKRBz-0007uG-CK
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 15:46:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645044384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mPtjmaGVh+BTG6ceb/j6h8sGXAel5jr+9rp3N10akMQ=;
 b=QApG0Klw3oO54gp7ByRqwfmj6nSeIcTgrHyOCajrl/qfHAceZqZQKt3wyGIZ1K8N02lq7I
 DU9jE5nbz6apHKwoJNM/Eyyjm5xfijo/9qUtzN4t+fWlCP4jDcly1f7UIovu8XMS3pEzu1
 9Jd7nLBCf1WWpph5HjEwJiLbtpB/EDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-GCAHBL5SPcmK0ewIQXUtng-1; Wed, 16 Feb 2022 15:46:23 -0500
X-MC-Unique: GCAHBL5SPcmK0ewIQXUtng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 618061853022;
 Wed, 16 Feb 2022 20:46:22 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.195.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3683A6AB8D;
 Wed, 16 Feb 2022 20:46:04 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: Portable inline asm to get address of TLS variable
References: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
 <87leyaznm6.fsf@oldenburg.str.redhat.com>
 <CAJSP0QXmF=AKtaZO7GjxFtd7o5iQ9JC2xYGYDo-zC0Ea1POS5w@mail.gmail.com>
 <CAJSP0QUOXwwBzXpBNhGb_uuxM8AqP2mOD_7tSSWoEhErdVnHNw@mail.gmail.com>
Date: Wed, 16 Feb 2022 21:46:02 +0100
In-Reply-To: <CAJSP0QUOXwwBzXpBNhGb_uuxM8AqP2mOD_7tSSWoEhErdVnHNw@mail.gmail.com>
 (Stefan Hajnoczi's message of "Wed, 16 Feb 2022 20:33:39 +0000")
Message-ID: <871r02zgj9.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=fweimer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi:

> I'm basically asking whether the &tls_var input operand is treated as
> volatile and part of the inline assembly or whether it's just regular
> C code that the compiler may optimize with the surrounding function?

&tls_var is evaluated outside of the inline assembly, any compiler
barrier will come after that.  It's subject to CSE (or whatever it's
called.  Three asm statements in a row

  asm volatile("" : "=r"(dst_ptr) : "0"(&tls_var));
  asm volatile("" : "=r"(dst_ptr) : "0"(&tls_var));
  asm volatile("" : "=r"(dst_ptr) : "0"(&tls_var));

result in

	movq	tls_var@gottpoff(%rip), %rax
	addq	%fs:0, %rax
	movq	%rax, %rdx
	movq	%rax, %rdx

which is probably not what you want.

Thanks,
Florian


