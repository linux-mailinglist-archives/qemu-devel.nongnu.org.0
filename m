Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E579E692781
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 20:57:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQZVr-0003ki-3l; Fri, 10 Feb 2023 14:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pQZVl-0003kF-VY
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 14:56:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pQZVh-0004gh-EK
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 14:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676059000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NJevYEmKz2Jw2mXzCKXerbiuMSar2C8Nueq50rGjGrg=;
 b=eBXAvChjjB5xQ8NsChleIZLG4csCibEuyRe4lduSLZRDvKIzqknc9pJxRaNP/7oCxUETTM
 PSbT1y/sobi76lfCPUSQurP3uFScaQREmHYWAdIbFWtRGsKk2+QRGWtDovf6jPHdw/f4lk
 JWYEyhbTFEZ7xw+vHrL5JIUUdExMD+E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-DNsIqEBOP_6p4Cxuppo78A-1; Fri, 10 Feb 2023 14:56:37 -0500
X-MC-Unique: DNsIqEBOP_6p4Cxuppo78A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14443280558C;
 Fri, 10 Feb 2023 19:56:37 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1CF5140EBF4;
 Fri, 10 Feb 2023 19:56:29 +0000 (UTC)
Date: Fri, 10 Feb 2023 13:56:27 -0600
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 3/7] configure: Look for auxiliary Python installations
Message-ID: <20230210195627.jfkjm74fzdecrowp@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-4-jsnow@redhat.com>
 <3bb14d43-4dbe-62f3-679f-4b7823b29d41@redhat.com>
 <CAFn=p-Yyus2zipaUgLwonpMRdfZp-CKEisiXgZBLjgG6UxXagw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFn=p-Yyus2zipaUgLwonpMRdfZp-CKEisiXgZBLjgG6UxXagw@mail.gmail.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Feb 10, 2023 at 10:28:42AM -0500, John Snow wrote:
> > >   python=
> > > +first_python=
> > >   explicit_python=no
> > > -for binary in "${PYTHON-python3}" python
> > > +# A bare 'python' is traditionally python 2.x, but some distros
> > > +# have it as python 3.x, so check in both places.
> > > +for binary in "${PYTHON-python3}" python python3.{11..6}
> >
> > This is not available in e.g. dash, so we need to use {11,10,9,8,7,6}.
> > Just a nit, I can fix it myself.

Shoot - I didn't notice v2 before I reviewed v1, where I pointed out
the same problem.  But note that dash doesn't understand ANY brace
expansion; {11,10,9} is no better than {11..9}.

The list is also not testing python3 when $PYTHON is set.  See my
suggestion for fixing that in my mail on v1.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


