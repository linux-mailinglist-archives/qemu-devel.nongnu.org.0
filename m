Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCBD262F6B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 15:58:40 +0200 (CEST)
Received: from localhost ([::1]:41464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kG0cR-0002zK-E8
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 09:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kG0b8-0001ki-8G
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 09:57:18 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:45139
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kG0b5-0000Oj-RX
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 09:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599659834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HLW43OxZHa74RmP6OvPejCWWzGjBAT/zs6L2Z8SL4sM=;
 b=g79xA8QvJkYb8Qcfpj+P6vOp6QFoE9jJyTjHezC6HfAHu/ZbZnC/Xk61xDMx+G/qc2HM52
 I91XcH1bjex0vWN3+RtHKHBTZ8KVMENm6PsSu/d+pjG8RzWoB3oVWXCo9TYLluUtChzRQj
 ww8IJCqDWdeXgBzn/qNtALC9OPTqxuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-5EVDleg7NgqI6teniMdPSA-1; Wed, 09 Sep 2020 09:57:10 -0400
X-MC-Unique: 5EVDleg7NgqI6teniMdPSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1B801882FA3;
 Wed,  9 Sep 2020 13:57:08 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-234.ams2.redhat.com [10.36.112.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E5E260C15;
 Wed,  9 Sep 2020 13:57:06 +0000 (UTC)
Subject: Re: [PATCH v2 10/10] plugins: move the more involved plugins to
 contrib
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200909112742.25730-1-alex.bennee@linaro.org>
 <20200909112742.25730-11-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3af24c63-c439-d50c-f453-2b6c4ca24253@redhat.com>
Date: Wed, 9 Sep 2020 15:57:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200909112742.25730-11-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 02:43:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.576, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, richard.henderson@linaro.org,
 f4bug@amsat.org, cota@braap.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/09/2020 13.27, Alex Bennée wrote:
> We have an exploding complexity problem in the testing so lets just
> move the more involved plugins into contrib. tests/plugins still exist
> for the basic plugins that exercise the API. We restore the old
> pre-meson style Makefile for contrib as it also doubles as a guide for
> out-of-tree plugin builds.
> 
> While we are at it add some examples to the documentation and a
> specific plugins build target.
[...]
> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
> index a05990906cc..e079695caf9 100644
> --- a/docs/devel/tcg-plugins.rst
> +++ b/docs/devel/tcg-plugins.rst
> @@ -134,3 +134,145 @@ longer want to instrument the code. This operation is asynchronous
>  which means callbacks may still occur after the uninstall operation is
>  requested. The plugin isn't completely uninstalled until the safe work
>  has executed while all vCPUs are quiescent.
> +
> +Example Plugins
> +===============
> +
> +There are a number of plugins included with QEMU and you are
> +encouraged to contribute them upstream.

s/contribute them/contribute your own plugins/ ?

> There is a `contrib/plugins`
> +directory where they can go.
> +
> +- tests/plugins
> +
> +These are some basic plugins that are used to test and exercise the
> +API during the `make check-tcg` target.
> +
> +- contrib/plugins/hotblocks.c
> +
> +The hotblocks plugin allows you to examine the where hot paths of
> +execution are in your program. Once the program has finished you will
> +get a sorted list of blocks reporting the starting PC, translation
> +count, number of instructions and execution count. This will work best
> +with linux-user execution as system emulation tends to generate
> +re-translations as blocks from different programs get swapped in and
> +out of system memory.
> +
> +If your program is single-threaded you can use the `inline` option for
> +slightly faster (but not thread safe) counters.
> +
> +Example::
> +
> +  ./aarch64-linux-user/qemu-aarch64 -plugin contrib/plugins/libhotblocks.so -d plugin ./tests/tcg/aarch64-linux-user/sha1

Maybe break long lines with a backslash ?

> +  SHA1=15dd99a1991e0b3826fede3deffc1feba42278e6
> +  collected 903 entries in the hash table
> +  pc, tcount, icount, ecount
> +  0x0000000041ed10, 1, 5, 66087
> +  0x000000004002b0, 1, 4, 66087
> +  ...
> +
> +- contrib/plugins/hotpages.c
> +
> +Similar to hotblocks but this time tracks memory accesses::
> +
> +  ./aarch64-linux-user/qemu-aarch64 -plugin contrib/plugins/libhotpages.so -d plugin ./tests/tcg/aarch64-linux-user/sha1

dito ?

 Thomas


