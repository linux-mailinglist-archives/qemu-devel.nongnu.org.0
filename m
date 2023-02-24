Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BA46A211F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 19:05:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVcR2-0003Qf-2F; Fri, 24 Feb 2023 13:04:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pVcQz-0003Py-VD
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:04:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pVcQy-0001Ve-BE
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:04:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677261878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ueJjLyPlMQge/5deGy3+795NM8CeEZ8fcGdBMpnMvx0=;
 b=BRaBBlQmNbtqjuEBFLPDeD59/oSkoVeEPHotpcq4Zi5IEx7F67oqrGOFQ1RemJRo51j08d
 M2S6AQIK6J6WzOxNwhwtt6kmekM/rDOWqHBT89zFI/3dS82jA9SkvBzPaWSuxip6SUUTEV
 XtC6cDRbGQVUA4E6xmchwY1wSP7/70M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-GWf-MDC2OVu9-86VRZRE_Q-1; Fri, 24 Feb 2023 13:04:35 -0500
X-MC-Unique: GWf-MDC2OVu9-86VRZRE_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1236A85A588;
 Fri, 24 Feb 2023 18:04:35 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB4C94014CF3;
 Fri, 24 Feb 2023 18:04:33 +0000 (UTC)
Date: Fri, 24 Feb 2023 12:04:32 -0600
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
Subject: Re: [PATCH v3 1/6] configure: Look for auxiliary Python installations
Message-ID: <20230224180432.xy6ponxtondgxrjt@redhat.com>
References: <20230221012456.2607692-1-jsnow@redhat.com>
 <20230221012456.2607692-2-jsnow@redhat.com>
 <db3a7e62-2eac-1b9f-1c3e-69e58d614359@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db3a7e62-2eac-1b9f-1c3e-69e58d614359@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Tue, Feb 21, 2023 at 12:03:44PM +0100, Paolo Bonzini wrote:
> > 
> > This configure loop will prefer, in order:
> > 
> > 1. Whatever is specified in $PYTHON
> > 2. python3
> > 3. python (Which is usually 2.x, but might be 3.x on some platforms.)
> > 4. python3.11 down through python3.6
> > 
> > +
> >   python=
> > +first_python=
> >   explicit_python=no
> > -for binary in "${PYTHON-python3}" python
> > +# Check for $PYTHON, python3, python, then explicitly-versioned interpreters.
> > +for binary in "${PYTHON-python3}" ${PYTHON:+python3} python \
> > +                                  python3.11 python3.10 python3.9 \
> > +                                  python3.8 python3.7 python3.6
> 
> I think if PYTHON is set we shouldn't look at anything else.

Now that you mention that, it does sound more like what autoconf does
(if the user specified something, honor it; otherwise, find the best
match in a list of candidates).

> 
> Paolo
> 
> >   do
> >       if has "$binary"
> >       then
> >           python=$(command -v "$binary")
> > -        break
> > +        if test -z "$first_python"; then
> > +           first_python=$python
> > +        fi
> > +        if check_py_version "$python"; then
> > +            # This one is good.
> > +            first_python=
> > +            break
> > +        fi

One easy way to do that is add this here:

             if test -n "$PYTHON"; then break; fi

> >       fi
> >   done
> > +# If first_python is set, we didn't find a suitable binary.
> > +# Use this one for possible future error messages.
> > +if test -n "$first_python"; then
> > +    python="$first_python"
> > +fi

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


