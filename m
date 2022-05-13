Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC485262AD
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 15:11:51 +0200 (CEST)
Received: from localhost ([::1]:59106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npV5C-0003Az-5b
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 09:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npUrV-0003Ny-OX
 for qemu-devel@nongnu.org; Fri, 13 May 2022 08:57:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npUrU-0004gw-9o
 for qemu-devel@nongnu.org; Fri, 13 May 2022 08:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652446659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TMDOOsixNaXS8bxX27RL80xGJVDQlC22EpM/pYMiHYY=;
 b=eVR8yup2cOqY1242nospI4YYr0JFSC5H+HeqMh+VbRxPEJHI4fD414ClXxT6ExsYIIVPKx
 xXYPgEXF3//oIRThflrbF8mqk5mq6ABb0WrgzH4M9VDiQruOU/M2dbZW34NHYmbhJdeIbK
 5BnC9hvRm85nIjLhyUgXJzYmuDz+KeE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-taDTtfECPnu9KSDk8MlMQg-1; Fri, 13 May 2022 08:57:36 -0400
X-MC-Unique: taDTtfECPnu9KSDk8MlMQg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4BE42919EBA;
 Fri, 13 May 2022 12:57:35 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3F31111F3BB;
 Fri, 13 May 2022 12:57:30 +0000 (UTC)
Date: Fri, 13 May 2022 14:57:29 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH 0/9] tests: run python tests under the
 build/tests/venv environment
Message-ID: <Yn5VuVLK/jBJugCi@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
 <Yn4YS1FpgtCZMMx6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yn4YS1FpgtCZMMx6@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.05.2022 um 10:35 hat Daniel P. Berrangé geschrieben:
> On Thu, May 12, 2022 at 08:06:00PM -0400, John Snow wrote:
> > RFC: This is a very early, crude attempt at switching over to an
> > external Python package dependency for QMP. This series does not
> > actually make the switch in and of itself, but instead just switches to
> > the paradigm of using a venv in general to install the QEMU python
> > packages instead of using PYTHONPATH to load them from the source tree.
> > 
> > (By installing the package, we can process dependencies.)
> > 
> > I'm sending it to the list so I can show you some of what's ugly so far
> > and my notes on how I might make it less ugly.
> > 
> > (1) This doesn't trigger venv creation *from* iotests, it merely prints
> > a friendly error message if "make check-venv" has not been run
> > first. Not the greatest.
> 
> So if we run the sequence
> 
>   mkdir build
>   cd build
>   ../configure
>   make
>   ./tests/qemu-iotests/check 001
> 
> It won't work anymore, until we 'make check-venv' (or simply
> 'make check') ?
> 
> I'm somewhat inclined to say that venv should be created
> unconditionally by default. ie a plain 'make' should always
> everything needed to be able to invoke the tests directly.

To be honest, I'm inclined to say that we already do too much of this.
When I change a source file, I usually just want qemu/qemu-img/qemu-io
updated to run my manual tests. If I want to run a test case, I have no
problem specifying this explicitly. This is what we had before the meson
switch. But what it does now is linking lots of test binaries (that I
won't run before I think that my change is finished and looking good)
and taking much longer than it should take.

Kevin


