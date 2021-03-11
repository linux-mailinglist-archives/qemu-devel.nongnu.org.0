Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615BA337E2C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 20:26:42 +0100 (CET)
Received: from localhost ([::1]:51998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQxF-0007v7-Bu
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 14:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKQsL-0003Kr-SW
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:21:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKQsJ-00072k-7D
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:21:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615490494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2IV1oWsv8s3HfMcBXCUc9IAd1A+qJe3m3u8Q6jQM5BQ=;
 b=Zr8YR/n1z8TZ/n8+ly60uQddovfzmAAXDRoYfmH0MPgziBigbhdykaOf0F3uEgMD+CY7+J
 YaWEyKvWzdJFthH3XKUid26Ar+1Up0XY/wg85Fq22UbeIsRRq2gY8D4uw5nGW/q2AWD0O9
 ABL/doP+QcaNMtjHPNWBypeMeJaadJc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-CZWcrQDeO9CQUv5NQlNCCw-1; Thu, 11 Mar 2021 14:21:32 -0500
X-MC-Unique: CZWcrQDeO9CQUv5NQlNCCw-1
Received: by mail-wr1-f69.google.com with SMTP id h30so9998733wrh.10
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 11:21:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2IV1oWsv8s3HfMcBXCUc9IAd1A+qJe3m3u8Q6jQM5BQ=;
 b=TQhD65IWJZAnnkINj+sqY5ZnK0eHyk2OaLinQg0lOmTA8sPTQwSaanmqrv7DiZgDPX
 UfcrVmig+y6penjZId2rzpNw1XSjCu8uFhza6IAsjYdNDvV1T50tKzkLGafCPRycCm9d
 OoR8JNqlBGMRrkx6/aHx6X5t8qz7wjZ3ajxEVeeGN7o00gHomXU6WMWthhak7Dnytuu6
 GYL9tF22Vo9i0PasSSXDA8OP2gL448RnaKNd/CWRIHURQhDI25usVyGyPrJe2z6q8To2
 I1KOZv8jwEkwjAHJdMAyc5bmYJPsVXbVZhJ/0RMgnTrXH8o2jbNHpcdtXr5NiElhcYWi
 kABA==
X-Gm-Message-State: AOAM530WvQ+OcdR9EG62Pk/VAPjxXEFZyjNDP6kV3p30tmZkddxncr0e
 qSm8AlVV38I+DM5BgQ7vZ0T2o+uH4iKbYEGo6MXGvUYA4GuCiRz4qiPZ6iAtTam+WPA4BADjdYL
 wDxf1+BeuXYIPxkHWgtf1MtLM2g9ClUmKnVhW9MWRfcQFt7K82aC7Vwt5E+kdVgmZ
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr10240301wrr.274.1615490490871; 
 Thu, 11 Mar 2021 11:21:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVhBNpuu4jdYFiKIbbNrrvgUrOGLpXPQv+/YGLEly32vEow/klO6PuUuhmx19edOdJE01pkA==
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr10240278wrr.274.1615490490525; 
 Thu, 11 Mar 2021 11:21:30 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s23sm4811892wmc.35.2021.03.11.11.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 11:21:30 -0800 (PST)
Subject: Re: [PULL 47/53] scripts: Coccinelle script to use ERRP_GUARD()
To: Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200707212503.1495927-1-armbru@redhat.com>
 <20200707212503.1495927-48-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a569c1e3-401e-c6d2-128d-3a846f46440c@redhat.com>
Date: Thu, 11 Mar 2021 20:21:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20200707212503.1495927-48-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/20 11:24 PM, Markus Armbruster wrote:
> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Script adds ERRP_GUARD() macro invocations where appropriate and
> does corresponding changes in code (look for details in
> include/qapi/error.h)
> 
> Usage example:
> spatch --sp-file scripts/coccinelle/errp-guard.cocci \
>  --macro-file scripts/cocci-macro-file.h --in-place --no-show-diff \
>  --max-width 80 FILES...
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Message-Id: <20200707165037.1026246-3-armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> [ERRP_AUTO_PROPAGATE() renamed to ERRP_GUARD(), and
> auto-propagated-errp.cocci to errp-guard.cocci]
> ---
>  scripts/coccinelle/errp-guard.cocci | 336 ++++++++++++++++++++++++++++
>  include/qapi/error.h                |   2 +
>  MAINTAINERS                         |   1 +
>  3 files changed, 339 insertions(+)
>  create mode 100644 scripts/coccinelle/errp-guard.cocci

Odd, this script fails on Fedora rawhide:

$ spatch --macro-file scripts/cocci-macro-file.h --sp-file
scripts/coccinelle/errp-guard.cocci --use-gitgrep --dir .
There is no standard.iso in /usr/lib64/coccinelle.
Are you sure you run a properly installed version of spatch
?\ninit_defs_builtins: /usr/lib64/coccinelle/standard.h
init_defs: scripts/cocci-macro-file.h
minus: parse error:
  File "scripts/coccinelle/errp-guard.cocci", line 54, column 5, charpos
= 1899
  around = '<...',
  whole content =      <...

$ spatch --version
There is no standard.iso in /usr/lib64/coccinelle.
Are you sure you run a properly installed version of spatch ?\nspatch
version 1.1.0-gc4cc9f6-dirty compiled with OCaml version 4.12.0
Flags passed to the configure script: --build=x86_64-redhat-linux-gnu
--host=x86_64-redhat-linux-gnu --program-prefix=
--disable-dependency-tracking --prefix=/usr --exec-prefix=/usr
--bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc
--datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64
--libexecdir=/usr/libexec --localstatedir=/var --sharedstatedir=/var/lib
--mandir=/usr/share/man --infodir=/usr/share/info
--with-python=/usr/bin/python3 --with-menhir=/usr/bin/menhir
OCaml scripting support: yes
Python scripting support: yes
Syntax of regular expressions: PCRE

$ ls /usr/lib64/coccinelle
ocaml  spatch  standard.h  standard.iso


