Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E334A817A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 10:29:42 +0100 (CET)
Received: from localhost ([::1]:49876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFYQu-0003yp-6f
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 04:29:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nFYH8-0002JL-0N
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 04:19:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nFYH2-000451-KS
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 04:19:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643879967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uTbgMD7lMeZfocGySnF0bUWrQaDDX6Zf6B+F9PJdeeI=;
 b=GRrWmc7uZhVyXYbLek1tAOdvqlETrtiZLHX9QvrqSuxDHqp59FbZynEOWbS6IbH0dVB/s7
 jBH1djdkULziId9YtO1VIj5WSSnQTWjNsdmlAZp8AHDiNruIM0n8ASTMtnWp7Yb90v9fNT
 h9ZifPcOiObaMBYYtKsVt6xamE0cGB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-RNJayVYQMk-TI2duxm5mGw-1; Thu, 03 Feb 2022 04:19:22 -0500
X-MC-Unique: RNJayVYQMk-TI2duxm5mGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9B4C100C661;
 Thu,  3 Feb 2022 09:19:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBF341062227;
 Thu,  3 Feb 2022 09:19:19 +0000 (UTC)
Date: Thu, 3 Feb 2022 10:19:18 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 4/4] python/aqmp: add socket bind step to legacy.py
Message-ID: <YfueFuHpHx6TXCMR@redhat.com>
References: <20220201041134.1237016-1-jsnow@redhat.com>
 <20220201041134.1237016-5-jsnow@redhat.com>
 <YfkzwdbIaGF5TcVZ@redhat.com>
 <CAFn=p-YKS8UXm3+LPsbjKh-_EkQ--efTW60KfQDa8ZAOVMmHjQ@mail.gmail.com>
 <YfmN+w7zh4qx27q/@redhat.com>
 <CAFn=p-bTFrJSF+TtkzyjQhBcTKe3AeWoJJT=O+mS-LiKZVHDnQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-bTFrJSF+TtkzyjQhBcTKe3AeWoJJT=O+mS-LiKZVHDnQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.02.2022 um 20:08 hat John Snow geschrieben:
> > I guess the relevant question in the context of this patch is whether
> > sync.py will need a similar two-phase setup as legacy.py. Do you think
> > you can do without it when you have to reintroduce this behaviour here
> > to fix bugs?
> >
> 
> Hm, honestly, no. I think you'll still need the two-phase in the sync
> version no matter what -- if you expect to be able to launch QMP and
> QEMU from the same process, anyway. I suppose it's just a matter of
> what you *call* it and what/where the arguments are.
> 
> I could just call it bind(), and it does whatever it needs to (Either
> creating a socket or, in 3.7+, instantiating more of the asyncio loop
> machinery).
> The signature for accept() would need to change to (perhaps)
> optionally accepting no arguments; i.e. you can do either of the
> following:
> 
> (1) qmp.bind('/tmp/sock')
>     qmp.accept()
> 
> (2) qmp.accept('/tmp/sock')
> 
> The risk is that the interface is just a touch more complex, the docs
> get a bit more cluttered, there's a slight loss of clarity, the
> accept() method would need to check to make sure you didn't give it an
> address argument if you've already given it one, etc. Necessary
> trade-off for the flexibility, though.

Hm, how about copying the create_server() interface instead? So it
would become:

(1) qmp.create_server('/tmp/sock', start_serving=False)
    qmp.start_serving()

(2) qmp.create_server('/tmp/sock')

Then you get the connection details only in a single place. (The names
should probably be changed because we're still a QMP client even though
we're technically the server on the socket level, but you get the idea.)

Kevin


