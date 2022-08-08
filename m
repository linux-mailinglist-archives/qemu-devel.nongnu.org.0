Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D35C58C2C7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 07:22:59 +0200 (CEST)
Received: from localhost ([::1]:37206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKvE9-00011G-UV
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 01:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oKv6X-0002hZ-Jw
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:15:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oKv6U-0002V5-V6
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659935687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hzWM6d40e/63KV4ZEjtqTLvDGYNvFiPE/+tTF5kEUcw=;
 b=HFTHYV5Xsp9hqQlYYa+GJgkilWTCnDSdeDrIEGigWG5U3w+sYxrwoEiv/3yzg1kechjMuj
 eFrTuMjl5vKNcozF9o+QY/SG/t6GuC9cuhUMVRNAgpN3YZjpMalwcTrE16rEZPas75lK9/
 1tF5OFlD37yHQcQrX12jgffT4bUEo+k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-Ed9fYrx-Na2QUUjrNKam3w-1; Mon, 08 Aug 2022 01:14:46 -0400
X-MC-Unique: Ed9fYrx-Na2QUUjrNKam3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53676802D1C
 for <qemu-devel@nongnu.org>; Mon,  8 Aug 2022 05:14:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3256D2026D4C;
 Mon,  8 Aug 2022 05:14:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2C98C21E6930; Mon,  8 Aug 2022 07:14:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] vl: fix [memory] section with -readconfig
References: <20220805172301.553081-1-pbonzini@redhat.com>
Date: Mon, 08 Aug 2022 07:14:45 +0200
In-Reply-To: <20220805172301.553081-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Fri, 5 Aug 2022 19:23:01 +0200")
Message-ID: <877d3jz58a.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> The -M memory.* options do not have magic applied to them than the -m
> option, namely no "M" (for mebibytes) is tacked at the end of a
> suffixless value for "-M memory.size".

This sentence is confusing.  Do you mean "like the -m option"?

> This magic is performed by parse_memory_options, and we have to
> do it for both "-m" and the [memory] section of a config file.
> Storing [memory] sections directly to machine_opts_dict changed
> the meaning of
>
>     [memory]
>       size = "1024"
>
> in a -readconfig file from 1024MiB to 8KiB (1024 Bytes rounded up to
> 8KiB silently).  To avoid this, the [memory] section has to be
> changed back to QemuOpts (combining [memory] and "-m" will work fine
> thanks to .merge_lists being true).
>
> Change parse_memory_options() so that, similar to the older function
> set_memory_options(), it operates after command line parsing is done;
> and also call it where set_memory_options() used to be.
>
> Note, the parsing code uses exit(1) instead of exit(EXIT_FAILURE) to
> match neighboring code.
>
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Fixes: ce9d03fb3f ("machine: add mem compound property", 2022-05-12)
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Preferably with a clarified commit message:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


