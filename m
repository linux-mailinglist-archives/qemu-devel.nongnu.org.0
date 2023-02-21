Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B446C69DEDE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:32:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQs7-0003bs-VA; Tue, 21 Feb 2023 06:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUQs2-0003aN-Ck
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:31:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUQs0-0005mT-QY
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:31:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676979100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4GDIxRF6ZvINPoD5c25pBWEm2NCBDE3Y/QOKg0Ugs1Y=;
 b=NHtIeJq6l2j87JyNSXgYsaNYHV9qNi4YgsuhiBBUc4I0yI5UH17/6Ykt1lYFYOrWAEUhd1
 s55MeIjAo7XkFmLw6CcFTR4DQCzpFCjdTuO0C++XkZ4QGYPHLius/td8h/+bORzQ9l38e8
 IkD9wpYPKtv5KUkI1SfvBrhKD4apQNY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-449-afnsIbuZMsiIRC34LGHEKg-1; Tue, 21 Feb 2023 06:31:39 -0500
X-MC-Unique: afnsIbuZMsiIRC34LGHEKg-1
Received: by mail-ed1-f72.google.com with SMTP id
 co14-20020a0564020c0e00b004aab4319cedso5111072edb.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 03:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4GDIxRF6ZvINPoD5c25pBWEm2NCBDE3Y/QOKg0Ugs1Y=;
 b=6Dp5ZqouQQopfOhdNOIdxLb1gBkDdLpANhaVMzgKQ4gjEZ1kvaYxhGWElmrz5cnbw2
 Ot8tTAc+HRtpQMzPWkD7IencalLneyWlBqijCaWUIJZJeXwDaT6FsrHt616gksXEOEAD
 iZL07kMerB01VXTL6uh4JLfjbY/YoJsGMY2ThdmIbEdCT1NxODRQkLK+oslOekACs/ph
 TGJ2TQSZE1YcpdBQWN9PJ2JXNBAvXcv8TQ1K/+4o1oiHGN7LzoWak5jkVgNfkGZmOAKP
 td/bUtWrCQLoBVzA8mpYTgspv+It+OqAhoLoZGYJyY+jkTEcOpmDLyIDzNW3pKLN5SC0
 tuPQ==
X-Gm-Message-State: AO0yUKU4qdlXEllkrO4EGNOEF9W38DtA84bsYcFbwTen1d/vVkyLhOYM
 6n+Kf8Ht2FbPq5TI07DUG0abewlTyXrMyWQH97mEbo7l0OfG6MD0w14FenKEp881PPkgtSvl7rJ
 w9x6lbL7/iblO27Y=
X-Received: by 2002:a17:906:11ce:b0:88a:a27c:c282 with SMTP id
 o14-20020a17090611ce00b0088aa27cc282mr11683913eja.47.1676979098009; 
 Tue, 21 Feb 2023 03:31:38 -0800 (PST)
X-Google-Smtp-Source: AK7set+AUWM3akTFjYDG7ahMXTIqx1VaQ0jp0uiHMxfXCkasIF9ttOGm3ClS0g73bguoZRJu05Y90w==
X-Received: by 2002:a17:906:11ce:b0:88a:a27c:c282 with SMTP id
 o14-20020a17090611ce00b0088aa27cc282mr11683885eja.47.1676979097735; 
 Tue, 21 Feb 2023 03:31:37 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 cb3-20020a170906a44300b008d83ad86fe8sm1936812ejb.59.2023.02.21.03.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 03:31:37 -0800 (PST)
Message-ID: <2c63f79d-b46d-841b-bed3-0dca33eab2c0@redhat.com>
Date: Tue, 21 Feb 2023 12:31:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 5/6] meson: prefer 'sphinx-build' to 'sphinx-build-3'
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
References: <20230221012456.2607692-1-jsnow@redhat.com>
 <20230221012456.2607692-6-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230221012456.2607692-6-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/21/23 02:24, John Snow wrote:
> Once upon a time, "sphinx-build" on certain RPM platforms invoked
> specifically a Python 2.x version, while "sphinx-build-3" was a distro
> shim for the Python 3.x version.
> 
> These days, none of our supported platforms utilize a 2.x version, so it
> should be safe to search for 'sphinx-build' prior to 'sphinx-build-3',
> which will prefer pip/venv installed versions of sphinx if they're
> available.
> 
> This adds an extremely convenient ability to test document building
> ability in QEMU across multiple versions of Sphinx for the purposes of
> compatibility testing.

Can we just use "$PYTHON -m sphinx.cmd.build" instead, to ensure that we don't
escape the virtual environment?  Or even better, we could have a simple script
like this:

#! /usr/bin/env python3

from pkg_resources import load_entry_point

if __name__ == '__main__':
     if sys.argv[1] == '--check':
         try:
             load_entry_point(sys.argv[2], 'console_scripts', sys.argv[3])
             sys.exit(0)
         except ImportError:
             sys.exit(1)
     else:
         entry_point = load_entry_point(sys.argv[1], 'console_scripts', sys.argv[2])
         # The second argument to python-run.py becomes sys.argv[0]
         del sys.argv[0:1]
         sys.exit(entry_point())

then docs/meson.build can do this:

python_run = find_program('scripts/python-run.py')
build_docs = false
if get_feature('docs') \
   .require(run_command(python_run, '--check', 'sphinx', 'sphinx-build',
                        check: false).returncode() == 0,
            error: 'Could not find sphinx installation') \
   .allowed()
   # The sphinx module is installed
   SPHINX_ARGS = ['env', 'CONFDIR=' + qemu_confdir,
                  python_run, 'sphinx', 'sphinx-build', '-q']
   ...
   build_docs = (sphinx_build_test_out.returncode() == 0)
   ...
endif

This again ensures that sphinx-build will not escape the virtual environment
if there is one.  configure can also use the script to run meson, though that
can come later.

Paolo


