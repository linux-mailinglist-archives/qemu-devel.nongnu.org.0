Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE2569275F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 20:47:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQZL7-00011x-MJ; Fri, 10 Feb 2023 14:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pQZL4-00011Y-2e
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 14:45:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pQZL2-0002Je-3F
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 14:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676058336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=STSD8yZGCAV9mtLPtDaMORo+2JIiEAzwGWp9kwNIonQ=;
 b=SAipjbEnqqvd85VtyhnqkCR4yXlApJHddSLp1zuIpuFyGdJnQgsGz/kH0QCBHa+KSZGaCx
 lfY53lOJ/R9/j91fpZtoZ9IjX6CmzgFuZuFZDJzA+Yd9Y5W9PSb167BGHztoE2miU+63sa
 ZcqR9UutUV5U9c/0JjWl3Ky8IsnMjQg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-azEHGEYAN6OImHFbknKcCQ-1; Fri, 10 Feb 2023 14:45:32 -0500
X-MC-Unique: azEHGEYAN6OImHFbknKcCQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E57FB3C0E469;
 Fri, 10 Feb 2023 19:45:30 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D5EA1121315;
 Fri, 10 Feb 2023 19:45:29 +0000 (UTC)
Date: Fri, 10 Feb 2023 13:45:27 -0600
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 3/7] configure: Look for auxiliary Python installations
Message-ID: <20230210194527.d622oiaitb43utl2@redhat.com>
References: <20230209154034.983044-1-jsnow@redhat.com>
 <20230209154034.983044-4-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209154034.983044-4-jsnow@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

On Thu, Feb 09, 2023 at 10:40:30AM -0500, John Snow wrote:
> At the moment, we look for just "python3" and "python", which is good
> enough almost all of the time. But ... if you are on a platform that
> uses an older Python by default and only offers a newer Python as an
> option, you'll have to specify --python=/usr/bin/foo every time.
> 
> We can be kind and instead make a cursory attempt to locate a suitable
> Python binary ourselves, looking for the remaining well-known binaries.
> 
> This configure loop will prefer, in order:
> 
> 1. Whatever is specified in $PYTHON
> 2. python3
> 3. python
> 4. python3.11 down through python3.6

Makes sense.


>  python=
> +first_python=
>  explicit_python=no
> -for binary in "${PYTHON-python3}" python
> +# A bare 'python' is traditionally python 2.x, but some distros
> +# have it as python 3.x, so check in both places.
> +for binary in "${PYTHON-python3}" python python3.{11..6}

This does not match your commit message. If $PYTHON is set but fails,
you never check python3.  Pre-existing, but now that you're calling it
out as intended, it may be better to write the list prefix as:

for binary in $PYTHON python3 python ...

except that it mishandles $PYTHON containing space, so you want the
quotes, but you don't want to test an empty binary or waste time
testing python3 twice, so more precise could be:

for binary in "${PYTHON-python3}" ${PYTHON:+python3} python ...

Meanwhioe, your use of {11.6} is a bashism, but configure is /bin/sh.
It would be nice if you could use $(seq -f python3.%g 11 -1 6), but
that's probably too specific to GNU Coreutils and won't work on other
platforms; and open-coding it in a shell loop isn't going to be any
prettier.  So you'll be safest if you just manually spell it out:

python3.11 python3.10 ...

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


