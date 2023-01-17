Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BE566E387
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:27:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHomg-00026V-FU; Tue, 17 Jan 2023 11:26:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pHomc-0001xp-4G
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:25:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pHomX-0005qI-Km
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673972748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gPG6Qa8IauY9pzYZtaveMQl4TjvmSAMnd9dA4ICkkpU=;
 b=QTTD0IW+cOUxTAneTOPznsKlaapVmkJ43nfk8izdmH+sqmumSB6Nd0nKU1ttUFPnmMmm0S
 rYD2UcL0QV2/WhXenHdRF8AxpfpNhVT7Bsuxew79BMXyf542FzrF7YIJc+LrP5GIY8Tur9
 a93SQ5REO6epNn5Nd8ED6KaZ136YybM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-lywK9miiMw-gFj-YFwZ_fg-1; Tue, 17 Jan 2023 11:25:47 -0500
X-MC-Unique: lywK9miiMw-gFj-YFwZ_fg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94AA887B2A8;
 Tue, 17 Jan 2023 16:25:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23C24492B00;
 Tue, 17 Jan 2023 16:25:43 +0000 (UTC)
Date: Tue, 17 Jan 2023 17:25:41 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Warner Losh <imp@bsdimp.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/3] bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA
 warnings
Message-ID: <Y8bMBZFqVP+EFzA8@redhat.com>
References: <20230117135203.3049709-1-eesposit@redhat.com>
 <20230117135203.3049709-3-eesposit@redhat.com>
 <CANCZdfq=F9HJnjX9sGq6w9tzVx2C8e9jOfk2Lfer_mm2bDRP0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANCZdfq=F9HJnjX9sGq6w9tzVx2C8e9jOfk2Lfer_mm2bDRP0A@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 17.01.2023 um 17:16 hat Warner Losh geschrieben:
> On Tue, Jan 17, 2023 at 6:52 AM Emanuele Giuseppe Esposito <
> eesposit@redhat.com> wrote:
> 
> > QEMU does not compile when enabling clang's thread safety analysis
> > (TSA),
> > because some functions create wrappers for pthread mutexes but do
> > not use any TSA macro. Therefore the compiler fails.
> >
> > In order to make the compiler happy and avoid adding all the
> > necessary macros to all callers (lock functions should use
> > TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to allusers of
> > pthread_mutex_lock/pthread_mutex_unlock),
> > simply use TSA_NO_TSA to supppress such warnings.
> 
> I'm not sure I understand this quite right. Maybe a clarifying question
> will help me understand: Why is this needed for bsd-user but not
> linux-user? How are they different here?

FreeBSD's pthread headers include TSA annotations for some functions
that force us to do something about them (for now: suppress the warnings
in their callers) before we can enable -Wthread-safety for the purposes
where we really want it. Without this, calling functions like
pthread_mutex_lock() would cause compiler errors.

glibc's headers don't contain such annotations, so the same is not
necessary on Linux.

Kevin


